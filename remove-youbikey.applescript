on run eventArgs
	set thisTrigger to (trigger of eventArgs)
	set thisDeviceName to (deviceName of eventArgs)
	
	
	if thisTrigger is "USB device removed" and thisDeviceName is "Yubikey NEO OTP+U2F+CCID" then
		-- stop ssh agenta
		do shell script "launchctl stop org.openbsd.ssh-agent"
		-- lock keychain
		do shell script "security lock-keychain yb.keychain"
		-- show notification
		display notification "Yubikey removed" with title "Yubikey"
	end if
end run