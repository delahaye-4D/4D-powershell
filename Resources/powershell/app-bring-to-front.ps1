#---------------------------------------------------------------------------------------------------------
#
# FROM Dominique Delahaye <dominique.delahaye@4D.com>
#
# Ce script permet de passer au premier plan l'application défini par le pid passé en parametre
#
# paramètres : json 4D
#
#             pid   : numéro du process id de l'instance à passer au premier plan
#             debug : boolean
#
# versions   :
#              1.0.0 ( 28/02/2020 ) pour le composant infoReport
#
#---------------------------------------------------------------------------------------------------------



Param (
    [Parameter(Position=1)]
    [string]$param        = '{}'
    )



Clear

$script_version = "1.0.0"
$powershellVersion = $PSVersionTable.PSVersion.Major



$o = $param | ConvertFrom-Json 


Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public class SFW {
     [DllImport("user32.dll")]
     [return: MarshalAs(UnmanagedType.Bool)]
     public static extern bool SetForegroundWindow(IntPtr hWnd);
  }
"@

$_pid = 2296

$h =  (get-process -Id $o.pid).MainWindowHandle
[SFW]::SetForegroundWindow($h)


