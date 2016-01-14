on run eventArgs
	
	set thisTrigger to (trigger of eventArgs)
	set thisDeviceName to (deviceName of eventArgs)
	
	
	if thisTrigger is "USB device attached" and thisDeviceName is "Yubikey NEO OTP+U2F+CCID" then
		-- add keys from yubikey to ssh-agent
		do shell script "export DISPLAY=:0.0; export SSH_ASKPASS=\"/usr/local/bin/askpass.sh\"; ssh-add -s /usr/lib/opensc-pkcs11.so < /dev/null"
                -- display notification
		display notification "Yubikey attached" with title "Yubikey"
	end if
	
end run