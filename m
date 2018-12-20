Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="oEOw1NuD"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ws7si2ch"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KywD0YCpzDqsD
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 15:10:19 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 550801709;
 Wed, 19 Dec 2018 23:10:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 19 Dec 2018 23:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:date:in-reply-to
 :references:content-type:mime-version:content-transfer-encoding;
 s=fm1; bh=+yCxkde0upQK/Cn4G1A1bP5ovP687C5/tvEutpbOBdg=; b=oEOw1
 NuDx/ZgnajYLXtLDrfZVtR8NOJyaU0PZCbjh1DS3sQq4LhMCudrmq4XCdef9GHEo
 x2x4O0N2HS8FFVWSnHICyp5IWOS10M2KWc+viel3+gcep6V0CVS29ANZ1q/vRPEH
 8BeGGsN7C+HkrD1naju1aqIY3D0X9eww57Ws+ZCd8DhlsPeU62n3VPJQ9Z/M0tXl
 Jdk4v2AwfWfSSJgmcouOqjjnBDzVYlrt41PMiEnG8wMIhFR5IEyaTA70LkR4kULs
 KivpLdoq2Et0eWP25emgnoNcKza2C4LyoI20ogWXGlGzzWVn5VPzluVWZl1XCU/A
 NXV1UNQzuoAkJ3YGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+yCxkde0upQK/Cn4G1A1bP5ovP687C5/tvEutpbOB
 dg=; b=ws7si2chTq/RQwa/gOnQ0ihE+d51R0vKGjd5DPWNB9bvmXPrp+39dpeqP
 /xp8K6k7njhwWFsp7u+Cj3M9iPvCOieB5BZiwfWZTw+YoPgsOK7r5EjDbjctrRhI
 WcV0PivBR1Y6n0LSyHD95fpHx3foj8KKqEmApqBPHY5/s34iBpXaXn4DfVj6bDRq
 YK5NIcgi+vjDbedI93//phf9mPA/+IOINRWxsD3PJ7s4SsTeZOlglTIYxQ4qIIJ5
 mkh2WI7jEl41G5qzmig6yqL2W7OeyPehO9BZgvhWq9/faQE86Nue9HzhR51wH6LM
 DvdQ/PiUdOFPV0/VEz2gAGRLrlgCA==
X-ME-Sender: <xms:KBYbXMUhLQHjT3HbW22KdD_waZ4ohrwUHlquvEmvCPIPnl9SEDyUsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudejvddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecufghrlhcuvffnffculdefhedmnecujfgurhepkffuhffvffgjfhgtfggggfesth
 ejredttderjeenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceo
 shgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucffohhmrghinhepohhpvghnsg
 hmtgdqphhrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecukfhppeduvddvrdel
 ledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhesmhgvnhguohiirg
 hjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KBYbXM5L1cXlN11VunO9e1FXDPLaeq7UmS05hZOAc78FLfvw24uhrg>
 <xmx:KBYbXDJk03Kva8C8r5oYzx44qMDW78AZs3Gu69bYi6lTSYdlfZzXew>
 <xmx:KBYbXNI0smLTuP2Onjiywk2csJju_FkavQlpTLI4q0QlR3m6OoEYCw>
 <xmx:KBYbXBL2p-RThOZMNcSezZ19gF6aKyZAcz9MIckrOxh8vCJwUu1xEw>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 22D58E4445;
 Wed, 19 Dec 2018 23:10:14 -0500 (EST)
Message-ID: <ad36e5feeda656601875b61888329f54c693e127.camel@mendozajonas.com>
Subject: Re: Re: NCSI eth0 (ftgmac100): transmit queue 0 timed out error
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Thu, 20 Dec 2018 15:10:11 +1100
In-Reply-To: <tencent_34AE14932D962B192FFA857F@qq.com>
References: <tencent_34AE14932D962B192FFA857F@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2018 04:10:23 -0000

On Thu, 2018-12-20 at 11:43 +0800, xiuzhi wrote:
> I patch the 0001-DO-NOT-MERGE-NCSI-state-machine-debugging.patch to debug the ncsi net from https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/6545/
> The  motherboard without the ncsi  switch worked , the log:

Ha, nice find.

