//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$1)
C_TEXT:C284($string)
C_LONGINT:C283($i)
ARRAY TEXT:C222($_name;0)
ARRAY LONGINT:C221($_type;0)

OB GET PROPERTY NAMES:C1232($1;$_name;$_type)

For ($i;1;Size of array:C274($_name))
	
	Case of 
		: ($_type{$i}=Est un numérique:K8:4)
			
			$string:=String:C10($1[$_name{$i}])
			Case of 
				: ($string="")
					$1[$_name{$i}]:=Null:C1517
					
				: ($string="@INF@")
					$1[$_name{$i}]:=Null:C1517
					
			End case 
			
			
			
		: ($_type{$i}=Est un objet:K8:27)
			
			object_infinite ($1[$_name{$i}])
			
		: ($_type{$i}=Est une collection:K8:32)
			
			
			collection_infinite ($1[$_name{$i}])
			
			
			
	End case 
	
End for 

$0:=$1