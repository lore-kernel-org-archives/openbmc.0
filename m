Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V3Qx6TyRzF3Jk
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 04:01:10 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2018 10:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,361,1534834800"; d="scan'208";a="86992369"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2018 09:57:52 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 9 Oct 2018 09:57:52 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.194]) by
 ORSMSX113.amr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0319.002;
 Tue, 9 Oct 2018 09:57:52 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Loss of several MB of run-time memory
Thread-Topic: Loss of several MB of run-time memory
Thread-Index: AQHUX/Csj1WxrFGyqkOn1Vx1Jt9wUaUXIoxL
Date: Tue, 9 Oct 2018 16:57:51 +0000
Message-ID: <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
In-Reply-To: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 09 Oct 2018 17:01:14 -0000

Was this only the kernel version jump, or did you jump in openbmc/phosphor =
levels as well?  There have been quite a few daemons added in the last 6 mo=
nths or so that could explain your memory footprint increase.

-Ed



> On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
>=20
> Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> stuff once things are settled, whereas before I could have up to
> 35MiB.
>=20
> Here are some dumps:
>=20
> Now:
> [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D000=
5317f
> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
> [    0.000000] OF: fdt: Machine model: Quanta Q71L BMC
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] On node 0 totalpages: 30720
> [    0.000000]   Normal zone: 240 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 30720 pages, LIFO batch:7
> [    0.000000] random: get_random_bytes called from
> start_kernel+0x8c/0x4c0 with crng_init=3D0
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 304=
80
> [    0.000000] Kernel command line: console=3DttyS4,115200n8
> root=3D/dev/ram rw clk_ignore_unused
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 by=
tes)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 byte=
s)
> [    0.000000] Memory: 111076K/122880K available (5120K kernel code,
> 365K rwdata, 1104K rodata, 1024K init, 143K bss, 11804K reserved, 0K
> cma-reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0x88000000 - 0xff800000   (1912 MB)
> [    0.000000]     lowmem  : 0x80000000 - 0x87800000   ( 120 MB)
> [    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)
> [    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
> [    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 366 kB)
> [    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 144 kB)
> [    0.000000] ftrace: allocating 18546 entries in 55 pages
>=20
> cat /proc/meminfo
> MemTotal:         113952 kB
> MemFree:           19944 kB
> MemAvailable:      62432 kB
> Buffers:           11032 kB
> Cached:            48732 kB
> SwapCached:            0 kB
> Active:            40940 kB
> Inactive:          26728 kB
> Active(anon):      17068 kB
> Inactive(anon):     9316 kB
> Active(file):      23872 kB
> Inactive(file):    17412 kB
> Unevictable:        9088 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:         17008 kB
> Mapped:            21120 kB
> Shmem:              9392 kB
> Slab:              11956 kB
> SReclaimable:       6472 kB
> SUnreclaim:         5484 kB
> KernelStack:         560 kB
> PageTables:         1384 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:       56976 kB
> Committed_AS:     124224 kB
> VmallocTotal:    1957888 kB
> VmallocUsed:           0 kB
> VmallocChunk:          0 kB
>=20
> Before:
> dmesg
>  Normal zone: 30720 pages, LIFO batch:7
> pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> pcpu-alloc: [0] 0
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 3048=
0
> Kernel command line: console=3DttyS4,115200n8 root=3D/dev/ram rw
> PID hash table entries: 512 (order: -1, 2048 bytes)
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Memory: 113644K/122880K available (4206K kernel code, 150K rwdata,
> 860K rodata, 1024K init, 111K bss, 9236K reserved, 0K cma-reserved)
> Virtual kernel memory layout:
>    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>    vmalloc : 0xc8000000 - 0xff800000   ( 888 MB)
>    lowmem  : 0xc0000000 - 0xc7800000   ( 120 MB)
>      .text : 0xc0008000 - 0xc05f28ec   (6059 kB)
>      .init : 0xc0600000 - 0xc0700000   (1024 kB)
>      .data : 0xc0700000 - 0xc0725be8   ( 151 kB)
>       .bss : 0xc0725be8 - 0xc0741a38   ( 112 kB)
>=20
> cat /proc/meminfo
> MemTotal:         116224 kB
> MemFree:           35832 kB
> MemAvailable:      76952 kB
> Buffers:            9596 kB
> Cached:            39776 kB
> SwapCached:            0 kB
> Active:            40516 kB
> Inactive:          25432 kB
> Active(anon):      17004 kB
> Inactive(anon):     6968 kB
> Active(file):      23512 kB
> Inactive(file):    18464 kB
> Unevictable:           0 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:         16588 kB
> Mapped:            20064 kB
> Shmem:              7396 kB
> Slab:               9424 kB
> SReclaimable:       4532 kB
> SUnreclaim:         4892 kB
> KernelStack:         720 kB
> PageTables:         1328 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:       58112 kB
> Committed_AS:     142324 kB
> VmallocTotal:     909312 kB
> VmallocUsed:           0 kB
> VmallocChunk:          0 kB
>=20
> This matters for a few reasons:
> 1) my memory chip is too small to be practical and I need all the
> bytes I can get.
> 2) I need at least 32MiB to load a new firmware image.
>=20
> I dropped all the python except the mapper, and I dropped the newer
> daemons from my build to clear out that difference.  It was originally
> about 16MiB difference, so I was thinking that something is now being
> mapped by default that wasn't before, such as part of a flash image.
>=20
> Patrick
