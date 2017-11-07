Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22b; helo=mail-lf0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eiuA8v4q"; 
 dkim-atps=neutral
Received: from mail-lf0-x22b.google.com (mail-lf0-x22b.google.com
 [IPv6:2a00:1450:4010:c07::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWPYG40KKzDr8Q
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 20:40:18 +1100 (AEDT)
Received: by mail-lf0-x22b.google.com with SMTP id 75so13705273lfx.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Nov 2017 01:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5KhaK4U1VmhtlDYcLeZaX83tKZkt92YPOv0xlAxZGnY=;
 b=eiuA8v4q/uL4gr+kQR/Ri0Hk60PLUGaVVFlSgbr/uhMckVtlW1V+/3ifQMzwuW4KKg
 Tbru9IbchtWRafcQfg9how3hknFPClbH6kxD867TgNfVt1pFyB4KCqCr2gDd772gKSjx
 2L5P++6osZBLCrMz6t6acBjo3MfJWmsM91cuBwhoL2W4H/5ixDH+zbcSeQZz2kkgYN0e
 n9tB3iXAOaN1wWay5TlvRWE/6eTFVOVQDbBsMBEak34oMO1zvC3wd0wtR77RmG9Ead0g
 KvjJDyf2J6Kk5yXrKoR/7ru5K2XF+rOD3JloafweBVQjD0eyIZ75fWPZzrZllb2buggA
 dUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5KhaK4U1VmhtlDYcLeZaX83tKZkt92YPOv0xlAxZGnY=;
 b=rw4xRKhMF+5Wl6425P7svw7n9g4coxBPaZwLH9BvXnR2m+NKDP3kX0HRiO3M1aLWgw
 kHEILq+msynVM7ih4ior0nWdAJkgxIjn14+f9mZurMlrkm/nXbHI0zOvGDZvGJrbxmYh
 ZqeKjbNG/fSfvvXy+3wwYhqSho3pQ/U6/ygtnlDxaWefSuSNNrr7iSecfblMPfOikLQg
 d8jOSeZRS9DkJSvSE8H9x17brO2dyQvHRJnbv7kSQ5mZUywgam4NG3/z6wn1I5dWBXwe
 j3e93sKLTSLac6CYRDnKT6OmKC/YFuE+7PSV7v21jqgFF0LOaXYa0iOmCcGmYhopN8Gb
 serw==
X-Gm-Message-State: AJaThX76SJVu9yvOuQzBkVmY3BRpgix7zTQ6udWdzlJvV86pdkahZi27
 U3dRfpCtS2y6SV5yJtn0Ny9TIzjJkzNSYotY/TU=
X-Google-Smtp-Source: ABhQp+QkZH998xw9mdPUi9fU/imVqAHQJMoFYN8AHYpAsl/4jxqFAllI87fdUwVnqZ4OV/qW52wKuKzUNgoIwqY7FgI=
X-Received: by 10.25.99.216 with SMTP id v85mr6377989lfi.257.1510047613324;
 Tue, 07 Nov 2017 01:40:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Tue, 7 Nov 2017 01:39:52 -0800 (PST)
In-Reply-To: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 20:09:52 +1030
X-Google-Sender-Auth: szIztfKGW1Fit3Vhnj32DpjrXE4
Message-ID: <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
Subject: Re: linux 4.10 on ast2400
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 09:40:19 -0000

On Tue, Nov 7, 2017 at 11:42 AM, Patrick Venture <venture@google.com> wrote:
> I've been doing testing with linux 4.10 on the ast2400 and on some
> percentage (20% of systems) when they boot they're not able to really
> launch applications.  The one we see failing is agetty, but ipmid also
> ends up not running.  Here is the log from what we're seeing on the
> quanta-q71l:
>
> [  OK  ] Started Clear one time boot overrides.
> [  OK  ] Found device /dev/ttyS4.
> [  OK  ] Found device /dev/ttyVUART0.
> [   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
> [  OK  ] Started Network Service.
> [   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
> [  OK  ] Started Phosphor Inventory Manager.
> [  OK  ] Started Phosphor Settings Daemon.
> [  OK  ] Reached target Network.
>          Starting Permit User Sessions...
> [  OK  ] Started Lightweight SLP Server.
> [  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyVUART0.
> [  OK  ] Started Phosphor Inband IPMI.
> [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
> [  OK  ] Started Permit User Sessions.
> [  OK  ] Started Serial Getty on ttyS4.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Reached target Multi-User System.
> [   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
> [   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
> [   49.430000] Unable to handle kernel paging request at virtual
> address e1a00006
> [   49.430000] pgd = 85354000
> [   49.430000] [e1a00006] *pgd=00000000
> [   49.430000] Internal error: Oops: 1 [#1] ARM
> [   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
> 4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1

This SHA isn't in the OpenBMC dev-4.10 tree. Where are you getting
your kernel sources from?

Wherever you've grabbed it from it's out of date as the line numbers
don't quite make sense.

> [   49.430000] Hardware name: ASpeed SoC
> [   49.430000] task: 86e1c000 task.stack: 858f6000
> [   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0

We have seen memory corruption when running under Qemu. This is the
first time I've had a report of it happening on hardware.

 https://github.com/openbmc/qemu/issues/9

Can you share some information with how you're booting?

Are you netbooting?

Which u-boot tree are you using? Does it enable networking before
jumping to the kenrel? Or trigger any other kinds of DMA?

Cheers,

Joel

> [   49.430000] LR is at 0x853ea140
> [   49.430000] pc : [<801e0e90>]    lr : [<853ea140>]    psr: 80000013
> [   49.430000] sp : 858f7d58  ip : 00000000  fp : 858f7d8c
> [   49.430000] r10: 8081ca58  r9 : 858572fc  r8 : 858572c0
> [   49.430000] r7 : 85154280  r6 : e1a00006  r5 : 853dfff8  r4 : 853dfff8
> [   49.430000] r3 : 85154280  r2 : 853e0000  r1 : 85c08e9c  r0 : 00000000
> [   49.430000] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   49.430000] Control: 0005317f  Table: 45354000  DAC: 00000051
> [   49.430000] Process (agetty) (pid: 932, stack limit = 0x858f6190)
> [   49.430000] Stack: (0x858f7d58 to 0x858f8000)
> [   49.430000] 7d40:
>     801dacd8 801db374
> [   49.430000] 7d60: 858f7d8c 85857318 858572c0 858f7dcc 00002000
> 00000000 769c3000 858571b8
> [   49.430000] 7d80: 858f7dc4 858f7d90 801d5da0 801e0e08 769c3000
> 801d6b68 00000000 852e49a0
> [   49.430000] 7da0: 858c1520 8080300c 85228e00 858c1520 86fa9040
> 000003a4 858f7e34 858f7dc8
> [   49.430000] 7dc0: 801dc724 801d5d1c 00000000 858c1520 00000001
> 00000000 00000000 ffffffff
> [   49.430000] 7de0: 00000000 8010f6b8 0000030d 00000400 85353000
> 00000800 801ef480 86e1c000
> [   49.430000] 7e00: 858c1520 86e1c000 85228e00 00000000 86fa9040
> 1f69b357 858c1a00 858c1520
> [   49.430000] 7e20: 00000000 86e1c000 858f7e4c 858f7e38 8010f47c
> 801dc628 858c1520 858c1a00
> [   49.430000] 7e40: 858f7e84 858f7e50 801f6098 8010f44c 858f7e84
> 858f7e60 80239ad8 8587ff34
> [   49.430000] 7e60: 8587ff00 00000001 8524f520 00000000 859d34e0
> 000003a4 858f7f0c 858f7e88
> [   49.430000] 7e80: 80239ef0 801f5ca4 8587ff34 00000034 858f7e88
> 86e1c000 00000000 8010b4fc
> [   49.430000] 7ea0: 858f7ec4 858f7eb0 8010b4fc 801c8f74 00000000
> 86c20c00 85c6f180 859d34e0
> [   49.430000] 7ec0: 85228e00 85228e00 859255d8 86bbfe38 8581a000
> 858c1a00 858f7ef4 1f69b357
> [   49.430000] 7ee0: 801f9994 85228e00 fffffff8 8081cae4 8081f914
> 8581a000 000003a4 000003a4
> [   49.430000] 7f00: 858f7f2c 858f7f10 801f6734 80239bd4 85228e00
> 86e1c000 ffffe000 00000000
> [   49.430000] 7f20: 858f7f74 858f7f30 801f6afc 801f66ec 80845538
> 8080300c 55d72618 55df14c0
> [   49.430000] 7f40: 00000000 1f69b357 801f9648 55df14c0 55d72618
> 55df14c0 0000000b 80102644
> [   49.430000] 7f60: 858f6000 00000000 858f7f8c 858f7f78 801f6e1c
> 801f67ac 00000000 801f960c
> [   49.430000] 7f80: 858f7fa4 858f7f90 801f707c 801f6df8 00000010
> 55d72618 00000000 858f7fa8
> [   49.430000] 7fa0: 801024a0 801f7060 00000010 55d72618 55d93710
> 55df14c0 55d72618 55da9ed8
> [   49.430000] 7fc0: 00000010 55d72618 55df14c0 0000000b 7e99e758
> 55df17e0 55da8788 7e99e68c
> [   49.430000] 7fe0: 54c3573c 7e99e464 54b741fc 76c37d3c 60000010
> 55d93710 477fd871 477fdc71
> [   49.430000] [<801e0e90>] (unlink_anon_vmas) from [<801d5da0>]
> (free_pgtables+0x94/0xb0)
> [   49.430000] [<801d5da0>] (free_pgtables) from [<801dc724>]
> (exit_mmap+0x10c/0x220)
> [   49.430000] [<801dc724>] (exit_mmap) from [<8010f47c>] (mmput+0x40/0xc8)
> [   49.430000] [<8010f47c>] (mmput) from [<801f6098>]
> (flush_old_exec+0x404/0x5cc)
> [   49.430000] [<801f6098>] (flush_old_exec) from [<80239ef0>]
> (load_elf_binary+0x32c/0x1068)
> [   49.430000] [<80239ef0>] (load_elf_binary) from [<801f6734>]
> (search_binary_handler+0x58/0xc0)
> [   49.430000] [<801f6734>] (search_binary_handler) from [<801f6afc>]
> (do_execveat_common+0x360/0x64c)
> [   49.430000] [<801f6afc>] (do_execveat_common) from [<801f6e1c>]
> (do_execve+0x34/0x3c)
> [   49.430000] [<801f6e1c>] (do_execve) from [<801f707c>] (SyS_execve+0x2c/0x30)
> [   49.430000] [<801f707c>] (SyS_execve) from [<801024a0>]
> (ret_fast_syscall+0x0/0x38)
> [   49.430000] Code: 1a00002f e24bd028 e89daff0 e5946004 (e5967000)
> [   49.880000] ---[ end trace 587620580325ca16 ]---
> [  OK  ] Stopped Serial Getty on ttyS4.
> [   61.100000] ftgmac100 1e660000.ethernet eth0: no vlan ids left to set
> [   61.100000] ------------[ cut here ]------------
> [   61.100000] WARNING: CPU: 0 PID: 936 at
> /build/tmp/quanta/kernel-source/net/ncsi/ncsi-manage.c:256
> ncsi_start_channel_monitor+0x54/0x8c
> [   61.100000] CPU: 0 PID: 936 Comm: kworker/0:4 Tainted: G      D
>     4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
> [   61.100000] Hardware name: ASpeed SoC
> [   61.100000] Workqueue: events ncsi_dev_work
> [   61.100000] [<801087d4>] (unwind_backtrace) from [<80105f44>]
> (show_stack+0x20/0x24)
> [   61.100000] [<80105f44>] (show_stack) from [<802e070c>]
> (dump_stack+0x20/0x28)
> [   61.100000] [<802e070c>] (dump_stack) from [<80111b7c>] (__warn+0xe8/0x104)
> [   61.100000] [<80111b7c>] (__warn) from [<80111cb0>]
> (warn_slowpath_null+0x30/0x38)
> [   61.100000] [<80111cb0>] (warn_slowpath_null) from [<804c5370>]
> (ncsi_start_channel_monitor+0x54/0x8c)
> [   61.100000] [<804c5370>] (ncsi_start_channel_monitor) from
> [<804c64cc>] (ncsi_configure_channel+0x4e4/0x568)
> [   61.100000] [<804c64cc>] (ncsi_configure_channel) from [<804c6d18>]
> (ncsi_dev_work+0x3b8/0x3e8)
> [   61.100000] [<804c6d18>] (ncsi_dev_work) from [<80127130>]
> (process_one_work+0x1ac/0x384)
> [   61.100000] [<80127130>] (process_one_work) from [<801275f8>]
> (worker_thread+0x2b0/0x428)
> [   61.100000] [<801275f8>] (worker_thread) from [<8012cde4>]
> (kthread+0x13c/0x154)
> [   61.100000] [<8012cde4>] (kthread) from [<80102550>]
> (ret_from_fork+0x14/0x24)
> [   61.100000] ---[ end trace 587620580325ca17 ]---
> [   61.250000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
> [  176.400000] random: crng init done
>
> Any suggestions would be appreciated.
>
> Thanks,
> Patrick
