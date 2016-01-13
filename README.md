# osx-yubikey-ssh-helper
EventScripts to automatically add keys to SSH Agent from your Yubikey.

## Requirements
[EventScripts](http://www.mousedown.net/mouseware/index.html)
[OpenSC](https://github.com/OpenSC/OpenSC)
[Yubikey](https://www.yubico.com/products/yubikey-hardware/yubikey4/) or other PKCS11 compatible token

## Installation

1. Checkout git repository
2. Copy askpass.sh to /usr/local/bin
3. Create new keychain with name yb
4. In Keychain yb create new item "application password" with name yb. Password is your password for Yubikey.
5. Compile scripts 
```bash
osacompile -o insert-yubikey.scpt insert-yubikey.source
osacompile -o remove-yubikey.scpt remove-yubikey.source
```
6. Copy insert-yubikey.scpt and remove-yubikey.scpt in to EventScripts script folder.
7. Add two events:
  1. USB device attached -> insert-yubikey.scpt
  2. USB device removed -> remove-yubikey.scpt
8. Insert your Yubikey
