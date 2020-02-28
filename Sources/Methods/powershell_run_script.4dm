//%attributes = {"invisible":true,"preemptive":"capable"}

C_OBJECT:C1216($0;$result;$2;$parameter;$code_page)
C_TEXT:C284($1;$script_path)
C_TEXT:C284($script;$script_param;$filePath)

C_BOOLEAN:C305($asynchronous;$hidden)

Case of 
		
	: (Count parameters:C259<2)
		
		$0:=New object:C1471("success";False:C215;"failed";True:C214;"message";"two parameters required : script path (powershell script path) , script parameter (object)")
		
	: (Test path name:C476($1)#Est un document:K24:1)
		
		$0:=New object:C1471("success";False:C215;"failed";True:C214;"message";"script path does not exist : "+$1)
		
	Else 
		
		$script_path:=$1
		$parameter:=$2
		
		
		$script_path:=Replace string:C233($script_path;" ";"` ")
		$script_path:=Replace string:C233($script_path;"(";"`(")
		$script_path:=Replace string:C233($script_path;")";"`)")
		
		object_infinite ($parameter)
		$script_param:=JSON Stringify:C1217($parameter)
		
		$script_param:=Replace string:C233($script_param;"\"";"'''")
		$script_param:=Replace string:C233($script_param;"{";"`{")
		$script_param:=Replace string:C233($script_param;"}";"`}")
		$script_param:=Replace string:C233($script_param;",";"`,")
		
		$script:="\""+powershell_path +"\" -ExecutionPolicy BYPASS \""+$script_path+"\" "+$script_param
		
		$code_page:=windows_codepage 
		CONVERT FROM TEXT:C1011($script;$code_page.code_page;$bin)
		
		$filePath:=Temporary folder:C486+Generate UUID:C1066+".bat"
		If (Test path name:C476($filePath)=Est un document:K24:1)
			DELETE DOCUMENT:C159($filePath)
		End if 
		
		BLOB TO DOCUMENT:C526($filePath;$bin)
		Case of 
			: ($parameter=Null:C1517)
			: ($parameter.debug=Null:C1517)
			: ($parameter.debug)
				SHOW ON DISK:C922($filePath)
		End case 
		SET BLOB SIZE:C606($bin;0)
		
		Case of 
			: ($parameter=Null:C1517)
			: ($parameter.async=Null:C1517)
			: ($parameter.async)
				$asynchronous:=True:C214
				
		End case 
		
		$hidden:=Is compiled mode:C492
		Case of 
			: ($parameter=Null:C1517)
			: ($parameter.hidden=Null:C1517)
			: ($parameter.hidden)
				$hidden:=True:C214
				
		End case 
		
		SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";Choose:C955($hidden;"true";"false"))  //Choisir(Mode compilé;"true";"false"))
		SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";Choose:C955($asynchronous;"false";"true"))
		
		$result:=launch_external_process ($filePath;$parameter)
		
		$0:=$result
		
End case 