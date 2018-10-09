Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hCCHFCEI"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V5zW5B7XzF3MZ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 05:56:07 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id f8-v6so1258426pgq.5
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 11:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axZXW2eQ6S6caeCQxSSgNYur6w7tMu7QHa7E8kss+LA=;
 b=hCCHFCEIlwGNO5Jtofm5/rbHAnq8mehX6VZgU0jsXk0XAg1PkZi28KkMM2+a9WsZ2Y
 V1vFoFoUOKxadKahDwXyLcmE4WMLXYBH/cHXOjRYXEWfJTku8bSfG6SWp83UkWY6eYZ4
 J0abUw2cxCc/f5QQVJdSaFkYooqHoQT8LnH29NDMinUsUsaYRbaKaod3aGhTQYxO99pR
 8eQlrNcwEyLyW582n3W3Ecvg4Idfr+IAV9ZDyvLkSc2+eHSmcMAhC+HWo+h2d1Lhm9yE
 jdFc8PhuynW3n3zSJjaPdB9tW2s2Tjekj4T3YO0lYjSHpCs5mpOrVQfx7bWYCgCko9QS
 G0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axZXW2eQ6S6caeCQxSSgNYur6w7tMu7QHa7E8kss+LA=;
 b=gb874BCygX5/9oKD0LiXuWLuz0g3uEcNWJxessXJ82vMO1dA0lUmstM56INu+M+Aw7
 xpOMAPyBmcaQnFoYqwNvCUXzP1yj+UHfYYOBxjjeQIWlaiIoloFVI73B0siuC8IkrjW5
 fNQEiM+4BQ9FjL7RilrdN5VIQlyzNh19AljUcQlzY9yzcbOtFho7bV42/tykdn47LlNj
 dHy9Va6x8P2Me7NiRE3c0Xq7tv+t/ki3voXclgwPxxvvZvjzSNctzZFAWaTtMahZQb0P
 cG0kHr+ClVv4jd4nuMfFcKiPn1M5ZtWc0Qh+ne9M88sUbyKMeY8HPWLJMPGbCw94SdhW
 7HoA==
X-Gm-Message-State: ABuFfohjCqdkUEgsgeoNO/lLQwgBYXncV3WfDAV5DBOG+yinguU8zb7S
 PB5vYWurrHWMfEvOV9TcqeSNDjc/bnJ6fdcCwO+paA==
X-Google-Smtp-Source: ACcGV623OFHhZjlTJFDGG/Sc+xiaCHMOXWAvkzsp1EW4rnQQMN28p/bx6T9195AQ5q8RThMDOp0J6ms0jOHWU0spE24=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr26960408pgd.449.1539111365271; 
 Tue, 09 Oct 2018 11:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
 <CAO=notzwwSevvHUyb1gacrXgvApHZ89tfmXzSBeWSHxArYWf+A@mail.gmail.com>
In-Reply-To: <CAO=notzwwSevvHUyb1gacrXgvApHZ89tfmXzSBeWSHxArYWf+A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Oct 2018 11:55:53 -0700
Message-ID: <CAO=notzqj_PXOw03zq3Jg4uToiQem-sMVD0tO1Y-HL8PG0cmPw@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: Kun Yi <kunyi@google.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 09 Oct 2018 18:56:08 -0000

On Tue, Oct 9, 2018 at 10:20 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Oct 9, 2018 at 10:06 AM Kun Yi <kunyi@google.com> wrote:
> >
> > A somewhat tedious way to test would be to build and boot with 'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, and
> then compare the kernel memory footprint.
>
> So, I went through and dropped all the unused image_Features will
> dropped a lot of daemons.  I should have about the same between the
> two images, but I can do some side-by-sides of the filesystem.  The ps
> is nearly identical.

Item                  | 4.17      | 4.7
                         | kB         | kB         | kB
