///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//   ���������������� ������ ������������� ���������� TBComPort. ����������  //
// ���������� �������� ������ ���������� �����������. ����� CR+LF ��������-  //
// ��������� ����� ��������������� ���������� �������� ������ ��� ������     //
// ������� �������� ������� � Memo1. ��� ���������� � Delphi3 � ����         //
// �������� Transparent ����������� Image1..Image3 ���� ���������� � True.   //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, BCPort;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    cbPort: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbBaudRate: TComboBox;
    Memo1: TMemo;
    btnConnect: TButton;
    btnDisconnect: TButton;
    BComPort1: TBComPort;
    Panel2: TPanel;
    Edit1: TEdit;
    btnSend: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnClear: TButton;
    cbCRLF: TCheckBox;
    cbSetRTS: TCheckBox;
    cbSetDTR: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure BComPort1RxChar(Sender: TObject; Count: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure cbBaudRateChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure BComPort1CTSChange(Sender: TObject; State: Boolean);
    procedure BComPort1DSRChange(Sender: TObject; State: Boolean);
    procedure BComPort1RLSDChange(Sender: TObject; State: Boolean);
    procedure cbSetRTSClick(Sender: TObject);
    procedure cbSetDTRClick(Sender: TObject);
  private
    // ���������-���������� �����������
    procedure SetLedCTS(Value: Boolean);
    procedure SetLedDSR(Value: Boolean);
    procedure SetLedRLSD(Value: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}
{$R Led.res}

procedure TMainForm.SetLedCTS(Value: Boolean);
begin
  if Value then
    Image1.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'On')
  else
    Image1.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'Off');
end;

procedure TMainForm.SetLedDSR(Value: Boolean);
begin
  if Value then
    Image2.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'On')
  else
    Image2.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'Off');
end;

procedure TMainForm.SetLedRLSD(Value: Boolean);
begin
  if Value then
    Image3.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'On')
  else
    Image3.Picture.Bitmap.Handle := LoadBitmap(HInstance, 'Off');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  EnumComPorts(cbPort.Items);
  cbPort.ItemIndex := 0;
  cbBaudRate.ItemIndex := 6;
  SetLedCTS(False);
  SetLedDSR(False);
  SetLedRLSD(False);
end;

procedure TMainForm.btnConnectClick(Sender: TObject);
begin
  BComPort1.Port := cbPort.Text;
  BComPort1.BaudRate := TBaudRate(cbBaudRate.ItemIndex);
  if BComPort1.Open then
  begin
    Edit1.Enabled := True; Edit1.Color := clWindow;
    btnConnect.Enabled := False;
    cbPort.Enabled := False;
    btnDisconnect.Enabled := True;
    cbSetDTR.Enabled := True; cbSetDTR.Checked := True;
    cbSetRTS.Enabled := True; cbSetRTS.Checked := True;
    btnSend.Enabled := True;
    cbCRLF.Enabled := True;
    btnClear.Enabled := True;
    Memo1.Enabled := True; Memo1.Color := clWindow;
    SetLedCTS(csCTS in BComPort1.Signals);
    SetLedDSR(csDSR in BComPort1.Signals);
    SetLedRLSD(csRLSD in BComPort1.Signals);
    Edit1.SetFocus;
  end;
end;

procedure TMainForm.btnDisconnectClick(Sender: TObject);
begin
  if BComPort1.Close then
  begin
    btnConnect.Enabled := True;
    cbPort.Enabled := True;
    btnDisconnect.Enabled := False;
    cbSetDTR.Enabled := False;
    cbSetRTS.Enabled := False;
    btnSend.Enabled := False;
    cbCRLF.Enabled := False;
    btnClear.Enabled := False;
    Memo1.Enabled := False; Memo1.Color := clBtnFace;
    Edit1.Enabled := False; Edit1.Color := clBtnFace;
    SetLedCTS(False);
    SetLedDSR(False);
    SetLedRLSD(False);
  end;
end;

procedure TMainForm.btnSendClick(Sender: TObject);
begin
  if BComPort1.Connected then
  begin
    BComPort1.WriteStr(Edit1.Text);
    Edit1.Text := '';
    Edit1.SetFocus;
  end;
end;

procedure TMainForm.BComPort1RxChar(Sender: TObject; Count: Integer);
var
  S: String;
begin
  BComPort1.ReadStr(S, Count);
  if cbCRLF.Checked and (S[Length(S)] = #13) then // ���������� �������� ������
    S := S + #10;
  Memo1.Text := Memo1.Text + S;
end;

procedure TMainForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if BComPort1.Connected and (Key = #13) then
  begin
    BComPort1.WriteStr(Edit1.Text + Key);
    Edit1.Text := '';
  end;
end;

procedure TMainForm.cbBaudRateChange(Sender: TObject);
begin
  BComPort1.BaudRate := TBaudRate(cbBaudRate.ItemIndex);
end;

procedure TMainForm.btnClearClick(Sender: TObject);
begin
  Memo1.Clear;
  Edit1.SetFocus;
end;

procedure TMainForm.BComPort1CTSChange(Sender: TObject; State: Boolean);
begin
  SetLedCTS(State);  // ���������� ��������� ������� ����� CTS
end;

procedure TMainForm.BComPort1DSRChange(Sender: TObject; State: Boolean);
begin
  SetLedDSR(State);  // ���������� ��������� ������� ����� DSR
end;

procedure TMainForm.BComPort1RLSDChange(Sender: TObject; State: Boolean);
begin
  SetLedRLSD(State); // ���������� ��������� ������� ����� RLSD
end;

procedure TMainForm.cbSetRTSClick(Sender: TObject);
begin
  BComPort1.SetRTS(cbSetRTS.Checked);
  Edit1.SetFocus;
end;

procedure TMainForm.cbSetDTRClick(Sender: TObject);
begin
  BComPort1.SetDTR(cbSetDTR.Checked);
  Edit1.SetFocus;
end;

end.
