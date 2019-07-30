program Project_Transformer;

uses
  Vcl.Forms,
  TransForm in 'TransForm.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  MainFunc in 'MainFunc.pas',
  BCPort in 'BCPort.pas',
  RegExpr in 'RegExpr.pas',
  About in 'About.pas' {AboutForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Transfromer';
  TStyleManager.TrySetStyle('Ruby Graphite');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
