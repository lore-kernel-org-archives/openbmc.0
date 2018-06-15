Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=69.89.30.42; helo=gproxy3-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="HJeZWSgp"; 
 dkim-atps=neutral
X-Greylist: delayed 2479 seconds by postgrey-1.36 at bilbo;
 Sat, 16 Jun 2018 00:35:23 AEST
Received: from gproxy3-pub.mail.unifiedlayer.com
 (gproxy3-pub.mail.unifiedlayer.com [69.89.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 416jhC3NlBzF1bv
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jun 2018 00:35:22 +1000 (AEST)
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
 by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 3D9164102A
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 07:28:32 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id ToltfSJL920diToltfazO4; Fri, 15 Jun 2018 07:28:09 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1CHVeZzucGjqNTYGZCYjdqpm8aduPr6n1ka7ybv0wRo=; b=HJeZWSgphHiTi+lwvANsZOiTeJ
 IgPyyyoNPl1RZYn7cb7JkoJoMMSqklVP2b/IYgUB5zptciy873rRvtFueatTEDhh0HD5BZaE9juvD
 6JJ2M5Asu9WD4z6OZli6JXIKn;
Received: from mail-ot0-f172.google.com ([74.125.82.172]:39927)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89_1) (envelope-from <aaron_ppus@fmad.com>)
 id 1fTomF-0009PG-KJ
 for openbmc@lists.ozlabs.org; Fri, 15 Jun 2018 07:28:31 -0600
Received: by mail-ot0-f172.google.com with SMTP id l15-v6so10974287oth.6
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 06:28:31 -0700 (PDT)
X-Gm-Message-State: APt69E0ntmeYKaKLm96T8tjU0TenlVAZf5quc6Ok0UnVcbtW/b/Xqm+E
 Rg7oQF14eXZZS3yH1y8JGvmXrsoSVe0f5QenCg==
X-Google-Smtp-Source: ADUXVKKXFjrcditE+2EQmWi/XL4JIu/8Zf2pmLoc5IYyp74Ajf8yCd/W8FWAZxYJPQsPjtJwFn3cVKmFF7ba1kJw00g=
X-Received: by 2002:a9d:fe7:: with SMTP id m36-v6mr916438otd.129.1529069310873; 
 Fri, 15 Jun 2018 06:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:7591:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 06:28:30
 -0700 (PDT)
From: Aaron <aaron_ppus@fmad.com>
Date: Fri, 15 Jun 2018 22:28:30 +0900
X-Gmail-Original-Message-ID: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
Message-ID: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
Subject: Netboot full image loading AST2400
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001c9660056eae31c4"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 74.125.82.172
X-Source-L: No
X-Exim-ID: 1fTomF-0009PG-KJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-ot0-f172.google.com [74.125.82.172]:39927
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 1
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Org: HG=bhcustomer;ORG=bluehost;
X-Local-Domain: yes
X-Mailman-Approved-At: Mon, 18 Jun 2018 12:04:13 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 14:35:25 -0000

--0000000000001c9660056eae31c4
Content-Type: text/plain; charset="UTF-8"

Hi,

It seems like there would an easy way to do this for development/bringup,
asking instead of hacking on the code for a change.

Im bringing up a system by loading an image via u-boot across the network
into the upper section of ram, then booting from there. It relocates itself
to the reset vector and generally works well.

U-Boot 2016.07 (Jun 15 2018 - 20:42:28 +0900)

DRAM:  240 MiB
WARNING: Caches not enabled
Flash: 32 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Error: aspeednic#0 address not set.

Hit any key to stop autoboot:  0
ast# nv
Unknown command 'nv' - try 'help'
ast# env print
baudrate=115200
bootargs=console=ttyS4,115200n8 root=/dev/ram rw
bootcmd=bootm 20080000
bootdelay=2
ethact=aspeednic#0
spi_dma=yes
stderr=serial
stdin=serial
stdout=serial
verify=yes

Environment size: 204/65531 bytes
ast#


The initial stages are good, but 2nd stage loader assume files on MTD
instead of whats in RAM, thus crashes out / uses stale data. Wasted about
half a day wondering why my changes were having little to no effect.

Is there a best practices on this?

Thanks
Aaron



ast# bootd
FTGMAC100#0: link up, 1000bps full-duplex
Using FTGMAC100#0 device
TFTP from server 192.168.2.136; our IP address is 192.168.2.143
Filename 'image-current'.
Load address: 0x40a00000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
.
.
.
.
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #######################################################
         2.5 MiB/s
done
Bytes transferred = 33554432 (2000000 hex)
## Loading kernel from FIT Image at 40a80000 ...
   Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x40a8012c
     Data Size:    2331736 Bytes = 2.2 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x40008000
     Entry Point:  0x40008000
     Hash algo:    sha1
     Hash value:   6a7b891f8d5fed2d358b2ceb06034496979dcae8
   Verifying Hash Integrity ... sha1+ OK
## Loading ramdisk from FIT Image at 40a80000 ...
   Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  lzma compressed
     Data Start:   0x40cbfa80
     Data Size:    1874095 Bytes = 1.8 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha1
     Hash value:   788a33bc41ecf5667b87ee2e264c679ed2a42e51
   Verifying Hash Integrity ... sha1+ OK
## Loading fdt from FIT Image at 40a80000 ...
   Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
   Trying 'fdt@aspeed-bmc-quanta-q71l.dtb' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x40cb9690
     Data Size:    25390 Bytes = 24.8 KiB
     Architecture: ARM
     Hash algo:    sha1
     Hash value:   84ed7efe6232738984546b3ef27397ab251c3396
   Verifying Hash Integrity ... sha1+ OK
   Booting using the fdt blob at 0x40cb9690
   Loading Kernel Image ... OK
   Loading Ramdisk to 4e9d1000, end 4eb9a8af ... OK
   Loading Device Tree to 4e9c7000, end 4e9d032d ... OK

Starting kernel ...


[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] random: get_random_bytes called from start_kernel+0x3c/0x3f0
with crng_init=0
[    0.000000] Linux version
4.13.16-aca92be80c008bceeb6fb62fd1d450b5be5d0a4f (oe-user@oe-host) (gcc
version 7.3.0 (GCC)) #10 Fri Jun 15 20:59:12 JST 2018
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
[    0.000000] Memory policy: Data cache writeback
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 58912
[    0.000000] Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 224832K/237568K available (5120K kernel code, 330K
rwdata, 1276K rodata, 1024K init, 109K bss, 12736K reserved, 0K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x8f800000 - 0xff800000   (1792 MB)
.
.
<snip>
.
.

[    4.641015] Segment Routing with IPv6
[    4.643890] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    4.648315] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    4.654435] NET: Registered protocol family 17
[    4.657830] 8021q: 802.1Q VLAN Support v1.8
[    4.672023] hctosys: unable to open rtc device (rtc0)
[    4.682642] Freeing unused kernel memory: 1024K
rofs = mtd4 squashfs rwfs = mtd5 jffs2
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
[    7.296855] jffs2: notice: (453) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 53 of xdatum (40 unchecked, 13 orphan) and 189 of
xref (8 dead, 47 orphan) foun.
[    7.336463] overlayfs: upper fs does not support tmpfile.
chroot: can't execute '/bin/sh': No such file or directory

