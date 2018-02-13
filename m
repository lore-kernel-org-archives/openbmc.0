Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C/bIaiKg"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgQX65QbMzF0vn
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:52:22 +1100 (AEDT)
Received: by mail-qk0-x22b.google.com with SMTP id x127so20775115qkb.12
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 17:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AztINkKQNH2KSo034j3i2gwkp4qsI7VhE/3gjpErKPA=;
 b=C/bIaiKgIn3gdHic2RSsLRx321VBpqtDsBhEVxaQajUnY1RTtwQ8TNbRWqa+6kbhCM
 96kI6lVOMMCEkwO9Atz2K1oc6IjNZ3k2JWmFv5thRAt+3XIj98BhD0G4VE+NkXObb6LE
 h1O0ITbUQBw5t211B2i5cQ6q6pveUBlpAQDtGKeea1g+TUpJI+khV+FywO+d5Xw6Y3+c
 gZoktthFEwpexjQJYDh1mnAFX+sg4zUe8fOk9S4YRKxD9lQaZYaglIYwkNABVHF0ECUL
 EGqrP+OwxKIIwjOOBo+BR7MkWWJileNa3Dj0yeFEtm3DVjCuX6fWfsHPC/16s52fhGhf
 /QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AztINkKQNH2KSo034j3i2gwkp4qsI7VhE/3gjpErKPA=;
 b=SBH+yRBfzhN2urEgzHkA4kgFAJml/IDAK62er9DjnM8F1DczIu0UCBPP5SoKLJh6vA
 Y9uw814mkTfKcaLwxZF7tv3ctQZl4BO8UTBR4Ca4Oj9mI1i1ITbqDJsybm1FTa6TQD/y
 HJQl1clPPaELP4B2hYzJCzifxdcisoEIxUNvFArv/moh2MUhEwQtvWY3bGTOdWIws4CS
 f/elKedq1i5REeJhLD/Y2jHd7O6ktmGMZVNNG8XBIBO33OEmbqS2UdyYQ4EZFtPW3tMQ
 NLCT2zmCh4AhmYUIAZlYczgN8JNqq7tVWaTEmIz633QnJ5FI5OFvs3A3yFe8+MeatNWt
 Wtkw==
X-Gm-Message-State: APf1xPB2v1lsj5O0vL/8O6Wqc8ZuICDGrXNmcjtzHm2liYbI/EVDIWaj
 ynStsSnlwCLftU0EnPDdaZ1YfkkjLSH6pyJBiF4=
X-Google-Smtp-Source: AH8x226ZOyej/bGLqUZ75KD/p0rc7QpJzHAKTrFhzgmDQj5k6SccOtvznwZBB58LZdBH+Rt6Tn24IXjKHVQqorOam4E=
X-Received: by 10.55.33.129 with SMTP id f1mr21044915qki.158.1518486739444;
 Mon, 12 Feb 2018 17:52:19 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 17:51:59 -0800 (PST)
In-Reply-To: <95cd4831-f9fb-0e72-9305-a249fc99c956@cavium.com>
References: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
 <CACPK8XdWGur=QB5QK+mja33M0bRkXGg9gCoVn_DdJF4vKD+p9g@mail.gmail.com>
 <95cd4831-f9fb-0e72-9305-a249fc99c956@cavium.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 12:21:59 +1030
X-Google-Sender-Auth: Hw8nbOo6zVaVg-6SfklM-etDQm4
Message-ID: <CACPK8XdWo_G31R3QgLBmG+hWT77604vJrMgd4+ZHcK_N4Wi2Og@mail.gmail.com>
Subject: Re: udev faulting with openbmc filesystem builds.
To: "Steven J. Hill" <Steven.Hill@cavium.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 13 Feb 2018 01:52:23 -0000

On Tue, Feb 13, 2018 at 4:44 AM, Steven J. Hill <Steven.Hill@cavium.com> wrote:
> On 02/12/2018 12:44 AM, Joel Stanley wrote:
>>
>> Do your other filesystems have similar userspace components, such as systemd?
>>
>> Have you tried to reproduce using the OpenBMC kernel?
>>
> Joel,
>
> Yes, I have tried the OpenBMC kernel and get the same results. Let me outline
> my platform, kernel versions tried, etc. for completeness.
>
> Developing on Aspeed AST2500 evaluation board. The core is an AST2500-A1.
> The detailed core information from the kernel is:
>
>    CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5307d
>    CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
>    OF: fdt: Machine model: AST2500 EVB
>
> Kernels that I have tested:
>
>    Palmetto (built by the OBMC build system)
>    Witherspoon (built by the OBMC build system)
>    Generic OpenBMC kernel from 'dev-4.10' branch

