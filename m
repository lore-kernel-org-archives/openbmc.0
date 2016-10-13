Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svzy34V8CzDt1g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 05:38:18 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 17FDE13FC5
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 20:38:12 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 352242A006D;
 Thu, 13 Oct 2016 20:38:11 +0200 (CEST)
Subject: Re: Single device tree blob between linux and u-boot
To: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0a8881b0-15c2-c752-89d1-c39bbaf57ced@kaod.org>
Date: Thu, 13 Oct 2016 20:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15317868235786849026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeggdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 18:38:20 -0000

On 10/13/2016 08:20 PM, Xo Wang wrote:
> Hi folks,
> 
> I saw Cedric had mentioned "...you can use the linux compiled [dtb]
> and dd it at the end of the u-boot
> partition..."
> 
> To provide the device tree to u-boot, should we do what Cedric said
> and also pass the address of the DTB from U-Boot to Linux? According
> to these slides:
> 
> https://events.linuxfoundation.org/sites/events/files/slides/petazzoni-device-tree-dummies.pdf
> 
> U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right
> bootm command parameters.

to see what it takes, you can tftp the dtb at some address and start
using it from uboot after telling him where it is with "fdt addr".
For linux, just add the address to bootm and boot. The main issue
I saw was the use the default kernel command line in the dtb  

You will need a recompile of uboot to add fdt support. Check out my
branch.  

> This means we can have U-Boot and Linux use the same DTB binary (I
> prefer built in Linux) rather than each source tree building one.

I would rather keep the dtb in Linux also.

> Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux
> build that is described as a legacy "compatibility" mechanism. We also
> avoid having an extra copy of the DTSs in U-Boot source and avoid
> duplicate DTBs in our image.
> 
> Thoughts?

It's easy to experiment, you can get all the flow working under qemu to
see the pros and cons. You just need to build your own test flash with
a couple of dd lines. There is some room before u-boot-env.

Cheers,

C. 


ast# fdt addr 0x20050000
ast# fdt header
magic:                  0xd00dfeed
totalsize:              0x37f3 (14323)
off_dt_struct:          0x38
off_dt_strings:         0x3610
off_mem_rsvmap:         0x28
version:                17
last_comp_version:      16
boot_cpuid_phys:        0x0
size_dt_strings:        0x1e3
size_dt_struct:         0x35d8
number mem_rsv:         0x0

ast# bootm 20080000 20300000 20050000
## Booting kernel from Legacy Image at 20080000 ...
   Image Name:   legoater-201610132032
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1565643 Bytes = 1.5 MiB
   Load Address: 40008000
   Entry Point:  40008000
## Loading init Ramdisk from Legacy Image at 20300000 ...
   Image Name:   legoater-201610132032
   Image Type:   ARM Linux RAMDisk Image (lzma compressed)
   Data Size:    1567123 Bytes = 1.5 MiB
   Load Address: 48000000
   Entry Point:  48000000
## Flattened Device Tree blob at 20050000
   Booting using the fdt blob at 0x20050000
   Loading Kernel Image ... OK
   Loading Ramdisk to 5ea0b000, end 5eb89993 ... OK
   Loading Ramdisk to 5e88c000, end 5ea0a993 ... OK
   Loading Device Tree to 5e885000, end 5e88b7f2 ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.7.3-00073-g178805942243-dirty (legoater@hermes.kaod.org) (gcc version 4.9.3 (GCC) ) #223 Thu Oct 13 19:15:31 CEST 2016
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine model: Palmetto BMC
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Memory policy: Data cache writeback
[    0.000000] SOC Rev: 02000303
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
[    0.000000] Kernel command line: console=ttyS4,115200 earlyprintk
...
