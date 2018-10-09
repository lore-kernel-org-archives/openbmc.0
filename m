Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fk5rZwB4"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V3YV3qHmzF3M2
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 04:06:54 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id e12-v6so1714115iok.12
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gepjDYV3GD+y1ngcUX6qGTt3F8JQoZoqtIh1qVPTO3s=;
 b=Fk5rZwB4V/TyxRY/Uh/s4K7iT5k+Mq/jBZ3FwRs63WXZj99sRM8QozfVuCITuLFqdy
 LYMYZI2t7iFCWdaAqM8LGuv8if/u4tSUst2nbTfn9RgDJjLEdVTkO3AtWqahDbzbfyi4
 gUmoQw2pd0fXKogvHiM8gxYHgpIKoHzELTfQH2EZhULkKWZ82UU3YlAZOmLjKrdAkJtM
 76nV3i+fgOJnLtAl3mYLLJFQY6vOUf9kTPG4oWz4m1ffJuTE9+zcfXz/zKAbeeCdxM5O
 uvu7TAqAgVN9D446zrfNSmakhrRvqzwRKKBIpuxjfEQBppOWYM+KXJjo0ScbpGFfIbEf
 7s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gepjDYV3GD+y1ngcUX6qGTt3F8JQoZoqtIh1qVPTO3s=;
 b=jktuF4nvG6+7vv1K4Sqsaz+u1hDpjeAGcwtQY5w31jJsFpb7UReNgE1IbYnbF3neLO
 jRKYhd3MEj5o+g3q+d4cH2o16WtVxMabHyH9rGolMlNw6uoGxyNVRO5Z+syrPxYO2Zor
 2/OaVUoilZz66ZSAY6QqHy8OUCbMgaIFyKHkm5pNMbhdFL93rknLn3KNz5PVIbWFnc2m
 RgWBWns5qOfrcd742VNwC2f16Q9ppHpum2F6d8ZaJA9xqXOMkZbKinMY8luhhwLzmzoI
 C2VagBOkuwm+ABGRsXIiykcDIvi9CX5IRRq+bYKTByOp9XcStKOFvTHZED6cg02o56IZ
 L5uQ==
X-Gm-Message-State: ABuFfojUekynEDjdT+3ooh2Jpj8urLwPwmhIkAhV8uBoZt2peXza4vc5
 FqR9DTfe3wSbu/0y1vsQc833E7hpBiYUf1+HDJr5fw==
X-Google-Smtp-Source: ACcGV63oE/B7pHI4Qv5cQrTwax/2czIr2+ZrJ7VGBWA5AHzhcSUwPrZLOvY0eE40/TT7U7Jha4tqk7TZsQ9zdbrsNDg=
X-Received: by 2002:a6b:c8c5:: with SMTP id
 y188-v6mr19222737iof.295.1539104811814; 
 Tue, 09 Oct 2018 10:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
In-Reply-To: <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 9 Oct 2018 10:06:24 -0700
Message-ID: <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: ed.tanous@intel.com
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000094fa990577cec3bd"
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
X-List-Received-Date: Tue, 09 Oct 2018 17:06:55 -0000

--00000000000094fa990577cec3bd
Content-Type: text/plain; charset="UTF-8"

A somewhat tedious way to test would be to build and boot with 'bitbake
core-image-minimal' to ensure no phosphor-daemons are loaded, and then
compare the kernel memory footprint.

On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:

> Was this only the kernel version jump, or did you jump in openbmc/phosphor
> levels as well?  There have been quite a few daemons added in the last 6
> months or so that could explain your memory footprint increase.
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
> > [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ),
> cr=0005317f
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
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 30480
> > [    0.000000] Kernel command line: console=ttyS4,115200n8
> > root=/dev/ram rw clk_ignore_unused
> > [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536
> bytes)
> > [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768
> bytes)
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
> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
> 30480
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
>


-- 
Regards,
Kun

--00000000000094fa990577cec3bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A somewhat tedious way to test would be to build and boot =
with &#39;bitbake core-image-minimal&#39; to ensure no phosphor-daemons are=
 loaded, and then compare the kernel memory footprint.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, 2018 at 10:01 AM Tanous, E=
