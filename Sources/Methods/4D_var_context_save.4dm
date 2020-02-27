//%attributes = {"invisible":true,"preemptive":"capable"}

C_OBJECT:C1216($0;$context)


$context:=New object:C1471(\
"class";"4D_CONTEXT";\
"save_OK";OK;\
"save_Error";Error;\
"save_Document";Document;\
"Error_handler";Method called on error:C704;\
"restore";Formula:C1597(4D_var_context_restore );\
"test";Formula:C1597((OK=1) & (Error=0))\
)

$context.is:=New object:C1471(\
"ok";Formula:C1597((OK=1) & (Error=0));\
"ko";Formula:C1597((OK=0) | (Error#0))\
)

OK:=1
Error:=0
Document:=""
$0:=$context