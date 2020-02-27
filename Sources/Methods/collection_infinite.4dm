//%attributes = {"invisible":true,"preemptive":"capable"}
C_COLLECTION:C1488($0;$1)

C_LONGINT:C283($i;$type)
C_TEXT:C284($string)


For ($i;0;$1.length-1)
	
	$type:=Value type:C1509($1[$i])
	
	Case of 
			
		: ($type=Est un objet:K8:27)
			object_infinite ($1[$i])
			
		: ($type=Est une collection:K8:32)
			collection_infinite ($1[$i])
			
		: ($type=Est un numérique:K8:4)
			
			$string:=String:C10($1[$i])
			Case of 
				: ($string="")
					$1[$i]:=Null:C1517
					
				: ($string="@INF@")
					$1[$i]:=Null:C1517
					
			End case 
			
			
	End case 
	
End for 