Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RjWSAHKR"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WCtk6PlzzF3J8
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 01:25:50 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id c8-v6so4318682plo.9
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lcfdE8sgMz9HHJNt+Xv1ROfxfhBrRP9Ou3T40J3/aps=;
 b=RjWSAHKRafXEmItToQR8evyghlJ7ZJMeM+ZXxCFLo0sy/SE6uf0qdeC0Ojfkmti0S2
 7s3AhfI2nO/3gkFjvkN3m6oUUpBzcRNCl7LvQnvItMGKqrbAvcxSlSLjxbcd+Ke3YRdA
 5sTlLxQCd3hKacRQmDWI15alk2vBtcL2YvRSbD3Jx+wztuHBEwf3JedEzA2LiTSThWjq
 7vzSpUeGuPIvx/YV3w9rYIMDYMQWncQ5DpQdjV0FH3FymQCWWWpxNjd93X0AMgt1EMCi
 Bl+WGk9cVrpJUjVnpOiyy5aoVojCpLbp3NaMzZ8jeSCsWMZjZPKOEZ9brYsWNDm2dX9f
 EUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcfdE8sgMz9HHJNt+Xv1ROfxfhBrRP9Ou3T40J3/aps=;
 b=bqraA/Zd7ItRq80VQitD1o2h1NVRod0cN088VPV+Z2AE+2AWXHRrIu3zyia3Y9P25a
 Uwfs6C6KM704omdlBmZh3uLslFeRjdzJ8GN4lLV/yV734FM6sbU8bJ0j6UbQwzxzRQEW
 kAq2gJu1tqPA0mjyzq6QyOrYn2SJ6Z7iGudsdn1qR9Zds1o5OKrri77BMIagnYIQuoC2
 IxmEvvjl//3hJ19QAxLiAH1oUh3hi45wQZmS9z9oLzrLa8SHMLrkPXshxyouaP11mEih
 DU1csqRTcP7Qxd9eRzO2r40jNhM8YI5V54DlsMwA/lkgIvLh5oIa1x7t/vOgcz3JZTsv
 ddvg==
X-Gm-Message-State: ABuFfog4VxAxDS6OkewLSrCDWwApVPako5RO1ZIQndnAH3mLZB671Q5j
 IiiPq1rF87Iy4GxvsMEshCHEkKvEAowaamd9Xxki+w==
X-Google-Smtp-Source: ACcGV63fSpaalm3EEcoKMNx3VT7BuT6OWMP+DSbtoRjWyCU8DteuJlZLeLjKQmuqNDS/vhXJ6VB5ZXgf09B+zSAngDs=
X-Received: by 2002:a17:902:a03:: with SMTP id
 3-v6mr1782357plo.323.1539267947825; 
 Thu, 11 Oct 2018 07:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
 <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
 <CAO=notwqFd5fHraUvTMSjK=6Cws13qgCRyf6=05_XTrsbdwSRA@mail.gmail.com>
 <CAO=notySRV2yzMfQ72MqUUgzAYkk9zMruBFFzbi1jPsXLzbDCg@mail.gmail.com>
In-Reply-To: <CAO=notySRV2yzMfQ72MqUUgzAYkk9zMruBFFzbi1jPsXLzbDCg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 11 Oct 2018 07:25:36 -0700
Message-ID: <CAO=notyQT1MW7i0AgOBNnTy5crrsO2Lg7sbBaFqE5rxesap1vA@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Thu, 11 Oct 2018 14:25:52 -0000

