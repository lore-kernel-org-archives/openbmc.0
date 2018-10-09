Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VSly1EhG"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V3YS1c1QzF3Lx
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 04:06:51 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 1-v6so1131572plv.7
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IelF2hW+3ORXXwJrL+3/bNRue6zf1CM1V/SYR6ThGKk=;
 b=VSly1EhGN9ZpE2w6YLkhYpipH9voGJdE5vOqkkrfTda+ZQUAdxKIz/BPltjC58YoZE
 3SlyNdTA/WbybJeDPJA91YSTDIlxWEU1PNyPG6kFrr39IYhQtFcIhCKpWIqCrCOF9Xq3
 Nf6pop5fd394wSbMrrwYb4AEW6BYi7WhL3drGQ+1zSikIPqn6gmlEQVjjbpv0euMgCkt
 mORURbzBiT/jngqTC5csrZGCvU8UQvQL9qClz2hkc4CVvMXSakZQLhFD0WEfoc2OGrMW
 TyWXnTZGm7UcbnidzilhytqTd9xSACoPAK3VD7xlxGuw7Yh8lo8s0OI/ho6hh98g1Jtj
 mvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IelF2hW+3ORXXwJrL+3/bNRue6zf1CM1V/SYR6ThGKk=;
 b=nSaaZMT0YgsT7p2kiYfAX2LV5GYg8vl33pyHXYr1XZE44CtHNy/G1VpT4Hg5G8Pcir
 S7DpERxxvpOsfq8oeCmVa7SYBby7TG7VaSqkab/6U2SFJLy9hwoiO+iVdTgKwsLTFdpS
 l0IXf3MtRZ8v5Ruo66s++G/UyoQBl3TOfh9jqhGuhXQVbIEq9IvcFxtO7TEIbHBTyDuo
 VaZ8I84MPO7CWh6fG6yQyzsSWLfIPhfPqmOwPIYUw7aC9ZYJmL4SSrTFC5RafzwbuCHL
 L2VedX3SCwcUwG+n2v6wQAZa5ObQse5zySmcKf030B0LxozJrBMzHDMPLzune1TV5KeK
 w+OA==
X-Gm-Message-State: ABuFfoiEDmWLJvf5vIPYQcz66fxGuzkdl6mcTvYdDos9yWkSFfTey36Z
 tnj2fzYltwcKFwp+mN/AOnCEHXheg805phswEIR3QLmDqmWYSA==
X-Google-Smtp-Source: ACcGV61rWrR+sb/CNWTpMzXGo3zv/vP3nv8qoiEspJd8NNE4AhOQQdCPsFibGR4+xj9wcvxJ0OcCZxDbV7ScUA2YKek=
X-Received: by 2002:a17:902:7e49:: with SMTP id
 a9-v6mr29160886pln.149.1539104809613; 
 Tue, 09 Oct 2018 10:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
In-Reply-To: <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Oct 2018 10:06:38 -0700
Message-ID: <CAO=notxu=VdUUyo4GNp60ucRvn+UiNZwn7_nXhopZiMnxvVPZQ@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 09 Oct 2018 17:06:53 -0000

On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.

So, I did also jump phosphor versions, but my running process list is
nearly identical to what it was, so I don't expect to lose
substantially more memory from just this.

