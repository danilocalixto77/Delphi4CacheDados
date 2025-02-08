unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  LocalCache4d, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Data.Module, Log.Monitor;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LocalCache.Instance('cachededados').SetItem(Edit1.Text, Edit2.Text) ;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add(LocalCache.Instance('cachededados').GetItem(Edit1.Text));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  TLogMonitor.WriteLot('D:\Danilo\Cursos\AcademiaDoCodigo\MelhorandoDesempEficienciaAplicDelphiCacheDados\Log.txt','Inicio consulta');
  DMApp.FDQuery1.Close;
  DMApp.FDQuery1.SQL.Clear;
  DMApp.FDQuery1.SQL.Add('SELECT * FROM cliente');
  DMApp.FDQuery1.Open;

  DMApp.FDQuery1.First;
  while not(DMApp.FDQuery1.Eof) do
  begin
    Memo1.Lines.Add(DMApp.FDQuery1.FieldByName('nome').AsString);
    DMApp.FDQuery1.Next;
  end;
  TLogMonitor.WriteLot('D:\Danilo\Cursos\AcademiaDoCodigo\MelhorandoDesempEficienciaAplicDelphiCacheDados\Log.txt','Fechanco consulta');

end;

end.
