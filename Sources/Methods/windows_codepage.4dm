//%attributes = {"invisible":true,"preemptive":"capable"}

C_OBJECT:C1216($0;$result)

C_OBJECT:C1216($context;$scope)


C_BLOB:C604($binErr)

C_TEXT:C284($command;$stdIn;$stdOut)


$scope:=scope ("windows.environ.code_page")

If ($scope.code=Null:C1517)
	
	$context:=4D_var_context_save 
	
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";"true")
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";"true")
	
	
	$command:="cmd.exe /C CHCP "
	
	$result:=New object:C1471("ms";Milliseconds:C459;"success";False:C215)
	
	LAUNCH EXTERNAL PROCESS:C811($command;$stdIn;$stdOut;$binErr)  //;$pid)
	
	
	Case of 
		: ($context.is.ko())
			
		Else 
			$result.code:=Num:C11(Split string:C1554($stdOut;":";sk couper espaces:K86:2)[1])
			$result.success:=True:C214
			
			Case of 
					
				: ($result.code=850)
					$result.code_page:="windows-1252"
					
				: ($result.code=2011)
					$result.code_page:="csPC8CodePage437"
					
				: ($result.code=3)
					$result.code_page:="US-ASCII"
					
				: ($result.code=4)
					$result.code_page:="ISO-8859-1"
					
				: ($result.code=5)
					$result.code_page:="ISO-8859-2"
					
				: ($result.code=6)
					$result.code_page:="ISO-8859-3"
					
				: ($result.code=7)
					$result.code_page:="ISO-8859-4"
					
				: ($result.code=8)
					$result.code_page:="ISO-8859-5"
					
				: ($result.code=9)
					$result.code_page:="ISO-8859-6"
					
				: ($result.code=10)
					$result.code_page:="ISO-8859-7"
					
				: ($result.code=11)
					$result.code_page:="ISO-8859-8"
					
				: ($result.code=12)
					$result.code_page:="ISO-8859-9"
					
				: ($result.code=13)
					$result.code_page:="ISO-8859-10"
					
				: ($result.code=17)
					$result.code_page:="MS_Kanji"
					
				: ($result.code=38)
					$result.code_page:="EUC-KR"
					
				: ($result.code=39)
					$result.code_page:="ISO-2022-JP"
					
				: ($result.code=57)
					$result.code_page:="csISO58GB231280"
					
					
					  // forcer le code page en utf8
					  //REG ADD HKCU\Console\%SystemRoot^%_system32_cmd.exe /v CodePage /t REG_DWORD /d 65001
					
				: ($result.code=106) | ($result.code=65001)  //https://superuser.com/questions/269818/change-default-code-page-of-windows-console-to-utf-8
					$result.code_page:="UTF-8"
					
				: ($result.code=109)
					$result.code_page:="ISO-8859-13"
					
				: ($result.code=111)
					$result.code_page:="ISO-8859-15"
					
				: ($result.code=113)
					$result.code_page:="GBK"
					
				: ($result.code=1012)
					$result.code_page:="UTF-7"
					
				: ($result.code=1013)
					$result.code_page:="UTF-16BE"
					
				: ($result.code=1014)
					$result.code_page:="UTF-16LE"
					
				: ($result.code=1015)
					$result.code_page:="UTF-16"
					
				: ($result.code=1017)
					$result.code_page:="UTF-32"
					
				: ($result.code=1018)
					$result.code_page:="UTF-32BE"
					
				: ($result.code=1019)
					$result.code_page:="UTF-32LE"
					
				: ($result.code=1250)
					$result.code_page:="MacCE"
					
				: ($result.code=1251)
					$result.code_page:="x-mac-cyrillic"
					
				: ($result.code=1253)
					$result.code_page:="x-mac-greek"
					
				: ($result.code=1254)
					$result.code_page:="x-mac-turkish"
					
				: ($result.code=1256)
					$result.code_page:="x-mac-arabic"
					
				: ($result.code=1255)
					$result.code_page:="x-mac-hebrew"
					
				: ($result.code=1257)
					$result.code_page:="x-mac-ce"
					
				: ($result.code=2011)
					$result.code_page:="csPC8CodePage437"
					
				: ($result.code=2024)
					$result.code_page:="Windows-31J"
					
				: ($result.code=2025)
					$result.code_page:="csGB2312"
					
				: ($result.code=2026)
					$result.code_page:="csBig5"
					
				: ($result.code=2027)
					$result.code_page:="MacRoman"
					
				: ($result.code=2028)
					$result.code_page:="IBM037"
					
				: ($result.code=2084)
					$result.code_page:="KOI8-R"
					
				: ($result.code=2250)
					$result.code_page:="windows-1250"
					
				: ($result.code=2251)
					$result.code_page:="windows-1251"
					
				: ($result.code=2252)
					$result.code_page:="windows-1252"
					
				: ($result.code=2253)
					$result.code_page:="windows-1253"
					
				: ($result.code=2254)
					$result.code_page:="windows-1254"
					
				: ($result.code=2255)
					$result.code_page:="windows-1255"
					
				: ($result.code=2256)
					$result.code_page:="windows-1256"
					
				: ($result.code=2257)
					$result.code_page:="windows-1257"
					
				Else 
					
					$result.success:=False:C215
			End case 
			
