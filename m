Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ucyAW/mw"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfx3y2fqWzF0cl
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 17:44:43 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id h186so5092541qke.8
 for <openbmc@lists.ozlabs.org>; Sun, 11 Feb 2018 22:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rL1DwDLRGHpPZUL4zdWuXzfovRrI8UPnldMwextLgLA=;
 b=ucyAW/mw7nXO2BofkmcRO3ubiZ2SI30C7WB2ElurGKB3daUC1pEq559wvcbLzlzXTy
 sEwJgA/A8VI2vaxybXbDtp5q0R1W+TkoTArZj0Z0XiHCjXJGdBf4ycHKNC6WbbqjXhIa
 Tn2M5M9MKy+reF2Vfk2bNtv1l3s6UvNpX2M9z1uCvDOjUQxI0loP9fbnsfWhN6Tw3IbT
 1umsjgbo8SQN5mJuutgeuMc3+vArWh7YDTGVN3X585Ejsc0E7lnLVmoq0IHk1ya04F8f
 +HImLzKI90tQMjEZOLWPSX37quJH8lMxuTa6cnO56cVdU+LS2COs5azGRAxfph4S1BkA
 2Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rL1DwDLRGHpPZUL4zdWuXzfovRrI8UPnldMwextLgLA=;
 b=kepWhB1E9K4wqfPOs2xxI6ORizh+aLY5VbIx73daL/JeprW2njPE2dtReEmhvwH9uD
 Z3Y+UjV8DTqcq+RQI+7N/xCtAJiK6oI82ALI0ykC3U2mLI4hTkHbu0XFetfvva1VwOcB
 C6Zz/7Qs7n0JMF36dknIZ25m1/bGat6noZ48W3gETNfmFYQPgEIAX9o00KHCadlwgGGW
 NEZMl/qMIigZy+jtapQ8Gqv41n1XpPZdkDPxgIBGweFJfNJWeTyxlUeDhxxzf+dgFcwZ
 9rZxxOPmEUYakZ0l6tp4oj6/2ympHFMvLzBXWeeDatUTlr/j5GoyH54ihzlgMBzecNTU
 JRMA==
X-Gm-Message-State: APf1xPA+HwIYCTrSU3aRg6GucgJhJpKCoSP1vv4UI4iDZFehEQtjYz09
 bYJleLGjN4iwopEwEaC9C0VHtiM9eiDLEsu8BjJvIq1v
X-Google-Smtp-Source: AH8x226gdmHcL2nx8WsWE/07wg1PMJIsPwpYWHLHzRW/Aw7eD/hh/L7HI87r+3qV/pODUSpVO628788dxs81eoqZu8Y=
X-Received: by 10.55.33.129 with SMTP id f1mr16370179qki.158.1518417880004;
 Sun, 11 Feb 2018 22:44:40 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Sun, 11 Feb 2018 22:44:19 -0800 (PST)
In-Reply-To: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
References: <0bd9476d-f2d5-45c2-bda6-987835581a48@cavium.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Feb 2018 17:14:19 +1030
X-Google-Sender-Auth: uKD5UERMwof9mEIYg56CCgJmX1c
Message-ID: <CACPK8XdWGur=QB5QK+mja33M0bRkXGg9gCoVn_DdJF4vKD+p9g@mail.gmail.com>
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
X-List-Received-Date: Mon, 12 Feb 2018 06:44:48 -0000

Hi Steve,

On Fri, Feb 9, 2018 at 5:38 PM, Steven J. Hill <Steven.Hill@cavium.com> wrote:
> I'm working with an AST2500 development board. I have built the
> Palmetto and Witherspoon platforms. I am taking the filesystem
> 'obmc-phosphor-image-PLATFORM-20180208xxxxxx.rootfs.squashfs-xz'
> and placing the files on a USB flash drive. Coldplugging devices
> with 'udev' always faults as shown below. I have a custom 4.10
> kernel that works with non-OBMC root filesystems just fine.

Do your other filesystems have similar userspace components, such as systemd?

Have you tried to reproduce using the OpenBMC kernel?

Cheers,

Joel


