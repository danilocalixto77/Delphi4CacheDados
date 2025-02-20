program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas',
  Data.Module in 'Data.Module.pas' {DMApp: TDataModule},
  Log.Monitor in 'Log.Monitor.pas',
  Log.Register in 'Log.Register.pas',
  Unit4 in 'Unit4.pas',
  Cliente in 'Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMApp, DMApp);
  Application.Run;
end.
