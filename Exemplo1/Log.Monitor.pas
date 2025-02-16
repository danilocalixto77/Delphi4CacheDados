unit Log.Monitor;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TLogMonitor = class
  private
  public
    class function ReadLog(const LogFile: String;
                           const Strings: TStrings): Boolean; virtual;
    class function WriteLog(const LogFile, aMessage: String;
                            const CanCreate: Boolean = True;
                            const ClearBeforeWrite: Boolean = False;
                            const UseDateTimeInLog: Boolean = True): Boolean;
  end;



implementation

uses Log.Register;

var FMonitor: TMultiReadExclusiveWriteSynchronizer;

class function TLogMonitor.ReadLog(const LogFile: String;
  const Strings: TStrings): Boolean;
begin
  FMonitor.BeginRead;
  Result := TLog.Instance.Load(LogFile, Strings);
  FMonitor.EndRead;
end;

class function TLogMonitor.WriteLog(const LogFile, aMessage: String;
  const CanCreate, ClearBeforeWrite, UseDateTimeInLog: Boolean): Boolean;
begin
  FMonitor.BeginWrite;
  Result := TLog.Instance.WriteLog(LogFile, aMessage, CanCreate, ClearBeforeWrite, UseDateTimeInLog);
  FMonitor.EndWrite;

end;


initialization
  FMonitor := TMultiReadExclusiveWriteSynchronizer.Create;

finalization
  FMonitor.Free;


end.