d &lt;<a href=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Was this only the kernel versi=
on jump, or did you jump in openbmc/phosphor levels as well?=C2=A0 There ha=
ve been quite a few daemons added in the last 6 months or so that could exp=
lain your memory footprint increase.<br>
<br>
-Ed<br>
<br>
<br>
<br>
&gt; On Oct 9, 2018, at 9:54 AM, Patrick Venture &lt;<a href=3D"mailto:vent=
ure@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Just jumped from 4.7 kernel to 4.18 running the latest openbmc image<b=
r>
&gt; on the quanta-q71l board.=C2=A0 And I see now I have ~20MiB of RAM fre=
e for<br>
&gt; stuff once things are settled, whereas before I could have up to<br>
&gt; 35MiB.<br>
&gt; <br>
&gt; Here are some dumps:<br>
&gt; <br>
&gt; Now:<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5T=
EJ), cr=3D0005317f<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: VIVT data cache, VIVT instruction cache<=
br>
&gt; [=C2=A0 =C2=A0 0.000000] OF: fdt: Machine model: Quanta Q71L BMC<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory policy: Data cache writeback<br>
&gt; [=C2=A0 =C2=A0 0.000000] On node 0 totalpages: 30720<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal zone: 240 pages used for m=
emmap<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal zone: 0 pages reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal zone: 30720 pages, LIFO ba=
tch:7<br>
&gt; [=C2=A0 =C2=A0 0.000000] random: get_random_bytes called from<br>
&gt; start_kernel+0x8c/0x4c0 with crng_init=3D0<br>
&gt; [=C2=A0 =C2=A0 0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*327=
68<br>
&gt; [=C2=A0 =C2=A0 0.000000] pcpu-alloc: [0] 0<br>
&gt; [=C2=A0 =C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 30480<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyS4,115200n8=
<br>
&gt; root=3D/dev/ram rw clk_ignore_unused<br>
&gt; [=C2=A0 =C2=A0 0.000000] Dentry cache hash table entries: 16384 (order=
: 4, 65536 bytes)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Inode-cache hash table entries: 8192 (order: =
3, 32768 bytes)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory: 111076K/122880K available (5120K kern=
el code,<br>
&gt; 365K rwdata, 1104K rodata, 1024K init, 143K bss, 11804K reserved, 0K<b=
r>
&gt; cma-reserved)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Virtual kernel memory layout:<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vector=C2=A0 : 0xffff0000 =
- 0xffff1000=C2=A0 =C2=A0(=C2=A0 =C2=A04 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0fixmap=C2=A0 : 0xffc00000 =
- 0xfff00000=C2=A0 =C2=A0(3072 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vmalloc : 0x88000000 - 0xf=
f800000=C2=A0 =C2=A0(1912 MB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0lowmem=C2=A0 : 0x80000000 =
- 0x87800000=C2=A0 =C2=A0( 120 MB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.text : 0x(ptrval) =
- 0x(ptrval)=C2=A0 =C2=A0(6112 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.init : 0x(ptrval) =
- 0x(ptrval)=C2=A0 =C2=A0(1024 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.data : 0x(ptrval) =
- 0x(ptrval)=C2=A0 =C2=A0( 366 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0 .bss : 0x(ptrval) =
- 0x(ptrval)=C2=A0 =C2=A0( 144 kB)<br>
&gt; [=C2=A0 =C2=A0 0.000000] ftrace: allocating 18546 entries in 55 pages<=
br>
&gt; <br>
&gt; cat /proc/meminfo<br>
&gt; MemTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0113952 kB<br>
&gt; MemFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A019944 kB<br>
&gt; MemAvailable:=C2=A0 =C2=A0 =C2=A0 62432 kB<br>
&gt; Buffers:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011032 kB<br>
&gt; Cached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48732 kB<br>
&gt; SwapCached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Active:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 40940 kB<br>
&gt; Inactive:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 26728 kB<br>
&gt; Active(anon):=C2=A0 =C2=A0 =C2=A0 17068 kB<br>
&gt; Inactive(anon):=C2=A0 =C2=A0 =C2=A09316 kB<br>
&gt; Active(file):=C2=A0 =C2=A0 =C2=A0 23872 kB<br>
&gt; Inactive(file):=C2=A0 =C2=A0 17412 kB<br>
&gt; Unevictable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 9088 kB<br>
&gt; Mlocked:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br=
>
&gt; SwapTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; SwapFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Dirty:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =
kB<br>
&gt; Writeback:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; AnonPages:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017008 kB<br>
&gt; Mapped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 21120 kB<br>
&gt; Shmem:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9392 kB<br>
&gt; Slab:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11956 kB<br>
&gt; SReclaimable:=C2=A0 =C2=A0 =C2=A0 =C2=A06472 kB<br>
&gt; SUnreclaim:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05484 kB<br>
&gt; KernelStack:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0560 kB<br>
&gt; PageTables:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01384 kB<br>
&gt; NFS_Unstable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Bounce:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br=
>
&gt; WritebackTmp:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; CommitLimit:=C2=A0 =C2=A0 =C2=A0 =C2=A056976 kB<br>
&gt; Committed_AS:=C2=A0 =C2=A0 =C2=A0124224 kB<br>
&gt; VmallocTotal:=C2=A0 =C2=A0 1957888 kB<br>
&gt; VmallocUsed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; VmallocChunk:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; <br>
&gt; Before:<br>
&gt; dmesg<br>
&gt;=C2=A0 Normal zone: 30720 pages, LIFO batch:7<br>
&gt; pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768<br>
&gt; pcpu-alloc: [0] 0<br>
&gt; Built 1 zonelists in Zone order, mobility grouping on.=C2=A0 Total pag=
es: 30480<br>
&gt; Kernel command line: console=3DttyS4,115200n8 root=3D/dev/ram rw<br>
&gt; PID hash table entries: 512 (order: -1, 2048 bytes)<br>
&gt; Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)<br>
&gt; Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)<br>
&gt; Memory: 113644K/122880K available (4206K kernel code, 150K rwdata,<br>
&gt; 860K rodata, 1024K init, 111K bss, 9236K reserved, 0K cma-reserved)<br=
>
&gt; Virtual kernel memory layout:<br>
&gt;=C2=A0 =C2=A0 vector=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0 =C2=A0(=C2=
=A0 =C2=A04 kB)<br>
&gt;=C2=A0 =C2=A0 fixmap=C2=A0 : 0xffc00000 - 0xfff00000=C2=A0 =C2=A0(3072 =
kB)<br>
&gt;=C2=A0 =C2=A0 vmalloc : 0xc8000000 - 0xff800000=C2=A0 =C2=A0( 888 MB)<b=
r>
&gt;=C2=A0 =C2=A0 lowmem=C2=A0 : 0xc0000000 - 0xc7800000=C2=A0 =C2=A0( 120 =
MB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .text : 0xc0008000 - 0xc05f28ec=C2=A0 =C2=A0(6059 =
kB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .init : 0xc0600000 - 0xc0700000=C2=A0 =C2=A0(1024 =
kB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .data : 0xc0700000 - 0xc0725be8=C2=A0 =C2=A0( 151 =
kB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.bss : 0xc0725be8 - 0xc0741a38=C2=A0 =C2=A0(=
 112 kB)<br>
&gt; <br>
&gt; cat /proc/meminfo<br>
&gt; MemTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0116224 kB<br>
&gt; MemFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A035832 kB<br>
&gt; MemAvailable:=C2=A0 =C2=A0 =C2=A0 76952 kB<br>
&gt; Buffers:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9596 kB<br>
&gt; Cached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 39776 kB<br>
&gt; SwapCached:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Active:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 40516 kB<br>
&gt; Inactive:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25432 kB<br>
&gt; Active(anon):=C2=A0 =C2=A0 =C2=A0 17004 kB<br>
&gt; Inactive(anon):=C2=A0 =C2=A0 =C2=A06968 kB<br>
&gt; Active(file):=C2=A0 =C2=A0 =C2=A0 23512 kB<br>
&gt; Inactive(file):=C2=A0 =C2=A0 18464 kB<br>
&gt; Unevictable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; Mlocked:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br=
>
&gt; SwapTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; SwapFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Dirty:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =
kB<br>
&gt; Writeback:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; AnonPages:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016588 kB<br>
&gt; Mapped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20064 kB<br>
&gt; Shmem:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7396 kB<br>
&gt; Slab:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09424 kB<br=
>
&gt; SReclaimable:=C2=A0 =C2=A0 =C2=A0 =C2=A04532 kB<br>
&gt; SUnreclaim:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04892 kB<br>
&gt; KernelStack:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0720 kB<br>
&gt; PageTables:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01328 kB<br>
&gt; NFS_Unstable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; Bounce:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br=
>
&gt; WritebackTmp:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; CommitLimit:=C2=A0 =C2=A0 =C2=A0 =C2=A058112 kB<br>
&gt; Committed_AS:=C2=A0 =C2=A0 =C2=A0142324 kB<br>
&gt; VmallocTotal:=C2=A0 =C2=A0 =C2=A0909312 kB<br>
&gt; VmallocUsed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB<br>
&gt; VmallocChunk:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB<br>
&gt; <br>
&gt; This matters for a few reasons:<br>
&gt; 1) my memory chip is too small to be practical and I need all the<br>
&gt; bytes I can get.<br>
&gt; 2) I need at least 32MiB to load a new firmware image.<br>
&gt; <br>
&gt; I dropped all the python except the mapper, and I dropped the newer<br=
>
&gt; daemons from my build to clear out that difference.=C2=A0 It was origi=
nally<br>
&gt; about 16MiB difference, so I was thinking that something is now being<=
br>
&gt; mapped by default that wasn&#39;t before, such as part of a flash imag=
e.<br>
&gt; <br>
&gt; Patrick<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--00000000000094fa990577cec3bd--
