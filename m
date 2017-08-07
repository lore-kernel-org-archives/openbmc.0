Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com
 [IPv6:2a00:1450:400c:c0c::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xR4YC3TVWzDqkF
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 03:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="t7G7B/M7"; 
 dkim-atps=neutral
Received: by mail-wr0-x22b.google.com with SMTP id 33so4311294wrz.4
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 10:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FRRKp5F8/s6nuxk1YYvV1mtkDMdKv8szA4tC+z7DOP4=;
 b=t7G7B/M7gIHRFIPX1E3mvvDza1UG5JRKzpDROqAMv3Vg6bMKlFplKUxN6T4dCe3akB
 8VWcKdcyqGbFoI6a5zZ+t4Wybp4ZL7hxVvHPnSH3tac9mZVsrWmN/jyMpDwmu4lXC+/G
 YHVs4ryCSDSFwV76lvMIwtmUIoOnUuFxbYwmxF/VJWTz/NZp19lz3MnH4YUcKHxR/k+T
 VBDTB2HsU2xzOe5qooESLufe9YIAa+NY5kjcxEw3MOazc8zXrbcRS2DG7VrZDGRA7ece
 tJRNdye/jMsI6Nn1iewDmA5FEcejz0z+x+j8dkVWFC67V5d3To7jGjtqBADuq7kLm2Ys
 n/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FRRKp5F8/s6nuxk1YYvV1mtkDMdKv8szA4tC+z7DOP4=;
 b=lLEoDmgl1RyZ4Vl42LF5i+tv8Z9Ca6BNo+laRljjyeCbGuRjh9YQ+eBh71JCM7EBYi
 ZxJ8Zr3bCJJYuSuxirapGUFc0t/B/1A8FWvoCftCi07uYAjCofUvxsD46KWkSBiVj+P/
 jdXsTK+gCRLARQGkHnxrXk2CvArTFJvKHQA2NIEg4jF80H9Ev8oT36yIxoTXn/j6oU1l
 oifzc01mB0KdZS2sB4xPY/HGgbLMPcGTRjabMThQEl7nF1JyoN0EcZkIk01dg9zg69WK
 CMuG5Xhr41Fe9GJJZ/VOWt8isJep+YnAG4tVEhtBdJYn0xFT9QG/q9wHMqsvQbv4rmAw
 MO2w==
X-Gm-Message-State: AHYfb5ghoLuLRGHfbknYAKhKaTa07cR33VFITmT4rmT+DNDf5DXzt8ek
 dxgFP5ATM/1g0cc7u1c+VrYszK+iR6ya
X-Received: by 10.223.133.201 with SMTP id 9mr1059020wru.177.1502127595100;
 Mon, 07 Aug 2017 10:39:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Mon, 7 Aug 2017 10:39:54 -0700 (PDT)
In-Reply-To: <fc11d97ef36876f10cc083a776737fbd@linux.vnet.ibm.com>
References: <2d17aa79d1cd24f26f7dc026bb3fed88@linux.vnet.ibm.com>
 <CACPK8Xcjh7LCDNfsR7s9fJXTHh_cz8O224dHw8grTrhgyiyCbg@mail.gmail.com>
 <fc11d97ef36876f10cc083a776737fbd@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 7 Aug 2017 10:39:54 -0700
Message-ID: <CAPLgG==3QTFkFpAr=C6HosKmdSbCAY_iPieByGHKNXLEadbJYQ@mail.gmail.com>
Subject: Re: u-boot: load a kernel that's in a ubi volume
To: anoo <anoo@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel.stan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 07 Aug 2017 17:40:00 -0000

I'm surprised you are putting the kernel in a bare UBI volume.  AFAIK,
U-Boot can load kernels from UBIFS.  Why wouldn't you create a UBIFS
volume for /boot and put the fitImage in there?

On Mon, Aug 7, 2017 at 8:34 AM, anoo <anoo@linux.vnet.ibm.com> wrote:
> On 2017-08-07 02:36, Joel Stanley wrote:
>>
>> On Mon, Aug 7, 2017 at 1:39 PM, anoo <anoo@linux.vnet.ibm.com> wrote:
>>>
>>> Hi Joel,
>>>
>>> Per our discussion, here are the details of what we=E2=80=99re trying t=
o do and
>>> the
>>> things I=E2=80=99ve tried.
>>
>>
>> Thanks. I spent the afternoon attempting to recreate your results.
>>
>>>
>>> Goal: Have u-boot load a kernel that's in a ubi volume.
>>>
>>> 1. Added ubi support to uboot by adding the following macros to
>>> include/configs/ast-g5-ncsi.h temporarily for testing purposes (a new
>>> config
>>> header would probably need to be created for a final implementation):
>>>
>>> | +#define CONFIG_CMD_UBI
>>> | +#define CONFIG_CMD_UBIFS
>>> | +#define CONFIG_RBTREE
>>> | +#define CONFIG_MTD_DEVICE
>>> | +#define CONFIG_MTD_PARTITIONS
>>> | +#define CONFIG_CMD_MTDPARTS
>>> | +#define CONFIG_LZO
>>
>>
>> I replicated this. I noted that this increases the size of the u-boot
>> image a lot:
>>
>> Old size: 232632
>> New size: 358320
>>
>> This is an extra 122kB, or a 54% increase in the u-boot size.
>>
>> It does still fit in the partition we have, which is 384 KB.
>
>
> Definitely something to keep in mind.
>
>>
>>>
>>> 2. Built a romulus image with the above u-boot change plus commit
>>> https://gerrit.openbmc-project.xyz/#/c/5812/ which is the top-most comm=
it
>>> for a set of changes to remove the initramfs and create a flash image
>>> that
>>> builds the kernel and rootsfs into ubi volumes.
>>
>>
>> Why Romulus? Isn't this work being done for Witherspoon?
>
>
> Yeah, this is being done for witherspoon. I've tested with witherspoon as
> well but also Romulus in case there were device tree changes that needed =
to
> be done that's a smaller system.
>
>>> 3. Used the generated obmc-phosphor-image-romulus.ubi.mtd to boot qemu.
>>
>>
>> What was the Qemu command line you used?
>
>
> After cloning the openbmc/qemu repo and building (using as reference
> https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu):
>
> ./build/arm-softmmu/qemu-system-arm -m 256 -M romulus-bmc -nographic -dri=
ve
> file=3D/<path_to>/obmc-phosphor-image-romulus.ubi.mtd,format=3Draw,if=3Dm=
td -net
> nic -net
> user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,hostfwd=
=3D:127.0.0.1:2300-:3000,hostname=3Dqemu
>
> For witherspoon, I use the same command, just pointing to a withespoon
> image.
>
>>
>> Can you share a mkfs.ubifs command line that I can use to create a ubi
>> image?
>
>
> You can create a config test file (named ubi.cfg in this example) in a
> directory where you have the kernel fit image fitImage-<system>.bin, ex:
>
> $ cat ubi.cfg
> [kernel0]
> mode=3Dubi
> image=3DfitImage-<system>.bin
> vol_type=3Dstatic
> vol_name=3Dkernel0
> vol_id=3D0
>
> Then use ubinize command:
> $ ubinize -p 64 -m 1 -o <outputfilename> ubi.cfg
>
> The ubinize command is being added to the openbmc build with this commit:
> https://gerrit.openbmc-project.xyz/#/c/5801/3/meta-phosphor/classes/image=
_types_phosphor.bbclass
>
> The rwfs is built with:
> "UBIFS_RWFS_CMD =3D "mkfs.ubifs -r ubifs -c ${FLASH_UBI_RWFS_LEBS} -m
> ${FLASH_PAGE_SIZE} -e ${FLASH_LEB_SIZE}KiB rwfs.ubifs"
>
> Then the ubi image is built with:
> "ubinize -p ${FLASH_PEB_SIZE}KiB -m ${FLASH_PAGE_SIZE} -o ubi-img $cfg"
>
>>
>> When I tried to boot the image I downloaded from the gerrit job, none
>> of the uboot commands you listed worked:
>
>
> An image needs to built with the u-boot changes that enable ubi, since th=
at
> is not in gerrit. You'd need to build an openbmc image with the u-boot
> recipe pointing to a local u-boot repo that has the ubi macros enabled.
>
> I'll pass you in a separate msg the image I have built.
>
>
>>
>> U-Boot 2016.07 (Jul 27 2017 - 21:13:25 +0000)
>>
>>        Watchdog enabled
>> DRAM:  496 MiB
>> Flash: 32 MiB
>> *** Warning - bad CRC, using default environment
>>
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Net:   aspeednic#0
>> Error: aspeednic#0 address not set.
>>
>> Hit any key to stop autoboot:  0
>> libfdt fdt_check_header(): FDT_ERR_BADMAGIC
>> Wrong Image Format for bootm command
>> ERROR: can't get kernel image!
>> ast# mtdparts
>> Unknown command 'mtdparts' - try 'help'
>> ast# ubi part kernel0
>> Unknown command 'ubi' - try 'help'
>>
>>
>>>
>>> 4. To be able to use ubi in u-boot, the mtdparts and mtdids variables
>>> need
>>> to be set (reference:
>>> https://fossies.org/linux/qemu/roms/u-boot/doc/README.ubi).
>>>
>>> Here is where I=E2=80=99ve been unable to get u-boot to recognize the e=
xisting
>>> mtd.
>>> I=E2=80=99ve tried multiple combinations for mtdids, such as nor0=3Dbmc=
,
>>> nor0=3D<addr>.flash, etc etc. But when running =E2=80=9Cmtdparts=E2=80=
=9D command from
>>> u-boot,
>>> or a ubi command, always get "Device nor0 not found!=E2=80=9D. Ex:
>>>
>>> ast# mtdparts
>>> Device nor0 not found!
>>>
>>> ast# ubi part kernel0
>>> Device nor0 not found!
>>> Error initializing mtdparts!
>>>
>>> I=E2=80=99ve also taken a stab at adding the romulus device tree to u-b=
oot to see
>>> if
>>> that may be the reason, by copying from the kernel and adding to u-boot
>>> the
>>> files arch/arm/dts/aspeed-g5.dtsi, aspeed-bmc-opp-flash-layout.dtsi,
>>> aspeed-bmc-opp-romulus.dts, and adding the dts to the Makefile. Also
>>> added a
>>> CONFIG_DEFAULT_DEVICE_TREE macro. This might not be the correct or
>>> complete
>>> way to add the device tree to the openbmc version of u-boot.
>>
>>
>> Can you explain what you were trying to do there?
>
>
> I was trying to add the system device tree to u-boot. The device trees fo=
r
> the openbmc systems are defined in the kernel, but they may be required t=
o
> be defined in u-boot for u-boot to find the mtd partitions.
>
>>
>> Cheers,
>>
>> Joel
>
>