> [  OK  ] Started Apply Kernel Variables.
>          Starting Create System Users...
> Unable to handle kernel paging request at virtual address 9bda7000
> pgd = db1ac000
> [9bda7000] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 146 Comm: udevadm Not tainted 4.10.0+ #3
> Hardware name: ASpeed BMC SoC
> task: db025ac0 task.stack: db170000
> PC is at strlen+0xc/0x38
> LR is at kstrdup+0x20/0x58
> pc : [<c01f2bb4>]    lr : [<c00965ec>]    psr: a0000013
> sp : db171d30  ip : db171d40  fp : db171d3c
> r10: dbff85c0  r9 : dbd9c208  r8 : 00000fff
> r7 : db171d9a  r6 : 9bda7000  r5 : c0266bc4  r4 : 014000c0
> r3 : dbd95890  r2 : 0000f000  r1 : 014000c0  r0 : 9bda7000
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 00c5387d  Table: 9b1ac008  DAC: 00000055
> Process udevadm (pid: 146, stack limit = 0xdb170188)
> Stack: (0xdb171d30 to 0xdb172000)
> 1d20:                                     db171d5c db171d40 c00965ec c01f2bb4
> 1d40: dbd9c208 db171d9c dbd9c200 db171d9a db171d6c db171d60 c0266bc4 c00965d8
> 1d60: db171d8c db171d70 c026b5d8 c0266b98 dbd9c208 db058000 dbd9c200 db171da4
> 1d80: db171dc4 db171d90 c026b778 c026b56c db171d9c db171da0 f000432c 00000000
> 1da0: 00000000 00000000 dbc26d00 db058000 dbd9c208 db057000 db171dec db171dc8
> 1dc0: c0268f20 c026b648 dbff3f20 c059b8c8 c04324ac db057000 00000fff dbd9c208
> 1de0: db171e04 db171df0 c0268d40 c0268e78 dbff3f20 00001000 db171e34 db171e08
> 1e00: c011c7bc c0268d28 c011c72c dbff3f20 00001000 db171e60 00000000 dbd3f680
> 1e20: db171f78 00000001 db171e44 db171e38 c011b2c4 c011c738 db171e9c db171e48
> 1e40: c00e0a08 c011b2a4 db171ebc 7f6ad9a0 00001000 dbff3f50 db00f5d0 dbfe7580
> 1e60: 00000000 00000000 00000055 014000c0 0007f6af dbff85c0 00001000 db171f78
> 1e80: db171f78 00000000 00001000 00000000 db171edc db171ea0 c011bfa8 c00e0958
> 1ea0: 00000817 7f6af9ac 00000055 7f6ad9a0 db171efc c011be6c dbd3f680 db171f78
> 1ec0: db171f78 00000000 00001000 00000000 db171f44 db171ee0 c00bdb0c c011be78
> 1ee0: 7f6af9ac db171fb0 b6e69b94 00000001 db171fac db171f00 c0009244 c0015560
> 1f00: dbfe7590 00000000 7f6d0000 db055ba0 db171f7c db171f20 c00a85f8 c00a6b04
> 1f20: 00001000 dbd3f680 00001000 dbd3f680 7f6ad9a0 db171f78 db171f74 db171f48
> 1f40: c00bf12c c00bdae8 7f6d0000 7f6af000 db171f74 dbd3f680 dbd3f680 00000000
> 1f60: 00000000 7f6ad9a0 db171fa4 db171f78 c00bffec c00bf0ac 00000000 00000000
> 1f80: 7f6ad838 b6d95c84 00001000 00000003 c000f784 db170000 00000000 db171fa8
> 1fa0: c000f5e0 c00bffb4 7f6ad838 b6d95c84 00000005 7f6ad9a0 00001000 00000040
> 1fc0: 7f6ad838 b6d95c84 00001000 00000003 ffffffff ffffffff 7f6ad9a0 b6e67ba8
> 1fe0: 00000000 beb0251c b6d95924 b6dee64c 60000010 00000005 00000000 00000000
> Backtrace:
> [<c01f2ba8>] (strlen) from [<c00965ec>] (kstrdup+0x20/0x58)
> [<c00965cc>] (kstrdup) from [<c0266bc4>] (misc_devnode+0x38/0x40)
>  r7:db171d9a r6:dbd9c200 r5:db171d9c r4:dbd9c208
> [<c0266b8c>] (misc_devnode) from [<c026b5d8>] (device_get_devnode+0x78/0xdc)
> [<c026b560>] (device_get_devnode) from [<c026b778>] (dev_uevent+0x13c/0x1e0)
>  r7:db171da4 r6:dbd9c200 r5:db058000 r4:dbd9c208
> [<c026b63c>] (dev_uevent) from [<c0268f20>] (uevent_show+0xb4/0x118)
>  r7:db057000 r6:dbd9c208 r5:db058000 r4:dbc26d00
> [<c0268e6c>] (uevent_show) from [<c0268d40>] (dev_attr_show+0x24/0x50)
>  r9:dbd9c208 r8:00000fff r7:db057000 r6:c04324ac r5:c059b8c8 r4:dbff3f20
> [<c0268d1c>] (dev_attr_show) from [<c011c7bc>] (sysfs_kf_seq_show+0x90/0xfc)
>  r5:00001000 r4:dbff3f20
> [<c011c72c>] (sysfs_kf_seq_show) from [<c011b2c4>] (kernfs_seq_show+0x2c/0x30)
>  r10:00000001 r9:db171f78 r8:dbd3f680 r7:00000000 r6:db171e60 r5:00001000
>  r4:dbff3f20 r3:c011c72c
> [<c011b298>] (kernfs_seq_show) from [<c00e0a08>] (seq_read+0xbc/0x4c0)
> [<c00e094c>] (seq_read) from [<c011bfa8>] (kernfs_fop_read+0x13c/0x1b8)
>  r10:00000000 r9:00001000 r8:00000000 r7:db171f78 r6:db171f78 r5:00001000
>  r4:dbff85c0
> [<c011be6c>] (kernfs_fop_read) from [<c00bdb0c>] (__vfs_read+0x30/0x114)
>  r10:00000000 r9:00001000 r8:00000000 r7:db171f78 r6:db171f78 r5:dbd3f680
>  r4:c011be6c
> [<c00bdadc>] (__vfs_read) from [<c00bf12c>] (vfs_read+0x8c/0x114)
>  r7:db171f78 r6:7f6ad9a0 r5:dbd3f680 r4:00001000
> [<c00bf0a0>] (vfs_read) from [<c00bffec>] (SyS_read+0x44/0x98)
>  r8:7f6ad9a0 r7:00000000 r6:00000000 r5:dbd3f680 r4:dbd3f680
> [<c00bffa8>] (SyS_read) from [<c000f5e0>] (ret_fast_syscall+0x0/0x34)
>  r9:db170000 r8:c000f784 r7:00000003 r6:00001000 r5:b6d95c84 r4:7f6ad838
> Code: c0412150 e1a0c00d e92dd800 e24cb004 (e5d03000)
> ---[ end trace 79534d21c87b0cbe ]---
> [FAILED] Failed to start udev Coldplug all Devices.
> See 'systemctl status systemd-udev-trigger.service' for details.
> [  OK  ] Started Create System Users.
