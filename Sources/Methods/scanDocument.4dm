//%attributes = {"invisible":true,"preemptive":"capable"}

  //<documentation>
  //
  //----------------------------------------------------------------------------------------------
  // syntaxe : scan document ( $1 : text ; $2 : text ) -> text
  //----------------------------------------------------------------------------------------------
  // $0  <-   text
  // $1   :   text
  // $2   :   text
  //
  // execute on server : false
  // shared            : true
  // invisible         : true
  // sql               : false
  // web               : false
  // soap              : false
  // wsdl              : false
  //
  //
  // 4D S.A.S 
  //
  // Wed, 02 Sep 2015 10:29:08 GMT
  //
  //</documentation>

C_TEXT:C284($1;$2)
C_TEXT:C284($0;$result)

C_LONGINT:C283($i;$size)


If (Test path name:C476($1)=Est un dossier:K24:2)
	C_LONGINT:C283($index)
	ARRAY TEXT:C222($_documents;0)
	DOCUMENT LIST:C474($1;$_documents)
	
	
	$index:=Find in array:C230($_documents;$2)
	If ($index>0)
		$0:=$1+$_documents{$index}
	Else 
		
		
		FOLDER LIST:C473($1;$_documents)
		$size:=Size of array:C274($_documents)
		
		  //--------------------- CONTROL EXECUTION OFF ---------------------------------------
		  //%R-
		  //-----------------------------------------------------------------------------------
		
		For ($i;1;$size)
			IDLE:C311
			$result:=scanDocument ($1+$_documents{$i}+Séparateur dossier:K24:12;$2)
			
			If (Test path name:C476($result)=Est un document:K24:1)
				$i:=$size+1  // quick exit
				$0:=$result
			End if 
			
		End for 
		  //--------------------- CONTROL EXECUTION RESTORE -------------------------------
		  //%R*
		  //-------------------------------------------------------------------------------
	End if 
	
End if 