ps -eaf
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  1 14:44 ?        00:00:21 /sbin/init
root         2     0  0 14:44 ?        00:00:00 [kthreadd]
root         4     2  0 14:44 ?        00:00:00 [kworker/0:0H-kb]
root         6     2  0 14:44 ?        00:00:00 [mm_percpu_wq]
root         7     2  0 14:44 ?        00:00:03 [ksoftirqd/0]
root         8     2  0 14:44 ?        00:00:00 [watchdog/0]
root         9     2  0 14:44 ?        00:00:00 [kdevtmpfs]
root        10     2  0 14:44 ?        00:00:00 [oom_reaper]
root        71     2  0 14:44 ?        00:00:00 [kworker/u2:2-ev]
root       171     2  0 14:44 ?        00:00:00 [writeback]
root       173     2  0 14:44 ?        00:00:00 [crypto]
root       175     2  0 14:44 ?        00:00:00 [kblockd]
root       194     2  0 14:44 ?        00:00:00 [watchdogd]
root       200     2  0 14:44 ?        00:00:05 [kworker/0:1-eve]
root       220     2  0 14:44 ?        00:00:00 [kswapd0]
root       269     2  0 14:44 ?        00:00:00 [hwrng]
root       508     2  0 14:44 ?        00:00:00 [ipv6_addrconf]
root       538     2  0 14:44 ?        00:00:00 [kworker/0:1H-kb]
root       566     2  0 14:44 ?        00:00:00 [jffs2_gcd_mtd5]
root       684     1  0 14:44 ?        00:00:17 /lib/systemd/systemd-journald
root       704     1  0 14:44 ?        00:00:01 /lib/systemd/systemd-udevd
systemd+   927     1  0 14:44 ?        00:00:01 /lib/systemd/systemd-timesyncd
systemd+   965     1  0 14:44 ?        00:00:01 /lib/systemd/systemd-resolved
root       969     1  0 14:44 ?        00:00:02 /usr/sbin/rsyslogd -n
root       970     1  0 14:44 ttyS5    00:00:02 obmc-console-server
--config /etc/obmc-console.conf ttyVUART0
message+   974     1  5 14:44 ?        00:01:46 /usr/bin/dbus-daemon
--system --address=systemd: --nofork --nopidfile --systemd-activation
--syslog-only
root       982     1  0 14:44 ?        00:00:14 btbridged
root       983     1  0 14:44 ?        00:00:01 /bin/bash
/usr/sbin/set_gateway_arp.sh eth1
root       984     1  0 14:44 ?        00:00:00 /usr/sbin/snoopd -d
/dev/aspeed-lpc-snoop0 -b 1
root       985     1  0 14:44 ?        00:00:00 phosphor-log-manager
root       986     1  0 14:44 ?        00:00:00 phosphor-settings-manager
root       987     1  0 14:44 ?        00:00:00 phosphor-rsyslog-conf
root       989     1  2 14:44 ?        00:00:47 python
/usr/sbin/phosphor-mapper --path_namespaces=/org/openbmc
/xyz/openbmc_project --interface_namespaces=xyz.openbmc_project
org.openbmc --blacklists= --
root       990     1  0 14:44 ?        00:00:02 phosphor-watchdog
--service=xyz.openbmc_project.Watchdog
--path=/xyz/openbmc_project/watchdog/host0
--target=iceblink-reset.target --continue
root       991     1  0 14:44 ?        00:00:00 /usr/sbin/rngd -f
root       993     1  0 14:44 ?        00:00:01 phosphor-inventory
avahi      994     1  0 14:44 ?        00:00:01 avahi-daemon: running
[iceblink.local]
avahi      995   994  0 14:45 ?        00:00:00 avahi-daemon: chroot helper
root       998     1  1 14:45 ?        00:00:28 ipmid
root      1000     1  0 14:45 ?        00:00:00 slpd
root      1001     1  0 14:45 ttyS4    00:00:00 /bin/login --
root      1005     1  0 14:45 ?        00:00:00 phosphor-hwmon-readd
-o /iio-hwmon-battery
root      1008     1  0 14:45 ?        00:00:02 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4c
root      1016     1  0 14:45 ?        00:00:00 phosphor-network-manager
root      1017     1  0 14:45 ?        00:00:00 phosphor-dbus-monitor
root      1021     1  0 14:45 ?        00:00:00 phosphor-network-snmpconf
root      1024     1  0 14:45 ?        00:00:00 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@0/psu@59
root      1025     1  0 14:45 ?        00:00:02 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4f
root      1026     1  0 14:45 ?        00:00:00 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@1/psu@58
root      1027     1  0 14:45 ?        00:00:02 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4e
root      1028     1  0 14:45 ?        00:00:01 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@2/psu@58
root      1029     1  0 14:45 ?        00:00:16 phosphor-hwmon-readd
-o /ahb/apb/pwm-tacho-controller@1e786000
root      1030     1  0 14:45 ?        00:00:00 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@3/psu@59
root      1034     1  1 14:45 ?        00:00:22 phosphor-hwmon-readd
-o /iio-hwmon
systemd+  1046     1  0 14:45 ?        00:00:00 /lib/systemd/systemd-networkd
root      1057     1  0 14:45 ?        00:00:00 /usr/sbin/watchdog
root      1070     1  2 14:45 ?        00:00:56 /usr/sbin/swampd
root      1090  1001  0 14:46 ttyS4    00:00:00 -sh
root      1123     2  0 14:50 ?        00:00:00 [kworker/u2:0-ev]
root      1272     2  0 15:13 ?        00:00:00 [kworker/0:2-eve]
root      1304   983  1 15:18 ?        00:00:00 sleep 10
root      1305  1090  0 15:18 ttyS4    00:00:00 ps -eaf


