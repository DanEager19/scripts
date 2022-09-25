# Scenario
```sh
You are tasked with securing 192.168.1.5, a shared web server used by the IT team. James is the project lead and is thusly the system administrator.
```
## Allowed users
- James, Bob, Katy
- All of them are in the users group
- James is a sudoer, Bob and Katy are not
- These are the only authorized users
- No other groups/users should exist

## Services
The primary services that must be maintained are:
```sh
FTP (File Transfer Protocol) server
SSH (Secure Shell) server
HTTP (Hypertext Transfer Protocol) server
```

## Default Password
`GamerAlert`