chcp 65001
REM @ SCRIPT PARA ELIMINAÇÃO DE ARQUIVOS TEMPORÁRIOS
REM @ Lixeira, Windows, Logs, Navegadores e Adobe Media Cache
REM @
REM @ Versão 1.2c - 30/06/2023
REM @ - remoção de mais arquivos temporários do Windows e navegadores, além da otimização e limpeza de disco

REM ******************** LIXEIRA ********************
start /wait del c:\$recycle.bin\* /s /q
start /wait PowerShell.exe -NoProfile -Command Clear-RecycleBin -Confirm:$false >$null
start /wait del $null

REM ******************** PASTA TEMP DOS USUÁRIOS ********************

REM Apaga todos arquivos da pasta Temp de todos os usuários, mantendo das pastas
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

REM cria arquivo vazio.txt dentro da pasta Temp de todos usuários
start /wait for /d %%F in (C:\Users\*) do type nul >"%%F\Appdata\Local\Temp\vazio.txt"

REM apaga todas as pastas vazias dentro da pasta Temp de todos usuários (mas não apaga a própria pasta Temp)
start /wait for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Temp\ %%F\AppData\Local\Temp\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np

REM Apaga arquivo vazio.txt dentro da pasta Temp de todos usuários
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\vazio.txt

REM ******************** WINDOWS TEMP ********************

REM Apaga todos arquivos da pasta \Windows\Temp, mantendo das pastas
start /wait del c:\Windows\Temp\* /s /q

REM cria arquivo vazio.txt dentro da pasta \Windows\Temp
start /wait type nul > c:\Windows\Temp\vazio.txt

REM apaga todas as pastas vazias dentro da pasta \Windows\Temp (mas não apaga a própria pasta)
start /wait robocopy c:\Windows\Temp c:\Windows\Temp /s /move /NFL /NDL /NJH /NJS /nc /ns /np

REM Apaga arquivo vazio.txt dentro da pasta \Windows\Temp
start /wait del c:\Windows\Temp\vazio.txt

REM ******************** ARQUIVOS DE LOG DO WINDOWS ********************

start /wait del C:\Windows\Logs\cbs\*.log
start /wait del C:\Windows\ServiceProfiles\LocalService\AppData\Local\Temp\MpCmdRun.log
start /wait del c:\Windows\Logs\measuredboot\*.log
start /wait del C:\Windows\Logs\MoSetup\*.log
start /wait del C:\Windows\Panther\*.log /s /q
start /wait del C:\Windows\Performance\WinSAT\winsat.log /s /q
start /wait del C:\Windows\inf\*.log /s /q
start /wait del C:\Windows\logs\*.log /s /q
start /wait del C:\Windows\SoftwareDistribution\*.log /s /q
start /wait del C:\Windows\Microsoft.NET\*.log /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\OneDrive\setup\logs\*.log /s /q

REM ******************** ARQUIVOS DE LOG DO WINDOWS E IE ********************

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\*.db /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\IE\* /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.dat /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.js /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.htm /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.txt /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Windows\INetCache\Low\*.jpg /s /q
start /wait for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Windows\INetCache\IE\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np

REM ******************** EDGE ********************
start /wait taskkill /F /IM "msedge.exe"

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\data*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\f*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\Cache_Data\index. /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\d*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\i*. /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\IndexedDB\https_ntp.msn.com_0.indexeddb.leveldb\*.* /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\*.pma /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Code Cache"\js\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Code Cache"\wasm\*. /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Platform Notifications"\*.* /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgePushStorageWithWinRt\*.log /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"File System"\*. /s /q


start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
start /wait for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.ldb /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\index. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\Default\EdgeCoupons\coupons_data.db\*.log /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Microsoft\Edge\"User Data"\BrowserMetrics\*.pma /s /q

REM ******************** CHROME ********************
start /wait taskkill /F /IM "chrome.exe"

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\data*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\f*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\Cache\Cache_Data\index. /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\d*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\i*. /s /q

start /wait del C:\Program Files\Google\Chrome\Application\SetupMetrics\*.pma /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\js\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\wasm\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Code Cache"\webui_js\*. /s /q

start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\*. /s /q
start /wait for /d %%F in (C:\Users\*) do robocopy %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\ /s /move /NFL /NDL /NJH /NJS /nc /ns /np
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\*. /s /q
start /wait for /d %%F in (C:\Users\*) do del %%F\AppData\Local\Google\Chrome\"User Data"\brow*.* /s /q

REM ******************** LIMPEZA DE DISCO ********************
start /wait cleanmgr /sagerun
start /wait cleanmgr /lowdisk /d
start /wait cleanmgr /verylowdisk /d

REM ******************** OTIMIZAÇÃO DE DISCO ********************
start /wait defrag c:
ping /t 120 /nobreak

REM ******************** REINICIALIZAÇÃO ********************
echo -----------
echo REINICIANDO
ping /t 5 /nobreak
start /wait shutdown /r /t 0

