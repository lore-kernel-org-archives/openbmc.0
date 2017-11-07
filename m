Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22c; helo=mail-vk0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J794QcQA"; 
 dkim-atps=neutral
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWBJ94PD8zDrK6
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 12:13:12 +1100 (AEDT)
Received: by mail-vk0-x22c.google.com with SMTP id j2so6993345vki.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 17:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JBhdjwdGyrcm54gwJdgmJR9DySgun1GC0y6FlJDWlx8=;
 b=J794QcQAyRLsq2bPPmuZDMelUYq2ggIygec35cUTvvCQypolQHBSTLgI+1N/SASZiA
 ys0/aR6hNA0+NtBwi2LEWLzoNX4IZxOYMyUGW/agOQfciYSUGg54S8ew78s4TnScu6sm
 Mb1txjksAqTBj40yNo04Na5KD1OqdMsPY55NC+BA5prB7oxPWzolPAPwWwocCn2YtIMk
 qWNetjiIC7C1VTlWPYWsaidsXJoMSp4YxdqD4rBTD51VyWiZ5X7S1TAJZ18erESfIMbK
 We0U2gbeMtcdPUrLHI31aL7Ue8tu16Spd38ZPpBpqnptllzZJOKEt27TzHYNc0a4cNJk
 liPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JBhdjwdGyrcm54gwJdgmJR9DySgun1GC0y6FlJDWlx8=;
 b=KWeIfEUfD2E5qq23NxLg5LRvwwcc29/69isM0JcfRf1XZgVrr6FcCNp7g1p4ZtLsAf
 5urqs/gVOqdM1pPdtPjvWK9/bTSJ64e9yTTAD5P5Ef/VMzWZOAXlZRylfQUMALNX/53T
 yqGmzgOGvVw2TczGd9EJnemq10hhN5Zq0X3YqlWc+JRafvG/66lz8bpnF18N9jY0qWEC
 EsLs+qZH9EVkF/X4gSuWfDeWeoBMseZh/cV4FPI+tJXCQG9jh93i8mbVzF8Pa1whhaoQ
 ueroajSy4S2a5BkSaPKw4z9+VKyCdgKXnDnsmHSaX/hqLJy1Pu6G7f3q5zIraXi3r0Io
 aIwg==
X-Gm-Message-State: AMCzsaWfz6D8AzOXya8GifJ4kgZT6kMUdU0BRy8MQZCsTzLRuPuc9mZZ
 uq1sG6AFcwTyqeDFLn0PA5uU3GtWuvLA0gokWPeOMTb/xU4=
X-Google-Smtp-Source: ABhQp+R2MWR/tFu66ufQgcJ1zubPlNs6dmaDUpWs3amYdVZ+AO0N045hbs6SMNB7LV50+nPJ8+uwqdfbpyJNnaYPyag=
X-Received: by 10.31.167.151 with SMTP id q145mr12583545vke.49.1510017189715; 
 Mon, 06 Nov 2017 17:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Mon, 6 Nov 2017 17:12:48 -0800 (PST)
From: Patrick Venture <venture@google.com>
Date: Mon, 6 Nov 2017 17:12:48 -0800
Message-ID: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
Subject: linux 4.10 on ast2400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Tue, 07 Nov 2017 01:13:14 -0000

I've been doing testing with linux 4.10 on the ast2400 and on some
percentage (20% of systems) when they boot they're not able to really
launch applications.  The one we see failing is agetty, but ipmid also
ends up not running.  Here is the log from what we're seeing on the
quanta-q71l:

