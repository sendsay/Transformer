///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//            ������ ������ ����� ����� ���-���� � ��������������            //
//  ���������� TBComPort. ���� ����������� ������� (��� ������������� ����-  //
//  ��� OnRxChar). ��������� �������� ������������ ����� (��� � ������       //
//  �����) � ������ ����� ����� (������ '[END]'). �.�. ������ �����������    //
//  ���������� ������� ����������, ����������� ������ ��������������.        //
//  �������� ����� ���������� ����� ������ ����� � ����������� OnRxChar,     //
//  ������� �������� SyncMethod ������ ���� ����������� � smWindowSync.      //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////

unit MainRecept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, BCPort;

type
  TReceptForm = class(TForm)
    CB: TComboBox;
    Button1: TButton;
    CP: TBComPort;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CPRxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
    F: TFileStream;
    Buf: String;
    IsBegin: Boolean;
  public
    { Public declarations }
  end;

var
  ReceptForm: TReceptForm;

implementation

{$R *.DFM}

procedure TReceptForm.FormCreate(Sender: TObject);
begin
  CB.ItemIndex := 6;
end;

procedure TReceptForm.Button1Click(Sender: TObject);
begin
  Buf := '';
  IsBegin := True;
  ProgressBar1.Position := 0;
  CP.BaudRate := TBaudRate(CB.ItemIndex);
  if CP.Open then Button1.Enabled := False;
end;

procedure TReceptForm.CPRxChar(Sender: TObject; Count: Integer);
var
  S: String;
begin
  CP.ReadStr(S, Count);
  Buf := Buf + S;
  // ���� ����� ��������� ������
  if IsBegin then
  begin
    if Pos('[BEGIN]', Buf) > 0 then
    begin
      // ������ �����
      ProgressBar1.Max := StrToInt(Copy(Buf, Pos(':', Buf) + 1,
                                   Pos('[BEGIN]', Buf) - Pos(':', Buf) - 1));
      // ��������� (�������) ���� ��� �������� ������
      F := TFileStream.Create('_' + Copy(Buf, 1, Pos(':', Buf) - 1), fmOpenWrite or fmCreate);
      if Length(Buf) > (Pos('[BEGIN]', Buf) + 6) then
        Delete(Buf, 1, Pos('[BEGIN]', Buf) + 6)
      else
        Buf := '';
      if Length(Buf) > 0 then
      begin
        ProgressBar1.Position := ProgressBar1.Position + Length(Buf);
        F.Write(Buf[1], Length(Buf));
      end;
      Buf := '';
      IsBegin := False;
    end;
  end else
  // ������ �� ��������� ������
  begin
    if Pos('[END]', Buf) > 0 then  // ������ ����� �����
    begin
      Delete(Buf, Pos('[END]', Buf), 5);
      ProgressBar1.Position := ProgressBar1.Position + Length(Buf);
      if Length(Buf) > 0 then
        F.Write(Buf[1], Length(Buf));
      F.Free;                      // ��������� ����
      if CP.Close then             // ��������� ����
        Button1.Enabled := True;
      ShowMessage('���� ������');
    end
    else
    begin
      ProgressBar1.Position := ProgressBar1.Position + Count;
      F.Write(Buf[1], Count);
      Buf := '';
    end;
  end;
  Application.ProcessMessages;
end;

end.
