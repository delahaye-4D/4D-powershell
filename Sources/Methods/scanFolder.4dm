//%attributes = {"invisible":true,"preemptive":"capable"}

  //<documentation>
  //
  //----------------------------------------------------------------------------------------
  // syntaxe : scanFolder ( $1 : text ; $2 : text ) -> text
  //----------------------------------------------------------------------------------------
  // $0  <-   text
  // $1   :   text
  // $2   :   text
  //
  // execute on server : false
  // shared            : false
  // invisible         : true
  // sql               : false
  // web               : false
  // soap              : false
  // wsdl              : false
  //
  // Fri, 03 Jun 2016 17:57:36 GMT
  //
  // developer : dominique
  // computer  : LATITUDE-1187
  //
  // 4D S.A.S 
  //
  //</documentation>

C_TEXT:C284($1;$2)
C_TEXT:C284($0;$result)

If (Test path name:C476($1)=Est un dossier:K24:2)
	C_LONGINT:C283($index)
	ARRAY TEXT:C222($_folders;0)
	FOLDER LIST:C473($1;$_folders)
	
	
	$index:=Find in array:C230($_folders;$2)
	If ($index>0)
		$0:=$1+$_folders{$index}+Séparateur dossier:K24:12
	Else 
		
		C_LONGINT:C283($i;$size)
		
		$size:=Size of array:C274($_folders)
		
		For ($i;1;$size)
			
			$result:=scanFolder ($1+$_folders{$i}+Séparateur dossier:K24:12;$2)
			
			If (Test path name:C476($result)=Est un dossier:K24:2)
				$i:=$size+1  // quick exit
				$0:=$result
			End if 
			
		End for 
		
	End if 
	
End if 
