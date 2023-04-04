#### Ping entre les deux VMs

```
gibbs@b3-node1:~$ ping b3-node2
PING b3-node2.120bvlftuafejjowv5nhgovpfc.bx.internal.cloudapp.net (10.0.2.5) 56(84) bytes of data.
64 bytes from b3-node2.internal.cloudapp.net (10.0.2.5): icmp_seq=1 ttl=64 time=3.50 ms
64 bytes from b3-node2.internal.cloudapp.net (10.0.2.5): icmp_seq=2 ttl=64 time=1.01 ms
64 bytes from b3-node2.internal.cloudapp.net (10.0.2.5): icmp_seq=3 ttl=64 time=1.56 ms
64 bytes from b3-node2.internal.cloudapp.net (10.0.2.5): icmp_seq=4 ttl=64 time=2.32 ms
64 bytes from b3-node2.internal.cloudapp.net (10.0.2.5): icmp_seq=5 ttl=64 time=1.01 ms
^C
--- b3-node2.120bvlftuafejjowv5nhgovpfc.bx.internal.cloudapp.net ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4007ms
rtt min/avg/max/mdev = 1.007/1.878/3.495/0.940 ms
```
#### SSH jump

```
PS C:\Users\thepa> ssh -J gibbs@20.124.131.226 gibbs@10.0.2.5
Linux b3-node2 4.19.0-23-cloud-amd64 #1 SMP Debian 4.19.269-1 (2022-12-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Apr  4 13:39:34 2023 from 10.0.2.4
gibbs@b3-node2:~$ ping b3-node1
PING b3-node1.120bvlftuafejjowv5nhgovpfc.bx.internal.cloudapp.net (10.0.2.4) 56(84) bytes of data.
64 bytes from b3-node1.internal.cloudapp.net (10.0.2.4): icmp_seq=1 ttl=64 time=0.875 ms
64 bytes from b3-node1.internal.cloudapp.net (10.0.2.4): icmp_seq=2 ttl=64 time=1.56 ms
64 bytes from b3-node1.internal.cloudapp.net (10.0.2.4): icmp_seq=3 ttl=64 time=1.31 ms
^C
--- b3-node1.120bvlftuafejjowv5nhgovpfc.bx.internal.cloudapp.net ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.875/1.246/1.557/0.281 ms
gibbs@b3-node2:~$ 
```