Unable to confirm /sbin/init is an executable non-empty file
in merged file system mounted at /root.

Change Root test failed!  Invoking emergency shell.
Enter password to try to manually fix.
After fixing run exit to continue this script, or reboot -f to retry, or
touch /takeover and exit to become PID 1 allowing editing of this script.
Give root password for maintenance
(or press Control-D to continue):


... and tries to load from MTD which has been purposely erased, and thus
complains.

--0000000000001c9660056eae31c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>It seems like there would an easy w=
ay to do this for development/bringup, asking instead of hacking on the cod=
e for a change.</div><div><br></div><div>Im bringing up a system by loading=
 an image via u-boot across the network into the upper section of ram, then=
 booting from there. It relocates itself to the reset vector and generally =
works well.</div><div><div><br></div><div>U-Boot 2016.07 (Jun 15 2018 - 20:=
42:28 +0900)</div><div><br></div><div>DRAM:=C2=A0 240 MiB</div><div>WARNING=
: Caches not enabled</div><div>Flash: 32 MiB</div><div>*** Warning - bad CR=
C, using default environment</div><div><br></div><div>In:=C2=A0 =C2=A0 seri=
al</div><div>Out:=C2=A0 =C2=A0serial</div><div>Err:=C2=A0 =C2=A0serial</div=
><div>Net:=C2=A0 =C2=A0aspeednic#0</div><div>Error: aspeednic#0 address not=
 set.</div><div><br></div><div>Hit any key to stop autoboot:=C2=A0 0</div><=
