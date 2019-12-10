$host
# Host-UI-Member: Methoden um Meldungen in den Host statt in den Fehlerstream zu schreiben:
$host.UI | gm [rw]*line*
$host.UI.writeline("red","green","Just a Test")
$host.UI.readline()
foreach ($i in 1..3) {"i is $i"}
function test {"`$args is " + $args}
foreach ($i in 1..3) {"test $i"}


get-help Set-PSDebug 

#Turns script debugging features on and off, sets the trace level, and toggles strict mode    
#SYNTAX
#    Set-PSDebug [-Off] [<CommonParameters>]
#   
#    Set-PSDebug [-Step] [-Strict] [-Trace <Int32>] [<CommonParameters>]
#
#When the Trace parameter has a value of 1, each line of script is traced as it runs. 
#When the parameter has a value of 2, 
    #variable assignments, function calls, and script calls are also traced. 
 # If the Step parameter is specified, you are prompted before each line of the script runs.

get-help Set-PSDebug -examples

get-help Set-PSBreakpoint

#SYNTAX
#    Set-PSBreakpoint [-Script] <String[]> [-Line] <Int32[]> [[-Column] <Int32>] [-Action <ScriptBlock>] [<CommonParameters>]
#    
#    Set-PSBreakpoint [[-Script] <String[]>] [-Action <ScriptBlock>] -Command <String[]> [<CommonParameters>]
#    
#    Set-PSBreakpoint [[-Script] <String[]>] [-Action <ScriptBlock>] [-Mode {Read | Write | ReadWrite}] -Variable <String[]> 
#    [<CommonParameters>]
#    
#    
#BESCHREIBUNG
#    The Set-PSBreakpoint cmdlet sets a breakpoint in a script or in any command run in the current session. 
#    You can use Set-PSBreakpoint to 
#    - set a breakpoint before executing a script or running a command, 
#    - or during debugging, when stopped at another breakpoint. 
#    Set-PSBreakpoint 
#    cannot set a breakpoint on a remote computer. To debug a script on a remote computer, copy the script to the local computer and then debug 
#    it locally.
#    
#    Each Set-PSBreakpoint command creates one of the following three types of breakpoints:
#    
#    - Line breakpoint.  Sets breakpoints at particular line and column coordinates.
#    
#    - Command breakpoint.  Sets breakpoints on commands and functions.
#    
#    - Variable breakpoint. Sets breakpoints on variables.#
# Beispiele:
# Set a breakpoint on line 18.
#                 Set-PSBreakpoint -Script C:\PS2\Debugging\DemoBreakpoints.ps1 -Line 18

# Also set a breakpoint that outputs data to a debugging file each time $properties is written to
#               Set-PSBreakpoint -Script C:\PS2\Debugging\DemoBreakpoints.ps1 -Variable properties -Mode Write -Action { $properties | Out-File C:\PS2\Debugging\DemoBreakpoints.ps1.txt -append }