> [   23.923250] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored for type 0x95
> [   23.938842] ftgmac100 1e660000.ethernet eth0: ncsi: starting config machine   
> [   23.968028] ftgmac100 1e660000.ethernet eth0: ncsi: config complete - starting monitor
> [   23.976100] ftgmac100 1e660000.ethernet eth0: ncsi: report link (false) from next channel
> The mothboard with the switch failed, the log:
> root@haiguang1:~# dmesg|grep -i net
> [    0.039194] NET: Registered protocol family 16
> [    0.211611] NET: Registered protocol family 2
> [    0.213769] NET: Registered protocol family 1
> [    2.094889] NET: Registered protocol family 38
> [    3.617315] ftgmac100 1e660000.ethernet: Generated random MAC address 9e:24:06:20:1c:bf
> [    3.625469] ftgmac100 1e660000.ethernet: Using NCSI interface
> [    3.632401] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at 39aaaa23
> [    3.639822] ftgmac100 1e680000.ethernet: Generated random MAC address 12:5a:54:09:a6:a6
> [    3.754214] Broadcom BCM54612E 1e680000.ethernet--1:00: attached PHY driver [Broadcom BCM54612E] (mii_bus:phy_addr=1e680000.ethernet--1:00)
> [    3.768773] ftgmac100 1e680000.ethernet eth1: irq 20, mapped at 7ea18756
> [    4.019980] Driver for 1-wire Dallas network protocol.
> [    4.283070] NET: Registered protocol family 10
> [    4.306534] NET: Registered protocol family 17
> [    4.326455] console [netcon0] enabled
> [    4.330138] netconsole: network logging started
> [   19.153517] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> [   20.562851] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found with link

Nothing extra appears to trip up from that extra logging, so I don't
think it's a driver issue at the moment. I'm not familiar with this
'switch' setup but we can probably check if the driver is seeing anything
at all. OpenBMC should include the 'ncsi-netlink' utility. If you run an
'info' command with that and check the logs you should be able to see if
it at least pulls out the NC version info.
Alternately I have a version for debugging available here which you can
compile and copy to the system: https://github.com/sammj/ncsi-netlink


