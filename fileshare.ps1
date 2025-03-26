$connectTestResult = Test-NetConnection -ComputerName saanvikit26022025.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"saanvikit26022025.file.core.windows.net`" /user:`"localhost\saanvikit26022025`" /pass:`"CxfYf7py0Vp0bBCDfFqBPLMHZces4SNKb+1r2PQw4iRkOpo2E+j+aeQztQFazy5Z47bWroBGP4CD+AStnMzmkQ==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\saanvikit26022025.file.core.windows.net\saanvikit-fs" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}