On Wed, Oct 10, 2018 at 9:17 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Oct 10, 2018 at 8:31 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Tue, Oct 9, 2018 at 3:25 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Wed, 10 Oct 2018 at 03:38, Kun Yi <kunyi@google.com> wrote:
> > > >
> > > > A somewhat tedious way to test would be to build and boot with 'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, and then compare the kernel memory footprint.
> > > >
> > > > On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
> > > >>
> > > >> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.
> > >
> > > HI team. Just a reminder about email etiquette on the mailing lists
> > > that Brad posted a while back:
> > >
> > >  https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_style
> > >
> > > In particular the top posting bit, which makes it hard to reply to this thread.
> > >
> > > Back to the issue at hand:
> > >
> > > >> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
> > > >> >
> > > >> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> > > >> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> > > >> > stuff once things are settled, whereas before I could have up to
> > > >> > 35MiB.
> > >
> > > Are you able to boot the new kernel with the old userspace? This will
> > > allow you to compare like for like (even if the system is not fully
> > > functional in that state). Alternatively, boot it with a small
> > > non-openbmc initrd to allow comparisons as Kun suggested.
> >
> > I'm going to try building an older kernel with the newer userspace
> > first (it's a slightly easier experiment).  I'll post back on this
> > thread once I have a little more information.
>
> Running 4.17 kernel with new userspace:
>
> MemTotal   113944
> MemFree   19316
> MemAvailable   61700
> Buffers    11072
> Cached   48872
> Active   39012
> Inactive  29200
> Active(anon) 17432
> Inactive(anon)  9332
> Active(file)   21580
> Inactive(file) 19868
> Unevitable    9088
> AnonPages  17372
> Mapped       22704
> Shmem     9408
> Slab             11704
> SReclaimable 6204
> SUnreclaim  5500
> KernelStack  648
> PageTables  1472
> CommitLimit  56972
> Commited_AS  125448
> VmallocTota   1957888
>
> Running 4.7.10 kernel with new userspace:
>
> MemTotal: 116224 kB
> MemFree: 27396 kB  <--- older kernel same userspace, ~8MiB difference right off.
> MemAvailable: 74212 kB
> Buffers: 10380 kB
> Cached: 46456 kB
> Active: 40516 kB
> Inactive: 33380 kB
> Active(anon): 17124 kB
> Inactive(anon): 9356 kB
> Active(file): 23392 kB
> Inactive(file): 24024 kB
> Unevictable: 0 kB
> AnonPages: 17076 kB
> Mapped: 20696 kB
> Shmem: 9420 kB
> Slab: 9660 kB
> SReclaimable: 4776 kB
> SUnreclaim: 4884 kB
> KernelStack: 744 kB
> PageTables: 1364 kB
> CommitLimit: 58112 kB
> Committed_AS: 116540 kB
> VmallocTotal: 909312 kB
>
> Running 4.7.10 kernel with old (openbmc 1.99) userspace:
>
> MemTotal:         116224 kB
> MemFree:           39636 kB  <--- everything before ~12MiB difference.
> MemAvailable:      80224 kB
> Buffers:            9500 kB
> Cached:            38940 kB
> SwapCached:            0 kB
> Active:            36472 kB
> Inactive:          26156 kB
> Active(anon):      14452 kB
> Inactive(anon):     6456 kB
> Active(file):      22020 kB
> Inactive(file):    19700 kB
> Unevictable:           0 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:         14200 kB
> Mapped:            19584 kB
> Shmem:              6720 kB
> Slab:               8928 kB
> SReclaimable:       4256 kB
> SUnreclaim:         4672 kB
> KernelStack:         744 kB
> PageTables:         1320 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:       58112 kB
> Committed_AS:     139392 kB
> VmallocTotal:     909312 kB
> VmallocUsed:           0 kB
> VmallocChunk:          0 kB
>
> Losing those 8MiB with just a kernel difference, makes me think it is
> always loading more or there's some default 8MiB window being eaten
> now that wasn't before.  I deliberately have the VGA window, but
> that's in both kernel's device-trees, so that isn't it -- but it makes
> me think it's something along those lines.
>
> As far as the rest of the loss in userspace :( :( I'll take a look at
> what is built and compare sizes -- my process lists are basically
> identical between old and new userspace, so something in them must
> have changed?

Running with 2.3+ openbmc:

~# ps -eaf
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 Oct08 ?        00:00:31 /sbin/init
root         2     0  0 Oct08 ?        00:00:00 [kthreadd]
root         4     2  0 Oct08 ?        00:00:00 [kworker/0:0H]
root         5     2  0 Oct08 ?        00:00:00 [kworker/u2:0]
root         6     2  0 Oct08 ?        00:00:00 [mm_percpu_wq]
root         7     2  0 Oct08 ?        00:01:16 [ksoftirqd/0]
root         8     2  0 Oct08 ?        00:00:01 [watchdog/0]
root         9     2  0 Oct08 ?        00:00:00 [kdevtmpfs]
root        10     2  0 Oct08 ?        00:00:00 [oom_reaper]
root        11     2  0 Oct08 ?        00:00:00 [kworker/u2:1]
root       151     2  0 Oct08 ?        00:00:00 [writeback]
root       153     2  0 Oct08 ?        00:00:00 [crypto]
root       155     2  0 Oct08 ?        00:00:00 [kblockd]
root       156     2  0 Oct08 ?        00:00:00 [watchdogd]
root       176     2  0 Oct08 ?        00:00:22 [kworker/0:1]
root       197     2  0 Oct08 ?        00:00:00 [kswapd0]
root       245     2  0 Oct08 ?        00:00:00 [hwrng]
root       467     2  0 Oct08 ?        00:00:00 [ipv6_addrconf]
root       497     2  0 Oct08 ?        00:00:00 [kworker/0:1H]
root       525     2  0 Oct08 ?        00:00:00 [jffs2_gcd_mtd5]
root       551     1  0 Oct08 ?        00:02:46 /lib/systemd/systemd-journald
root       647     1  0 Oct08 ?        00:00:01 /lib/systemd/systemd-udevd
systemd+   866     1  0 Oct08 ?        00:00:28 /lib/systemd/systemd-timesyncd
systemd+   905     1  0 Oct08 ?        00:00:01 /lib/systemd/systemd-resolved
root       909     1  0 Oct08 ?        00:00:00 phosphor-log-manager
root       910     1  0 Oct08 ?        00:00:01 phosphor-settings-manager
message+   911     1  1 Oct08 ?        00:16:18 /usr/bin/dbus-daemon
--system --address=systemd: --nofork --nopidfile --systemd-activation
--syslog-only
root       912     1  0 Oct08 ?        00:00:46 python
/usr/sbin/phosphor-mapper --path_namespaces=/org/openbmc
/xyz/openbmc_project --interface_namespaces=xyz.openbmc_project
org.openbmc --blacklists= --
root       913     1  0 Oct08 ?        00:00:10 btbridged
root       914     1  0 Oct08 ?        00:00:00 /sbin/klogd -n
root       915     1  0 Oct08 ?        00:00:03 phosphor-inventory
avahi      916     1  0 Oct08 ?        00:00:08 avahi-daemon: running
[iceblink.local]
root       917     1  0 Oct08 ?        00:00:00 /usr/sbin/snoopd -d
/dev/aspeed-lpc-snoop0 -b 1
root       918     1  0 Oct08 ?        00:00:06 /usr/sbin/rngd -f
root       919     1  0 Oct08 ?        00:00:00 /sbin/syslogd -n
root       921     1  0 Oct08 ?        00:01:50 /bin/bash
/usr/sbin/set_gateway_arp.sh eth1
root       924     1  0 Oct08 ?        00:00:00 phosphor-watchdog
--service=xyz.openbmc_project.Watchdog
--path=/xyz/openbmc_project/watchdog/host0
--target=iceblink-reset.target --continue
root       926     1  0 Oct08 ttyS5    00:00:00 obmc-console-server
--config /etc/obmc-console.conf ttyVUART0
root       931     2  0 Oct08 ?        00:00:00 [kworker/0:2]
avahi      936   916  0 Oct08 ?        00:00:00 avahi-daemon: chroot helper
root       938     1  0 Oct08 ?        00:00:01 ipmid
root       939     1  0 Oct08 ?        00:00:00 slpd
root       941     1  0 Oct08 ttyS4    00:00:00 /bin/login --
root       945     1  0 Oct08 ?        00:00:14 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@2/psu@58
root       947     1  0 Oct08 ?        00:00:12 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@1/psu@58
root       949     1  0 Oct08 ?        00:00:00 phosphor-hwmon-readd
-o /iio-hwmon-battery
root       950     1  0 Oct08 ?        00:01:05 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4c
root       954     1  0 Oct08 ?        00:00:00 phosphor-dbus-monitor
root       960     1  0 Oct08 ?        00:00:00 phosphor-network-snmpconf
root       965     1  0 Oct08 ?        00:00:03 phosphor-network-manager
root       969     1  0 Oct08 ?        00:00:18 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@3/psu@59
root       970     1  0 Oct08 ?        00:01:03 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4e
root       971     1  0 Oct08 ?        00:00:21 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@0/psu@59
root       972     1  0 Oct08 ?        00:07:59 phosphor-hwmon-readd
-o /ahb/apb/pwm-tacho-controller@1e786000
root       973     1  0 Oct08 ?        00:01:05 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4f
root       975     1  1 Oct08 ?        00:11:36 phosphor-hwmon-readd
-o /iio-hwmon
systemd+   992     1  0 Oct08 ?        00:00:00 /lib/systemd/systemd-networkd
root      1006     1  0 Oct08 ?        00:02:00 /usr/sbin/ncsid eth1
root      1009     1  2 Oct08 ?        00:28:22 /usr/sbin/swampd
root      1012     1  0 Oct08 ?        00:00:04 /usr/sbin/watchdog
root     12836     1  0 01:46 ?        00:00:09 /usr/sbin/nemorad eth1
root     19051     2  0 07:33 ?        00:00:00 [kworker/u2:2]
root     19054   921  0 07:33 ?        00:00:00 sleep 10
root     19055   941  3 07:33 ttyS4    00:00:00 -sh
root     19059 19055  0 07:33 ttyS4    00:00:00 ps -eaf

The phosphor-hwmon each take 4%

top - 07:36:25 up 16:52,  1 user,  load average: 0.15, 0.14, 0.10
Tasks:  65 total,   1 running,  52 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.9 us,  2.7 sy,  0.0 ni, 94.3 id,  0.0 wa,  0.0 hi,  0.1 si,  0.0 st
KiB Mem :   113960 total,    21252 free,    27920 used,    64788 buff/cache
KiB Swap:        0 total,        0 free,        0 used.    62284 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
  912 root      20   0   14664  10356   5444 S  0.0  9.1   0:46.25
python <-- phosphor-mapper python
    1 root      20   0   25568   6192   4492 S  0.0  5.4   0:31.74 systemd
12836 root      20   0   42860   5668   5304 S  0.0  5.0   0:09.80 nemorad
  938 root      20   0    8236   5204   4644 S  0.0  4.6   0:01.12 ipmid
  915 root      20   0    6892   4752   4496 S  0.0  4.2   0:03.57
phosphor-invent
  965 root      20   0    6512   4700   4452 S  0.0  4.1   0:03.61
phosphor-networ
 1009 root      20   0   41272   4676   4328 S  0.0  4.1  28:26.95 swampd
  969 root      20   0    6576   4620   4336 S  0.0  4.1   0:18.10
phosphor-hwmon-
  947 root      20   0    6576   4616   4336 S  0.0  4.1   0:12.03
phosphor-hwmon-
  971 root      20   0    6576   4608   4336 S  0.0  4.0   0:21.64
phosphor-hwmon-
  972 root      20   0    6576   4604   4336 S  0.0  4.0   8:00.20
phosphor-hwmon-
  975 root      20   0    6680   4560   4272 S  0.0  4.0  11:38.04
phosphor-hwmon-
  945 root      20   0    6576   4544   4272 S  0.0  4.0   0:14.57
phosphor-hwmon-
  950 root      20   0    6576   4540   4272 S  0.0  4.0   1:05.53
phosphor-hwmon-
  973 root      20   0    6576   4540   4272 S  0.0  4.0   1:06.05
phosphor-hwmon-
  949 root      20   0    6576   4528   4272 S  0.0  4.0   0:00.24
phosphor-hwmon-
  970 root      20   0    6576   4528   4272 S  0.0  4.0   1:04.10
phosphor-hwmon-
  954 root      20   0    8204   4440   4176 S  0.0  3.9   0:00.67
phosphor-dbus-m
  551 root      20   0   22400   4336   3932 S  0.0  3.8   2:46.93
systemd-journal
  910 root      20   0    6480   4248   4004 S  0.0  3.7   0:01.35
phosphor-settin
  924 root      20   0    6208   4128   3920 S  0.0  3.6   0:00.15
phosphor-watchd
  909 root      20   0    6336   4088   3860 S  0.0  3.6   0:00.76
phosphor-log-ma
  917 root      20   0    6268   3932   3720 S  0.0  3.5   0:00.18 snoopd
  960 root      20   0    6256   3856   3648 S  0.0  3.4   0:00.23
phosphor-networ
  992 systemd+  20   0    5472   3800   3472 S  0.0  3.3   0:00.71
systemd-network
  905 systemd+  20   0    5940   3660   3384 S  0.0  3.2   0:01.35
systemd-resolve
  866 systemd+  20   0   24508   3388   3068 S  0.0  3.0   0:28.22
systemd-timesyn
 1006 root      20   0    5316   3300   3128 S  0.0  2.9   2:01.05 ncsid
  911 message+  20   0    4404   3072   2456 S  0.0  2.7  16:21.02 dbus-daemon
  939 root      20   0    5212   2852   2716 S  0.0  2.5   0:00.15 slpd
  916 avahi     20   0    4492   2760   2532 S  0.0  2.4   0:08.32 avahi-daemon
  647 root      20   0    3836   2604   2032 S  0.0  2.3   0:01.86 systemd-udevd
19055 root      20   0    3104   2528   2300 S  0.0  2.2   0:00.26 sh
  921 root      20   0    3004   2304   2132 S  0.0  2.0   1:51.07
set_gateway_arp
  913 root      20   0    2916   1912   1800 S  0.0  1.7   0:10.42 btbridged
  941 root      20   0    3520   1900   1640 S  0.0  1.7   0:00.59 login
19111 root      20   0    2804   1796   1588 R 36.0  1.6   0:00.20 top
  914 root      20   0    3272   1668   1588 S  0.0  1.5   0:00.07 klogd
  919 root      20   0    3272   1644   1588 S  0.0  1.4   0:00.12 syslogd
  936 avahi     20   0    4368   1392   1252 S  0.0  1.2   0:00.01 avahi-daemon
19110 root      20   0    3140   1252   1204 S  0.0  1.1   0:00.01 sleep
  926 root      20   0    1896   1124   1052 S  0.0  1.0   0:00.10
obmc-console-se
  918 root      20   0    1756   1088   1044 S  0.0  1.0   0:06.81 rngd
 1012 root      20   0    1836   1052    988 S  0.0  0.9   0:04.59 watchdog


Running with 1.99.10 openbmc:

ps -eaf
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 May24 ?        00:01:07 /sbin/init
root         2     0  0 May24 ?        00:00:00 [kthreadd]
root         3     2  0 May24 ?        00:01:55 [ksoftirqd/0]
root         5     2  0 May24 ?        00:00:00 [kworker/0:0H]
root         7     2  0 May24 ?        00:00:00 [lru-add-drain]
root         8     2  0 May24 ?        00:00:00 [kdevtmpfs]
root         9     2  0 May24 ?        00:00:00 [kworker/u2:1]
root        10     2  0 May24 ?        00:00:00 [oom_reaper]
root       133     2  0 May24 ?        00:00:00 [writeback]
root       134     2  0 May24 ?        00:00:00 [kcompactd0]
root       136     2  0 May24 ?        00:00:00 [bioset]
root       138     2  0 May24 ?        00:00:00 [kblockd]
root       143     2  0 May24 ?        00:00:00 [watchdogd]
root       166     2  0 May24 ?        00:00:00 [rpciod]
root       175     2  0 May24 ?        00:00:00 [kswapd0]
root       176     2  0 May24 ?        00:00:00 [nfsiod]
root       210     2  0 May24 ?        00:00:00 [bioset]
root       211     2  0 May24 ?        00:00:00 [bioset]
root       212     2  0 May24 ?        00:00:00 [bioset]
root       213     2  0 May24 ?        00:00:00 [bioset]
root       223     2  0 May24 ?        00:00:00 [bioset]
root       226     2  0 May24 ?        00:00:00 [bioset]
root       229     2  0 May24 ?        00:00:00 [bioset]
root       232     2  0 May24 ?        00:00:00 [bioset]
root       235     2  0 May24 ?        00:00:00 [bioset]
root       238     2  0 May24 ?        00:00:00 [bioset]
root       241     2  0 May24 ?        00:00:00 [bioset]
root       244     2  0 May24 ?        00:00:00 [bioset]
root       256     2  0 May24 ?        00:00:00 [bioset]
root       261     2  0 May24 ?        00:00:00 [bioset]
root       266     2  0 May24 ?        00:00:00 [bioset]
root       271     2  0 May24 ?        00:00:00 [bioset]
root       276     2  0 May24 ?        00:00:00 [bioset]
root       281     2  0 May24 ?        00:00:00 [bioset]
root       447     2  0 May24 ?        00:00:00 [ipv6_addrconf]
root       452     2  0 May24 ?        00:00:00 [deferwq]
root       500     2  0 May24 ?        00:00:00 [jffs2_gcd_mtd5]
root       505     2  0 May24 ?        00:00:00 [kworker/0:1H]
root       520     1  3 May24 ?        00:39:30 /lib/systemd/systemd-journald
root       612     1  0 May24 ?        00:00:01 /lib/systemd/systemd-udevd
systemd+   835     1  0 May24 ?        00:03:00 /lib/systemd/systemd-timesyncd
root       923     1  0 May24 ttyS0    00:00:00 obmc-console-server
--config /etc/obmc-console.conf ttyVUART0
root       924     1  0 May24 ?        00:00:00 phosphor-settings-manager
root       925     1  0 May24 ?        00:00:02 phosphor-inventory
root       927     1  0 May24 ?        00:00:00 /usr/sbin/snoopd
root       928     1  0 May24 ?        00:00:00 phosphor-log-manager
root       929     1  0 May24 ?        00:06:36 btbridged
root       930     1  0 May24 ?        00:02:48 phosphor-watchdog
--service=xyz.openbmc_project.Watchdog
--path=/xyz/openbmc_project/watchdog/host0
--target=iceblink-reset.target --continue
root       931     1 36 May24 ?        07:39:09 python
/usr/sbin/phosphor-mapper --path_namespaces=/org/openbmc
/xyz/openbmc_project --interface_namespaces=org.openbmc
xyz.openbmc_project --blacklists= --
message+   937     1  6 May24 ?        01:22:47 /usr/bin/dbus-daemon
--system --address=systemd: --nofork --nopidfile --systemd-activation
root       960     1  0 May24 ?        00:01:39 /sbin/syslogd -n
root       961     1  0 May24 ?        00:00:00 /sbin/klogd -n
avahi      962     1  0 May24 ?        00:00:05 avahi-daemon: running
[iceblink.local]
root       963     1  0 May24 ?        00:02:01 /bin/bash
/usr/sbin/set_gateway_arp.sh eth1
avahi      974   962  0 May24 ?        00:00:00 avahi-daemon: chroot helper
root       976     1  0 May24 ?        00:00:00 slpd
root       977     1  1 May24 ?        00:23:49 ipmid
root       979     1  0 May24 ttyS4    00:00:00 /bin/login --
systemd+   985     1  0 May24 ?        00:00:00 /lib/systemd/systemd-networkd
root       990   979  0 May24 ttyS4    00:00:00 -sh
root       995     1  0 May24 ?        00:00:40 phosphor-hwmon-readd
-o /iio-hwmon
root       996     1  7 May24 ?        01:31:52 phosphor-hwmon-readd
-o /pwm-tacho-controller@1e786000
root       997     1  0 May24 ?        00:03:21 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@0/psu@59
root       998     1  0 May24 ?        00:03:18 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@2/psu@58
root       999     1  0 May24 ?        00:00:36 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4c
root      1000     1  0 May24 ?        00:00:36 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4e
root      1001     1  0 May24 ?        00:03:23 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@3/psu@59
root      1002     1  0 May24 ?        00:00:37 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@4f
root      1003     1  0 May24 ?        00:03:31 phosphor-hwmon-readd
-o /ahb/apb/i2c@1e78a000/i2c-bus@300/i2c-switch@70/i2c@1/psu@58
root      1006     1  0 May24 ?        00:00:03 phosphor-network-manager
root      1013     1  0 May24 ?        00:00:00 phosphor-dbus-monitor
root      1017     1  0 May24 ?        00:00:00 phosphor-hwmon-readd
-o /iio-hwmon-battery
root      1073     1  0 May24 ?        00:00:34 /usr/sbin/ncsid eth1
root      1088     1  1 May24 ?        00:18:51 /usr/sbin/swampd
root      1090     1  0 May24 ?        00:00:02 /usr/sbin/watchdog
root     14996     2  0 07:21 ?        00:00:00 [kworker/u2:0]
root     25090     2  0 16:00 ?        00:00:00 [kworker/0:0]
root     25220     2  0 16:07 ?        00:00:00 [kworker/0:1]
root     25520     2  0 16:21 ?        00:00:00 [kworker/0:2]
root     25625     2  0 16:26 ?        00:00:00 [kworker/0:3]
root     25655     1  1 16:27 ?        00:00:00 /usr/sbin/nemorad eth1
root     25660   963  0 16:27 ?        00:00:00 sleep 10
root     25661   990  0 16:27 ttyS4    00:00:00 ps -eaf

top - 16:27:46 up 20:51,  1 user,  load average: 0.74, 0.98, 1.02
Tasks:  83 total,   4 running,  79 sleeping,   0 stopped,   0 zombie
%Cpu(s): 38.3 us, 10.5 sy,  0.0 ni, 51.1 id,  0.0 wa,  0.0 hi,  0.1 si,  0.0 st
KiB Mem :   116224 total,    36440 free,    25856 used,    53928 buff/cache
KiB Swap:        0 total,        0 free,        0 used.    77640 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
  931 root      20   0   16252  10664   5824 R 39.2  9.2 459:16.10 python
  977 root      20   0    9872   7364   4932 S  0.0  6.3  23:49.80 ipmid
    1 root      20   0   25124   5332   4420 S  0.0  4.6   1:07.47 systemd
25655 root      20   0   26104   4964   4656 S  0.0  4.3   0:00.12 nemorad
 1006 root      20   0    6264   4560   4328 S  0.0  3.9   0:03.63
phosphor-networ
  925 root      20   0    6596   4520   4224 S  0.0  3.9   0:02.76
phosphor-invent
 1017 root      20   0    6228   4468   4228 S  0.0  3.8   0:00.72
phosphor-hwmon-
  995 root      20   0    6228   4416   4164 S  0.0  3.8   0:40.10
phosphor-hwmon-
  996 root      20   0    6228   4404   4164 S  0.0  3.8  91:53.64
phosphor-hwmon-
  997 root      20   0    6228   4404   4164 S  0.0  3.8   3:21.94
phosphor-hwmon-
  998 root      20   0    6228   4404   4164 S  0.0  3.8   3:18.27
phosphor-hwmon-
 1001 root      20   0    6228   4404   4164 S  0.0  3.8   3:23.29
phosphor-hwmon-
 1003 root      20   0    6228   4404   4164 S  0.0  3.8   3:31.54
phosphor-hwmon-
 1000 root      20   0    6228   4400   4164 S  0.0  3.8   0:36.22
phosphor-hwmon-
 1002 root      20   0    6228   4396   4164 S  0.0  3.8   0:37.46
phosphor-hwmon-
  999 root      20   0    6228   4392   4164 S  0.0  3.8   0:36.41
phosphor-hwmon-
 1088 root      20   0   41008   4368   4064 S  0.0  3.8  18:52.12 swampd
  520 root      20   0   22776   4320   3964 S  0.0  3.7  39:30.70
systemd-journal
  928 root      20   0    6048   4016   3800 S  0.0  3.5   0:00.14
phosphor-log-ma
  985 systemd+  20   0    5748   3880   3600 S  0.0  3.3   0:00.25
systemd-network
  924 root      20   0    6208   3724   3516 S  0.0  3.2   0:00.40
phosphor-settin
  835 systemd+  20   0   14976   3512   3252 S  0.0  3.0   3:00.64
systemd-timesyn
  930 root      20   0    5948   3456   3260 S  0.0  3.0   2:48.19
phosphor-watchd
  927 root      20   0   15052   3296   3092 S  0.0  2.8   0:00.31 snoopd
 1073 root      20   0    5244   3132   2980 S  0.0  2.7   0:34.43 ncsid
  937 message+  20   0    5072   3124   2584 R  0.0  2.7  82:48.94 dbus-daemon
  962 avahi     20   0    5304   2880   2656 S  0.0  2.5   0:05.99 avahi-daemon
  976 root      20   0    5160   2756   2620 S  0.0  2.4   0:00.10 slpd
  979 root      20   0    5580   2716   2432 S  0.0  2.3   0:00.57 login
 1013 root      20   0    5152   2592   2444 S  0.0  2.2   0:00.00
phosphor-dbus-m
  990 root      20   0    3072   2520   2320 S  0.0  2.2   0:00.06 sh
  612 root      20   0    3724   2444   2116 S  0.0  2.1   0:01.96 systemd-udevd
  963 root      20   0    3072   2304   2144 S  0.0  2.0   2:01.88
set_gateway_arp
  929 root      20   0    3816   2232   2120 S  0.0  1.9   6:36.91 btbridged
25668 root      20   0    3068   1876   1648 R 28.4  1.6   0:00.46 top
  960 root      20   0    3040   1604   1556 S  0.0  1.4   1:39.19 syslogd
  961 root      20   0    3040   1572   1508 S  0.0  1.4   0:00.13 klogd
  974 avahi     20   0    5180   1384   1224 S  0.0  1.2   0:00.00 avahi-daemon
25667 root      20   0    2908   1216   1172 S  0.0  1.0   0:00.03 sleep
  923 root      20   0    1876   1184   1116 S  0.0  1.0   0:00.56
obmc-console-se
 1090 root      20   0    1816   1048    984 S  0.0  0.9   0:02.48 watchdog

>
> >
> > >
> > > The kernel has grown a bunch of new drivers. Most of them should not
> > > probe, and therefore won't allocate memory at run time, but there may
> > > be some new ones.
> > >
> > > I've not spent much time looking at runtime memory usage, so if these
> > > suggestions don't provide answers we might need to investigate a bit
> > > deeper.
> > >
> > > >> > This matters for a few reasons:
> > > >> > 1) my memory chip is too small to be practical and I need all the
> > > >> > bytes I can get.
> > > >> > 2) I need at least 32MiB to load a new firmware image.
> > > >> >
> > > >> > I dropped all the python except the mapper, and I dropped the newer
> > > >> > daemons from my build to clear out that difference.  It was originally
> > > >> > about 16MiB difference, so I was thinking that something is now being
> > > >> > mapped by default that wasn't before, such as part of a flash image.
> > >
> > > I initially thought you were confusing RAM with flash size, but on a
> > > second read I now understand.
> > >
> > > There has been recent work to create phosphor-tiny, is that relevant here Brad?
>
> So, the image fits on my flash chip, but it may have extra daemons
> that are being mapped in from flash for the fs?
>
> > >
> > > Cheers,
> > >
> > > Joel