div>ast# nv</div><div>Unknown command &#39;nv&#39; - try &#39;help&#39;</di=
v><div>ast# env print</div><div>baudrate=3D115200</div><div>bootargs=3Dcons=
ole=3DttyS4,115200n8 root=3D/dev/ram rw</div><div>bootcmd=3Dbootm 20080000<=
/div><div>bootdelay=3D2</div><div>ethact=3Daspeednic#0</div><div>spi_dma=3D=
yes</div><div>stderr=3Dserial</div><div>stdin=3Dserial</div><div>stdout=3Ds=
erial</div><div>verify=3Dyes</div><div><br></div><div>Environment size: 204=
/65531 bytes</div><div>ast#</div></div><div><br></div><div>

<div style=3D"font-size:small;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><br></div><div style=3D"f=
ont-size:small;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial">The initial stages are good, but 2nd sta=
ge loader assume files on MTD instead of whats in RAM, thus crashes out / u=
ses stale data. Wasted about half a day wondering why my changes were havin=
g little to no effect.=C2=A0</div><div style=3D"font-size:small;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><br></div><div style=3D"font-size:small;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial">Is the=
re a best practices on this?</div><div style=3D"font-size:small;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><br></div><div style=3D"font-size:small;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial">Thanks=
</div><div style=3D"font-size:small;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial">Aaron</div><br clas=
s=3D"gmail-Apple-interchange-newline">

<br></div><div><br></div><div><div>ast# bootd</div><div>FTGMAC100#0: link u=
p, 1000bps full-duplex</div><div>Using FTGMAC100#0 device</div><div>TFTP fr=
om server 192.168.2.136; our IP address is 192.168.2.143</div><div>Filename=
 &#39;image-current&#39;.</div><div>Load address: 0x40a00000</div><div>Load=
ing: #################################################################</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0###################################=
##############################</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
#################################################################</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0########################################=
#########################</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#####=
############################################################</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0############################################=
#####################</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#########=
########################################################</div></div><div>.<=
/div><div>.</div><div>.</div><div>.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0#################################################################<br>=
</div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#########################=
########################################</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#################################################################=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0##############################=
###################################</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0#######################################################</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.5 MiB/s</div><div>done</div><div>Bytes tra=
nsferred =3D 33554432 (2000000 hex)</div><div>## Loading kernel from FIT Im=
age at 40a80000 ...</div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-bmc-quant=
a-q71l.dtb&#39; configuration</div><div>=C2=A0 =C2=A0Trying &#39;kernel@1&#=
39; kernel subimage</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Linux =
kernel</div><div>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Kernel Image</div><div>=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompress=
ed</div><div>=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x40a8012c</div><d=
iv>=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 2331736 Bytes =3D 2.2 MiB</d=
iv><div>=C2=A0 =C2=A0 =C2=A0Architecture: ARM</div><div>=C2=A0 =C2=A0 =C2=
=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux</div><div>=C2=A0 =C2=
=A0 =C2=A0Load Address: 0x40008000</div><div>=C2=A0 =C2=A0 =C2=A0Entry Poin=
t:=C2=A0 0x40008000</div><div>=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 s=
ha1</div><div>=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A06a7b891f8d5fed2d3=
58b2ceb06034496979dcae8</div><div>=C2=A0 =C2=A0Verifying Hash Integrity ...=
 sha1+ OK</div><div>## Loading ramdisk from FIT Image at 40a80000 ...<br></=
