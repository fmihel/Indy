{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}
{
{   Rev 1.1    1/21/2004 4:03:08 PM  JPMugaas
{ InitComponent
}
{
{   Rev 1.0    11/13/2002 08:00:12 AM  JPMugaas
}
unit IdSASLAnonymous;

interface
uses IdSASL, IdTCPConnection;

{
Implements RFC 2245

Anonymous SASL Mechanism

Oxymoron if you ask me :-).

5-20-2002 - Started this unit.
}
type
  TIdSASLAnonymous = class(TIdSASL)
  protected
    FTraceInfo : String;
    procedure InitComponent; override;
  public
    class function ServiceName: TIdSASLServiceName; override;
    function StartAuthenticate(const AChallenge: String): String; override;
  published
    property TraceInfo : String read FTraceInfo write FTraceInfo;
  end;

implementation

{ TIdSASLAnonymous }

procedure TIdSASLAnonymous.InitComponent;
begin
  inherited;
  FSecurityLevel := 0;   //broadcast on the evening news and post to every
                         // newsgroup for good measure
end;

class function TIdSASLAnonymous.ServiceName: TIdSASLServiceName;
begin
  Result := 'ANONYMOUS';   {Do not translate}
end;

function TIdSASLAnonymous.StartAuthenticate(
  const AChallenge: String): String;
begin
  Result := TraceInfo;
end;

end.
