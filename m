Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=74.220.202.212; helo=outbound-ss-348.hostmonster.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="pz08mRkq"; 
 dkim-atps=neutral
X-Greylist: delayed 2311 seconds by postgrey-1.36 at bilbo;
 Mon, 18 Jun 2018 15:21:52 AEST
Received: from outbound-ss-348.hostmonster.com
 (outbound-ss-348.hostmonster.com [74.220.202.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418KG80ZvDzF0Pd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 15:21:50 +1000 (AEST)
Received: from cmgw13.unifiedlayer.com (unknown [10.9.0.13])
 by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id C5FBF1E0624
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 22:43:14 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id Um06fWDgl6v4yUm06fVV0T; Sun, 17 Jun 2018 22:42:46 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:
 In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=VWEF+OVaWFksWv7UcmXJZUS6+A42Kpx+ZeeqLPquCeo=; b=pz08mRkqC/UAcwoNRd//YpMyJb
 aMboD4X+cII0xuWuLFB5wVMn6vr5+4A0zgbRK5SR4W2arRLjUql8/SYDD++mnIWKCvZ2uw0GNknP4
 oDcxg8IQvYHvIIzi6MKeG8njB;
Received: from mail-oi0-f49.google.com ([209.85.218.49]:45302)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89_1) (envelope-from <aaron_ppus@fmad.com>)
 id 1fUm0Y-002TKp-6W
 for openbmc@lists.ozlabs.org; Sun, 17 Jun 2018 22:43:14 -0600
Received: by mail-oi0-f49.google.com with SMTP id 188-v6so13627348oid.12
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 21:43:14 -0700 (PDT)
X-Gm-Message-State: APt69E0nmZNSBi34y3M0uXh22D9yGX0kxtd+ZF68qbMwVP9edgcMCsWy
 HAwSFXi+H817oJNHnw2/BQKIXT55Ja0XGJn6BQ==
X-Google-Smtp-Source: ADUXVKKukb/J8aEPkVXAHmoq4/2MWOrLDHIhwXKjdh3PKUk8KmMqRUPQaRObaA22vCjHOdGV6FEqEMpKgKBNQblaUzY=
X-Received: by 2002:aca:a686:: with SMTP id t6-v6mr6378766oij.48.1529296993570; 
 Sun, 17 Jun 2018 21:43:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:7591:0:0:0:0:0 with HTTP; Sun, 17 Jun 2018 21:43:12
 -0700 (PDT)
In-Reply-To: <1529294903.2213646.1411287368.3EEC4528@webmail.messagingengine.com>
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
 <1529294903.2213646.1411287368.3EEC4528@webmail.messagingengine.com>
From: Aaron <aaron_ppus@fmad.com>
Date: Mon, 18 Jun 2018 13:43:12 +0900
X-Gmail-Original-Message-ID: <CABq4n+R+DLn3ham7YfsxEBPLALPma8YEmWAuckt+-gzBHT5aSg@mail.gmail.com>
Message-ID: <CABq4n+R+DLn3ham7YfsxEBPLALPma8YEmWAuckt+-gzBHT5aSg@mail.gmail.com>
Subject: Re: Netboot full image loading AST2400
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000ed60c056ee33471"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 209.85.218.49
X-Source-L: No
X-Exim-ID: 1fUm0Y-002TKp-6W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-oi0-f49.google.com [209.85.218.49]:45302
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 3
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Tue, 19 Jun 2018 10:02:54 +1000
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
X-List-Received-Date: Mon, 18 Jun 2018 05:21:53 -0000

--0000000000000ed60c056ee33471
Content-Type: text/plain; charset="UTF-8"

Thanks! will give that a try.

Aaron

On 18 June 2018 at 13:08, Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Aaron,
>
> On Fri, 15 Jun 2018, at 22:58, Aaron wrote:
> > Hi,
> >
> > It seems like there would an easy way to do this for development/bringup,
> > asking instead of hacking on the code for a change.
> >
> > Im bringing up a system by loading an image via u-boot across the network
> > into the upper section of ram, then booting from there. It relocates
> itself
> > to the reset vector and generally works well.
> >
> > U-Boot 2016.07 (Jun 15 2018 - 20:42:28 +0900)
> >
> > DRAM:  240 MiB
> > WARNING: Caches not enabled
> > Flash: 32 MiB
> > *** Warning - bad CRC, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   aspeednic#0
> > Error: aspeednic#0 address not set.
> >
> > Hit any key to stop autoboot:  0
> > ast# nv
> > Unknown command 'nv' - try 'help'
> > ast# env print
> > baudrate=115200
> > bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> > bootcmd=bootm 20080000
> > bootdelay=2
> > ethact=aspeednic#0
> > spi_dma=yes
> > stderr=serial
> > stdin=serial
> > stdout=serial
> > verify=yes
> >
> > Environment size: 204/65531 bytes
> > ast#
> >
> >
> > The initial stages are good, but 2nd stage loader assume files on MTD
> > instead of whats in RAM, thus crashes out / uses stale data. Wasted about
> > half a day wondering why my changes were having little to no effect.
> >
> > Is there a best practices on this?
> >
> > Thanks
> > Aaron
> >
> >
> >
> > ast# bootd
> > FTGMAC100#0: link up, 1000bps full-duplex
> > Using FTGMAC100#0 device
> > TFTP from server 192.168.2.136; our IP address is 192.168.2.143
> > Filename 'image-current'.
> > Load address: 0x40a00000
> > Loading: ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> > .
> > .
> > .
> > .
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          ############################################################
> #####
> >          #######################################################
> >          2.5 MiB/s
> > done
> > Bytes transferred = 33554432 (2000000 hex)
> > ## Loading kernel from FIT Image at 40a80000 ...
> >    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
> >    Trying 'kernel@1' kernel subimage
> >      Description:  Linux kernel
> >      Type:         Kernel Image
> >      Compression:  uncompressed
> >      Data Start:   0x40a8012c
> >      Data Size:    2331736 Bytes = 2.2 MiB
> >      Architecture: ARM
> >      OS:           Linux
> >      Load Address: 0x40008000
> >      Entry Point:  0x40008000
> >      Hash algo:    sha1
> >      Hash value:   6a7b891f8d5fed2d358b2ceb06034496979dcae8
> >    Verifying Hash Integrity ... sha1+ OK
> > ## Loading ramdisk from FIT Image at 40a80000 ...
> >    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
> >    Trying 'ramdisk@1' ramdisk subimage
> >      Description:  obmc-phosphor-initramfs
> >      Type:         RAMDisk Image
> >      Compression:  lzma compressed
> >      Data Start:   0x40cbfa80
> >      Data Size:    1874095 Bytes = 1.8 MiB
> >      Architecture: ARM
> >      OS:           Linux
> >      Load Address: unavailable
> >      Entry Point:  unavailable
> >      Hash algo:    sha1
> >      Hash value:   788a33bc41ecf5667b87ee2e264c679ed2a42e51
> >    Verifying Hash Integrity ... sha1+ OK
> > ## Loading fdt from FIT Image at 40a80000 ...
> >    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
> >    Trying 'fdt@aspeed-bmc-quanta-q71l.dtb' fdt subimage
> >      Description:  Flattened Device Tree blob
> >      Type:         Flat Device Tree
> >      Compression:  uncompressed
> >      Data Start:   0x40cb9690
> >      Data Size:    25390 Bytes = 24.8 KiB
> >      Architecture: ARM
> >      Hash algo:    sha1
> >      Hash value:   84ed7efe6232738984546b3ef27397ab251c3396
> >    Verifying Hash Integrity ... sha1+ OK
> >    Booting using the fdt blob at 0x40cb9690
> >    Loading Kernel Image ... OK
> >    Loading Ramdisk to 4e9d1000, end 4eb9a8af ... OK
> >    Loading Device Tree to 4e9c7000, end 4e9d032d ... OK
> >
> > Starting kernel ...
> >
> >
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] random: get_random_bytes called from
> start_kernel+0x3c/0x3f0
> > with crng_init=0
> > [    0.000000] Linux version
> > 4.13.16-aca92be80c008bceeb6fb62fd1d450b5be5d0a4f (oe-user@oe-host) (gcc
> > version 7.3.0 (GCC)) #10 Fri Jun 15 20:59:12 JST 2018
> > [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ),
> cr=0005317f
> > [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> > [    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
> > [    0.000000] Memory policy: Data cache writeback
> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> > Total pages: 58912
> > [    0.000000] Kernel command line: console=ttyS4,115200n8 root=/dev/ram
> rw
> > [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> > [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
> > bytes)
> > [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536
> bytes)
> > [    0.000000] Memory: 224832K/237568K available (5120K kernel code, 330K
> > rwdata, 1276K rodata, 1024K init, 109K bss, 12736K reserved, 0K
> > cma-reserved)
> > [    0.000000] Virtual kernel memory layout:
> > [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> > [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> > [    0.000000]     vmalloc : 0x8f800000 - 0xff800000   (1792 MB)
> > .
> > .
> > <snip>
> > .
> > .
> >
> > [    4.641015] Segment Routing with IPv6
> > [    4.643890] ip6_tables: (C) 2000-2006 Netfilter Core Team
> > [    4.648315] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> > [    4.654435] NET: Registered protocol family 17
> > [    4.657830] 8021q: 802.1Q VLAN Support v1.8
> > [    4.672023] hctosys: unable to open rtc device (rtc0)
> > [    4.682642] Freeing unused kernel memory: 1024K
> > rofs = mtd4 squashfs rwfs = mtd5 jffs2
> > mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid
> argument
> > [    7.296855] jffs2: notice: (453) jffs2_build_xattr_subsystem: complete
> > building xattr subsystem, 53 of xdatum (40 unchecked, 13 orphan) and 189
> of
> > xref (8 dead, 47 orphan) foun.
> > [    7.336463] overlayfs: upper fs does not support tmpfile.
> > chroot: can't execute '/bin/sh': No such file or directory
> >
> > Unable to confirm /sbin/init is an executable non-empty file
> > in merged file system mounted at /root.
> >
> > Change Root test failed!  Invoking emergency shell.
> > Enter password to try to manually fix.
> > After fixing run exit to continue this script, or reboot -f to retry, or
> > touch /takeover and exit to become PID 1 allowing editing of this script.
> > Give root password for maintenance
> > (or press Control-D to continue):
> >
> >
> > ... and tries to load from MTD which has been purposely erased, and thus
> > complains.
>
> Have you tried building a netboot image? I think this commit is relevant:
>
> https://gerrit.openbmc-project.xyz/#/c/1957/
>
> Cheers,
>
> Andrew
>

--0000000000000ed60c056ee33471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! will give that a try.<div><br></div><div>Aaron</di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 18 Jun=
e 2018 at 13:08, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"mailto:and=
rew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hi Aaron,<br>
<div><div class=3D"h5"><br>
On Fri, 15 Jun 2018, at 22:58, Aaron wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; It seems like there would an easy way to do this for development/bring=
up,<br>
&gt; asking instead of hacking on the code for a change.<br>
&gt; <br>
&gt; Im bringing up a system by loading an image via u-boot across the netw=
ork<br>
&gt; into the upper section of ram, then booting from there. It relocates i=
tself<br>
&gt; to the reset vector and generally works well.<br>
&gt; <br>
&gt; U-Boot 2016.07 (Jun 15 2018 - 20:42:28 +0900)<br>
&gt; <br>
&gt; DRAM:=C2=A0 240 MiB<br>
&gt; WARNING: Caches not enabled<br>
&gt; Flash: 32 MiB<br>
&gt; *** Warning - bad CRC, using default environment<br>
&gt; <br>
&gt; In:=C2=A0 =C2=A0 serial<br>
&gt; Out:=C2=A0 =C2=A0serial<br>
&gt; Err:=C2=A0 =C2=A0serial<br>
&gt; Net:=C2=A0 =C2=A0aspeednic#0<br>
&gt; Error: aspeednic#0 address not set.<br>
&gt; <br>
&gt; Hit any key to stop autoboot:=C2=A0 0<br>
&gt; ast# nv<br>
&gt; Unknown command &#39;nv&#39; - try &#39;help&#39;<br>
&gt; ast# env print<br>
&gt; baudrate=3D115200<br>
&gt; bootargs=3Dconsole=3DttyS4,<wbr>115200n8 root=3D/dev/ram rw<br>
&gt; bootcmd=3Dbootm 20080000<br>
&gt; bootdelay=3D2<br>
&gt; ethact=3Daspeednic#0<br>
&gt; spi_dma=3Dyes<br>
&gt; stderr=3Dserial<br>
&gt; stdin=3Dserial<br>
&gt; stdout=3Dserial<br>
&gt; verify=3Dyes<br>
&gt; <br>
&gt; Environment size: 204/65531 bytes<br>
&gt; ast#<br>
&gt; <br>
&gt; <br>
&gt; The initial stages are good, but 2nd stage loader assume files on MTD<=
br>
&gt; instead of whats in RAM, thus crashes out / uses stale data. Wasted ab=
out<br>
&gt; half a day wondering why my changes were having little to no effect.<b=
r>
&gt; <br>
&gt; Is there a best practices on this?<br>
&gt; <br>
&gt; Thanks<br>
&gt; Aaron<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ast# bootd<br>
&gt; FTGMAC100#0: link up, 1000bps full-duplex<br>
&gt; Using FTGMAC100#0 device<br>
&gt; TFTP from server 192.168.2.136; our IP address is 192.168.2.143<br>
&gt; Filename &#39;image-current&#39;.<br>
&gt; Load address: 0x40a00000<br>
&gt; Loading: ##############################<wbr>##########################=
####<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt; .<br>
&gt; .<br>
&gt; .<br>
&gt; .<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
#############################<wbr>#####<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##############################<wbr>#=
########################<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.5 MiB/s<br>
&gt; done<br>
&gt; Bytes transferred =3D 33554432 (2000000 hex)<br>
&gt; ## Loading kernel from FIT Image at 40a80000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@aspeed-bmc-quanta-q71l.<wbr>dtb&#39; conf=
iguration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;kernel@1&#39; kernel subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 Linux kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Imag=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x40a8012c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 2331736 Bytes =3D 2.2 MiB<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Load Address: 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Entry Point:=C2=A0 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A06a7b891f8d5fed2d358b2ceb06=
0344<wbr>96979dcae8<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt; ## Loading ramdisk from FIT Image at 40a80000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@aspeed-bmc-quanta-q71l.<wbr>dtb&#39; conf=
iguration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;ramdisk@1&#39; ramdisk subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 obmc-phosphor-initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAMDisk Ima=
ge<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 lzma compressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x40cbfa80<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 1874095 Bytes =3D 1.8 MiB<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Load Address: unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Entry Point:=C2=A0 unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A0788a33bc41ecf5667b87ee2e26=
4c67<wbr>9ed2a42e51<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt; ## Loading fdt from FIT Image at 40a80000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@aspeed-bmc-quanta-q71l.<wbr>dtb&#39; conf=
iguration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;fdt@aspeed-bmc-quanta-q71l.<wbr>dtb&#39; fdt =
subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 Flattened Device Tree blob<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device=
 Tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x40cb9690<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 25390 Bytes =3D 24.8 KiB<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A084ed7efe6232738984546b3ef2=
7397<wbr>ab251c3396<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt;=C2=A0 =C2=A0 Booting using the fdt blob at 0x40cb9690<br>
&gt;=C2=A0 =C2=A0 Loading Kernel Image ... OK<br>
&gt;=C2=A0 =C2=A0 Loading Ramdisk to 4e9d1000, end 4eb9a8af ... OK<br>
&gt;=C2=A0 =C2=A0 Loading Device Tree to 4e9c7000, end 4e9d032d ... OK<br>
&gt; <br>
&gt; Starting kernel ...<br>
&gt; <br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0<br>
&gt; [=C2=A0 =C2=A0 0.000000] random: get_random_bytes called from start_ke=
rnel+0x3c/0x3f0<br>
&gt; with crng_init=3D0<br>
&gt; [=C2=A0 =C2=A0 0.000000] Linux version<br>
&gt; 4.13.16-<wbr>aca92be80c008bceeb6fb62fd1d450<wbr>b5be5d0a4f (oe-user@oe=
-host) (gcc<br>
&gt; version 7.3.0 (GCC)) #10 Fri Jun 15 20:59:12 JST 2018<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5T=
EJ), cr=3D0005317f<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: VIVT data cache, VIVT instruction cache<=
br>
&gt; [=C2=A0 =C2=A0 0.000000] OF: fdt: Machine model: Quanta Q71L BMC<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory policy: Data cache writeback<br>
&gt; [=C2=A0 =C2=A0 0.000000] Built 1 zonelists in Zone order, mobility gro=
uping on.<br>
&gt; Total pages: 58912<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyS4,115200n8=
 root=3D/dev/ram rw<br>
&gt; [=C2=A0 =C2=A0 0.000000] PID hash table entries: 1024 (order: 0, 4096 =
bytes)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Dentry cache hash table entries: 32768 (order=
: 5, 131072<br>
&gt; bytes)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Inode-cache hash table entries: 16384 (order:=
 4, 65536 bytes)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory: 224832K/237568K available (5120K kern=
el code, 330K<br>
&gt; rwdata, 1276K rodata, 1024K init, 109K bss, 12736K reserved, 0K<br>
&gt; cma-reserved)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Virtual kernel memory layout:<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vector=C2=A0 : 0xffff0000 =
- 0xffff1000=C2=A0 =C2=A0(=C2=A0 =C2=A04 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0fixmap=C2=A0 : 0xffc00000 =
- 0xfff00000=C2=A0 =C2=A0(3072 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vmalloc : 0x8f800000 - 0xf=
f800000=C2=A0 =C2=A0(1792 MB)<br>
&gt; .<br>
&gt; .<br>
&gt; &lt;snip&gt;<br>
&gt; .<br>
&gt; .<br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 4.641015] Segment Routing with IPv6<br>
&gt; [=C2=A0 =C2=A0 4.643890] ip6_tables: (C) 2000-2006 Netfilter Core Team=
<br>
&gt; [=C2=A0 =C2=A0 4.648315] sit: IPv6, IPv4 and MPLS over IPv4 tunneling =
driver<br>
&gt; [=C2=A0 =C2=A0 4.654435] NET: Registered protocol family 17<br>
&gt; [=C2=A0 =C2=A0 4.657830] 8021q: 802.1Q VLAN Support v1.8<br>
&gt; [=C2=A0 =C2=A0 4.672023] hctosys: unable to open rtc device (rtc0)<br>
&gt; [=C2=A0 =C2=A0 4.682642] Freeing unused kernel memory: 1024K<br>
&gt; rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2<br>
&gt; mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid arg=
ument<br>
&gt; [=C2=A0 =C2=A0 7.296855] jffs2: notice: (453) jffs2_build_xattr_subsys=
tem: complete<br>
&gt; building xattr subsystem, 53 of xdatum (40 unchecked, 13 orphan) and 1=
89 of<br>
&gt; xref (8 dead, 47 orphan) foun.<br>
&gt; [=C2=A0 =C2=A0 7.336463] overlayfs: upper fs does not support tmpfile.=
<br>
&gt; chroot: can&#39;t execute &#39;/bin/sh&#39;: No such file or directory=
<br>
&gt; <br>
&gt; Unable to confirm /sbin/init is an executable non-empty file<br>
&gt; in merged file system mounted at /root.<br>
&gt; <br>
&gt; Change Root test failed!=C2=A0 Invoking emergency shell.<br>
&gt; Enter password to try to manually fix.<br>
&gt; After fixing run exit to continue this script, or reboot -f to retry, =
or<br>
&gt; touch /takeover and exit to become PID 1 allowing editing of this scri=
pt.<br>
&gt; Give root password for maintenance<br>
&gt; (or press Control-D to continue):<br>
&gt; <br>
&gt; <br>
&gt; ... and tries to load from MTD which has been purposely erased, and th=
us<br>
&gt; complains.<br>
<br>
</div></div>Have you tried building a netboot image? I think this commit is=
 relevant:<br>
<br>
<a href=3D"https://gerrit.openbmc-">https://gerrit.openbmc-</a><wbr><a href=
=3D"http://project.xyz/#/c/1957/">project.xyz/#/c/1957/</a><br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div><br></div>

--0000000000000ed60c056ee33471--