[  OK  ] Started Clear one time boot overrides.
[  OK  ] Found device /dev/ttyS4.
[  OK  ] Found device /dev/ttyVUART0.
[   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
[  OK  ] Started Network Service.
[   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
[  OK  ] Started Phosphor Inventory Manager.
[  OK  ] Started Phosphor Settings Daemon.
[  OK  ] Reached target Network.
         Starting Permit User Sessions...
[  OK  ] Started Lightweight SLP Server.
[  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyVUART0.
[  OK  ] Started Phosphor Inband IPMI.
[  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Serial Getty on ttyS4.
[  OK  ] Reached target Login Prompts.
[  OK  ] Reached target Multi-User System.
[   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
[   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
[   49.430000] Unable to handle kernel paging request at virtual
address e1a00006
[   49.430000] pgd = 85354000
[   49.430000] [e1a00006] *pgd=00000000
[   49.430000] Internal error: Oops: 1 [#1] ARM
[   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
[   49.430000] Hardware name: ASpeed SoC
[   49.430000] task: 86e1c000 task.stack: 858f6000
[   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0
[   49.430000] LR is at 0x853ea140
[   49.430000] pc : [<801e0e90>]    lr : [<853ea140>]    psr: 80000013
[   49.430000] sp : 858f7d58  ip : 00000000  fp : 858f7d8c
[   49.430000] r10: 8081ca58  r9 : 858572fc  r8 : 858572c0
[   49.430000] r7 : 85154280  r6 : e1a00006  r5 : 853dfff8  r4 : 853dfff8
[   49.430000] r3 : 85154280  r2 : 853e0000  r1 : 85c08e9c  r0 : 00000000
[   49.430000] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   49.430000] Control: 0005317f  Table: 45354000  DAC: 00000051
[   49.430000] Process (agetty) (pid: 932, stack limit = 0x858f6190)
[   49.430000] Stack: (0x858f7d58 to 0x858f8000)
[   49.430000] 7d40:
    801dacd8 801db374
[   49.430000] 7d60: 858f7d8c 85857318 858572c0 858f7dcc 00002000
00000000 769c3000 858571b8
[   49.430000] 7d80: 858f7dc4 858f7d90 801d5da0 801e0e08 769c3000
801d6b68 00000000 852e49a0
[   49.430000] 7da0: 858c1520 8080300c 85228e00 858c1520 86fa9040
000003a4 858f7e34 858f7dc8
[   49.430000] 7dc0: 801dc724 801d5d1c 00000000 858c1520 00000001
00000000 00000000 ffffffff
[   49.430000] 7de0: 00000000 8010f6b8 0000030d 00000400 85353000
00000800 801ef480 86e1c000
[   49.430000] 7e00: 858c1520 86e1c000 85228e00 00000000 86fa9040
1f69b357 858c1a00 858c1520
[   49.430000] 7e20: 00000000 86e1c000 858f7e4c 858f7e38 8010f47c
801dc628 858c1520 858c1a00
[   49.430000] 7e40: 858f7e84 858f7e50 801f6098 8010f44c 858f7e84
858f7e60 80239ad8 8587ff34
[   49.430000] 7e60: 8587ff00 00000001 8524f520 00000000 859d34e0
000003a4 858f7f0c 858f7e88
[   49.430000] 7e80: 80239ef0 801f5ca4 8587ff34 00000034 858f7e88
86e1c000 00000000 8010b4fc
[   49.430000] 7ea0: 858f7ec4 858f7eb0 8010b4fc 801c8f74 00000000
86c20c00 85c6f180 859d34e0
[   49.430000] 7ec0: 85228e00 85228e00 859255d8 86bbfe38 8581a000
858c1a00 858f7ef4 1f69b357
[   49.430000] 7ee0: 801f9994 85228e00 fffffff8 8081cae4 8081f914
8581a000 000003a4 000003a4
[   49.430000] 7f00: 858f7f2c 858f7f10 801f6734 80239bd4 85228e00
86e1c000 ffffe000 00000000
[   49.430000] 7f20: 858f7f74 858f7f30 801f6afc 801f66ec 80845538
8080300c 55d72618 55df14c0
[   49.430000] 7f40: 00000000 1f69b357 801f9648 55df14c0 55d72618
55df14c0 0000000b 80102644
[   49.430000] 7f60: 858f6000 00000000 858f7f8c 858f7f78 801f6e1c
801f67ac 00000000 801f960c
[   49.430000] 7f80: 858f7fa4 858f7f90 801f707c 801f6df8 00000010
55d72618 00000000 858f7fa8
[   49.430000] 7fa0: 801024a0 801f7060 00000010 55d72618 55d93710
55df14c0 55d72618 55da9ed8
[   49.430000] 7fc0: 00000010 55d72618 55df14c0 0000000b 7e99e758
55df17e0 55da8788 7e99e68c
[   49.430000] 7fe0: 54c3573c 7e99e464 54b741fc 76c37d3c 60000010
55d93710 477fd871 477fdc71
[   49.430000] [<801e0e90>] (unlink_anon_vmas) from [<801d5da0>]
(free_pgtables+0x94/0xb0)
[   49.430000] [<801d5da0>] (free_pgtables) from [<801dc724>]
(exit_mmap+0x10c/0x220)
[   49.430000] [<801dc724>] (exit_mmap) from [<8010f47c>] (mmput+0x40/0xc8)
[   49.430000] [<8010f47c>] (mmput) from [<801f6098>]
(flush_old_exec+0x404/0x5cc)
[   49.430000] [<801f6098>] (flush_old_exec) from [<80239ef0>]
(load_elf_binary+0x32c/0x1068)
[   49.430000] [<80239ef0>] (load_elf_binary) from [<801f6734>]
(search_binary_handler+0x58/0xc0)
[   49.430000] [<801f6734>] (search_binary_handler) from [<801f6afc>]
(do_execveat_common+0x360/0x64c)
[   49.430000] [<801f6afc>] (do_execveat_common) from [<801f6e1c>]
(do_execve+0x34/0x3c)
[   49.430000] [<801f6e1c>] (do_execve) from [<801f707c>] (SyS_execve+0x2c/0x30)
[   49.430000] [<801f707c>] (SyS_execve) from [<801024a0>]
(ret_fast_syscall+0x0/0x38)
[   49.430000] Code: 1a00002f e24bd028 e89daff0 e5946004 (e5967000)
[   49.880000] ---[ end trace 587620580325ca16 ]---
[  OK  ] Stopped Serial Getty on ttyS4.
[   61.100000] ftgmac100 1e660000.ethernet eth0: no vlan ids left to set
[   61.100000] ------------[ cut here ]------------
[   61.100000] WARNING: CPU: 0 PID: 936 at
/build/tmp/quanta/kernel-source/net/ncsi/ncsi-manage.c:256
ncsi_start_channel_monitor+0x54/0x8c
[   61.100000] CPU: 0 PID: 936 Comm: kworker/0:4 Tainted: G      D
    4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
[   61.100000] Hardware name: ASpeed SoC
[   61.100000] Workqueue: events ncsi_dev_work
[   61.100000] [<801087d4>] (unwind_backtrace) from [<80105f44>]
(show_stack+0x20/0x24)
[   61.100000] [<80105f44>] (show_stack) from [<802e070c>]
(dump_stack+0x20/0x28)
[   61.100000] [<802e070c>] (dump_stack) from [<80111b7c>] (__warn+0xe8/0x104)
[   61.100000] [<80111b7c>] (__warn) from [<80111cb0>]
(warn_slowpath_null+0x30/0x38)
[   61.100000] [<80111cb0>] (warn_slowpath_null) from [<804c5370>]
(ncsi_start_channel_monitor+0x54/0x8c)
[   61.100000] [<804c5370>] (ncsi_start_channel_monitor) from
[<804c64cc>] (ncsi_configure_channel+0x4e4/0x568)
[   61.100000] [<804c64cc>] (ncsi_configure_channel) from [<804c6d18>]
(ncsi_dev_work+0x3b8/0x3e8)
[   61.100000] [<804c6d18>] (ncsi_dev_work) from [<80127130>]
(process_one_work+0x1ac/0x384)
[   61.100000] [<80127130>] (process_one_work) from [<801275f8>]
(worker_thread+0x2b0/0x428)
[   61.100000] [<801275f8>] (worker_thread) from [<8012cde4>]
(kthread+0x13c/0x154)
[   61.100000] [<8012cde4>] (kthread) from [<80102550>]
(ret_from_fork+0x14/0x24)
[   61.100000] ---[ end trace 587620580325ca17 ]---
[   61.250000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
[  176.400000] random: crng init done

Any suggestions would be appreciated.

Thanks,
Patrick
