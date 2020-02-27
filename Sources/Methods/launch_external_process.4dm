//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216(\
$0;$result;\
$o_out;$o_error;\
$context;\
$code_page;\
$options)

C_TEXT:C284(\
$1;$command;\
$stdIn)

C_VARIANT:C1683(${2};$lastParam)

C_LONGINT:C283(\
$ms;$pid)

C_BLOB:C604(\
$binOut;$binErr)

$command:=$1

$lastParam:=${Count parameters:C259}

$options:=New object:C1471("hide";"true";"synchrone";"true")

Case of 
	: (Count parameters:C259<2)
		
	: (Value type:C1509($2)=Est un texte:K8:3)
		$stdIn:=$2
		
		
End case 


If (Value type:C1509($lastParam)=Est un objet:K8:27)
	
	Case of 
			
		: ($lastParam.hide=Null:C1517)
			
		: (Value type:C1509($lastParam.hide)=Est un booléen:K8:9)
			$options.hide:=Choose:C955($lastParam.hide;"true";"false")
			
		: (Value type:C1509($lastParam.hide)=Est un texte:K8:3)
			
			$options.hide:=$lastParam.hide
			
			
	End case 
	
	Case of 
			
		: ($lastParam.synchrone=Null:C1517)
			
		: (Value type:C1509($lastParam.synchrone)=Est un booléen:K8:9)
			$options.synchrone:=Choose:C955($lastParam.synchrone;"true";"false")
			
		: (Value type:C1509($lastParam.synchrone)=Est un texte:K8:3)
			
			$options.synchrone:=$lastParam.synchrone
			
			
	End case 
End if 

$context:=4D_var_context_save 

$code_page:=windows_codepage

If ($code_page.success)
	
	
	$ms:=Milliseconds:C459
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";$options.hide)  //Choisir(Mode compilé;"true";"false"))
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";$options.synchrone)
	
	LAUNCH EXTERNAL PROCESS:C811($command;$stdIn;$binOut;$binErr;$pid)
	$ms:=Milliseconds:C459-$ms
	
	$result:=New object:C1471(\
		"command";$command;\
		"stdIn";$stdIn;\
		"stdOut";Null:C1517;\
		"stdError";Null:C1517;\
		"elapsed_time";$ms;\
		"success";$context.is.ok();\
		"fail";$context.is.ko();\
		"pid";$pid)
	
	If ($result.success)
		$o_out:=New object:C1471(\
			"value";"";\
			"size";BLOB size:C605($binOut);\
			"success";True:C214)
		
		If ($o_out.size>0)
			OK:=1
			$o_out.value:=Convert to text:C1012($binOut;$code_page.code_page)
			$o_out.success:=OK=1
		End if 
		
		$o_error:=New object:C1471("value";"";"size";BLOB size:C605($binErr);"success";True:C214)
		If ($o_error.size>0)
			OK:=1
			$o_error.value:=Convert to text:C1012($binErr;$code_page.code_page)
			$o_error.success:=OK=1
		End if 
		
		$o_out.fail:=Not:C34($o_out.success)
		
		$o_error.fail:=Not:C34($o_error.success)
		
		$result.stdOut:=$o_out
		$result.stdError:=$o_error
		
	End if 
	
	$0:=$result
Else 
	
	$0:=$code_page
	
End if 

$context.restore()
