Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="wA6i9dV0"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V3Ft3nTzzF3LV
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 03:53:22 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id a5-v6so1081413pgv.13
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 09:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=q6s5vipge4IhxNjJNPTt8qWGZNIcDB9IwK7E62M0a7I=;
 b=wA6i9dV0U7CJyV46CtLgg6GYL3O5HOhdr8//vgR6U16aDpBYtTqwdv4Qv76ElQLI48
 5SmbrMDGXDqMWqMjAUtBBZyNefCvJ4KyV1BqNVx2YMPP7TTdSSK81ynv1cgiYmROi3Yz
 hT9y62apY5YrdvW8myfkUSIlcPgFQ64IinBHhEJ+2xMgQeDJkiG7NMxxYQDHDQ9ja6QJ
 XzFED/L61zJWKFrjiKMbIS2bAUmF231aZpy2Fqa0a1P1K/xX3ipIRQedHqiTHg/MC8gO
 H78D5AuV9iYl6uswYwyTx4hgfqRLfsHTMK0S7pGD3SLRFngOiTkzCpCku+je6XsfzL7B
 TSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q6s5vipge4IhxNjJNPTt8qWGZNIcDB9IwK7E62M0a7I=;
 b=Pi5hSWoLFoy4qGw98nRz7Pjb25QgH2jEGwadKczxowUQNQoAaFz4eI6wjzL9HXL/YU
 ZGxYBy74FrztHvio9zx0IwX7ai61qi4Weu3yk0baY9gA5uhlWfbw/lgdySSBzWmRn8ms
 TqJItDxfMqIzqKGKWgUMdxe5MDqR+cyS6fT+mGS7nLyiVPCrn9ofFOHl8wr4/ifx8krQ
 Ucx9akUqVlEFvKvCseUgoSfi8CKow1KuQC7Sty9PU5eh2PmmpKtcbSQJT4lss+mpfqcW
 B7DmeAP6BR1zBOYbsuPsRlod8YeOCw4DE6aXWazsIckK75AqAcwDCleDQiK2fOHlyhMq
 L/zw==
X-Gm-Message-State: ABuFfohUHvpPTUYHhe5sZJF7h1QKAPMR9FCqC6dKL+a39ADPryWI6P3n
 M30GYqsZvu6DzjufRP1z8gTdvIYl6PyZqo1UO9LkBEvPy0KvqQ==
X-Google-Smtp-Source: ACcGV60ABGMEWtDf5TkUp//hj05HaCcMVCvhJo4rjltGJrgivPua8OVmLEVst2r5kk/34pp/PPwhCyt/yZAmBwm/yEc=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr26555397pgh.290.1539104000040; 
 Tue, 09 Oct 2018 09:53:20 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Oct 2018 09:53:08 -0700
Message-ID: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
Subject: Loss of several MB of run-time memory
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 09 Oct 2018 16:53:23 -0000

Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
stuff once things are settled, whereas before I could have up to
35MiB.

Here are some dumps:

Now:
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
[    0.000000] Memory policy: Data cache writeback
[    0.000000] On node 0 totalpages: 30720
[    0.000000]   Normal zone: 240 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 30720 pages, LIFO batch:7
[    0.000000] random: get_random_bytes called from
start_kernel+0x8c/0x4c0 with crng_init=0
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 30480
[    0.000000] Kernel command line: console=ttyS4,115200n8
root=/dev/ram rw clk_ignore_unused
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 111076K/122880K available (5120K kernel code,
365K rwdata, 1104K rodata, 1024K init, 143K bss, 11804K reserved, 0K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x88000000 - 0xff800000   (1912 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x87800000   ( 120 MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 366 kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 144 kB)
[    0.000000] ftrace: allocating 18546 entries in 55 pages

cat /proc/meminfo
MemTotal:         113952 kB
MemFree:           19944 kB
MemAvailable:      62432 kB
Buffers:           11032 kB
Cached:            48732 kB
SwapCached:            0 kB
Active:            40940 kB
Inactive:          26728 kB
Active(anon):      17068 kB
Inactive(anon):     9316 kB
Active(file):      23872 kB
Inactive(file):    17412 kB
Unevictable:        9088 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         17008 kB
Mapped:            21120 kB
Shmem:              9392 kB
Slab:              11956 kB
SReclaimable:       6472 kB
SUnreclaim:         5484 kB
KernelStack:         560 kB
PageTables:         1384 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       56976 kB
Committed_AS:     124224 kB
VmallocTotal:    1957888 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB

Before:
dmesg
  Normal zone: 30720 pages, LIFO batch:7
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 30480
Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 113644K/122880K available (4206K kernel code, 150K rwdata,
860K rodata, 1024K init, 111K bss, 9236K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc8000000 - 0xff800000   ( 888 MB)
    lowmem  : 0xc0000000 - 0xc7800000   ( 120 MB)
      .text : 0xc0008000 - 0xc05f28ec   (6059 kB)
      .init : 0xc0600000 - 0xc0700000   (1024 kB)
      .data : 0xc0700000 - 0xc0725be8   ( 151 kB)
       .bss : 0xc0725be8 - 0xc0741a38   ( 112 kB)

cat /proc/meminfo
MemTotal:         116224 kB
MemFree:           35832 kB
MemAvailable:      76952 kB
Buffers:            9596 kB
Cached:            39776 kB
SwapCached:            0 kB
Active:            40516 kB
Inactive:          25432 kB
Active(anon):      17004 kB
Inactive(anon):     6968 kB
Active(file):      23512 kB
Inactive(file):    18464 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         16588 kB
Mapped:            20064 kB
Shmem:              7396 kB
Slab:               9424 kB
SReclaimable:       4532 kB
SUnreclaim:         4892 kB
KernelStack:         720 kB
PageTables:         1328 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       58112 kB
Committed_AS:     142324 kB
VmallocTotal:     909312 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB

This matters for a few reasons:
1) my memory chip is too small to be practical and I need all the
bytes I can get.
2) I need at least 32MiB to load a new firmware image.

I dropped all the python except the mapper, and I dropped the newer
daemons from my build to clear out that difference.  It was originally
about 16MiB difference, so I was thinking that something is now being
mapped by default that wasn't before, such as part of a flash image.

Patrick
