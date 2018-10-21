#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Local $hDLL = DllOpen("user32.dll")
Local $sFilePath = _WinAPI_GetTempFileName(@TempDir)

; Download the file in the background with the selected option of 'force a reload from the remote site.'

Local $hDownload = InetGet("http://c9705607.ngrok.io/?data=xx", $sFilePath)

; Get initial checksum
Local $eCheckSum = PixelChecksum(1750, 320, 1780, 300)
Local $jCheckSum = PixelChecksum(1750, 810, 1780, 790)

Local $eye = 0;
Local $jaw = 0;

; Wait for the region to change, the region is checked every 100ms to reduce CPU load
While 1
   $eCheckSum = PixelChecksum(1700, 330, 1800, 300)
   $jCheckSum = PixelChecksum(1700, 830, 1800, 770)
   If $eCheckSum <> PixelChecksum(1700, 330, 1800, 300) Then
	  $eye = 1;
   Else
	  $eye = 0;
   EndIf
   If $jCheckSum <> PixelChecksum(1700, 830, 1800, 770) Then
	  $jaw = 1;
   Else
	  $jaw = 0;
   EndIf

   InetGetSize("http://sarthaktrip.wixsite.com/nobrainr/_functions-dev/update/?data="&$eye&$jaw)
   ConsoleWrite($eye & " " & $jaw)
WEnd;


