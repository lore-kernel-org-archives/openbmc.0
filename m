Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Izu65z2Q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Qv3lARuc"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418HdQ0tlpzDrcd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 14:08:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AF09E21763;
 Mon, 18 Jun 2018 00:08:23 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Mon, 18 Jun 2018 00:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=GVdLLvQBsnXls0gjMiBFzXnged5tL
 Lw7NgtzpSPq2i4=; b=Izu65z2QFy0oPx8hthMmBWOk+I4MZdl2YgTdMg/y/LIbd
 dPEKAgYAXScr2KEFeMeJx8P1/aoa7fCC2ouCJ8BzFOk5s+yNzJBAO+t+eGouRsXi
 /UqEF+0PzwlcpX3P5FhOgULhGo+cCsx2IjpInQTUye24yiZixrcFPb6VFlgwm9YC
 /5aladwhGRKsqMS4LWf/ZdOUSd/4DIJU+ObaUlTVHLJ26HjjWT+RwFim41RWm2hs
 wEnyJXzkqXDtyLpXgvBLTFAB2sDPQJIiE0lsXMV0dW0e7NH0t8P7MAEDRhPqscLm
 TJ3pTEI/YQ/8WscnRqjOQJpN0HAu5LoIKr+KdWiwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GVdLLv
 QBsnXls0gjMiBFzXnged5tLLw7NgtzpSPq2i4=; b=Qv3lARucRlbxQ3PvvLMrM+
 htSIB+J/9aJOguPzbTfB9VuekQ7KbVUDZUc3i4tYq0HC6X8DX82AM71cHK4o63bF
 XNVW1uE8JyZCMZVGCSc+JCE2hVt5Z9NlGAqrwfNuGvprnrMm5d63tv7q62FoJu3b
 ZgvYcyGKr0CUW33kx0+sGzBJIJFJDOHA68CJ/fCLJ8KO1mfW/Cdp03d1LVpVgot4
 HND0JLOh+hv7QSBME0RdslrloR2Tzvhb982gLghA18yKj712fWLUOnOTH9v+z8MT
 bYj4cLOzoflCNQtNEupACf4wS5DbgRKpoJOMBxrbmSi7wlcChhdDPW3EZTyU/GhQ
 ==
X-ME-Proxy: <xmx:NzAnW_gUEoqf1PnWn-450jIr8iux3TbCsNrsgGUKy6JskVVpIX9zpg>
 <xmx:NzAnW0-y21L8wCcWqvqkSMFJYPlNkVpxrh_-GCRQNWfgiU96y6CmgA>
 <xmx:NzAnW30LDvNHWNZnuDLU2K9-yzeKGa_mumkWP0cSLy6qG-IoFWn-sQ>
 <xmx:NzAnW_ZME0Pyne3ZW08ctk8KOUOcUEyOXB52rd0hvAZsn1euYKjgWw>
 <xmx:NzAnW0SIai0zcchJRiujL13UH5OGrVpcswr1j2IASJbCqxd3velHmQ>
 <xmx:NzAnW69DIued-XP4T1URbkJoPzC_oF89Hf1C0Ldl1gWQkcOHCYTKqg>
X-ME-Sender: <xms:NzAnW47Aaerq-9F-WWwzcJre6WQjOtdlt8QN6O2SP0AEUwEoXCcNKQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 419A3BA43D; Mon, 18 Jun 2018 00:08:23 -0400 (EDT)
Message-Id: <1529294903.2213646.1411287368.3EEC4528@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Aaron <aaron_ppus@fmad.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-498d70f2
In-Reply-To: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
Date: Mon, 18 Jun 2018 13:38:23 +0930
Subject: Re: Netboot full image loading AST2400
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Jun 2018 04:08:26 -0000

Hi Aaron,

