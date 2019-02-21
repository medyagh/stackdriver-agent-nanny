# stackdriver-agent-nanny
a nanny service for the failing init script of stackdriver





### The Story ... Why need this?

Unfortunately when the stackdriver agent crashes for any reason, systemd failes to restart the stackdriver service.

Why ?
Stackdriver monitoring agent [installer script](https://dl.google.com/cloudagents/install-monitoring-agent.sh), uses old style init script. Debian auto generates a systemD version of it at  `/run/systemd/generator.late/stackdriver-agent.service`


### What does hack do ?

- Creates a nanny script that starts stackdriver and keeps watchning for PID of stackdriver, and if it is dead, it will exit error.
- Creates a nanny service that when nanny script fails restarts it.


