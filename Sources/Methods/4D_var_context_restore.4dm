//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1)

Case of 
	: (Count parameters:C259=0)
		4D_var_context_restore (This:C1470)
		
	: ($1=Null:C1517)
		
	: ($1.class=Null:C1517)
		
	: ($1.class#"4D_CONTEXT")
		
	Else 
		
		OK:=$1.save_OK
		Error:=$1.save_Error
		Document:=$1.save_Document
		
		ON ERR CALL:C155($1.Error_handler)
		  //APPELER SUR ÉVÉNEMENT($1.Event_handler)// pas thread-safe
		
End case 