unit TransForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, JvExComCtrls, JvStatusBar,
  Vcl.ExtCtrls, JvExExtCtrls, JvSplitter, Vcl.StdCtrls, JvExStdCtrls, JvMemo,
  JvRadioGroup, JvExtComponent, JvPanel, System.Actions, Vcl.ActnList, JvEdit,
  JvExControls, JvLabel, JvCheckBox, JvDragDrop, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppIniStorage, JvDialogs, JvProgressComponent,
  MainFunc, RegExpr, System.Generics.Collections, JvEditorCommon, JvEditor,
  JvSplit, JvProgressBar, BCPort, Vcl.Tabs, Vcl.DockTabSet, JvTabBar, JvPageList,
  JvComCtrls, Vcl.TabNotBk, System.ImageList, Vcl.ImgList, JvImageList,
  Vcl.ButtonGroup, JvArrayButton, JvXPCore, JvXPButtons, Vcl.OleCtrls,
  TCOGEOVIEWLib_TLB, JvFindReplace, JvAppHotKey, Vcl.Menus, JvMenus, Clipbrd,
  Vcl.StdActns, System.TypInfo ;

type
  TMainForm = class(TForm)
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    JvPanel3: TJvPanel;
    JvRadioGroupSelectTable: TJvRadioGroup;
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    JvStatusBar1: TJvStatusBar;
    ActionList1: TActionList;
    ActionExit: TAction;
    ActionAbout: TAction;
    ActionSend: TAction;
    ActionSave: TAction;
    Button2: TButton;
    ActionProcess: TAction;
    JvCheckBoxSensorUp: TJvCheckBox;
    JvCheckBoxDeleteNewTable: TJvCheckBox;
    JvCheckBoxSlashCall: TJvCheckBox;
    JvCheckBoxInnerHoles: TJvCheckBox;
    JvLabel1: TJvLabel;
    JvEditProgNumber: TJvEdit;
    JvLabel2: TJvLabel;
    JvEditProgName: TJvEdit;
    JvLabel3: TJvLabel;
    JvEditTechTable: TJvEdit;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    JvDragDrop1: TJvDragDrop;
    JvDragDrop2: TJvDragDrop;
    JvSaveDialog1: TJvSaveDialog;
    JvCheckBoxSaveChangedFile: TJvCheckBox;
    JvxSplitter1: TJvxSplitter;
    JvProgressBar1: TJvProgressBar;
    BComPort1: TBComPort;
    JvProgressComponent1: TJvProgressComponent;
    JvCheckBoxDelNumberStr: TJvCheckBox;
    JvPageControl1: TJvPageControl;
    TabSheetTransform: TTabSheet;
    JvTabDefaultPainter1: TJvTabDefaultPainter;
    ImageList1: TImageList;
    TabSheetGeometry: TTabSheet;
    Tcogeoview1: TTcogeoview;
    JvDragDrop3: TJvDragDrop;
    JvMemoIn: TJvMemo;
    JvMemoOut: TJvMemo;
    JvPopupMenu1: TJvPopupMenu;
    Find: TMenuItem;
    Replace1: TMenuItem;
    ActionFind: TAction;
    ActionReplace: TAction;
    JvFindReplace1: TJvFindReplace;
    JvFindReplace2: TJvFindReplace;
    JvRadioGroupSelectPiercing: TJvRadioGroup;
    JvPanel4: TJvPanel;
    JvRadioGroupCircleMesure: TJvRadioGroup;
    JvPanel5: TJvPanel;
    Jump1: TMenuItem;
    ActionJump: TAction;
    JvPanel8: TJvPanel;
    JvPanel9: TJvPanel;
    JvPanel10: TJvPanel;
    JvPanel11: TJvPanel;
    JvPanel7: TJvPanel;
    JvPanel6: TJvPanel;
    JvCheckBoxLookAHead: TJvCheckBox;
    JvCheckBoxFastOrigin: TJvCheckBox;
    procedure ActionExitExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure JvMemoInChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionProcessExecute(Sender: TObject);
    procedure ActionSendExecute(Sender: TObject);
    procedure BComPort1TxEmpty(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure JvDragDrop2Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure JvProgressComponent1Close(Sender: TObject);
    procedure JvDragDrop3Drop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure JvMemoInMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvMemoOutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionReplaceExecute(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure JvRadioGroupSelectPiercingClick(Sender: TObject);
    procedure ActionJumpExecute(Sender: TObject);
  private
    { Private declarations }
    FBreak: Boolean;
    FEmpty: Boolean;
  public
    { Public declarations }
    WithOutHSenList : TList<Integer>;               //List of pos height sensor
    iCoordTablePos : Integer;                       //Position coord table G54..G59
    CallSubprogramList : TList<Integer>;            //Position call of subprogram
    TechTableList : TList<Integer>;                 //Technical table pos
    iProgramNamePos : Integer;                      //Program name pos
    ProgramNumberList : TList<Integer>;             //Program number pos
    PircingList : TList<Integer>;                   //Pircing pos list
    AllPircingList : TList<Integer>;                //All pircing pos list
    MesureList : TList<Integer>;                    //Mesured point list
    FNameIn : string;
    FNameOut: string;

    CurrMemo : byte;                                //Current memo click
 //   ComPortError: Boolean;

    procedure FileDroped(FileName : string);          //Load file to memo and tune up buttons
    procedure GetDataFromFile;                        //Get all data about file
    procedure StatusProgress(Progress : Integer);     //Set progress to progress bar
    function ChangeName(OldNumber, NewNumber : string): string;  //Change number of program
    procedure SetStatus(Panel: Integer; Text: string);    //Sets status string
    procedure ButtonEnabled(Enabled : boolean);     //Switch on/off buttons

  end;

var
  MainForm: TMainForm;
     procedure ShowList(lst : TList<Integer>);                // Show any list items


implementation

uses
  About;

{$R *.dfm}

procedure TMainForm.GetDataFromFile;
var
  I: Integer;
  Reg: TRegExpr;
  Str, S: string;
  SearchPircing: Boolean;
  DataOneAdded: Boolean;
  DataTwoAdded: Boolean;
  IncPircing: Integer;
  CountPircing : Integer;
  ggI: Integer;
  AA : string;

begin
  MainForm.Cursor := crHourGlass;

  SearchPircing := False;
  DataOneAdded := False;
  DataTwoAdded := False;
  IncPircing := 0;
  CountPircing := 0;

  MainForm.WithOutHSenList.Clear;
  MainForm.iCoordTablePos := 0;
  MainForm.CallSubprogramList.Clear;
  MainForm.TechTableList.Clear;
  MainForm.iProgramNamePos := 0;
  MainForm.ProgramNumberList.Clear;
  MainForm.PircingList.Clear;
  MainForm.AllPircingList.Clear;
  MainForm.MesureList.Clear;

  Reg := TRegExpr.Create;

  try
    for I := 0 to MainForm.JvMemoIn.Lines.Count - 1 do
    begin
      Str := MainForm.JvMemoIn.Lines.Strings[I];

      with Reg do
      begin
        Expression := 'N\d+G934\[\d+\]';  //Gets height sensor pos
        if Exec(Str) then
           MainForm.WithOutHSenList.Add(I);

        Expression := 'N\d+G92';          //Gets table pos
        if Exec(Str) then
          MainForm.iCoordTablePos := I;

        Expression := 'N\d+G801\[\d+\]';  //Gets technical table pos
        if Exec(Str) then
        begin
          Expression := '\[\d+\]';        //Fill the edit
          if Exec(Str) then
          begin
            Delete(Str, 1, MatchPos[0]);
            Delete(Str, Length(Str), 1);
            MainForm.JvEditTechTable.Text := Str;
          end;
            MainForm.TechTableList.Add(I);
        end;

        Expression := '\(DFS,P\d+,[a-z A-Z \d _]*\)';   //gets program name pos
        if Exec(Str) then
        begin
          Expression := '[a-z A-Z \d _]*\)';       //fill the edit
          if Exec(Str) then
          begin
            S := Match[0];
            Delete(S, Length(S), 1);
            MainForm.JvEditProgName.Text := S;
          end;

          Expression := 'P\d+';                  //fill the edit
          if Exec(Str) then
          begin
            S := Match[0];
            Delete(S, 1, 1);
            MainForm.JvEditProgNumber.Text := S;
          end;
          MainForm.iProgramNamePos := I;
        end;

        Expression := 'N\d+Q\d*';         //Gets call subprogram
        if Exec(Str) then
          MainForm.CallSubprogramList.Add(I);

        Expression := '\(DFS,P\d+\)';     //Gets program number pos
        if Exec(Str) then
        begin
          MainForm.ProgramNumberList.Add(I);
          SearchPircing := True;
        end;

        Expression := 'N\d+G934\[\d*\]';     //Gets mesured point pos
        if Exec(Str) then
          MainForm.MesureList.Add(I);

        if SearchPircing then                //Gets all pircing pos
        begin
          Expression := 'N\d+G933\[\d*\]';
          if Exec(Str) then
          begin
            IncPircing := I;
            Inc(CountPircing);

            AllPircingList.Add(IncPircing);
          end;

          Expression := 'N\d+M02';
          if Exec(Str) then
          begin
            if CountPircing <> 1 then
              MainForm.PircingList.Add(IncPircing)
            else
              MainForm.PircingList.Add(-100000000);

            CountPircing := 0;
            SearchPircing := False;
          end;
        end;
      end;
    end;

  finally
    FreeAndNil(Reg);
    MainForm.Cursor := crDefault;

    SetStatus(0, Format('Lines: %d', [JvMemoIn.Lines.Count]));
    SetStatus(1, Format('File: %s', [FNameIn]));
  end;
end;

procedure TMainForm.FileDroped(FileName : string);
var
  ViewFName : string;
begin
  MainForm.Cursor := crHourGlass;
  MainForm.JvMemoIn.Clear;
  MainForm.JvMemoIn.Lines.LoadFromFile(FileName);
  FNameIn := FileName;

  SetStatus(0, Format('Lines: %d', [JvMemoIn.Lines.Count]));
  SetStatus(1, Format('File: %s', [FNameIn]));

  ViewFName := ChangeFileExt(FNameIn, '.tmt');

  if FileExists(ViewFName) then
  begin
    MainForm.TabSheetGeometry.Enabled := true;
    MainForm.Tcogeoview1.Filename := ViewFName;
  end;

  ActionProcess.Enabled := True;
  MainForm.Cursor := crDefault;
end;

procedure TMainForm.ActionAboutExecute(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ActionFindExecute(Sender: TObject);
begin
  case CurrMemo of
    1 : MainForm.JvFindReplace1.Find;
    2 : MainForm.JvFindReplace2.Find;
  end;
end;

procedure TMainForm.ActionJumpExecute(Sender: TObject);
begin

  MainForm.JvMemoIn.Perform(EM_LINESCROLL,0,100) ;
end;

procedure TMainForm.ActionProcessExecute(Sender: TObject);
var
  Reg: TRegExpr;
  Str: string;
  I, J, K, L, N, P: Integer;
  StrNumber: Integer;
  DelNewTable: Boolean;
  ChangeModeSensor : Integer;
  NewTable: string;
  M: Integer;
  ShiftList: Integer;
  ChangeNameStr : string;
  R: Integer;
  OnePircingContour: Boolean;
  ReadIni: string;
  IncPircing: Integer;
  CountPircing : Integer;
  SearchPircing: Boolean;
  S: Integer;
  FIleSize: Int64;
  MaxFileLength: Integer;
  Q: Integer;
begin
  ButtonEnabled(False);
  Application.ProcessMessages;
  StatusProgress(5);

  MainForm.Cursor := crHourGlass;



  Reg := TRegExpr.Create;
  DelNewTable := False;
  ChangeModeSensor := 0;
  ShiftList := 0;
  StrNumber := 0;
  M := 0;

  JvMemoOut.Clear;
  JvMemoOut.Lines.BeginUpdate;

  Application.ProcessMessages;

  MaxFileLength := JvAppIniFileStorage1.ReadInteger('Data\MaxFileLngth=', 300000);

  for J:= 0 to JvMemoIn.Lines.Count - 1 do
  begin

  //delete number string
    Str := JvMemoIn.Lines.Strings[J];
    if JvCheckBoxDelNumberStr.Checked then
    begin
      Reg.Expression := 'N\d+';
      if Reg.Exec(Str) then
        Delete(Str, 1, Reg.MatchLen[0]);
    end;

      Application.ProcessMessages;
  //delete new table
//    if JvCheckBoxDeleteNewTable.Checked then
//    begin
      Reg.Expression := '(DFS,G 999999999,WSS-DATEI LASER               ,RWED)';
      if Reg.Exec(Str) then
        DelNewTable := True;
//    end;

    if not DelNewTable then
      JvMemoOut.Lines.Add(Str);
  end;

  StatusProgress(25);

  //Change coord table
  if JvRadioGroupSelectTable.ItemIndex <> 0 then
  begin
    Str := JvMemoOut.Lines.Strings[iCoordTablePos];
    JvMemoOut.Lines.Strings[iCoordTablePos] := Format(Str + ' G%d', [53 + JvRadioGroupSelectTable.ItemIndex]);
  end;

  if JvCheckBoxLookAHead.Checked then
  begin
    JvMemoOut.Lines.Strings[iCoordTablePos] := JvMemoOut.Lines.Strings[iCoordTablePos] + ' G108';
  end;

  //With out height sensor
  if JvCheckBoxSensorUp.Checked then
  begin
    for L := 0 to MainForm.WithOutHSenList.Count - 1 do
    begin
      Str := JvMemoOut.Lines.Strings[MainForm.WithOutHSenList.Items[L]];
      StrNumber := MainForm.WithOutHSenList.Items[L];
      Reg.Expression := '\[\d+\]';
      MainForm.JvMemoOut.Lines.Strings[StrNumber] := Reg.Replace(Str, Format('[%d]', [1]), False);
      Application.ProcessMessages;
    end;
  end;

  StatusProgress(35);

  //Slash call subprogram
  if JvCheckBoxSlashCall.Checked then
  begin
    for K := 0 to MainForm.CallSubprogramList.Count - 1 do
    begin
      Str := JvMemoOut.Lines.Strings[MainForm.CallSubprogramList.Items[K]];
      Str := '/' + Str;
      JvMemoOut.Lines.Strings[MainForm.CallSubprogramList.Items[K]] := Str;
      Application.ProcessMessages;
    end;
  end;

  for R := 0 to AllPircingList.Count - 1 do
  begin
    Str := JvMemoOut.Lines.Strings[MainForm.AllPircingList.Items[R]];
    SetLength(Str, (Length(Str) - 2));

    if MainForm.JvRadioGroupSelectPiercing.ItemIndex <> 8 then
    begin
      Str := Str + (MainForm.JvRadioGroupSelectPiercing.ItemIndex + 1).ToString +']';
    end
    else
      Str := Str + (MainForm.JvRadioGroupSelectPiercing.ItemIndex + 2 ).ToString +']';

    if JvCheckBoxSlashCall.Checked then Str := '/' + Str;

    JvMemoOut.Lines.Strings[MainForm.AllPircingList.Items[R]] := Str;
    Application.ProcessMessages;
  end;

  StatusProgress(50);

  //Change mwsured point mode
  for Q := 0 to MainForm.MesureList.Count - 1 do
  begin
     Str := JvMemoIn.Lines.Strings[MainForm.MesureList.Items[Q]];
     SetLength(Str, Length(Str) - 2);
     Str := Str + MainForm.JvRadioGroupCircleMesure.ItemIndex.ToString + ']';

     JvMemoOut.Lines.Strings[MainForm.MesureList.Items[Q]] := Str;
     Application.ProcessMessages;
  end;

  StatusProgress(70);

  //Change program number
  for P := 0 to CallSubprogramList.Count - 1 do
  begin
    Str := JvMemoOut.Lines.Strings[MainForm.CallSubprogramList.Items[P]];
    StrNumber :=  MainForm.CallSubprogramList.Items[P];

    Reg.Expression := 'Q\d+';
    if Reg.Exec(Str) then
    begin
      ChangeNameStr := ChangeName(Reg.Match[0], MainForm.JvEditProgNumber.Text);
      MainForm.JvMemoOut.Lines.Strings[StrNumber] := Reg.Replace(Str, ChangeNameStr, False)
    end;
    Application.ProcessMessages;
  end;

  for R := 0 to ProgramNumberList.Count - 1 do
  begin
    Str := JvMemoOut.Lines.Strings[MainForm.ProgramNumberList.Items[R]];
    StrNumber :=  MainForm.ProgramNumberList.Items[R];

    Reg.Expression := '\d+';
    if Reg.Exec(Str) then
    begin
      ChangeNameStr := ChangeName(Reg.Match[0], MainForm.JvEditProgNumber.Text);
      MainForm.JvMemoOut.Lines.Strings[StrNumber] := Reg.Replace(Str, ChangeNameStr, False);
      Application.ProcessMessages;
    end;
  end;
  Str := JvMemoOut.Lines.Strings[iProgramNamePos];
  Reg.Expression := 'P\d+';
  if Reg.Exec(Str) then
  begin
    MainForm.JvMemoOut.Lines.Strings[iProgramNamePos] := Reg.Replace(Str, 'P' + MainForm.JvEditProgNumber.Text, False);
  end;

  //Change name of program
  Str := JvMemoOut.Lines.Strings[iProgramNamePos];
  Reg.Expression := ',[a-z A-Z \d _]*\)';
  MainForm.JvMemoOut.Lines.Strings[iProgramNamePos] := Reg.Replace(Str, ',' +
             MainForm.JvEditProgName.Text + ')', False);

  //Change technical table
  //Inner holes best quality
  if JvCheckBoxInnerHoles.Checked then
  begin
    ReadIni := JvAppIniFileStorage1.ReadString('TechTables\'+ JvEditTechTable.Text, '0000000') ;
    NewTable := InputBox('Trasformer', 'Enter table : ', ReadIni);
  end
  else
    NewTable := MainForm.JvEditTechTable.Text;
  //tech table
  for I := 0 to MainForm.TechTableList.Count - 1 do
  begin
    Str := JvMemoOut.Lines.Strings[MainForm.TechTableList.Items[I]];
    StrNumber := MainForm.TechTableList.Items[I];

    Reg.Expression := '\[\d+\]';
    MainForm.JvMemoOut.Lines.Strings[StrNumber] := Reg.Replace(Str, '[' +
             NewTable + ']', False);
    Application.ProcessMessages;
  end;
  //last pircing
  if JvCheckBoxInnerHoles.Checked then
  begin

  PircingList.Clear;     //Reset list and search pircing again

  for S := 0 to JvMemoOut.Lines.Count - 1 do
  begin
    Str := JvMemoOut.Lines.Strings[S];

    Reg.Expression := '\(DFS,P\d+\)';     //Gets program number pos
    if Reg.Exec(Str) then
    begin
      SearchPircing := True;
    end;

    if SearchPircing then                //Gets all pircing pos
    begin
      Reg.Expression := 'N\d+G933\[\d*\]';
      if Reg.Exec(Str) then
      begin
        IncPircing := S;
        Inc(CountPircing);
      end;

      Reg.Expression := 'N\d+M02';
      if Reg.Exec(Str) then
      begin
        if CountPircing <> 1 then
          MainForm.PircingList.Add(IncPircing)
        else
          MainForm.PircingList.Add(-1000);

        CountPircing := 0;
        SearchPircing := False;
      end;
    end;

    Application.ProcessMessages;
  end;

    for L := 0 to PircingList.Count - 1 do
    begin
      if PircingList.Items[L] > 0 then
      begin
        StrNumber := PircingList.Items[L];

        MainForm.JvMemoOut.Lines.Strings[StrNumber] := Format('G801[%d]', [StrToInt(MainForm.JvEditTechTable.Text)]);
        //reverse order

        Str := 'G933[7]';
        if JvCheckBoxSlashCall.Checked then
          Str := '/' + Str;
        MainForm.JvMemoOut.Lines.Insert(StrNumber+1, Str);

        MainForm.JvMemoOut.Lines.Insert(StrNumber+1, 'G915[1]');

        if MainForm.JvCheckBoxSensorUp.Checked then
          ChangeModeSensor := 1
        else
          ChangeModeSensor := 0;
        MainForm.JvMemoOut.Lines.Insert(StrNumber + 1, Format('G934[%d]', [ChangeModeSensor]));

        for R := (L) to PircingList.Count - 1 do
        begin
          ShiftList := MainForm.PircingList.Items[R];
          Inc(ShiftList, 3);
          MainForm.PircingList.Items[R] := ShiftList;
        end;

      end
      else
        OnePircingContour := True;

      Application.ProcessMessages;
    end;
  end;

  //Delete 4 last lines
  if JvCheckBoxDeleteNewTable.Checked then
    for N := 1 to 4 do
    begin
      MainForm.JvMemoOut.Lines.Delete(MainForm.JvMemoOut.Lines.Count - 1);
    end;

  StatusProgress(100);

  if OnePircingContour then
    ShowMessage('Contours with one pircing are detected, check the results!');

  JvMemoOut.Lines.EndUpdate;
  FreeAndNil(Reg);
  OnePircingContour := False;

  ButtonEnabled(True);

  SetStatus(2, Format('Lines: %d ', [JvMemoOut.Lines.Count]));
  FNameOut := FNameIn;
  SetStatus(3, Format('File: %s', [FNameIn]));

  SetStatus(2, Format('Lines: %d ', [JvMemoOut.Lines.Count]));

  SetStatus(4, Format('Bytes: %d', [Length(JvMemoOut.Text)]));


  if ((CallSubprogramList.Count - 1) > 99) then
    ShowMessage('WARNING!!! Count of subprogram more than 99! ');

  if (Length(JvMemoOut.Text) > MaxFileLength) then
    ShowMessage('WARINIG!!! Length of file more than ' + MaxFileLength.ToString +' bytes!');


  MainForm.Cursor := crDefault;
end;

procedure TMainForm.ActionReplaceExecute(Sender: TObject);
begin
  case CurrMemo of
    1 : MainForm.JvFindReplace1.Replace;
    2 : MainForm.JvFindReplace2.Replace;
  end;
end;

procedure TMainForm.ActionSaveExecute(Sender: TObject);
begin
  JvSaveDialog1.FileName := FNameIn;
  if JvSaveDialog1.Execute then
    MainForm.JvMemoOut.Lines.SaveToFile(JvSaveDialog1.FileName);
end;

procedure TMainForm.ActionSendExecute(Sender: TObject);
var
  Buf: String;
  N, PackSize, PackCount: Integer;
  F : TMemoryStream;
  MaxFileLength : integer;
begin
  if MessageDlg('Are you ready?', mtConfirmation, mbYesNo, 0) = mrNo then
    Exit;

  FBreak := False;
  try
    JvProgressComponent1.ProgressPosition := 0;
    JvProgressComponent1.InfoLabel := 'Sending file : ' + FNameOut;

    BComPort1.Port :=  JvAppIniFileStorage1.ReadString('COMPort\Port');
    BComPort1.BaudRate := TBaudRate(JvAppIniFileStorage1.ReadInteger('COMPort\BaudRate'));
    BComPort1.ByteSize := TByteSize(JvAppIniFileStorage1.ReadInteger('COMPort\ByteSize'));
    BComPort1.OutBufSize := JvAppIniFileStorage1.ReadInteger('COMPort\OutBufSize');
    BComPort1.Parity := TParity(JvAppIniFileStorage1.ReadInteger('COMPort\Parity'));
    BComPort1.StopBits := TStopBits(JvAppIniFileStorage1.ReadInteger('COMPort\StopBits'));

    if not BComPort1.Open then Exit;  // Открываем порт

    JvProgressComponent1.Execute;

    F := TMemoryStream.Create;
    MainForm.JvMemoOut.Lines.SaveToStream(F);

    // Определим размер и количество пакетов.
    if F.Size <= BComPort1.OutBufSize then
    begin
      PackSize := F.Size; PackCount := 1;
    end else
    begin
      PackSize := BComPort1.OutBufSize;
      PackCount := F.Size div PackSize;
      if (F.Size mod PackSize) > 0 then Inc(PackCount);
    end;

    JvProgressComponent1.ProgressMax := PackCount;

    N := 0; FEmpty := False;
    // Передаем имя файла и его размер
   BComPort1.WriteStr('transmit.tmp' + ':' + IntToStr(F.Size));

    repeat
      repeat
        // Ждем, пока выходной буфер не освободится или пользователь не прервет передачу
        Application.ProcessMessages; Sleep(10);

        if JvProgressComponent1.Cancel then
          FBreak := True;
      until FEmpty or FBreak;
      if FBreak then
      // Пользователь прервал передачу. Ожидание конца передачи текущего пакета
      begin
        repeat
          Application.ProcessMessages; Sleep(10);
        until FEmpty;
          JvProgressComponent1.Hide;
          ShowMessage('Transmiting canceled!');
        Break;
      end;
      F.Seek(N * PackSize, soFromBeginning);
      if (F.Size - F.Position) < PackSize then  // Последний пакет
        PackSize := F.Size - F.Position;

      SetLength(Buf, PackSize);
      F.Read(Buf[1], PackSize);
      FEmpty := False;
      BComPort1.WriteStr(Buf);
      Inc(N);
      JvProgressComponent1.ProgressPosition := JvProgressComponent1.ProgressPosition + 1;
      JvProgressComponent1.InfoLabel := 'Bytes remain: ' + (F.Size - (N * PackSize)).ToString;
    until N = PackCount;

    if not FBreak then
    begin
      if JvCheckBoxSaveChangedFile.Checked then
        F.SaveToFile(ChangeFileExt(FNameOut, '_TF') + '.LST');

      ShowMessage('Transmiting success!');
    end;
  finally
    F.Free;

    if BComPort1.Close then
    begin
      JvProgressComponent1.Hide;
    end;
  end;
end;

procedure TMainForm.BComPort1TxEmpty(Sender: TObject);
begin
  FEmpty := True; // Все данные ушли из буфера порта, можно передавать еще пакет
end;

procedure TMainForm.ButtonEnabled(Enabled: boolean);
var
  I : Integer;
  S : string;
begin


    for I := 0 to MainForm.ComponentCount -1 do
    begin
      if ((MainForm.Components[I] is TButton) or (MainForm.Components[I] is TJvPanel) or (MainForm.Components[I] is TJvRadioGroup) or (MainForm.Components[I] is TJvCheckBox) or (MainForm.Components[I] is TJvEdit)) then
        if Enabled then TControl(Components[I]).Enabled := True
        else TControl(Components[I]).Enabled := False;
      Application.ProcessMessages;

      if Enabled then
        MainForm.TabSheetTransform.Cursor := crDefault
      else
        MainForm.TabSheetTransform.Cursor := crHourGlass;
    end;






  {  if Enabled then
    begin
      ActionProcess.Enabled := True;
      ActionSend.Enabled := True;
      ActionSave.Enabled := True;
      ActionExit.Enabled := True;
      ActionAbout.Enabled := True;
      JvEditProgName.Enabled := True;
      JvEditTechTable.Enabled := True;
      JvEditProgNumber.Enabled := True;
      JvRadioGroupSelectTable.Enabled := True;
      JvRadioGroupCircleMesure.Enabled := True;
      JvRadioGroupSelectPiercing.Enabled := True;
      JvCheckBoxInnerHoles.Enabled := True;
      JvCheckBoxSensorUp.Enabled := True;
      JvCheckBoxSlashCall.Enabled := True;
      JvCheckBoxDelNumberStr.Enabled := True;
      JvCheckBoxDeleteNewTable.Enabled := True;
      JvCheckBoxSaveChangedFile.Enabled := True;
    end
    else
    begin
      ActionProcess.Enabled := False;
      ActionSend.Enabled := False;
      ActionSave.Enabled := False;
      ActionExit.Enabled := False;
      ActionAbout.Enabled := False;
      JvEditProgName.Enabled := False;
      JvEditTechTable.Enabled := False;
      JvEditProgNumber.Enabled := False;
      JvRadioGroupSelectTable.Enabled := False;
      JvRadioGroupCircleMesure.Enabled := False;
      JvRadioGroupSelectPiercing.Enabled := False;
      JvCheckBoxInnerHoles.Enabled := False;
      JvCheckBoxSensorUp.Enabled := False;
      JvCheckBoxSlashCall.Enabled := False;
      JvCheckBoxDelNumberStr.Enabled := False;
      JvCheckBoxDeleteNewTable.Enabled := False;
      JvCheckBoxSaveChangedFile.Enabled := False;
    end;   }
end;

function TMainForm.ChangeName(OldNumber, NewNumber: string): string;
var
  CallNumber: string;
  Number: string;
  NewN: string;
  
  Reg: TRegExpr;
begin
  Reg := TRegExpr.Create;
  CallNumber := OldNumber;
  Number := OldNumber;
  NewN := '';

  Delete(CallNumber, (Length(CallNumber) - 6), 7);
  Delete(Number, 1, Length(CallNumber));

  if Length(NewNumber) <> 7 then
    NewN := _GenerateSymbols(7 - Length(NewNumber), '0');

  Result := CallNumber + NewN + NewNumber;
  FreeAndNil(Reg);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  WithOutHSenList := TList<Integer>.Create;
  CallSubprogramList := TList<Integer>.Create;
  TechTableList  := TList<Integer>.Create;
  ProgramNumberList := TList<Integer>.Create;
  PircingList := TList<Integer>.Create;
  AllPircingList := TList<Integer>.Create;
  MesureList :=TList<Integer>.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(WithOutHSenList);
  FreeAndNil(CallSubprogramList);
  FreeAndNil(TechTableList);
  FreeAndNil(ProgramNumberList);
  FreeAndNil(PircingList);
  FreeAndNil(AllPircingList);
  FreeAndNil(MesureList);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  JvMemoIn.Width := Round((JvPanel2.Width / 2) - JvxSplitter1.Width);

  JvStatusBar1.Panels.Items[1].Width := (JvMemoIn.Width - JvStatusBar1.Panels.Items[0].Width);

  JvStatusBar1.Panels.Items[3].Width := JvMemoOut.Width- JvStatusBar1.Panels[2].Width + 20;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if ParamCount > 0 then
  begin
    JvPageControl1.ActivePage := TabSheetTransform;
    MainForm.FileDroped(ParamStr(1));
  end;
end;

procedure TMainForm.JvDragDrop1Drop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
begin
  MainForm.FileDroped(Value[0]);
end;

procedure TMainForm.JvDragDrop2Drop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
begin
  JvMemoOut.Clear;
  ActionSend.Enabled := True;
  ActionSave.Enabled := True;
  JvMemoOut.Lines.LoadFromFile(Value[0]);

  FNameOut := Value[0];
  SetStatus(3, Format('File: %s', [FNameOut]));
  SetStatus(2, Format('Lines: %d', [JvMemoOut.Lines.Count]));
end;

procedure TMainForm.JvDragDrop3Drop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
begin
  MainForm.Tcogeoview1.Filename := Value[0];
end;

procedure TMainForm.JvMemoInChange(Sender: TObject);
begin
  MainForm.GetDataFromFile;        //Collect data from file
end;

procedure TMainForm.JvMemoInMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CurrMemo := 1;  //Change current memo
end;

procedure TMainForm.JvMemoOutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CurrMemo := 2;  //Change current memo
end;

procedure TMainForm.JvProgressComponent1Close(Sender: TObject);
begin
  FBreak := True;
end;


procedure TMainForm.JvRadioGroupSelectPiercingClick(Sender: TObject);
begin
  case MainForm.JvRadioGroupSelectPiercing.ItemIndex of
    3 : ShowMessage('WARNING!!! That mode is option!');
    7 : ShowMessage('WARNING!!! That mode is option!');
    8 : ShowMessage('WARNING!!! That mode doesn''t work!');
  end;
end;

procedure TMainForm.SetStatus(Panel: Integer; Text: string);
begin
  MainForm.JvStatusBar1.Panels[Panel].Text := Text;
end;

procedure TMainForm.StatusProgress(Progress : Integer);
begin
  MainForm.JvProgressBar1.Position := Progress;
  Application.ProcessMessages;
end;

procedure ShowList(lst : TList<Integer>);
var
  I: Integer;
  Str : string;
begin
  for I := 0 to lst.Count-1 do
  begin
    Str := Str + lst.Items[I].ToString + #10#13;

  end;


  ShowMessage(Str);
end;

end.
