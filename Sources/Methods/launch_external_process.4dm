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
$context:=4D_var_context_save 

$code_page:=windows_codepage 

If ($code_page.success)
	
	$command:=$1
	
	$lastParam:=${Count parameters:C259}
	
	$options:=New object:C1471("hidden";"true";"async";"false")
	
	Case of 
		: (Count parameters:C259<2)
			
		: (Value type:C1509($2)=Est un texte:K8:3)
			$stdIn:=$2
			
			
	End case 
	
	If (Value type:C1509($lastParam)=Est un objet:K8:27)
		
		Case of 
				
			: ($lastParam.hidden=Null:C1517)
				
			: (Value type:C1509($lastParam.hidden)=Est un booléen:K8:9)
				$options.hidden:=Choose:C955($lastParam.hidden;"true";"false")
				
			: (Value type:C1509($lastParam.hidden)=Est un texte:K8:3)
				
				$options.hidden:=$lastParam.hidden
				
				
		End case 
		
		Case of 
				
			: ($lastParam.async=Null:C1517)
				
			: (Value type:C1509($lastParam.async)=Est un booléen:K8:9)
				$options.async:=Choose:C955($lastParam.async;"false";"true")
				
			: (Value type:C1509($lastParam.async)=Est un texte:K8:3)
				
				$options.async:=$lastParam.async
				
				
		End case 
	End if 
	
	$ms:=Milliseconds:C459
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";$options.hidden)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";$options.async)
	
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
