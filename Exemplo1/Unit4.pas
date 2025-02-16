unit Unit4;

interface

uses
  System.SysUtils,
  System.IniFiles,
  System.Classes,
  LocalCache4D;

type
  TConfiguracao = class
  private
    FPath : String;
    FArquivo : TIniFile;

    const
      ARQUIVOINI  = 'CONFIGURACAO.CONF';
      TEMPINI     = 'TEMP';
      SECAOCONF    = 'CONFIGURACAO';

  public
    constructor Create(Path: String);
    destructor Destroy; override;
    class function New(Path: String): TConfiguracao;
    function SetDataBase(Value: String): TConfiguracao;
    function GetDataBase: String;
    function SetUserName(Value: String): TConfiguracao;
    function GetUserName: String;
    function SetPassWord(Value: String): TConfiguracao;
    function GetPassWord: String;
    function SetDriveID(Value: String): TConfiguracao;
    function GetDriveID: String;


  end;



implementation

{ TConfiguracao }

constructor TConfiguracao.Create(Path: String);
begin
  FPath    := Path;
  FArquivo := TIniFile.Create(FPath+ARQUIVOINI);
end;

destructor TConfiguracao.Destroy;
begin
  FArquivo .Free;
  if FileExists(FPath+TEMPINI) then
    DeleteFile(FPath+TEMPINI);
  inherited;
end;

function TConfiguracao.GetDataBase: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'DATABASE','');
end;

function TConfiguracao.GetDriveID: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'DRIVEID','');
end;

function TConfiguracao.GetPassWord: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'PASSWORD','');
end;

function TConfiguracao.GetUserName: String;
begin
  Result := FArquivo.ReadString(SECAOCONF,'USERNAME','');
end;

class function TConfiguracao.New(Path: String): TConfiguracao;
begin
  Result := Self.Create(Path);
end;

function TConfiguracao.SetDataBase(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'DATABASE',Value);
  LocalCache.Instance('config').SetItem('database',Value);
end;

function TConfiguracao.SetDriveID(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'DRIVEID',Value);
end;

function TConfiguracao.SetPassWord(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'PASSWORD',Value);
end;

function TConfiguracao.SetUserName(Value: String): TConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECAOCONF,'USERNAME',Value);
end;

end.
