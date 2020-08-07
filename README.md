## curl_docker_image
###### Please send any questions, queries or concerns to: `curldocker@blairjames.com`

- Full featured Curl implementation. 
- Lean and up-to-date.
- CI/CD built, monitored and maintained.
- Compiled fresh from latest stable source: [https://github.com/curl/curl](https://github.com/curl/curl)

#### Run as you would native curl, just add the `docker run` prefix.
``` 
docker run --rm blairy/curl 
```
###### An alias can be added for the curl command: `alias curl="docker run --rm blairy/curl"`
###### Add to "$HOME/.bashrc" to make alias permanent.

#### Example Commands:
```
docker run --rm blairy/curl -V
docker run --rm blairy/curl -k -L https://google.com
docker run --rm blairy/curl -u "DOMAIN\login:password" smb://fs/dir/path/file.ext > 1
docker run --rm blairy/curl --user name:passwd ftps://ftp.host.com/
```


##### Version Information:
```
curl 7.72.0-DEV (x86_64-pc-linux-musl) libcurl/7.72.0-DEV OpenSSL/1.1.1g
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS HTTPS-proxy IPv6 Largefile NTLM NTLM_WB SSL TLS-SRP UnixSockets
```