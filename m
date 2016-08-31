Return-Path: <clg@kaod.org>
X-Greylist: delayed 603 seconds by postgrey-1.35 at bilbo;
 Thu, 01 Sep 2016 03:08:15 AEST
Received: from 7.mo53.mail-out.ovh.net (7.mo53.mail-out.ovh.net [46.105.61.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sPWzz1KmyzDrhc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2016 03:08:14 +1000 (AEST)
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 42BDA42557
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 18:50:33 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id CCE8F48008F;
 Wed, 31 Aug 2016 18:50:29 +0200 (CEST)
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
 <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
 <1472521481.5707.99.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7b5cc626-b936-d192-de9b-15aee5b5bd61@kaod.org>
Date: Wed, 31 Aug 2016 18:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472521481.5707.99.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 781374538037496578
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrgeelgddtheculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 17:08:16 -0000

On 08/30/2016 03:44 AM, Andrew Jeffery wrote:
> On Mon, 2016-08-22 at 17:29 +0200, Cédric Le Goater wrote:
>> On 08/09/2016 05:13 PM, Joel Stanley wrote:
>>>
>>> Hello OpenBMCers,
> 
> ...
> 
>>>   net/faraday: Avoid PHYSTS_CHG interrupt
>> I gave it a try on a palmetto and a ast2500 evb. Both boot fine but
>> the evb dmesg is full of :  
>>
>> net_ratelimit: 299522 callbacks suppressed
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>>
>> Below is a possible fix,
>> Cheers,
>>
>> C.
>>
>>
>> From: Cédric Le Goater <clg@kaod.org>
>> Subject: [PATCH] net/ftgmac100: raise PHY link sensor level
>> Date: Mon, 22 Aug 2016 16:29:02 +0200
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Commit 5f5d3d87370f ("net/faraday: Avoid PHYSTS_CHG interrupt")
>> lowered the sensivity of the PHY link by setting Bit#11 in the MAC
>> Control Register. But this seems to generate bogus PHY interrupts on
>> non NC-SI adapters :
>>
>>     net_ratelimit: 299522 callbacks suppressed
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>>     ...
>>
>> Let's lower the sensivity only for NC-SI adapters.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/net/ethernet/faraday/ftgmac100.c |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> Index: linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
>> ===================================================================
>> --- linux-openbmc-
>> 4.7.git.orig/drivers/net/ethernet/faraday/ftgmac100.c
>> +++ linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
>> @@ -215,7 +215,6 @@ static void ftgmac100_init_hw(struct ftg
>>  				 FTGMAC100_MACCR_RXMAC_EN	| \
>>  				 FTGMAC100_MACCR_FULLDUP	| \
>>  				 FTGMAC100_MACCR_CRC_APD	| \
>> -				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
>>  				 FTGMAC100_MACCR_RX_RUNT	| \
>>  				 FTGMAC100_MACCR_RX_BROADPKT)
>>  
>> @@ -223,6 +222,9 @@ static void ftgmac100_start_hw(struct ft
>>  {
>>  	int maccr = MACCR_ENABLE_ALL;
>>  
>> +	if (priv->use_ncsi)
>> +		maccr |= FTGMAC100_MACCR_PHY_LINK_LEVEL;
>> +
>>  	switch (speed) {
>>  	default:
>>  	case 10:
>>
> 
> I gave this change a spin and found that the interrupt storm returned
> out of the blue after a period of time. 

Same for me and I am not doing anything funky like you are. I need to
bisect I guess.

Thanks,

C. 

> The patch didn't apply cleanly
> to my tree and I manually made the change, so there's scope for PEBKAC.
>  Also, I was testing MAC2 on the EVB, disabling MAC1 in the devicetree
> and also muxing in MDIO2 so MAC2 had something to work with. So, lots
> of bad sience, but here's the full boot log:
> 
> U-Boot 2016.05-00095-gd347555e6ee8 (Jun 23 2016 - 14:48:50 +0930)
> 
> DRAM:  496 MiB
> Flash: 32 MiB
> In:    serial
> Out:   serial
> Err:   serial
> Net:   MAC0 : RGMII
> MAC1 : RGMII
> FTGMAC100#0, FTGMAC100#1
> Hit any key to stop autoboot:  0
> ast# dhcp
> FTGMAC100#0: Starting autonegotiation...
> FTGMAC100#0: Autonegotiation timed out (status=0x7949)
> FTGMAC100#0: link down
> FTGMAC100#1: no PHY present
> BOOTP broadcast 1
> DHCP client bound to address 10.104.0.178 (3 ms)
> Using FTGMAC100#1 device
> TFTP from server 10.104.0.15; our IP address is 10.104.0.178
> Filename 'uImage.ast2500evb'.
> Load address: 0x83000000
> Loading: #################################################################
>          ##########################################
>          112.3 KiB/s
> done
> Bytes transferred = 1569521 (17f2f1 hex)
> ast# tftp 0x84000000 misc.rootfs.cpio
> FTGMAC100#1: no PHY present
> Using FTGMAC100#1 device
> TFTP from server 10.104.0.15; our IP address is 10.104.0.178
> Filename 'misc.rootfs.cpio'.
> Load address: 0x84000000
> Loading: #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          ###############################################################
>          134.8 KiB/s
> done
> Bytes transferred = 14278144 (d9de00 hex)
> ast# bootm 0x83000000 0x84000000
> ## Booting kernel from Legacy Image at 83000000 ...
>    Image Name:   v4.8-rc2-115-g454e3b36a4e9-dirty
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1569457 Bytes = 1.5 MiB
>    Load Address: 80001000
>    Entry Point:  80001000
>    Verifying Checksum ... OK
> Wrong Ramdisk Image Format
> Ramdisk image is corrupt or invalid
> ast# tftp 0x84000000 misc.rootfs.cpio.u-boot
> FTGMAC100#1: no PHY present
> Using FTGMAC100#1 device
> TFTP from server 10.104.0.15; our IP address is 10.104.0.178
> Filename 'misc.rootfs.cpio.u-boot'.
> Load address: 0x84000000
> Loading: #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          ###############################################################
>          181.6 KiB/s
> done
> Bytes transferred = 14278208 (d9de40 hex)
> ast# bootm 0x83000000 0x84000000
> ## Booting kernel from Legacy Image at 83000000 ...
>    Image Name:   v4.8-rc2-115-g454e3b36a4e9-dirty
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    1569457 Bytes = 1.5 MiB
>    Load Address: 80001000
>    Entry Point:  80001000
>    Verifying Checksum ... OK
> ## Loading init Ramdisk from Legacy Image at 84000000 ...
>    Image Name:   buildroot userspace
>    Image Type:   ARM Linux RAMDisk Image (uncompressed)
>    Data Size:    14278144 Bytes = 13.6 MiB
>    Load Address: 81000000
>    Entry Point:  81000000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.8.0-rc2-00115-g454e3b36a4e9-dirty (andrew@keelia) (gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.1) ) #606 Tue Aug 30 10:07:10 ACST 2016
> [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
> [    0.000000] OF: fdt:Machine model: AST2500 EVB
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] SOC Rev: 04010303
> [    0.000000] On node 0 totalpages: 126976
> [    0.000000] free_area_init_node: node 0, pgdat 80720c6c, node_mem_map 9ec19000
> [    0.000000]   Normal zone: 992 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 126976 pages, LIFO batch:31
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 125984
> [    0.000000] Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw earlyprintk debug
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Memory: 477456K/507904K available (3072K kernel code, 150K rwdata, 980K rodata, 1024K init, 5685K bss, 30448K reserved, 0K cma-reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0x9f800000 - 0xff800000   (1536 MB)
> [    0.000000]     lowmem  : 0x80000000 - 0x9f000000   ( 496 MB)
> [    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
> [    0.000000]       .text : 0x80008000 - 0x80400000   (4064 kB)
> [    0.000000]       .init : 0x80600000 - 0x80700000   (1024 kB)
> [    0.000000]       .data : 0x80700000 - 0x807258e8   ( 151 kB)
> [    0.000000]        .bss : 0x807258e8 - 0x80cb2e90   (5686 kB)
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] clocksource: moxart_timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
> [    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
> [    0.010000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    0.020000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.020000] ... MAX_LOCK_DEPTH:          48
> [    0.020000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.030000] ... CLASSHASH_SIZE:          4096
> [    0.030000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.040000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.040000] ... CHAINHASH_SIZE:          32768
> [    0.050000]  memory used by lock dependency info: 5151 kB
> [    0.060000]  per task-struct memory footprint: 1536 bytes
> [    0.070000] Calibrating delay loop... 783.97 BogoMIPS (lpj=3919872)
> [    0.110000] pid_max: default: 32768 minimum: 301
> [    0.110000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.120000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.140000] CPU: Testing write buffer coherency: ok
> [    0.150000] Setting up static identity map for 0x80100000 - 0x8010005c
> [    0.170000] devtmpfs: initialized
> [    0.290000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.310000] pinctrl core: initialized pinctrl subsystem
> [    0.320000] NET: Registered protocol family 16
> [    0.330000] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.360000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: try to register 228 pins ...
> [    0.370000] pinctrl core: registered pin 0 (B14) on aspeed-g5-pinctrl
> [    0.370000] pinctrl core: registered pin 1 (PIN1) on aspeed-g5-pinctrl
> [    0.380000] pinctrl core: registered pin 2 (PIN2) on aspeed-g5-pinctrl
> [    0.390000] pinctrl core: registered pin 3 (E13) on aspeed-g5-pinctrl
> [    0.400000] pinctrl core: registered pin 4 (C14) on aspeed-g5-pinctrl
> [    0.400000] pinctrl core: registered pin 5 (A13) on aspeed-g5-pinctrl
> [    0.410000] pinctrl core: registered pin 6 (C13) on aspeed-g5-pinctrl
> [    0.420000] pinctrl core: registered pin 7 (B13) on aspeed-g5-pinctrl
> [    0.430000] pinctrl core: registered pin 8 (PIN8) on aspeed-g5-pinctrl
> [    0.430000] pinctrl core: registered pin 9 (PIN9) on aspeed-g5-pinctrl
> [    0.440000] pinctrl core: registered pin 10 (PIN10) on aspeed-g5-pinctrl
> [    0.450000] pinctrl core: registered pin 11 (PIN11) on aspeed-g5-pinctrl
> [    0.460000] pinctrl core: registered pin 12 (PIN12) on aspeed-g5-pinctrl
> [    0.460000] pinctrl core: registered pin 13 (PIN13) on aspeed-g5-pinctrl
> [    0.470000] pinctrl core: registered pin 14 (PIN14) on aspeed-g5-pinctrl
> [    0.480000] pinctrl core: registered pin 15 (H20) on aspeed-g5-pinctrl
> [    0.490000] pinctrl core: registered pin 16 (C12) on aspeed-g5-pinctrl
> [    0.490000] pinctrl core: registered pin 17 (A12) on aspeed-g5-pinctrl
> [    0.500000] pinctrl core: registered pin 18 (B12) on aspeed-g5-pinctrl
> [    0.510000] pinctrl core: registered pin 19 (D9) on aspeed-g5-pinctrl
> [    0.520000] pinctrl core: registered pin 20 (D10) on aspeed-g5-pinctrl
> [    0.520000] pinctrl core: registered pin 21 (E12) on aspeed-g5-pinctrl
> [    0.530000] pinctrl core: registered pin 22 (C11) on aspeed-g5-pinctrl
> [    0.540000] pinctrl core: registered pin 23 (B11) on aspeed-g5-pinctrl
> [    0.550000] pinctrl core: registered pin 24 (F19) on aspeed-g5-pinctrl
> [    0.550000] pinctrl core: registered pin 25 (E21) on aspeed-g5-pinctrl
> [    0.560000] pinctrl core: registered pin 26 (D20) on aspeed-g5-pinctrl
> [    0.570000] pinctrl core: registered pin 27 (D21) on aspeed-g5-pinctrl
> [    0.580000] pinctrl core: registered pin 28 (PIN28) on aspeed-g5-pinctrl
> [    0.580000] pinctrl core: registered pin 29 (PIN29) on aspeed-g5-pinctrl
> [    0.590000] pinctrl core: registered pin 30 (PIN30) on aspeed-g5-pinctrl
> [    0.600000] pinctrl core: registered pin 31 (PIN31) on aspeed-g5-pinctrl
> [    0.610000] pinctrl core: registered pin 32 (B20) on aspeed-g5-pinctrl
> [    0.610000] pinctrl core: registered pin 33 (C20) on aspeed-g5-pinctrl
> [    0.620000] pinctrl core: registered pin 34 (PIN34) on aspeed-g5-pinctrl
> [    0.630000] pinctrl core: registered pin 35 (PIN35) on aspeed-g5-pinctrl
> [    0.640000] pinctrl core: registered pin 36 (PIN36) on aspeed-g5-pinctrl
> [    0.640000] pinctrl core: registered pin 37 (PIN37) on aspeed-g5-pinctrl
> [    0.650000] pinctrl core: registered pin 38 (PIN38) on aspeed-g5-pinctrl
> [    0.660000] pinctrl core: registered pin 39 (PIN39) on aspeed-g5-pinctrl
> [    0.670000] pinctrl core: registered pin 40 (PIN40) on aspeed-g5-pinctrl
> [    0.670000] pinctrl core: registered pin 41 (PIN41) on aspeed-g5-pinctrl
> [    0.680000] pinctrl core: registered pin 42 (PIN42) on aspeed-g5-pinctrl
> [    0.690000] pinctrl core: registered pin 43 (PIN43) on aspeed-g5-pinctrl
> [    0.700000] pinctrl core: registered pin 44 (PIN44) on aspeed-g5-pinctrl
> [    0.700000] pinctrl core: registered pin 45 (PIN45) on aspeed-g5-pinctrl
> [    0.710000] pinctrl core: registered pin 46 (PIN46) on aspeed-g5-pinctrl
> [    0.720000] pinctrl core: registered pin 47 (PIN47) on aspeed-g5-pinctrl
> [    0.730000] pinctrl core: registered pin 48 (PIN48) on aspeed-g5-pinctrl
> [    0.740000] pinctrl core: registered pin 49 (PIN49) on aspeed-g5-pinctrl
> [    0.740000] pinctrl core: registered pin 50 (PIN50) on aspeed-g5-pinctrl
> [    0.750000] pinctrl core: registered pin 51 (PIN51) on aspeed-g5-pinctrl
> [    0.760000] pinctrl core: registered pin 52 (PIN52) on aspeed-g5-pinctrl
> [    0.770000] pinctrl core: registered pin 53 (PIN53) on aspeed-g5-pinctrl
> [    0.770000] pinctrl core: registered pin 54 (PIN54) on aspeed-g5-pinctrl
> [    0.780000] pinctrl core: registered pin 55 (PIN55) on aspeed-g5-pinctrl
> [    0.790000] pinctrl core: registered pin 56 (PIN56) on aspeed-g5-pinctrl
> [    0.800000] pinctrl core: registered pin 57 (PIN57) on aspeed-g5-pinctrl
> [    0.800000] pinctrl core: registered pin 58 (PIN58) on aspeed-g5-pinctrl
> [    0.810000] pinctrl core: registered pin 59 (PIN59) on aspeed-g5-pinctrl
> [    0.820000] pinctrl core: registered pin 60 (PIN60) on aspeed-g5-pinctrl
> [    0.830000] pinctrl core: registered pin 61 (PIN61) on aspeed-g5-pinctrl
> [    0.830000] pinctrl core: registered pin 62 (PIN62) on aspeed-g5-pinctrl
> [    0.840000] pinctrl core: registered pin 63 (PIN63) on aspeed-g5-pinctrl
> [    0.850000] pinctrl core: registered pin 64 (C18) on aspeed-g5-pinctrl
> [    0.860000] pinctrl core: registered pin 65 (E15) on aspeed-g5-pinctrl
> [    0.860000] pinctrl core: registered pin 66 (A14) on aspeed-g5-pinctrl
> [    0.870000] pinctrl core: registered pin 67 (C16) on aspeed-g5-pinctrl
> [    0.880000] pinctrl core: registered pin 68 (PIN68) on aspeed-g5-pinctrl
> [    0.890000] pinctrl core: registered pin 69 (PIN69) on aspeed-g5-pinctrl
> [    0.890000] pinctrl core: registered pin 70 (PIN70) on aspeed-g5-pinctrl
> [    0.900000] pinctrl core: registered pin 71 (PIN71) on aspeed-g5-pinctrl
> [    0.910000] pinctrl core: registered pin 72 (PIN72) on aspeed-g5-pinctrl
> [    0.920000] pinctrl core: registered pin 73 (L2) on aspeed-g5-pinctrl
> [    0.930000] pinctrl core: registered pin 74 (N3) on aspeed-g5-pinctrl
> [    0.930000] pinctrl core: registered pin 75 (N4) on aspeed-g5-pinctrl
> [    0.940000] pinctrl core: registered pin 76 (PIN76) on aspeed-g5-pinctrl
> [    0.950000] pinctrl core: registered pin 77 (PIN77) on aspeed-g5-pinctrl
> [    0.960000] pinctrl core: registered pin 78 (PIN78) on aspeed-g5-pinctrl
> [    0.960000] pinctrl core: registered pin 79 (PIN79) on aspeed-g5-pinctrl
> [    0.970000] pinctrl core: registered pin 80 (L3) on aspeed-g5-pinctrl
> [    0.980000] pinctrl core: registered pin 81 (L4) on aspeed-g5-pinctrl
> [    0.980000] pinctrl core: registered pin 82 (L1) on aspeed-g5-pinctrl
> [    0.990000] pinctrl core: registered pin 83 (N2) on aspeed-g5-pinctrl
> [    1.000000] pinctrl core: registered pin 84 (N1) on aspeed-g5-pinctrl
> [    1.010000] pinctrl core: registered pin 85 (P1) on aspeed-g5-pinctrl
> [    1.010000] pinctrl core: registered pin 86 (P2) on aspeed-g5-pinctrl
> [    1.020000] pinctrl core: registered pin 87 (R1) on aspeed-g5-pinctrl
> [    1.030000] pinctrl core: registered pin 88 (PIN88) on aspeed-g5-pinctrl
> [    1.040000] pinctrl core: registered pin 89 (PIN89) on aspeed-g5-pinctrl
> [    1.040000] pinctrl core: registered pin 90 (PIN90) on aspeed-g5-pinctrl
> [    1.050000] pinctrl core: registered pin 91 (PIN91) on aspeed-g5-pinctrl
> [    1.060000] pinctrl core: registered pin 92 (PIN92) on aspeed-g5-pinctrl
> [    1.070000] pinctrl core: registered pin 93 (PIN93) on aspeed-g5-pinctrl
> [    1.070000] pinctrl core: registered pin 94 (PIN94) on aspeed-g5-pinctrl
> [    1.080000] pinctrl core: registered pin 95 (PIN95) on aspeed-g5-pinctrl
> [    1.090000] pinctrl core: registered pin 96 (PIN96) on aspeed-g5-pinctrl
> [    1.100000] pinctrl core: registered pin 97 (PIN97) on aspeed-g5-pinctrl
> [    1.110000] pinctrl core: registered pin 98 (PIN98) on aspeed-g5-pinctrl
> [    1.110000] pinctrl core: registered pin 99 (PIN99) on aspeed-g5-pinctrl
> [    1.120000] pinctrl core: registered pin 100 (PIN100) on aspeed-g5-pinctrl
> [    1.130000] pinctrl core: registered pin 101 (PIN101) on aspeed-g5-pinctrl
> [    1.140000] pinctrl core: registered pin 102 (PIN102) on aspeed-g5-pinctrl
> [    1.140000] pinctrl core: registered pin 103 (PIN103) on aspeed-g5-pinctrl
> [    1.150000] pinctrl core: registered pin 104 (V2) on aspeed-g5-pinctrl
> [    1.160000] pinctrl core: registered pin 105 (W2) on aspeed-g5-pinctrl
> [    1.170000] pinctrl core: registered pin 106 (V3) on aspeed-g5-pinctrl
> [    1.170000] pinctrl core: registered pin 107 (U3) on aspeed-g5-pinctrl
> [    1.180000] pinctrl core: registered pin 108 (W3) on aspeed-g5-pinctrl
> [    1.190000] pinctrl core: registered pin 109 (AA3) on aspeed-g5-pinctrl
> [    1.200000] pinctrl core: registered pin 110 (Y3) on aspeed-g5-pinctrl
> [    1.200000] pinctrl core: registered pin 111 (T4) on aspeed-g5-pinctrl
> [    1.210000] pinctrl core: registered pin 112 (PIN112) on aspeed-g5-pinctrl
> [    1.220000] pinctrl core: registered pin 113 (PIN113) on aspeed-g5-pinctrl
> [    1.230000] pinctrl core: registered pin 114 (PIN114) on aspeed-g5-pinctrl
> [    1.230000] pinctrl core: registered pin 115 (PIN115) on aspeed-g5-pinctrl
> [    1.240000] pinctrl core: registered pin 116 (PIN116) on aspeed-g5-pinctrl
> [    1.250000] pinctrl core: registered pin 117 (PIN117) on aspeed-g5-pinctrl
> [    1.260000] pinctrl core: registered pin 118 (PIN118) on aspeed-g5-pinctrl
> [    1.270000] pinctrl core: registered pin 119 (PIN119) on aspeed-g5-pinctrl
> [    1.270000] pinctrl core: registered pin 120 (PIN120) on aspeed-g5-pinctrl
> [    1.280000] pinctrl core: registered pin 121 (PIN121) on aspeed-g5-pinctrl
> [    1.290000] pinctrl core: registered pin 122 (PIN122) on aspeed-g5-pinctrl
> [    1.300000] pinctrl core: registered pin 123 (PIN123) on aspeed-g5-pinctrl
> [    1.310000] pinctrl core: registered pin 124 (PIN124) on aspeed-g5-pinctrl
> [    1.310000] pinctrl core: registered pin 125 (PIN125) on aspeed-g5-pinctrl
> [    1.320000] pinctrl core: registered pin 126 (PIN126) on aspeed-g5-pinctrl
> [    1.330000] pinctrl core: registered pin 127 (V6) on aspeed-g5-pinctrl
> [    1.340000] pinctrl core: registered pin 128 (A11) on aspeed-g5-pinctrl
> [    1.340000] pinctrl core: registered pin 129 (A10) on aspeed-g5-pinctrl
> [    1.350000] pinctrl core: registered pin 130 (A9) on aspeed-g5-pinctrl
> [    1.360000] pinctrl core: registered pin 131 (B9) on aspeed-g5-pinctrl
> [    1.370000] pinctrl core: registered pin 132 (N21) on aspeed-g5-pinctrl
> [    1.370000] pinctrl core: registered pin 133 (N22) on aspeed-g5-pinctrl
> [    1.380000] pinctrl core: registered pin 134 (B10) on aspeed-g5-pinctrl
> [    1.390000] pinctrl core: registered pin 135 (N20) on aspeed-g5-pinctrl
> [    1.400000] pinctrl core: registered pin 136 (PIN136) on aspeed-g5-pinctrl
> [    1.400000] pinctrl core: registered pin 137 (PIN137) on aspeed-g5-pinctrl
> [    1.410000] pinctrl core: registered pin 138 (PIN138) on aspeed-g5-pinctrl
> [    1.420000] pinctrl core: registered pin 139 (PIN139) on aspeed-g5-pinctrl
> [    1.430000] pinctrl core: registered pin 140 (PIN140) on aspeed-g5-pinctrl
> [    1.430000] pinctrl core: registered pin 141 (PIN141) on aspeed-g5-pinctrl
> [    1.440000] pinctrl core: registered pin 142 (D8) on aspeed-g5-pinctrl
> [    1.450000] pinctrl core: registered pin 143 (E10) on aspeed-g5-pinctrl
> [    1.460000] pinctrl core: registered pin 144 (PIN144) on aspeed-g5-pinctrl
> [    1.470000] pinctrl core: registered pin 145 (PIN145) on aspeed-g5-pinctrl
> [    1.470000] pinctrl core: registered pin 146 (PIN146) on aspeed-g5-pinctrl
> [    1.480000] pinctrl core: registered pin 147 (PIN147) on aspeed-g5-pinctrl
> [    1.490000] pinctrl core: registered pin 148 (PIN148) on aspeed-g5-pinctrl
> [    1.500000] pinctrl core: registered pin 149 (PIN149) on aspeed-g5-pinctrl
> [    1.500000] pinctrl core: registered pin 150 (PIN150) on aspeed-g5-pinctrl
> [    1.510000] pinctrl core: registered pin 151 (PIN151) on aspeed-g5-pinctrl
> [    1.520000] pinctrl core: registered pin 152 (B5) on aspeed-g5-pinctrl
> [    1.530000] pinctrl core: registered pin 153 (E9) on aspeed-g5-pinctrl
> [    1.540000] pinctrl core: registered pin 154 (F9) on aspeed-g5-pinctrl
> [    1.540000] pinctrl core: registered pin 155 (A5) on aspeed-g5-pinctrl
> [    1.550000] pinctrl core: registered pin 156 (E7) on aspeed-g5-pinctrl
> [    1.560000] pinctrl core: registered pin 157 (D7) on aspeed-g5-pinctrl
> [    1.560000] pinctrl core: registered pin 158 (B2) on aspeed-g5-pinctrl
> [    1.570000] pinctrl core: registered pin 159 (B1) on aspeed-g5-pinctrl
> [    1.580000] pinctrl core: registered pin 160 (A2) on aspeed-g5-pinctrl
> [    1.590000] pinctrl core: registered pin 161 (B3) on aspeed-g5-pinctrl
> [    1.590000] pinctrl core: registered pin 162 (D5) on aspeed-g5-pinctrl
> [    1.600000] pinctrl core: registered pin 163 (D4) on aspeed-g5-pinctrl
> [    1.610000] pinctrl core: registered pin 164 (B4) on aspeed-g5-pinctrl
> [    1.620000] pinctrl core: registered pin 165 (A4) on aspeed-g5-pinctrl
> [    1.620000] pinctrl core: registered pin 166 (A3) on aspeed-g5-pinctrl
> [    1.630000] pinctrl core: registered pin 167 (D6) on aspeed-g5-pinctrl
> [    1.640000] pinctrl core: registered pin 168 (C5) on aspeed-g5-pinctrl
> [    1.650000] pinctrl core: registered pin 169 (C4) on aspeed-g5-pinctrl
> [    1.650000] pinctrl core: registered pin 170 (C2) on aspeed-g5-pinctrl
> [    1.660000] pinctrl core: registered pin 171 (C1) on aspeed-g5-pinctrl
> [    1.670000] pinctrl core: registered pin 172 (C3) on aspeed-g5-pinctrl
> [    1.680000] pinctrl core: registered pin 173 (D1) on aspeed-g5-pinctrl
> [    1.680000] pinctrl core: registered pin 174 (D2) on aspeed-g5-pinctrl
> [    1.690000] pinctrl core: registered pin 175 (E6) on aspeed-g5-pinctrl
> [    1.700000] pinctrl core: registered pin 176 (PIN176) on aspeed-g5-pinctrl
> [    1.710000] pinctrl core: registered pin 177 (PIN177) on aspeed-g5-pinctrl
> [    1.710000] pinctrl core: registered pin 178 (PIN178) on aspeed-g5-pinctrl
> [    1.720000] pinctrl core: registered pin 179 (PIN179) on aspeed-g5-pinctrl
> [    1.730000] pinctrl core: registered pin 180 (PIN180) on aspeed-g5-pinctrl
> [    1.740000] pinctrl core: registered pin 181 (PIN181) on aspeed-g5-pinctrl
> [    1.740000] pinctrl core: registered pin 182 (PIN182) on aspeed-g5-pinctrl
> [    1.750000] pinctrl core: registered pin 183 (PIN183) on aspeed-g5-pinctrl
> [    1.760000] pinctrl core: registered pin 184 (PIN184) on aspeed-g5-pinctrl
> [    1.770000] pinctrl core: registered pin 185 (PIN185) on aspeed-g5-pinctrl
> [    1.780000] pinctrl core: registered pin 186 (PIN186) on aspeed-g5-pinctrl
> [    1.780000] pinctrl core: registered pin 187 (PIN187) on aspeed-g5-pinctrl
> [    1.790000] pinctrl core: registered pin 188 (PIN188) on aspeed-g5-pinctrl
> [    1.800000] pinctrl core: registered pin 189 (PIN189) on aspeed-g5-pinctrl
> [    1.810000] pinctrl core: registered pin 190 (PIN190) on aspeed-g5-pinctrl
> [    1.820000] pinctrl core: registered pin 191 (PIN191) on aspeed-g5-pinctrl
> [    1.820000] pinctrl core: registered pin 192 (PIN192) on aspeed-g5-pinctrl
> [    1.830000] pinctrl core: registered pin 193 (PIN193) on aspeed-g5-pinctrl
> [    1.840000] pinctrl core: registered pin 194 (PIN194) on aspeed-g5-pinctrl
> [    1.850000] pinctrl core: registered pin 195 (PIN195) on aspeed-g5-pinctrl
> [    1.850000] pinctrl core: registered pin 196 (PIN196) on aspeed-g5-pinctrl
> [    1.860000] pinctrl core: registered pin 197 (PIN197) on aspeed-g5-pinctrl
> [    1.870000] pinctrl core: registered pin 198 (PIN198) on aspeed-g5-pinctrl
> [    1.880000] pinctrl core: registered pin 199 (PIN199) on aspeed-g5-pinctrl
> [    1.890000] pinctrl core: registered pin 200 (PIN200) on aspeed-g5-pinctrl
> [    1.890000] pinctrl core: registered pin 201 (PIN201) on aspeed-g5-pinctrl
> [    1.900000] pinctrl core: registered pin 202 (PIN202) on aspeed-g5-pinctrl
> [    1.910000] pinctrl core: registered pin 203 (PIN203) on aspeed-g5-pinctrl
> [    1.920000] pinctrl core: registered pin 204 (PIN204) on aspeed-g5-pinctrl
> [    1.930000] pinctrl core: registered pin 205 (PIN205) on aspeed-g5-pinctrl
> [    1.930000] pinctrl core: registered pin 206 (PIN206) on aspeed-g5-pinctrl
> [    1.940000] pinctrl core: registered pin 207 (PIN207) on aspeed-g5-pinctrl
> [    1.950000] pinctrl core: registered pin 208 (PIN208) on aspeed-g5-pinctrl
> [    1.960000] pinctrl core: registered pin 209 (PIN209) on aspeed-g5-pinctrl
> [    1.960000] pinctrl core: registered pin 210 (PIN210) on aspeed-g5-pinctrl
> [    1.970000] pinctrl core: registered pin 211 (PIN211) on aspeed-g5-pinctrl
> [    1.980000] pinctrl core: registered pin 212 (PIN212) on aspeed-g5-pinctrl
> [    1.990000] pinctrl core: registered pin 213 (PIN213) on aspeed-g5-pinctrl
> [    2.000000] pinctrl core: registered pin 214 (PIN214) on aspeed-g5-pinctrl
> [    2.000000] pinctrl core: registered pin 215 (PIN215) on aspeed-g5-pinctrl
> [    2.010000] pinctrl core: registered pin 216 (PIN216) on aspeed-g5-pinctrl
> [    2.020000] pinctrl core: registered pin 217 (PIN217) on aspeed-g5-pinctrl
> [    2.030000] pinctrl core: registered pin 218 (PIN218) on aspeed-g5-pinctrl
> [    2.030000] pinctrl core: registered pin 219 (PIN219) on aspeed-g5-pinctrl
> [    2.040000] pinctrl core: registered pin 220 (PIN220) on aspeed-g5-pinctrl
> [    2.050000] pinctrl core: registered pin 221 (PIN221) on aspeed-g5-pinctrl
> [    2.060000] pinctrl core: registered pin 222 (PIN222) on aspeed-g5-pinctrl
> [    2.070000] pinctrl core: registered pin 223 (PIN223) on aspeed-g5-pinctrl
> [    2.070000] pinctrl core: registered pin 224 (PIN224) on aspeed-g5-pinctrl
> [    2.080000] pinctrl core: registered pin 225 (PIN225) on aspeed-g5-pinctrl
> [    2.090000] pinctrl core: registered pin 226 (PIN226) on aspeed-g5-pinctrl
> [    2.100000] pinctrl core: registered pin 227 (PIN227) on aspeed-g5-pinctrl
> [    2.310000] clocksource: Switched to clocksource moxart_timer
> [    2.350000] NET: Registered protocol family 2
> [    2.350000] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
> [    2.350000] TCP bind hash table entries: 4096 (order: 5, 147456 bytes)
> [    2.380000] TCP: Hash tables configured (established 4096 bind 4096)
> [    2.380000] UDP hash table entries: 256 (order: 2, 20480 bytes)
> [    2.380000] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
> [    2.380000] NET: Registered protocol family 1
> [    2.380000] Trying to unpack rootfs image as initramfs...
> [    2.940000] Freeing initrd memory: 13944K (81000000 - 81d9e000)
> [    2.940000] alarmtimer alarmtimer: no of_node; not parsing pinctrl DT
> [    2.940000] futex hash table entries: 256 (order: 1, 11264 bytes)
> [    3.040000] workingset: timestamp_bits=30 max_order=17 bucket_order=0
> [    3.040000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    3.040000] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
> [    3.040000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
> [    3.040000] io scheduler noop registered
> [    3.040000] io scheduler deadline registered
> [    3.040000] io scheduler cfq registered (default)
> [    3.140000] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
> [    3.140000] serial8250 serial8250: no of_node; not parsing pinctrl DT
> [    3.140000] console [ttyS4] disabled
> [    3.140000] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 20, base_baud = 1500000) is a 16550A
> [    3.140000] console [ttyS4] enabled
> [    3.140000] console [ttyS4] enabled
> [    3.140000] bootconsole [earlycon0] disabled
> [    3.140000] bootconsole [earlycon0] disabled
> [    3.490000] brd: module loaded
> [    3.490000] bt-host 1e789140.ibt: Found bt host device
> [    3.490000] bt-host 1e789140.ibt: Using IRQ 19
> [    3.490000] platform 1e620000.fmc:flash@0: mx25l25635e (32768 Kbytes)
> [    3.490000] 6 ofpart partitions found on MTD device bmc
> [    3.490000] Creating 6 MTD partitions on "bmc":
> [    3.490000] 0x000000000000-0x000000060000 : "u-boot"
> [    3.490000] 0x000000060000-0x000000080000 : "u-boot-env"
> [    3.620000] 0x000000080000-0x000000300000 : "kernel"
> [    3.620000] 0x000000300000-0x0000004c0000 : "initramfs"
> [    3.620000] 0x0000004c0000-0x000001c00000 : "rofs"
> [    3.620000] 0x000001c00000-0x000002000000 : "rwfs"
> [    3.750000] libphy: Fixed MDIO Bus: probed
> [    3.750000] pinctrl core: add 1 pinctrl maps
> [    3.750000] pinctrl core: add 1 pinctrl maps
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: found group selector 29 for RGMII2
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: found group selector 17 for MDIO2
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 158 (B2) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 159 (B1) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 160 (A2) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 161 (B3) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 162 (D5) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 163 (D4) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 170 (C2) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 171 (C1) for 1e680000.ethernet
> [    3.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 172 (C3) for 1e680000.ethernet
> [    3.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 173 (D1) for 1e680000.ethernet
> [    3.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 174 (D2) for 1e680000.ethernet
> [    3.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 175 (E6) for 1e680000.ethernet
> [    3.890000] SCUa0[0x00000040]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCU48[0x40000000]=0x0, got 0x0 from 0x80082208
> [    3.890000] SCUa0[0x00000080]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00000100]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00000200]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00000400]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00000800]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00040000]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00080000]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00100000]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    3.890000] SCUa0[0x00200000]=0x0, got 0x0 from 0x00000000
> [    3.890000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    4.040000] SCUa0[0x00400000]=0x0, got 0x0 from 0x00000000
> [    4.040000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    4.040000] SCUa0[0x00800000]=0x0, got 0x0 from 0x00000000
> [    4.040000] SCU70[0x00000080]=0x1, got 0x1 from 0x7100c2e6
> [    4.040000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 6 (C13) for 1e680000.ethernet
> [    4.040000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 7 (B13) for 1e680000.ethernet
> [    4.040000] SCU90[0x00000004]=0x1, got 0x1 from 0x00220044
> [    4.040000] SCU90[0x00000040]=0x0, got 0x1 from 0x00220044
> [    4.040000] SCU90[0x00000004]=0x1, got 0x1 from 0x00220004
> [    4.040000] SCU90[0x00000040]=0x0, got 0x0 from 0x00220004
> [    4.040000] SCU90[0x00000004]=0x1, got 0x1 from 0x00220004
> [    4.040000] SCU90[0x00000040]=0x0, got 0x0 from 0x00220004
> [    4.040000] ftgmac100 1e680000.ethernet: Read MAC address 00:c0:a8:12:34:56 from chip
> [    4.040000] RTL8211E Gigabit Ethernet 1e680000.etherne:00: no of_node; not parsing pinctrl DT
> [    4.040000] RTL8211E Gigabit Ethernet 1e680000.etherne:01: no of_node; not parsing pinctrl DT
> [    4.200000] libphy: ftgmac100_mdio: probed
> [    4.200000] ftgmac100 1e680000.ethernet eth0: irq 17, mapped at f0080000
> [    4.200000] i2c /dev entries driver
> [    4.200000] i2c_aspeed 1e78a000.i2c: i2c controller registered, irq 21
> [    4.200000] pinctrl core: add 1 pinctrl maps
> [    4.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: found group selector 9 for I2C4
> [    4.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 130 (A9) for i2c-3
> [    4.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 131 (B9) for i2c-3
> [    4.200000] SCU90[0x00020000]=0x1, got 0x1 from 0x00220004
> [    4.200000] SCU90[0x00020000]=0x1, got 0x1 from 0x00220004
> [    4.200000] dummy 3-0051: no of_node; not parsing pinctrl DT
> [    4.200000] dummy 3-0052: no of_node; not parsing pinctrl DT
> [    4.200000] dummy 3-0053: no of_node; not parsing pinctrl DT
> [    4.200000] at24 3-0050: 1024 byte 24c08 EEPROM, writable, 16 bytes/write
> [    4.200000] i2c_aspeed i2c-3: i2c bus 3 registered, irq 217
> [    4.200000] pinctrl core: add 1 pinctrl maps
> [    4.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: found group selector 13 for I2C8
> [    4.370000] random: fast init done
> [    4.370000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 86 (P2) for i2c-7
> [    4.370000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request pin 87 (R1) for i2c-7
> [    4.370000] SCU90[0x00200000]=0x1, got 0x1 from 0x00220004
> [    4.370000] SCU90[0x00200000]=0x1, got 0x1 from 0x00220004
> [    4.370000] i2c_aspeed i2c-7: i2c bus 7 registered, irq 221
> [    4.430000] lm75 7-004d: hwmon0: sensor 'lm75'
> [    4.450000] NET: Registered protocol family 10
> [    4.470000] NET: Registered protocol family 17
> [    4.490000] kmemleak: Kernel memory leak detector initialized
> [    4.490000] kmemleak: Automatic memory scanning thread started
> [    4.490000] hctosys: unable to open rtc device (rtc0)
> [    4.520000] Freeing unused kernel memory: 1024K (80600000 - 80700000)
> Starting logging: OK
> Initializing random number generator... done.
> Starting network...
> [    5.330000] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> udhcpc (v1.24.1) started
> Sending discover...
> [    7.440000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> Sending discover...
> Sending select for 10.104.0.185...
> Lease of 10.104.0.185 obtained, lease time 86400
> deleting routers
> adding dns 192.231.203.132
> adding dns 210.5.35.1
> ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
> Starting sshd: OK
> 
> Welcome to Buildroot
> buildroot login: root
> # ping 8.8.8.8
> PING 8.8.8.8 (8.8.8.8): 56 data bytes
> 64 bytes from 8.8.8.8: seq=0 ttl=59 time=23.192 ms
> ^C
> --- 8.8.8.8 ping statistics ---
> 1 packets transmitted, 1 packets received, 0% packet loss
> round-trip min/avg/max = 23.192/23.192/23.192 ms
> # echo nameserver 8.8.8.8 > /etc/resolv.conf
> # ping on.net
> PING on.net (150.101.140.197): 56 data bytes
> 64 bytes from 150.101.140.197: seq=0 ttl=57 time=1.566 ms
> 64 bytes from 150.101.140.197: seq=1 ttl=57 time=1.528 ms
> ^C
> --- on.net ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 1.528/1.547/1.566 ms
> # wget http://mirror.internode.on.net/pub/test/10meg.test
> Connecting to mirror.internode.on.net (150.101.135.3:80)
> 10meg.test           100% |*******************************|  9765k  0:00:00 ETA
> # rm 10meg.test
> # wget http://mirror.internode.on.net/pub/test/10meg.test
> Connecting to mirror.internode.on.net (150.101.135.3:80)
> 10meg.test           100% |*******************************|  9765k  0:00:00 ETA
> # rm 10meg.test
> # wget http://mirror.internode.on.net/pub/test/100meg.test
> Connecting to mirror.internode.on.net (150.101.135.3:80)
> 100meg.test           17% |*****                          | 16989k  0:00:42 ETA[  134.370000] random: crng init done
> 100meg.test          100% |*******************************| 97656k  0:00:00 ETA
> # rm 100meg.test
> # [ 1342.210000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> [ 1342.210000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> [ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> [ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> [ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> [ 1342.240000] ftgmac100 1e680000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> 
