//%attributes = {}

C_TEXT:C284($script_path)
C_OBJECT:C1216($appl;$result)
C_LONGINT:C283($ms)

  //MONTRER SUR DISQUE(powershell_path )

$script_path:=powershell_script_path ("app-bring-to-front")


$appl:=Get application info:C1599
$appl.debug:=False:C215  // permet de visualiser le fichier . bat 
$appl.hidden:=True:C214  // masquer la console d'exécution
$appl.async:=False:C215  // execution en asynchrone

$ms:=Milliseconds:C459
Repeat 
	  // on attend 10 secondes pour passer l'app en arrière plan
Until ((Milliseconds:C459-$ms)>10000)


$result:=powershell_run_script ($script_path;$appl)