On Fri, 15 Jun 2018, at 22:58, Aaron wrote:
> Hi,
> 
> It seems like there would an easy way to do this for development/bringup,
> asking instead of hacking on the code for a change.
> 
> Im bringing up a system by loading an image via u-boot across the network
> into the upper section of ram, then booting from there. It relocates itself
> to the reset vector and generally works well.
> 
> U-Boot 2016.07 (Jun 15 2018 - 20:42:28 +0900)
> 
> DRAM:  240 MiB
> WARNING: Caches not enabled
> Flash: 32 MiB
> *** Warning - bad CRC, using default environment
> 
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Error: aspeednic#0 address not set.
> 
> Hit any key to stop autoboot:  0
> ast# nv
> Unknown command 'nv' - try 'help'
> ast# env print
> baudrate=115200
> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> bootcmd=bootm 20080000
> bootdelay=2
> ethact=aspeednic#0
> spi_dma=yes
> stderr=serial
> stdin=serial
> stdout=serial
> verify=yes
> 
> Environment size: 204/65531 bytes
> ast#
> 
> 
> The initial stages are good, but 2nd stage loader assume files on MTD
> instead of whats in RAM, thus crashes out / uses stale data. Wasted about
> half a day wondering why my changes were having little to no effect.
> 
> Is there a best practices on this?
> 
> Thanks
> Aaron
> 
> 
> 
> ast# bootd
> FTGMAC100#0: link up, 1000bps full-duplex
> Using FTGMAC100#0 device
> TFTP from server 192.168.2.136; our IP address is 192.168.2.143
> Filename 'image-current'.
> Load address: 0x40a00000
> Loading: #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
> .
> .
> .
> .
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #######################################################
>          2.5 MiB/s
> done
> Bytes transferred = 33554432 (2000000 hex)
> ## Loading kernel from FIT Image at 40a80000 ...
>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x40a8012c
>      Data Size:    2331736 Bytes = 2.2 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   6a7b891f8d5fed2d358b2ceb06034496979dcae8
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading ramdisk from FIT Image at 40a80000 ...
>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>    Trying 'ramdisk@1' ramdisk subimage
>      Description:  obmc-phosphor-initramfs
>      Type:         RAMDisk Image
>      Compression:  lzma compressed
>      Data Start:   0x40cbfa80
>      Data Size:    1874095 Bytes = 1.8 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha1
>      Hash value:   788a33bc41ecf5667b87ee2e264c679ed2a42e51
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading fdt from FIT Image at 40a80000 ...
>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>    Trying 'fdt@aspeed-bmc-quanta-q71l.dtb' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x40cb9690
>      Data Size:    25390 Bytes = 24.8 KiB
>      Architecture: ARM
>      Hash algo:    sha1
>      Hash value:   84ed7efe6232738984546b3ef27397ab251c3396
>    Verifying Hash Integrity ... sha1+ OK
>    Booting using the fdt blob at 0x40cb9690
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 4e9d1000, end 4eb9a8af ... OK
>    Loading Device Tree to 4e9c7000, end 4e9d032d ... OK
> 
> Starting kernel ...
> 
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] random: get_random_bytes called from start_kernel+0x3c/0x3f0
> with crng_init=0
> [    0.000000] Linux version
> 4.13.16-aca92be80c008bceeb6fb62fd1d450b5be5d0a4f (oe-user@oe-host) (gcc
> version 7.3.0 (GCC)) #10 Fri Jun 15 20:59:12 JST 2018
> [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> [    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> Total pages: 58912
> [    0.000000] Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
> [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
> bytes)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
> [    0.000000] Memory: 224832K/237568K available (5120K kernel code, 330K
> rwdata, 1276K rodata, 1024K init, 109K bss, 12736K reserved, 0K
> cma-reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0x8f800000 - 0xff800000   (1792 MB)
> .
> .
> <snip>
> .
> .
> 
> [    4.641015] Segment Routing with IPv6
> [    4.643890] ip6_tables: (C) 2000-2006 Netfilter Core Team
> [    4.648315] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    4.654435] NET: Registered protocol family 17
> [    4.657830] 8021q: 802.1Q VLAN Support v1.8
> [    4.672023] hctosys: unable to open rtc device (rtc0)
> [    4.682642] Freeing unused kernel memory: 1024K
> rofs = mtd4 squashfs rwfs = mtd5 jffs2
> mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
> [    7.296855] jffs2: notice: (453) jffs2_build_xattr_subsystem: complete
> building xattr subsystem, 53 of xdatum (40 unchecked, 13 orphan) and 189 of
> xref (8 dead, 47 orphan) foun.
> [    7.336463] overlayfs: upper fs does not support tmpfile.
> chroot: can't execute '/bin/sh': No such file or directory
> 
> Unable to confirm /sbin/init is an executable non-empty file
> in merged file system mounted at /root.
> 
> Change Root test failed!  Invoking emergency shell.
> Enter password to try to manually fix.
> After fixing run exit to continue this script, or reboot -f to retry, or
> touch /takeover and exit to become PID 1 allowing editing of this script.
> Give root password for maintenance
> (or press Control-D to continue):
> 
> 
> ... and tries to load from MTD which has been purposely erased, and thus
> complains.

Have you tried building a netboot image? I think this commit is relevant:

https://gerrit.openbmc-project.xyz/#/c/1957/

Cheers,

Andrew
