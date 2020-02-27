//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($0;$powerShellFolder)

$powerShellFolder:=powershell_folder 

If (Test path name:C476($powerShellFolder)=Est un dossier:K24:2)
	
	$0:=scanDocument ($powerShellFolder;"powershell.exe")
	
End if 