When you say "generic", which device tree are you using?

I don't know what has gone wrong from your backtrace. Which device
driver was being loaded when you hit this issue? Booting with
initcall_debug might help here.

I suggest you use the device tree for the ast2500-evb. Here's how I
would build a kernel for testing:

git checkout dev-4.13
make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm aspeed_g5_defconfig
make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm

cat << EOF > evb.its
/dts-v1/;

/ {
        description = "test kernel";
        #address-cells = <1>;

        images {
                kernel@1 {
                        description = "Linux kernel";
                        data = /incbin/("arch/arm/boot/zImage");
                        type = "kernel";
                        arch = "arm";
                        os = "linux";
                        compression = "none";
                        load = <0x80001000>;
                        entry = <0x80001000>;
                };
                fdt@1 {
                        description = "device tree";
                        data =
/incbin/("arch/arm/boot/dts/aspeed-ast2500-evb.dtb");
                        type = "flat_dt";
                        arch = "arm";
                        compression = "none";
                };
                ramdisk@1 {
                        description = "initramfs";
                        data = /incbin/("rootfs.cpio.xz");
                        type = "ramdisk";
                        arch = "arm";
                        os = "linux";
                };
        };

        configurations {
                default = "conf@1";
                conf@1 {
                        description = "Boot Linux kernel with FDT
blob, ramdisk";
                        kernel = "kernel@1";
                        fdt = "fdt@1";
                        ramdisk = "ramdisk@1";
                };
        };
};
EOF

mkimage -f evb.its evb
cp evb /srv/tftp/

From u-boot:

setenv serverip <tftp server ip>
dhcp evb
bootm

If that shows the bug, send me the fill dmesg log with initcall_debug
enabled and we can go from there.

Cheers,

Joel

>    Aspeed SDK kernel based on 4.9 (supplied from Aspeed)
>    Aspeed SDK kernel based on 4.10 (ported by me)
>    Aspeed SDK kernel based on 4.11 (ported by me)
>    Aspeed SDK kernel based on 4.12 (ported by me)
>    Aspeed SDK kernel based on 4.13 (ported by me)
>    Aspeed SDK kernel based on 4.14 (ported by me)
>    Aspeed SDK kernel based on 4.15 (ported by me)
>
> Root filesystems tested, all using systemd:
>
>    Palmetto
>    Witherspoon
>    buildroot (HEAD)
>
> All kernel/RFS combinations fault at exactly the same function inside
> of 'udevadm' shown below. It is always the 'strlen' function. For all
> test runs the virtual address is always aligned on a 4KB page boundary.
> I have tried variations of SLUB, SLAB, enabling errata workarounds,
> passing different 'mem=xxx' to the kernel, kernel hacking options,
> "kernel mem{cpy,set}() for {copy_to,clear}_user()" option and others.
> This is where I am currently. Any insight would be great. Cheers.
>
> Steve
>
>
>
> Unable to handle kernel paging request at virtual address 9bc8c000
> pgd = db438000
> [9bc8c000] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 900 Comm: udevadm Not tainted 4.10.0+ #3
> Hardware name: ASpeed BMC SoC
> task: dbed7880 task.stack: db4ae000
> PC is at strlen+0xc/0x38
> LR is at kstrdup+0x20/0x58
> pc : [<c01f610c>]    lr : [<c00965ec>]    psr: a0000013
> sp : db4afd30  ip : db4afd40  fp : db4afd3c
> r10: db5a88c0  r9 : dbda1f08  r8 : 00000fff
> r7 : db4afd9a  r6 : 9bc8c000  r5 : c0269d9c  r4 : 014000c0
> r3 : dbdbf990  r2 : 0000f000  r1 : 014000c0  r0 : 9bc8c000
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 00c5387d  Table: 9b438008  DAC: 00000055
> Process udevadm (pid: 900, stack limit = 0xdb4ae188)
> Stack: (0xdb4afd30 to 0xdb4b0000)
> ...
> ...
> ...
> Backtrace:
> [<c01f6100>] (strlen) from [<c00965ec>] (kstrdup+0x20/0x58)
> [<c00965cc>] (kstrdup) from [<c0269d9c>] (misc_devnode+0x38/0x40)
>  r7:db4afd9a r6:dbda1f00 r5:db4afd9c r4:dbda1f08
> [<c0269d64>] (misc_devnode) from [<c026e7b0>] (device_get_devnode+0x78/0xdc)
> [<c026e738>] (device_get_devnode) from [<c026e950>] (dev_uevent+0x13c/0x1e0)