> [   84.087503] WARNING: CPU: 0 PID: 1174 at /usr/src/kernel/net/sched/sch_generic.c:461 dev_watchdog+0x230/0x24c
> [   84.097560] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed out
> -------
> [   19.609459] aspeed-video 1e700000.video: Failed to start video engine
> [   20.562851] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found with link
> [   84.082800] ------------[ cut here ]------------
> [   84.087503] WARNING: CPU: 0 PID: 1174 at /usr/src/kernel/net/sched/sch_generic.c:461 dev_watchdog+0x230/0x24c
> [   84.097560] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed out
> [   84.104474] CPU: 0 PID: 1174 Comm: dbus-daemon Tainted: G        W         4.18.16-d822bbc00e9259c72112f0dab412625a30aaabb0 #1
> [   84.115997] Hardware name: Generic DT based system
> [   84.120874] [<80109bec>] (unwind_backtrace) from [<801075fc>] (show_stack+0x20/0x24)
> [   84.128780] [<801075fc>] (show_stack) from [<806474a8>] (dump_stack+0x20/0x28)
> [   84.136163] [<806474a8>] (dump_stack) from [<80116fac>] (__warn+0xdc/0x104)
> [   84.143267] [<80116fac>] (__warn) from [<80117028>] (warn_slowpath_fmt+0x54/0x74)
> [   84.150824] [<80117028>] (warn_slowpath_fmt) from [<8055f7c8>] (dev_watchdog+0x230/0x24c)
> [   84.159172] [<8055f7c8>] (dev_watchdog) from [<80157b38>] (call_timer_fn+0x3c/0x120)
> [   84.167087] [<80157b38>] (call_timer_fn) from [<80157ccc>] (expire_timers+0xb0/0xbc)
> [   84.174976] [<80157ccc>] (expire_timers) from [<80157dc8>] (run_timer_softirq+0xa4/0x198)
> [   84.183308] [<80157dc8>] (run_timer_softirq) from [<8010223c>] (__do_softirq+0xcc/0x2f0)
> [   84.191475] [<8010223c>] (__do_softirq) from [<8011b278>] (irq_exit+0xfc/0x110)
> [   84.198950] [<8011b278>] (irq_exit) from [<8014ba14>] (__handle_domain_irq+0x60/0xb8)
> [   84.206917] [<8014ba14>] (__handle_domain_irq) from [<80102164>] (avic_handle_irq+0x68/0x70)
> [   84.215501] [<80102164>] (avic_handle_irq) from [<80101db4>] (__irq_usr+0x54/0x80)
> [   84.223189] Exception stack(0x974e1fb0 to 0x974e1ff8)
> [   84.228291] 1fa0:                                     ffff0fff 00000020 00000019 45e210f0
> [   84.236587] 1fc0: 00000000 00000000 020789d0 45e204d0 00000020 020789c8 00000018 7e90c800
> [   84.244871] 1fe0: 45ffd210 7e90c438 45d52090 ffff0fe0 60000010 ffffffff
> [   84.251581] ---[ end trace 935ea877fd2be47d ]---
> 
> Hi Sam,
>     The eth0 works  with  same kernel code and config on the motherboard without the NCSI on-off switch to connect the host pysical network card .
> This new version motherboard only add the switch . Does this switch cause  electrical signals time delay growth?
>   The ncsi eth0 has never connect successful on the new motherboard on OpenBmc while it works on AMI BMC. I guess there is something wrong with the driver.
> Best,
> xiuzhi
> On Wed, 2018-12-19 at 15:49 +0800, xiuzhi wrote:
> > 
> > Hi all,
> >    I set the  eth0/MAC#1 of Ast2500 to NCSI mode.
> > There is a on-off switch between Ast2500 MAC#1 and host Network. 
> >  The hardware electrical signal is good and can ping to other machines on AMI BMC
> > .dts:
> >  &mac0 {
> >         status = "okay";
> >   
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&pinctrl_rgii_default>;
> >         use-ncsi;
> > };
> > 
> > demsg:
> >  [   18.204116] 8021q: adding VLAN 0 to HW filter on device eth0                                     
> > [   18.884647] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready                                  
> > [   19.391004] aspeed-video 1e700000.video: timed out on 1st mode detect                           
> > [   19.397549] aspeed-video 1e700000.video: Failed to start video engine                           
> > [   20.481030] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found with link
> 
> This likely means the Network Controller didn't respond to the NCSI
> driver's probe process. If that happens even after a power cycle then
> hopefully one of the BMC people can weigh in on how to make sure it's set
> up correctly. If it only happens intermittently then it may be related to
> the NCSI microcode.
> 
> Cheers,
> Sam
> 
> >                   
> > [   20.961742] ftgmac100 1e680000.ethernet eth1: Link is Up - 10Mbps/Half - flow control off       
> > [   20.969995] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready                             
> > [  103.120946] ------------[ cut here ]------------                                                
> > [  103.125630] WARNING: CPU: 0 PID: 1329 at /usr/src/kernel/net/sched/sch_generic.c:461 dev_watchdc
> > [  103.135678] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed out                       
> > [  103.142580] CPU: 0 PID: 1329 Comm: ipmid Tainted: G        W         4.18.16-71414b7d863e8ee6131
> > [  103.153562] Hardware name: Generic DT based system                                              
> > [  103.158432] [<80109bec>] (unwind_backtrace) from [<801075fc>] (show_stack+0x20/0x24)            
> > [  103.166310] [<801075fc>] (show_stack) from [<80646f48>] (dump_stack+0x20/0x28)                  
> > [  103.173665] [<80646f48>] (dump_stack) from [<80116fac>] (__warn+0xdc/0x104)                     
> > [  103.180662] [<80116fac>] (__warn) from [<80117028>] (warn_slowpath_fmt+0x54/0x74)               
> > [  103.188331] [<80117028>] (warn_slowpath_fmt) from [<8055f3c0>] (dev_watchdog+0x230/0x24c)       
> > [  103.196663] [<8055f3c0>] (dev_watchdog) from [<80157b38>] (call_timer_fn+0x3c/0x120)            
> > [  103.204547] [<80157b38>] (call_timer_fn) from [<80157ccc>] (expire_timers+0xb0/0xbc)            
> > [  103.212427] [<80157ccc>] (expire_timers) from [<80157dc8>] (run_timer_softirq+0xa4/0x198)       
> > [  103.220644] [<80157dc8>] (run_timer_softirq) from [<8010223c>] (__do_softirq+0xcc/0x2f0)        
> > [  103.228863] [<8010223c>] (__do_softirq) from [<8011b278>] (irq_exit+0xfc/0x110)                 
> > [  103.236334] [<8011b278>] (irq_exit) from [<8014ba14>] (__handle_domain_irq+0x60/0xb8)           
> > [  103.244311] [<8014ba14>] (__handle_domain_irq) from [<80102164>] (avic_handle_irq+0x68/0x70)    
> > [  103.252876] [<80102164>] (avic_handle_irq) from [<801019ec>] (__irq_svc+0x6c/0x90)              
> > [  103.260461] Exception stack(0x97ddf870 to 0x97ddf8b8)                                           
> > [  103.265630] f860:                                     000001b0 0063e8dc 969e0ee4 00000401       
> > [  103.273907] f880: 969e0000 00000000 00000000 00000600 fbd51971 0000008b 969e06dc 97ddf8ec       
> > [  103.282174] f8a0: 000001b0 97ddf8c0 048ecf6b 8036faac 20000013 ffffffff                         
> > [  103.288843] [<801019ec>] (__irq_svc) from [<8036faac>] (lzma_main+0x6ac/0x8e8)                  
> > [  103.296186] [<8036faac>] (lzma_main) from [<803702e0>] (xz_dec_lzma2_run+0x5f8/0x840)           
> > [  103.304139] [<803702e0>] (xz_dec_lzma2_run) from [<8036e9b8>] (xz_dec_run+0x378/0xa9c)          
> > [  103.312215] [<8036e9b8>] (xz_dec_run) from [<802a0fec>] (squashfs_xz_uncompress+0x84/0x228)     
> > [  103.320606] [<802a0fec>] (squashfs_xz_uncompress) from [<802a0f14>] (squashfs_decompress+0x68/0)
> > [  103.329774] [<802a0f14>] (squashfs_decompress) from [<8029cc00>] (squashfs_read_data+0x3d4/0x6f)
> > [  103.338754] [<8029cc00>] (squashfs_read_data) from [<8029d220>] (squashfs_cache_get+0x170/0x348)
> > [  103.347660] [<8029d220>] (squashfs_cache_get) from [<8029d7b0>] (squashfs_read_metadata+0xa4/0x)
> > [  103.356832] [<8029d7b0>] (squashfs_read_metadata) from [<8029f128>] (squashfs_read_inode+0x98/0)
> > [  103.366083] [<8029f128>] (squashfs_read_inode) from [<8029fa14>] (squashfs_iget+0x6c/0x9c)      
> > [  103.374473] [<8029fa14>] (squashfs_iget) from [<8029fd74>] (squashfs_lookup+0x330/0x484)        
> > [  103.382691] [<8029fd74>] (squashfs_lookup) from [<802362e0>] (__lookup_slow+0x94/0x150)         
> > [  103.390736] [<802362e0>] (__lookup_slow) from [<802363dc>] (lookup_slow+0x40/0x54)              
> > [  103.398425] [<802363dc>] (lookup_slow) from [<8023940c>] (lookup_one_len_unlocked+0x78/0x84)    
> > [  103.406986] [<8023940c>] (lookup_one_len_unlocked) from [<802f3eb8>] (ovl_lookup_single+0x34/0x)
> > [  103.416153] [<802f3eb8>] (ovl_lookup_single) from [<802f42a4>] (ovl_lookup_layer+0x134/0x184)   
> > [  103.424790] [<802f42a4>] (ovl_lookup_layer) from [<802f52f8>] (ovl_lookup+0x3c8/0x7bc)          
> > [  103.432823] [<802f52f8>] (ovl_lookup) from [<8023a6e4>] (path_openat+0xbac/0x10c8)              
> > [  103.440422] [<8023a6e4>] (path_openat) from [<8023ac80>] (do_filp_open+0x80/0xf0)               
> > [  103.448027] [<8023ac80>] (do_filp_open) from [<8022973c>] (do_sys_open+0x178/0x21c)             
> > [  103.455816] [<8022973c>] (do_sys_open) from [<80229828>] (sys_openat+0x1c/0x20)                 
> > [  103.463247] [<80229828>] (sys_openat) from [<80101000>] (ret_fast_syscall+0x0/0x54)             
> > [  103.471002] Exception stack(0x97ddffa8 to 0x97ddfff0)                                           
> > [  103.476136] ffa0:                   00d9b3e0 7ebaf574 ffffff9c 00dbb7c8 00080000 00000000       
> > [  103.484409] ffc0: 00d9b3e0 7ebaf574 4e451908 00000142 00000000 00000002 00000000 7ebaf52c       
> > [  103.492671] ffe0: 4e450908 7ebaf4c0 4e426e10 4e439b80                                           
> > [  103.497743] ---[ end trace 935ea877fd2be47d ]---         
> > 
> > Best,
> > Xiuzhi        
> 
>  
