Return-Path: <clg@kaod.org>
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3hCV2kNBzDt4N
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 18:16:38 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 3267D987B
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 08:39:39 +0200 (CEST)
Received: from hermes.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 7F2B1180082;
 Wed, 26 Oct 2016 08:39:35 +0200 (CEST)
Subject: Re: Single device tree blob between linux and u-boot
To: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
 <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
 <CAPLgG=kafSFfaj4P569+qr=y4130ScobqtwCY94sYbm1uJzfFw@mail.gmail.com>
 <CACPK8XcJaP4apyXj3o=NznF_etzPd36zzspDco5+xvjR+n3m2w@mail.gmail.com>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <aa2ad314-bd4a-e4e6-1d51-7b478aa0de46@kaod.org>
Date: Wed, 26 Oct 2016 08:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcJaP4apyXj3o=NznF_etzPd36zzspDco5+xvjR+n3m2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5740400676287580930
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrieekgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Oct 2016 07:16:38 -0000

On 10/26/2016 07:22 AM, Joel Stanley wrote:
> Hey Rick,
> 
> On Fri, Oct 14, 2016 at 6:07 AM, Rick Altherr <raltherr@google.com> wrote:
>> I've been working on signed kernel images which depends on building FIT
>> images that include the kernel, initrd, and dtb.  The kernel_fitimage branch
>> of my tree (https://github.com/kc8apf/openbmc) will build an unsigned FIT
>> image by including the dtb specified in the machine config (usually from the
>> kernel).  There are also provisions in there for u-boot being built in two
>> stages so a control dtb that includes the public signing keys can be
>> combined into the final u-boot binary.  From how that is structure, I
>> suspect Maxim is right that there will be some differences between u-boot's
>> dtb and linux's dtb.  That shouldn't be an issue as the u-boot dtb gets
>> built into the u-boot image while the kernel dtb is loaded from the FIT
>> image.
> 
> I finally got around to testing your FIT changes.
> 
> I had to build my own u-boot, as we don't have FIT support enabled. We
> should make sure to add that to your patch series (in fact, we could
> enable it now interdependently of the other changes).
> 
> I created an image like this:
> 
> $ dd if=/dev/zero of=flash-test bs=1M count=32
> $ dd if=/home/joel/dev/u-boot/u-boot.bin of=flash-test conv=notrunc bs=1
> $ dd if=/home/joel/dev/obmc/fit/fitImage-core-image-minimal-initramfs-palmetto.bin
> of=flash-test conv=notrunc bs=1K seek=512
> 
> Here it is booting in Qemu:
> 
> $ qemu-system-arm -m 256M -M palmetto-bmc -nographic -nodefaults -net
> nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu -serial stdio
> -drive file=~/dev/obmc/flash-test,format=raw,if=mtd

I just included the above in the u-boot wiki. Gavin was asking for it 
for its development. I should extend a bit on the topic but I would
need to check which image to use first. This is all very custom for 
the moment. 

The TODO list needs an update also for the FIT image.

Thanks,

C.


> 
> U-Boot 2016.11-rc2-02954-g9f82ceb7118d (Oct 26 2016 - 15:36:23 +1030)
> 
> SOC : AST2400-A0
> RST : Power On
> PLL :     24 MHz
> CPU :    384 MHz
> MEM :      0 MHz, EEC:Disable
> VGA :    16 MiB
> DRAM :   init by SOC
> Model: Palmetto BMC
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
> ast# bootm 0x80000
> ## Loading kernel from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x00080124
>      Data Size:    1511416 Bytes = 1.4 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   1ab23fabb23234a21cd80651cd3c96a9b58a9e4c
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading ramdisk from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'ramdisk@1' ramdisk subimage
>      Description:  ramdisk image
>      Type:         RAMDisk Image
>      Compression:  uncompressed
>      Data Start:   0x001f62b8
>      Data Size:    4724736 Bytes = 4.5 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha1
>      Hash value:   202c90e945a883ba8ff73fa4e197a17d6a9ce9f4
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading fdt from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'fdt@1' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x001f1210
>      Data Size:    20463 Bytes = 20 KiB
>      Architecture: ARM
>      Hash algo:    sha1
>      Hash value:   63054f0970e89a70a15d1faac53fe9544a83e2e5
>    Verifying Hash Integrity ... sha1+ OK
>    Booting using the fdt blob at 0x1f1210
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 4e700000, end 4eb81800 ... OK
>    Loading Ramdisk to 4e27e000, end 4e6ff800 ... OK
>    Loading Device Tree to 4e276000, end 4e27dfee ... OK
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 4.7.10-32ede9ab3deda73c484c4e2d372863bb73d0f7e0
> (joel@ka3.ozlabs.ibm.com) (gcc version 5.3.0 (GCC) ) #1 Wed Oct 26
> 13:57:23 AEDT 2016
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
> CPU: VIVT data cache, VIVT instruction cache
> Machine model: Palmetto BMC
> Memory policy: Data cache writeback
> SOC Rev: 02000303
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 60960
> Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
> 
> 
> Looks good!
> 
> Cheers,
> 
> Joel
> 
