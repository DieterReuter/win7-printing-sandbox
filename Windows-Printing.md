
# Windows Printing - Setup your Windows machine

Here we provide some basic infos about setting up your Windows machine for all standard printing methods which are provided in a standard Microsoft Windows release.

## Window 7 Enterprise

To get a list of available Windows Features just open an elevated CMD shell and run
```bash
dism.exe /Online /Get-Features
```

Tipp:
Sometimes it's useful to inspect the DISM log file if you'd like to see any details about activating or deactivating some of the features.
```bash
C:\Windows\Logs\DISM\dism.log
```

### Available Printing Features

* Printing-Foundation-Features
* Printing-Foundation-LPRPortMonitor
* Printing-Foundation-LPDPrintService
* Printing-Foundation-InternetPrinting-Client

### Enable TELNET.exe

```bash
dism.exe /Online /Enable-Feature=TelnetClient
```

### Enable LPR.exe and LPQ.exe

```bash
dism.exe /Online /Enable-Feature=Printing-Foundation-LPRPortMonitor
```
This feature also installs a LPR PortMonitor using lprmon.dll and lprmonui.dll. 
Now you can install a printer and use a port type named "LPR Port", this is different from a "Standard TCP/IP Port".

### Enable LPD-Server (=LPD Service, LPDSVC, Port 515/tcp)

```bash
dism.exe /Online /Enable-Feature=Printing-Foundation-LPDPrintService
```