div></div><div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-bmc-quanta-q71l.dtb=
&#39; configuration</div><div>=C2=A0 =C2=A0Trying &#39;ramdisk@1&#39; ramdi=
sk subimage</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 obmc-phosphor-=
initramfs</div><div>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0RAMDisk Image</div><div>=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 lzma c=
ompressed</div><div>=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x40cbfa80<=
/div><div>=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 1874095 Bytes =3D 1.8=
 MiB</div><div>=C2=A0 =C2=A0 =C2=A0Architecture: ARM</div><div>=C2=A0 =C2=
=A0 =C2=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux</div><div>=C2=
=A0 =C2=A0 =C2=A0Load Address: unavailable</div><div>=C2=A0 =C2=A0 =C2=A0En=
try Point:=C2=A0 unavailable</div><div>=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0=
 =C2=A0 sha1</div><div>=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0788a33bc=
41ecf5667b87ee2e264c679ed2a42e51</div><div>=C2=A0 =C2=A0Verifying Hash Inte=
grity ... sha1+ OK</div><div>## Loading fdt from FIT Image at 40a80000 ...<=
/div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-bmc-quanta-q71l.dtb&#39; conf=
iguration</div><div>=C2=A0 =C2=A0Trying &#39;fdt@aspeed-bmc-quanta-q71l.dtb=
&#39; fdt subimage</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Flatten=
ed Device Tree blob</div><div>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Flat Device Tree</div><div>=C2=A0 =C2=A0 =C2=A0Compression:=
=C2=A0 uncompressed</div><div>=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00=
x40cb9690</div><div>=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 25390 Bytes=
 =3D 24.8 KiB</div><div>=C2=A0 =C2=A0 =C2=A0Architecture: ARM</div><div>=C2=
=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha1</div><div>=C2=A0 =C2=A0 =C2=
=A0Hash value:=C2=A0 =C2=A084ed7efe6232738984546b3ef27397ab251c3396</div><d=
iv>=C2=A0 =C2=A0Verifying Hash Integrity ... sha1+ OK</div><div>=C2=A0 =C2=
=A0Booting using the fdt blob at 0x40cb9690</div><div>=C2=A0 =C2=A0Loading =
Kernel Image ... OK</div><div>=C2=A0 =C2=A0Loading Ramdisk to 4e9d1000, end=
 4eb9a8af ... OK</div><div>=C2=A0 =C2=A0Loading Device Tree to 4e9c7000, en=
d 4e9d032d ... OK</div><div><br></div><div>Starting kernel ...</div></div><=
div><br></div><div><div><br></div><div>[=C2=A0 =C2=A0 0.000000] Booting Lin=
ux on physical CPU 0x0</div><div>[=C2=A0 =C2=A0 0.000000] random: get_rando=
m_bytes called from start_kernel+0x3c/0x3f0 with crng_init=3D0</div><div>[=
=C2=A0 =C2=A0 0.000000] Linux version 4.13.16-aca92be80c008bceeb6fb62fd1d45=
0b5be5d0a4f (oe-user@oe-host) (gcc version 7.3.0 (GCC)) #10 Fri Jun 15 20:5=
9:12 JST 2018</div><div>[=C2=A0 =C2=A0 0.000000] CPU: ARM926EJ-S [41069265]=
 revision 5 (ARMv5TEJ), cr=3D0005317f</div><div>[=C2=A0 =C2=A0 0.000000] CP=
