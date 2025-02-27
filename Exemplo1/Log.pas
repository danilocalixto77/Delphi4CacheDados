unit Log;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TLog = class
  private
  public
    class function Instance: TLog; virtual;
    function Load(const LogFile: String;
                  const Strings: TStrings): Boolean; virtual;
    function WriteLog(const LogFile: String;
                      const aMessage: String;
                      const CanCreate: Boolean = True;
                      const ClearBeforeWrite: Boolean = False;
                      const UseDateTimeInLog: Boolean = True): Boolean;
  end;


implementation

var
  FInstance: TLog;

class function TLog.Instance: TLog;
begin
  Result := FInstance;
end;

function TLog.Load(const LogFile: String; const Strings: TStrings): Boolean;
begin
  Result := False;
  if not (Assigned(Strings) and FileExists(LogFile)) then
    Exit;

  var LLog := TStringList.Create;
  try
    LLog.LoadFromFile(LogFile);

    if CompareText(Strings.Text, LLog.Text) <> 0 then
      Strings.Text := LLog.Text;

      Result := True;
  finally
    LLog.Free;
  end;
end;

function TLog.WriteLog(const LogFile, aMessage: String; const CanCreate,
  ClearBeforeWrite, UseDateTimeInLog: Boolean): Boolean;
begin
  const LOGMESSAGE = '%s - %s';
  const DATEFORMATE = 'DD-MM-YYYY HH:MM:SS';
  var lFilLOg: TextFile;

  Result := False;
  var lLogDir := IncludeTrailingPathDelimiter(ExtractFilePath(LogFile));
  if not (FileExists(LogFile) or (CanCreate)) then
    Exit;

  if not (DirectoryExists(lLogDir) or ForceDirectories(lLOgDir)) then
    Exit;

  AssignFile(lFilLog, LogFile);

  case FileExists(LogFile) and (not ClearBeforeWrite) of
    True: Append(LfilLog);
    False: Rewrite(lFilLog);
  end;

  var lStrLog: String;
  case UseDateTimeInLog of
    True: lStrLog := Format(LOGMESSAGE, [FormatDateTime(DATEFORMATE, Now), aMessage]);
    False: LStrLog := aMessage;
  end;

  Writeln(lFilLog, lStrLog);
  CloseFile(lFilLOg);
  Result := True;

end;

initialization
  //Inicializando log junto com a aplica��o
  FInstance := TLog.Create;

finalization
  FInstance.Free;

end.
