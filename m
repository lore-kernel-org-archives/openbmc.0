Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQq9c6WPszDqqN
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 17:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fm61QumG"; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id p68so38088549ywg.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IuIKjo9mL+hp9TeXxU8Zv89GP/EIxXNV8XrW26fcUj8=;
 b=Fm61QumG9QYb6nEXiPVfy2TRVtU5+fCmvml7RdE9JONWd68UWsDiom+EYDh0cYZU+I
 C4N2NoipkYxB2QlDvgmxMX+t4qlKJxmVqKuTuo5Q8/pYgnrm4aJOUU9iXIwv4jtAH2e1
 M2k27gy2XfWGeTkS++tRL2rst487M5MU++OAgtFB1gONaqRzXJKlwPtslxQE6aDjUvX/
 4uPlMklLOlwo5Gt6+HUNu5rmn1pEf+84FfAo0vhAbSkEW63RN9bFWUsIE4f+U3NVtSrB
 ehJh+NxBY6dw62mSP59iBlX5ClmscrQyvBWI4vX7KQf8OpAZg18GfDK/wzIQgd1qACiU
 HuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IuIKjo9mL+hp9TeXxU8Zv89GP/EIxXNV8XrW26fcUj8=;
 b=P9kXsUTsZBJEZshLijY94BDrW+98S7eCTI6WJWQEPi8a1BhnCQhBRJwyb3N7IdNeLk
 EvSOkBrMrjeOIcs7Gu+G+iL4FXpH2pU4XXkCvnrZuvzPHms5bbLdWnBwO22uXyCeZsBm
 qWa7milI5H8bRvD574NHW1rMkSL40s0bhA6SAgvzhzVVfj6YwGENfG2oL5Mwn0aVwLb6
 XGObd+T5Fo3ehKldCnmP8llCLQZEG4DDV5pvnjLxC0NXkInj6GQ+d+znRU4bmNVoA/ov
 UfhbToGENNpjy+FkVPwio9Mbq5RyzzS5u4z6RMw3/vGY8PEEKYJzDTdXHspNRdLZSIyB
 3M0Q==
X-Gm-Message-State: AHYfb5jHIlFZ11uhJSdIU6zNPkyzlJhEObvjM3Qw8xcSwEADW9cIalz6
 FNE+CVLuVR/x2Y7CIvCAkXhEotJvqg==
X-Received: by 10.37.110.3 with SMTP id j3mr2639958ybc.63.1502091426098; Mon,
 07 Aug 2017 00:37:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 7 Aug 2017 00:36:45 -0700 (PDT)
In-Reply-To: <2d17aa79d1cd24f26f7dc026bb3fed88@linux.vnet.ibm.com>
References: <2d17aa79d1cd24f26f7dc026bb3fed88@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Aug 2017 17:36:45 +1000
X-Google-Sender-Auth: 4AAbJzI_9ehw93VA2gLiJBr0Upc
Message-ID: <CACPK8Xcjh7LCDNfsR7s9fJXTHh_cz8O224dHw8grTrhgyiyCbg@mail.gmail.com>
Subject: Re: u-boot: load a kernel that's in a ubi volume
To: anoo <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 07 Aug 2017 07:37:09 -0000

On Mon, Aug 7, 2017 at 1:39 PM, anoo <anoo@linux.vnet.ibm.com> wrote:
> Hi Joel,
>
> Per our discussion, here are the details of what we=E2=80=99re trying to =
do and the
> things I=E2=80=99ve tried.

Thanks. I spent the afternoon attempting to recreate your results.

>
> Goal: Have u-boot load a kernel that's in a ubi volume.
>
> 1. Added ubi support to uboot by adding the following macros to
> include/configs/ast-g5-ncsi.h temporarily for testing purposes (a new con=
fig
> header would probably need to be created for a final implementation):
>
> | +#define CONFIG_CMD_UBI
> | +#define CONFIG_CMD_UBIFS
> | +#define CONFIG_RBTREE
> | +#define CONFIG_MTD_DEVICE
> | +#define CONFIG_MTD_PARTITIONS
> | +#define CONFIG_CMD_MTDPARTS
> | +#define CONFIG_LZO

I replicated this. I noted that this increases the size of the u-boot
image a lot:

Old size: 232632
New size: 358320

This is an extra 122kB, or a 54% increase in the u-boot size.

It does still fit in the partition we have, which is 384 KB.

>
> 2. Built a romulus image with the above u-boot change plus commit
> https://gerrit.openbmc-project.xyz/#/c/5812/ which is the top-most commit
> for a set of changes to remove the initramfs and create a flash image tha=
t
> builds the kernel and rootsfs into ubi volumes.

Why Romulus? Isn't this work being done for Witherspoon?

> 3. Used the generated obmc-phosphor-image-romulus.ubi.mtd to boot qemu.

What was the Qemu command line you used?

Can you share a mkfs.ubifs command line that I can use to create a ubi imag=
e?

When I tried to boot the image I downloaded from the gerrit job, none
of the uboot commands you listed worked:

U-Boot 2016.07 (Jul 27 2017 - 21:13:25 +0000)

       Watchdog enabled
DRAM:  496 MiB
Flash: 32 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Error: aspeednic#0 address not set.

Hit any key to stop autoboot:  0
libfdt fdt_check_header(): FDT_ERR_BADMAGIC
Wrong Image Format for bootm command
ERROR: can't get kernel image!
ast# mtdparts
Unknown command 'mtdparts' - try 'help'
ast# ubi part kernel0
Unknown command 'ubi' - try 'help'


>
> 4. To be able to use ubi in u-boot, the mtdparts and mtdids variables nee=
d
> to be set (reference:
> https://fossies.org/linux/qemu/roms/u-boot/doc/README.ubi).
>
> Here is where I=E2=80=99ve been unable to get u-boot to recognize the exi=
sting mtd.
> I=E2=80=99ve tried multiple combinations for mtdids, such as nor0=3Dbmc,
> nor0=3D<addr>.flash, etc etc. But when running =E2=80=9Cmtdparts=E2=80=9D=
 command from u-boot,
> or a ubi command, always get "Device nor0 not found!=E2=80=9D. Ex:
>
> ast# mtdparts
> Device nor0 not found!
>
> ast# ubi part kernel0
> Device nor0 not found!
> Error initializing mtdparts!
>
> I=E2=80=99ve also taken a stab at adding the romulus device tree to u-boo=
t to see if
> that may be the reason, by copying from the kernel and adding to u-boot t=
he
> files arch/arm/dts/aspeed-g5.dtsi, aspeed-bmc-opp-flash-layout.dtsi,
> aspeed-bmc-opp-romulus.dts, and adding the dts to the Makefile. Also adde=
d a
> CONFIG_DEFAULT_DEVICE_TREE macro. This might not be the correct or comple=
te
> way to add the device tree to the openbmc version of u-boot.

Can you explain what you were trying to do there?

Cheers,

Joel
