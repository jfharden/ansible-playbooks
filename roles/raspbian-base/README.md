# raspbian-base

Base role to configure a raspbian install from defaults

Sadly ssh is not enabled by default so before you can run this you manually have to:

```
systemctl enable ssh
systemctl start ssh
```
