unit Unit4;

interface

uses
  System.SysUtils,
  System.IniFiles,
  System.Classes,
  LocalCache4D;

type
  TTipoConf = (CACHE, ARQ);

  TConfiguracao = class
  private
    FPath : String;
    FArquivo : TIniFile;
    FCache : Boolean;

    const
      ARQUIVOINI  = 'CONFIGURACAO.CONF';
      TEMPINI     = 'TEMP';
      SECAOCONF    = 'CONFIGURACAO';

  public
    constructor Create(Path: String);
    destructor Destroy; override;
    class function New(Path: String): TConfiguracao;
    function TipoConfiguracao(Value: TTipoConf): TConfiguracao;
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
  if not FileExists(ExtractFilePath(ParamStr(0))+'cache.lc4') then
  begin
    LocalCache.SaveToStorage('cache.lc4');
    Exit;
  end;
  LocalCache.LoadDatabase('cache.lc4');
end;

destructor TConfiguracao.Destroy;
begin
  FArquivo .Free;
  if FileExists(FPath+TEMPINI) then
    DeleteFile(FPath+TEMPINI);
  LocalCache.SaveToStorage('cache.lc4');
  inherited;
end;

function TConfiguracao.GetDataBase: String;
begin
  if not FCache then
  begin
    Result := FArquivo.ReadString(SECAOCONF,'DATABASE','');
    Exit;
  end;
  Result := LocalCache.Instance(SECAOCONF).GetItem('DATABASE');
end;

function TConfiguracao.GetDriveID: String;
begin
  if not FCache then
  begin
    Result := FArquivo.ReadString(SECAOCONF,'DRIVEID','');
    Exit;
  end;
  Result := LocalCache.Instance(SECAOCONF).GetItem('DRIVEID');
end;

function TConfiguracao.GetPassWord: String;
begin
  if not FCache then
  begin
    Result := FArquivo.ReadString(SECAOCONF,'PASSWORD','');
    Exit;
  end;
  Result := LocalCache.Instance(SECAOCONF).GetItem('PASSWORD');
end;

function TConfiguracao.GetUserName: String;
begin
  if not FCache then
  begin
    Result := FArquivo.ReadString(SECAOCONF,'USERNAME','');
    Exit;
  end;
  Result := LocalCache.Instance(SECAOCONF).GetItem('USERNAME');
end;

class function TConfiguracao.New(Path: String): TConfiguracao;
begin
  Result := Self.Create(Path);
end;

function TConfiguracao.SetDataBase(Value: String): TConfiguracao;
begin
  Result := Self;
  if not FCache then
  begin
    FArquivo.WriteString(SECAOCONF,'DATABASE',Value);
    Exit;
  end;
  LocalCache.Instance(SECAOCONF).SetItem('DATABASE',Value);
end;

function TConfiguracao.SetDriveID(Value: String): TConfiguracao;
begin
  Result := Self;
  if not FCache then
  begin
    FArquivo.WriteString(SECAOCONF,'DRIVEID',Value);
    Exit;
  end;
  LocalCache.Instance(SECAOCONF).SetItem('DRIVEID',Value);
end;

function TConfiguracao.SetPassWord(Value: String): TConfiguracao;
begin
  Result := Self;
  if not FCache then
  begin
    FArquivo.WriteString(SECAOCONF,'PASSWORD',Value);
    Exit;
  end;
  LocalCache.Instance(SECAOCONF).SetItem('PASSWORD',Value);
end;

function TConfiguracao.SetUserName(Value: String): TConfiguracao;
begin
  Result := Self;
  if not FCache then
  begin
    FArquivo.WriteString(SECAOCONF,'USERNAME',Value);
    Exit;
  end;
  LocalCache.Instance(SECAOCONF).SetItem('USERNAME',Value);
end;

function TConfiguracao.TipoConfiguracao(Value: TTipoConf): TConfiguracao;
begin
  case Value of
    CACHE: FCache := True;
    ARQ: FCache := False;
  end;
end;

end.
