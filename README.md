## openshift-postfix

Run postfix smtp relay on openshift. Postfix needs to run as root.

Deploy
```
oc new-project postfix
oc adm policy add-scc-to-user anyuid -z default -n postfix
oc new-app --as-deployment-config --docker-image=quay.io/eformat/postfix-ubi:latest
```

Test
```
oc port-forward svc/postfix-ubi 8025:25

telnet localhost:8025
Trying ::1...
Connected to localhost.
Escape character is '^]'.
220 postfix-ubi-2-2jlh2.localdomain ESMTP Postfix
helo localhost
250 postfix-ubi-2-2jlh2.localdomain
mail from: root@god.com
250 2.1.0 Ok
rcpt to: mike@god.com
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
Subject: the ants are coming
.
250 2.0.0 Ok: queued as 199932C026FA
quit
221 2.0.0 Bye
Connection closed by foreign host.
```