>
> -Ed
>
>
>
> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
> >
> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> > stuff once things are settled, whereas before I could have up to
> > 35MiB.
> >
> > Here are some dumps:
> >
> > Now:
> > [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
> > [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> > [    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
> > [    0.000000] Memory policy: Data cache writeback
> > [    0.000000] On node 0 totalpages: 30720
> > [    0.000000]   Normal zone: 240 pages used for memmap
> > [    0.000000]   Normal zone: 0 pages reserved
> > [    0.000000]   Normal zone: 30720 pages, LIFO batch:7
> > [    0.000000] random: get_random_bytes called from
> > start_kernel+0x8c/0x4c0 with crng_init=0
> > [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> > [    0.000000] pcpu-alloc: [0] 0
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 30480
> > [    0.000000] Kernel command line: console=ttyS4,115200n8
> > root=/dev/ram rw clk_ignore_unused
> > [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> > [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> > [    0.000000] Memory: 111076K/122880K available (5120K kernel code,
> > 365K rwdata, 1104K rodata, 1024K init, 143K bss, 11804K reserved, 0K
> > cma-reserved)
> > [    0.000000] Virtual kernel memory layout:
> > [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> > [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> > [    0.000000]     vmalloc : 0x88000000 - 0xff800000   (1912 MB)
> > [    0.000000]     lowmem  : 0x80000000 - 0x87800000   ( 120 MB)
> > [    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)
> > [    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
> > [    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 366 kB)
> > [    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 144 kB)
> > [    0.000000] ftrace: allocating 18546 entries in 55 pages
> >
> > cat /proc/meminfo
> > MemTotal:         113952 kB
> > MemFree:           19944 kB
> > MemAvailable:      62432 kB
> > Buffers:           11032 kB
> > Cached:            48732 kB
> > SwapCached:            0 kB
> > Active:            40940 kB
> > Inactive:          26728 kB
> > Active(anon):      17068 kB
> > Inactive(anon):     9316 kB
> > Active(file):      23872 kB
> > Inactive(file):    17412 kB
> > Unevictable:        9088 kB
> > Mlocked:               0 kB
> > SwapTotal:             0 kB
> > SwapFree:              0 kB
> > Dirty:                 0 kB
> > Writeback:             0 kB
> > AnonPages:         17008 kB
> > Mapped:            21120 kB
> > Shmem:              9392 kB
> > Slab:              11956 kB
> > SReclaimable:       6472 kB
> > SUnreclaim:         5484 kB
> > KernelStack:         560 kB
> > PageTables:         1384 kB
> > NFS_Unstable:          0 kB
> > Bounce:                0 kB
> > WritebackTmp:          0 kB
> > CommitLimit:       56976 kB
> > Committed_AS:     124224 kB
> > VmallocTotal:    1957888 kB
> > VmallocUsed:           0 kB
> > VmallocChunk:          0 kB
> >
> > Before:
> > dmesg
> >  Normal zone: 30720 pages, LIFO batch:7
> > pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> > pcpu-alloc: [0] 0
> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 30480
> > Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
> > PID hash table entries: 512 (order: -1, 2048 bytes)
> > Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> > Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> > Memory: 113644K/122880K available (4206K kernel code, 150K rwdata,
> > 860K rodata, 1024K init, 111K bss, 9236K reserved, 0K cma-reserved)
> > Virtual kernel memory layout:
> >    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> >    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> >    vmalloc : 0xc8000000 - 0xff800000   ( 888 MB)
> >    lowmem  : 0xc0000000 - 0xc7800000   ( 120 MB)
> >      .text : 0xc0008000 - 0xc05f28ec   (6059 kB)
> >      .init : 0xc0600000 - 0xc0700000   (1024 kB)
> >      .data : 0xc0700000 - 0xc0725be8   ( 151 kB)
> >       .bss : 0xc0725be8 - 0xc0741a38   ( 112 kB)
> >
> > cat /proc/meminfo
> > MemTotal:         116224 kB
> > MemFree:           35832 kB
> > MemAvailable:      76952 kB
> > Buffers:            9596 kB
> > Cached:            39776 kB
> > SwapCached:            0 kB
> > Active:            40516 kB
> > Inactive:          25432 kB
> > Active(anon):      17004 kB
> > Inactive(anon):     6968 kB
> > Active(file):      23512 kB
> > Inactive(file):    18464 kB
> > Unevictable:           0 kB
> > Mlocked:               0 kB
> > SwapTotal:             0 kB
> > SwapFree:              0 kB
> > Dirty:                 0 kB
> > Writeback:             0 kB
> > AnonPages:         16588 kB
> > Mapped:            20064 kB
> > Shmem:              7396 kB
> > Slab:               9424 kB
> > SReclaimable:       4532 kB
> > SUnreclaim:         4892 kB
> > KernelStack:         720 kB
> > PageTables:         1328 kB
> > NFS_Unstable:          0 kB
> > Bounce:                0 kB
> > WritebackTmp:          0 kB
> > CommitLimit:       58112 kB
> > Committed_AS:     142324 kB
> > VmallocTotal:     909312 kB
> > VmallocUsed:           0 kB
> > VmallocChunk:          0 kB
> >
> > This matters for a few reasons:
> > 1) my memory chip is too small to be practical and I need all the
> > bytes I can get.
> > 2) I need at least 32MiB to load a new firmware image.
> >
> > I dropped all the python except the mapper, and I dropped the newer
> > daemons from my build to clear out that difference.  It was originally
> > about 16MiB difference, so I was thinking that something is now being
> > mapped by default that wasn't before, such as part of a flash image.
> >
> > Patrick
