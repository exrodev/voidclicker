<# ::
@echo off
setlocal enableDelayedExpansion

:main
cls
set /p "config=Clicker config name: "
if exist %config%.txt (
	echo '%config%.txt' already exists.
	pause
	goto main
)
call :run "%config%.txt"
cls
echo To start your config, open Void Lite and type in 'ClickPlayer %config%.txt'.
pause
exit /b 0

:run
set "lastinput="
setlocal
set "POWERSHELL_BAT_ARGS=%*"
if defined POWERSHELL_BAT_ARGS set "POWERSHELL_BAT_ARGS=%POWERSHELL_BAT_ARGS:"=\"%"
endlocal & powershell -ExecutionPolicy Bypass -NoLogo -NoProfile -Command "$_ = $input; Invoke-Expression $( '$input = $_; $_ = \"\"; $args = @( &{ $args } %POWERSHELL_BAT_ARGS% );' + [String]::Join( [char]10, $( Get-Content \"%~f0\" ) ) )"
goto :EOF
#>
$namespace = get-random
$class = get-random

$code = @"
using System;
using System.IO;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using System.Threading;
namespace n$namespace
{
	public class c$class
	{
		[DllImport("user32.dll")]
		private static extern short GetAsyncKeyState(System.Int32 vKey);
		
		private static long GetSystemTime()
		{
			return BitConverter.ToInt64(BitConverter.GetBytes(DateTimeOffset.Now.ToUnixTimeMilliseconds()), 0);
		}
		
		public static void Main()
		{
			string arg="$args";
			string[] args = arg.Split(' ');
			string file = args[0];
						
			List<long> Clicks = new List<long>();
			int RegisteredClicks = 0;
			int TotalClicks = 0;
			long LastClick = 0;
			bool running = true;
			bool LMBDown = false;
			
			Console.WriteLine("Have you finished clicking?");
			Console.WriteLine("Press: DELETE");
			Console.WriteLine("");
			
			int row = Console.CursorTop;
			Console.SetCursorPosition(0, row);
			Console.WriteLine("Total Clicks: " + RegisteredClicks + "/" + TotalClicks);
			
			while (running)
			{
				if (BitConverter.GetBytes(GetAsyncKeyState(1))[1] == 0x80)
				{
					if (!LMBDown)
					{
						LMBDown = true;
					}
				}
				else if (LMBDown)
				{
					LMBDown = false;
					long time = GetSystemTime() - LastClick;
					if (time < 200)
					{
						Clicks.Add(time);
						RegisteredClicks++;
					}
					TotalClicks++;
					LastClick = GetSystemTime();
					
					Console.SetCursorPosition(0, row);
					Console.WriteLine("Total Clicks: " + RegisteredClicks + "/" + TotalClicks);
				}
				if (BitConverter.GetBytes(GetAsyncKeyState(46))[1] == 0x80)
				{
					running = false;
					using (StreamWriter sw = File.CreateText(file))
					{
						foreach (long time in Clicks)
						{
							sw.WriteLine(time);
						}
					}
				}
			}
			return;
	    }
	}	
}
"@

$assemblies = ("System.Windows.Forms","System.Drawing")
Add-Type -ReferencedAssemblies $assemblies -TypeDefinition $code -Language CSharp
iex "[n$namespace.c$class]::Main()"