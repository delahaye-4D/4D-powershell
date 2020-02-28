//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($0;$1;$folder;$path;$folderName)

$folderName:="powershell"

$folder:=scanFolder (Get 4D folder:C485(Dossier Resources courant:K5:16;*);$folderName)

$path:=scanDocument ($folder;$1)

Case of 
		
	: (Test path name:C476($path)=Est un document:K24:1)
		
		
	Else 
		
		
		$path:=scanDocument ($folder;$1+"@")
		
		
End case 


Case of 
		
	: (Test path name:C476($path)=Est un document:K24:1)
		
	: (Structure file:C489=Structure file:C489(*))
		  // nous ne sommes pas dans un composant
		
	Else 
		  // le script n'est pas dans la base peut être dans le composant
		
		$folder:=scanFolder (Get 4D folder:C485(Dossier Resources courant:K5:16);$folderName)
		
		$path:=scanDocument ($folder;$1)
		
		Case of 
				
			: (Test path name:C476($path)=Est un document:K24:1)
				
				
			Else 
				
				
				$path:=scanDocument ($folder;$1+"@")
				
				
		End case 
		
End case 



$0:=$path