MemTotal         | 113944  | 116224 | -2280
MemFree         | 19316    | 35888 | -16572
MemAvailable  | 61700    | 77012 | -15312
Buffers             | 11072    | 9596 | 1476
Cached            | 48872    | 39616 | 9256
Active               | 39012   | 40468 | -1456
Inactive             | 29200   | 25432 | 3768
Active(anon)     | 17432    | 16956 | 476
Inactive(anon)  | 9332      | 6968 | 2364
Active(file)        | 21580    | 23512 | -1932
Inactive(file)     | 19868     | 18464 | 1404
Unevitable        | 9088      | 0          | 9088
AnonPages      | 17372     | 16700   | 672
Mapped            | 22704    | 19712    | 2992
Shmem             | 9408     | 7236       | 2172
Slab                  | 11704    | 9428      | 2276
SReclaimable   | 6204      | 4536      | 1668
SUnreclaim       | 5500      | 4892      | 608
KernelStack      | 648         | 720        | -72
PageTables       | 1472      | 1328      | 144
CommitLimit     | 56972     | 58112    | -1140
Commited_AS  | 125448   | 142372 | -16924
VmallocTota      | 1957888 | 909312 | 1048576

^^^ view the above in monospace and it'll look nice.

>
> >
> > On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
> >>
> >> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.
> >>
> >> -Ed
> >>
> >>
> >>
> >> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
> >> >
> >> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> >> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> >> > stuff once things are settled, whereas before I could have up to
> >> > 35MiB.
> >> >
> >> > Here are some dumps:
> >> >
> >> > Now:
> >> > [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
> >> > [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> >> > [    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
> >> > [    0.000000] Memory policy: Data cache writeback
> >> > [    0.000000] On node 0 totalpages: 30720
> >> > [    0.000000]   Normal zone: 240 pages used for memmap
> >> > [    0.000000]   Normal zone: 0 pages reserved
> >> > [    0.000000]   Normal zone: 30720 pages, LIFO batch:7
> >> > [    0.000000] random: get_random_bytes called from
> >> > start_kernel+0x8c/0x4c0 with crng_init=0
> >> > [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> >> > [    0.000000] pcpu-alloc: [0] 0
> >> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 30480
> >> > [    0.000000] Kernel command line: console=ttyS4,115200n8
> >> > root=/dev/ram rw clk_ignore_unused
> >> > [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> >> > [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> >> > [    0.000000] Memory: 111076K/122880K available (5120K kernel code,
> >> > 365K rwdata, 1104K rodata, 1024K init, 143K bss, 11804K reserved, 0K
> >> > cma-reserved)
> >> > [    0.000000] Virtual kernel memory layout:
> >> > [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> >> > [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> >> > [    0.000000]     vmalloc : 0x88000000 - 0xff800000   (1912 MB)
> >> > [    0.000000]     lowmem  : 0x80000000 - 0x87800000   ( 120 MB)
> >> > [    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)
> >> > [    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
> >> > [    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 366 kB)
> >> > [    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 144 kB)
> >> > [    0.000000] ftrace: allocating 18546 entries in 55 pages
> >> >
> >> > cat /proc/meminfo
> >> > MemTotal:         113952 kB
> >> > MemFree:           19944 kB
> >> > MemAvailable:      62432 kB
> >> > Buffers:           11032 kB
> >> > Cached:            48732 kB
> >> > SwapCached:            0 kB
> >> > Active:            40940 kB
> >> > Inactive:          26728 kB
> >> > Active(anon):      17068 kB
> >> > Inactive(anon):     9316 kB
> >> > Active(file):      23872 kB
> >> > Inactive(file):    17412 kB
> >> > Unevictable:        9088 kB
> >> > Mlocked:               0 kB
> >> > SwapTotal:             0 kB
> >> > SwapFree:              0 kB
> >> > Dirty:                 0 kB
> >> > Writeback:             0 kB
> >> > AnonPages:         17008 kB
> >> > Mapped:            21120 kB
> >> > Shmem:              9392 kB
> >> > Slab:              11956 kB
> >> > SReclaimable:       6472 kB
> >> > SUnreclaim:         5484 kB
> >> > KernelStack:         560 kB
> >> > PageTables:         1384 kB
> >> > NFS_Unstable:          0 kB
> >> > Bounce:                0 kB
> >> > WritebackTmp:          0 kB
> >> > CommitLimit:       56976 kB
> >> > Committed_AS:     124224 kB
> >> > VmallocTotal:    1957888 kB
> >> > VmallocUsed:           0 kB
> >> > VmallocChunk:          0 kB
> >> >
> >> > Before:
> >> > dmesg
> >> >  Normal zone: 30720 pages, LIFO batch:7
> >> > pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> >> > pcpu-alloc: [0] 0
> >> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 30480
> >> > Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
> >> > PID hash table entries: 512 (order: -1, 2048 bytes)
> >> > Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> >> > Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> >> > Memory: 113644K/122880K available (4206K kernel code, 150K rwdata,
> >> > 860K rodata, 1024K init, 111K bss, 9236K reserved, 0K cma-reserved)
> >> > Virtual kernel memory layout:
> >> >    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> >> >    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> >> >    vmalloc : 0xc8000000 - 0xff800000   ( 888 MB)
> >> >    lowmem  : 0xc0000000 - 0xc7800000   ( 120 MB)
> >> >      .text : 0xc0008000 - 0xc05f28ec   (6059 kB)
> >> >      .init : 0xc0600000 - 0xc0700000   (1024 kB)
> >> >      .data : 0xc0700000 - 0xc0725be8   ( 151 kB)
> >> >       .bss : 0xc0725be8 - 0xc0741a38   ( 112 kB)
> >> >
> >> > cat /proc/meminfo
> >> > MemTotal:         116224 kB
> >> > MemFree:           35832 kB
> >> > MemAvailable:      76952 kB
> >> > Buffers:            9596 kB
> >> > Cached:            39776 kB
> >> > SwapCached:            0 kB
> >> > Active:            40516 kB
> >> > Inactive:          25432 kB
> >> > Active(anon):      17004 kB
> >> > Inactive(anon):     6968 kB
> >> > Active(file):      23512 kB
> >> > Inactive(file):    18464 kB
> >> > Unevictable:           0 kB
> >> > Mlocked:               0 kB
> >> > SwapTotal:             0 kB
> >> > SwapFree:              0 kB
> >> > Dirty:                 0 kB
> >> > Writeback:             0 kB
> >> > AnonPages:         16588 kB
> >> > Mapped:            20064 kB
> >> > Shmem:              7396 kB
> >> > Slab:               9424 kB
> >> > SReclaimable:       4532 kB
> >> > SUnreclaim:         4892 kB
> >> > KernelStack:         720 kB
> >> > PageTables:         1328 kB
> >> > NFS_Unstable:          0 kB
> >> > Bounce:                0 kB
> >> > WritebackTmp:          0 kB
> >> > CommitLimit:       58112 kB
> >> > Committed_AS:     142324 kB
> >> > VmallocTotal:     909312 kB
> >> > VmallocUsed:           0 kB
> >> > VmallocChunk:          0 kB
> >> >
> >> > This matters for a few reasons:
> >> > 1) my memory chip is too small to be practical and I need all the
> >> > bytes I can get.
> >> > 2) I need at least 32MiB to load a new firmware image.
> >> >
> >> > I dropped all the python except the mapper, and I dropped the newer
> >> > daemons from my build to clear out that difference.  It was originally
> >> > about 16MiB difference, so I was thinking that something is now being
> >> > mapped by default that wasn't before, such as part of a flash image.
> >> >
> >> > Patrick
> >
> >
> >
> > --
> > Regards,
> > Kun