U: VIVT data cache, VIVT instruction cache</div><div>[=C2=A0 =C2=A0 0.00000=
0] OF: fdt: Machine model: Quanta Q71L BMC</div><div>[=C2=A0 =C2=A0 0.00000=
0] Memory policy: Data cache writeback</div><div>[=C2=A0 =C2=A0 0.000000] B=
uilt 1 zonelists in Zone order, mobility grouping on.=C2=A0 Total pages: 58=
912</div><div>[=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyS4=
,115200n8 root=3D/dev/ram rw</div><div>[=C2=A0 =C2=A0 0.000000] PID hash ta=
ble entries: 1024 (order: 0, 4096 bytes)</div><div>[=C2=A0 =C2=A0 0.000000]=
 Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)</div><div>=
[=C2=A0 =C2=A0 0.000000] Inode-cache hash table entries: 16384 (order: 4, 6=
5536 bytes)</div><div>[=C2=A0 =C2=A0 0.000000] Memory: 224832K/237568K avai=
lable (5120K kernel code, 330K rwdata, 1276K rodata, 1024K init, 109K bss, =
12736K reserved, 0K cma-reserved)</div><div>[=C2=A0 =C2=A0 0.000000] Virtua=
l kernel memory layout:</div><div>[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=
=A0vector=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0 =C2=A0(=C2=A0 =C2=A04 kB)</=
div><div>[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0fixmap=C2=A0 : 0xffc00=
000 - 0xfff00000=C2=A0 =C2=A0(3072 kB)</div><div>[=C2=A0 =C2=A0 0.000000]=
=C2=A0 =C2=A0 =C2=A0vmalloc : 0x8f800000 - 0xff800000=C2=A0 =C2=A0(1792 MB)=
</div></div><div>.</div><div>.</div><div>&lt;snip&gt;</div><div>.</div><div=
>.</div><div><br></div><div><div>[=C2=A0 =C2=A0 4.641015] Segment Routing w=
ith IPv6</div><div>[=C2=A0 =C2=A0 4.643890] ip6_tables: (C) 2000-2006 Netfi=
lter Core Team</div><div>[=C2=A0 =C2=A0 4.648315] sit: IPv6, IPv4 and MPLS =
over IPv4 tunneling driver</div><div>[=C2=A0 =C2=A0 4.654435] NET: Register=
ed protocol family 17</div><div>[=C2=A0 =C2=A0 4.657830] 8021q: 802.1Q VLAN=
 Support v1.8</div><div>[=C2=A0 =C2=A0 4.672023] hctosys: unable to open rt=
c device (rtc0)</div><div>[=C2=A0 =C2=A0 4.682642] Freeing unused kernel me=
mory: 1024K</div><div>rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2</div><div>=
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument=
</div><div>[=C2=A0 =C2=A0 7.296855] jffs2: notice: (453) jffs2_build_xattr_=
subsystem: complete building xattr subsystem, 53 of xdatum (40 unchecked, 1=
3 orphan) and 189 of xref (8 dead, 47 orphan) foun.</div><div>[=C2=A0 =C2=
=A0 7.336463] overlayfs: upper fs does not support tmpfile.</div><div>chroo=
t: can&#39;t execute &#39;/bin/sh&#39;: No such file or directory</div><div=
><br></div><div>Unable to confirm /sbin/init is an executable non-empty fil=
e</div><div>in merged file system mounted at /root.</div><div><br></div><di=
v>Change Root test failed!=C2=A0 Invoking emergency shell.</div><div>Enter =
password to try to manually fix.</div><div>After fixing run exit to continu=
e this script, or reboot -f to retry, or</div><div>touch /takeover and exit=
 to become PID 1 allowing editing of this script.</div><div>Give root passw=
ord for maintenance</div><div>(or press Control-D to continue):</div><div><=
br></div></div><div><br></div><div>... and tries to load from MTD which has=
 been purposely erased, and thus complains.</div><div><br></div><div><br></=
div><div><br></div></div>

--0000000000001c9660056eae31c4--
