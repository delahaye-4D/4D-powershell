//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;_scope_;$current)
C_COLLECTION:C1488($_path)
C_LONGINT:C283($i;$p)
C_TEXT:C284(${1})


If (_scope_=Null:C1517)
	
	_scope_:=New object:C1471
	
End if 


If (Count parameters:C259>0)
	
	$current:=_scope_
	For ($p;1;Count parameters:C259)
		
		$_path:=Split string:C1554(${$p};".";sk couper espaces:K86:2)
		
		For ($i;0;$_path.length-1)
			
			If ($current[$_path[$i]]=Null:C1517)
				$current[$_path[$i]]:=New object:C1471
			End if 
			
			$current:=$current[$_path[$i]]
		End for 
		
		
	End for 
	
	$0:=$current
	
Else 
	
	$0:=_scope_
	
End if 

