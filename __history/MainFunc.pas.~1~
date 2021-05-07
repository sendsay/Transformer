unit MainFunc;

interface

uses
  Vcl.Dialogs, System.SysUtils, System.Classes;

type TDoubleIntegerList = record
  DoubleIntegerListOne : Integer;
  DoubleIntegerListTwo : Integer;
end;

procedure _Msg(MsgFromUser : string); overload;
procedure _Msg(MsgFromUser : Integer); overload;
procedure _Msg(MsgFromUser : SmallInt); overload;
procedure _Msg(MsgFromUser : Real); overload;
procedure _Msg(MsgFromUser : Boolean); overload;
procedure _Msg(MsgFromUser : array of integer); overload;

function _GenerateSymbols(Count : integer; Symbol : Char): string;

implementation

procedure _Msg(MsgFromUser : string); overload;
begin
  ShowMessage(MsgFromUser);
end;

procedure _Msg(MsgFromUser : Integer); overload;
begin
  _Msg(IntToStr(MsgFromUser));
end;

procedure _Msg(MsgFromUser : SmallInt); overload;
begin
  _Msg(IntToStr(MsgFromUser));
end;

procedure _Msg(MsgFromUser : Real); overload;
begin
  _Msg(FloatToStr(MsgFromUser));
end;

procedure _Msg(MsgFromUser : Boolean); overload;
begin
  _Msg(BoolToStr(MsgFromUser));
end;

procedure _Msg(MsgFromUser : array of integer);
var
  MakeStr : string;
  I: Integer;
begin
  for I := 0 to High(MsgFromUser) do
  begin
    MakeStr := MakeStr + IntToStr(MsgFromUser[I]) + #13;
  end;

  _Msg(MakeStr);
end;


function _GenerateSymbols(Count : integer; Symbol : Char): string;
var
  I: Integer;
  Res : string;
begin
  if Count = 0 then
    Exit;

  if Count < 1 then
  begin
    Result := 'Count must be more !!!';
    Exit;
  end;

  for I := 0 to Count - 1  do
  begin
    Res := Res + Symbol;
  end;

  Result := Res;
end;

begin


end.