/*
: ($result.code=3)
$result.code_page:="US-ASCII
: ($result.code=4)
$result.code_page:="ISO-8859-1
: ($result.code=5)
$result.code_page:="ISO-8859-2
: ($result.code=6)
$result.code_page:="ISO-8859-3
: ($result.code=7)
$result.code_page:="ISO-8859-4
: ($result.code=8)
$result.code_page:="ISO-8859-5
: ($result.code=9)
$result.code_page:="ISO-8859-6
: ($result.code=10)
$result.code_page:="ISO-8859-7
: ($result.code=11)
$result.code_page:="ISO-8859-8
: ($result.code=12)
$result.code_page:="ISO-8859-9
: ($result.code=13)
$result.code_page:="ISO-8859-10
			
: ($result.code=17)
$result.code_page:="MS_Kanji
: ($result.code=38)
$result.code_page:="EUC-KR
: ($result.code=39)
$result.code_page:="ISO-2022-JP
: ($result.code=57)
$result.code_page:="csISO58GB231280
: ($result.code=106)
$result.code_page:="UTF-8
: ($result.code=109)
$result.code_page:="ISO-8859-13
: ($result.code=111)
$result.code_page:="ISO-8859-15
: ($result.code=113)
$result.code_page:="GBK
: ($result.code=1012)
$result.code_page:="UTF-7
: ($result.code=1013)
$result.code_page:="UTF-16BE
: ($result.code=1014)
$result.code_page:="UTF-16LE
: ($result.code=1015)
$result.code_page:="UTF-16
: ($result.code=1017)
$result.code_page:="UTF-32
: ($result.code=1018)
$result.code_page:="UTF-32BE
: ($result.code=1019)
$result.code_page:="UTF-32LE
: ($result.code=1250)
$result.code_page:="MacCE
: ($result.code=1251)
$result.code_page:="x-mac-cyrillic
: ($result.code=1253)
$result.code_page:="x-mac-greek
: ($result.code=1254)
$result.code_page:="x-mac-turkish
: ($result.code=1256)
$result.code_page:="x-mac-arabic
: ($result.code=1255)
$result.code_page:="x-mac-hebrew
: ($result.code=1257)
$result.code_page:="x-mac-ce
: ($result.code=2011)
$result.code_page:="csPC8CodePage437
: ($result.code=2024)
$result.code_page:="Windows-31J
: ($result.code=2025)
$result.code_page:="csGB2312
: ($result.code=2026)
$result.code_page:="csBig5
: ($result.code=2027)
$result.code_page:="MacRoman
: ($result.code=2028)
$result.code_page:="IBM037
: ($result.code=2084)
$result.code_page:="KOI8-R
: ($result.code=2250)
$result.code_page:="windows-1250
: ($result.code=2251)
$result.code_page:="windows-1251
: ($result.code=2252)
$result.code_page:="windows-1252
: ($result.code=2253)
$result.code_page:="windows-1253
: ($result.code=2254)
$result.code_page:="windows-1254
: ($result.code=2255)
$result.code_page:="windows-1255
: ($result.code=2256)
$result.code_page:="windows-1256
: ($result.code=2257)
$result.code_page:="windows-1257
*/
			
	End case 
	$result.ms:=Milliseconds:C459-$result.ms
	
	
	$context.restore()
	
	$result.fail:=Not:C34($result.success)
	If ($result.success)
		
		  //$scope:=$result
		
		$scope.code:=$result.code
		$scope.code_page:=$result.code_page
		
		$scope.success:=$result.success
		$scope.fail:=$result.fail
		$scope.ms:=$result.ms
		
	End if 
	
End if 

$0:=$scope  //.code_page