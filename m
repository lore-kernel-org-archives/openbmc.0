Return-Path: <raltherr@google.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3wJT5Bk2zDvHP
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 03:21:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=kHyi0R2p; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id t192so10305659ywf.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5kg5HsFhhpZJJyIHrMs75TB86XHL530u4w/Z5N9mBss=;
 b=kHyi0R2pPq92Mo3u4CCubLeA/I/3qqmFLLHYBKzqio8X9q/NBSP/f5w+9BREtZb+yp
 w7X2jgM9cSAqsvaZrN9ua31+zc21sKY7ZNQ1onv48o4moCoroqYfXjCbMib6vPNMax5P
 Kx0IO9hwuL2WI4PRnW60Fd2IKieUTSclg3jXYYS7WDYY7rcEjdbemqp8vyQgTx7hjFQT
 kw9VW0uHsAlKo3R9NhzgVDLTcVNOdgPvsAmTi4TAMkUEGuE6ET+WDjgK8j72M3VH6j4J
 uMGLf4u4wn01geS8nMGzJWTgBIkF5vV+yOXumEAra5hEVIarH/fZqTgyJLSRtPf/8OWT
 e6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5kg5HsFhhpZJJyIHrMs75TB86XHL530u4w/Z5N9mBss=;
 b=VNkVV359VvMXS48Otw7Ffc+6UG1k1MQY+Wk57JtvcZ0MF2NhGxOrQTW3oXWespLbPQ
 yUHb7QqONum9xLkCW/z+xG+csrAaNlcBKG7oevXwnFv+rp6C65xP55+vQXKL1KlsFxYN
 awyRtv0lOEmtCGkDeLDn94Ev8tFSz+a0B9r4Sjch09WPvF6HXKvozDZc0D/mU0lna4A7
 GIo0OBZl734aJ8VVPVct9C0cZR8CIUZbhE+PCDvQKUAUeT81DTQ/zw5KGb2H9lktz4VU
 WCXL748g3drbWXQ7bpBWLMf5i2+dmcFENwOh16oYNsPtL4BCXWaUoziCw5X4ATdoYvbB
 5oxg==
X-Gm-Message-State: ABUngveKJ2X6PoT9gnCAwi6eqrGQ25GNMl3/RJL7yOh31VPMGi2iilcT3ziDDXtW0Rk0ZiSK9j7D9JVfMbehJL4W
X-Received: by 10.129.53.206 with SMTP id c197mr2472632ywa.205.1477498902364; 
 Wed, 26 Oct 2016 09:21:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Wed, 26 Oct 2016 09:21:41 -0700 (PDT)
In-Reply-To: <CACPK8XcJaP4apyXj3o=NznF_etzPd36zzspDco5+xvjR+n3m2w@mail.gmail.com>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
 <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
 <CAPLgG=kafSFfaj4P569+qr=y4130ScobqtwCY94sYbm1uJzfFw@mail.gmail.com>
 <CACPK8XcJaP4apyXj3o=NznF_etzPd36zzspDco5+xvjR+n3m2w@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 26 Oct 2016 09:21:41 -0700
Message-ID: <CAPLgG=n=2Yd21gwOk80yYzJM2LtZKoewL5gTTxfi=gpQ_ibxUA@mail.gmail.com>
Subject: Re: Single device tree blob between linux and u-boot
To: Joel Stanley <joel@jms.id.au>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary=001a11421a263bdd3a053fc705f7
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2016 16:21:46 -0000

--001a11421a263bdd3a053fc705f7
Content-Type: text/plain; charset=UTF-8

Excellent.  Thank you for testing.  Even though you mentioned using qemu
previously, I kept overlooking that I could do that myself.

Now the question is when and how should we switch to using FIT?  Do we want
to switch all boards at once or select it on a per-board basis?  At a
minimum, obmc-phosphor-image_type_uboot.bbclass needs to be refactored to
not include the initramfs directly in the flash image when using a kernel
fitImage.

I think we can safely remove the initrd segment from the flash layout on
all boards without breaking backward compatibility.  Basically, initrd
would be removed from the flash layout in aspeed-bmc-opp-flash-layout.dtsi
and obmc-phosphor-image_type_uboot would stop including the build initramfs
directly in the flash image.  For cuImage, we'd set INITRAMFS_IMAGE_BUNDLE
so the initrd gets built into the cuImage via the kernel's
CONFIG_INITRAMFS_SOURCE option.  fitImage already bundles the initramfs as
a separate image in the FIT.  As long as nothing in userspace is assuming
it can access the initramfs via mtd, everything should still work.

On Tue, Oct 25, 2016 at 10:22 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hey Rick,
>
> On Fri, Oct 14, 2016 at 6:07 AM, Rick Altherr <raltherr@google.com> wrote:
> > I've been working on signed kernel images which depends on building FIT
> > images that include the kernel, initrd, and dtb.  The kernel_fitimage
> branch
> > of my tree (https://github.com/kc8apf/openbmc) will build an unsigned
> FIT
> > image by including the dtb specified in the machine config (usually from
> the
> > kernel).  There are also provisions in there for u-boot being built in
> two
> > stages so a control dtb that includes the public signing keys can be
> > combined into the final u-boot binary.  From how that is structure, I
> > suspect Maxim is right that there will be some differences between
> u-boot's
> > dtb and linux's dtb.  That shouldn't be an issue as the u-boot dtb gets
> > built into the u-boot image while the kernel dtb is loaded from the FIT
> > image.
>
> I finally got around to testing your FIT changes.
>
> I had to build my own u-boot, as we don't have FIT support enabled. We
> should make sure to add that to your patch series (in fact, we could
> enable it now interdependently of the other changes).
>
> I created an image like this:
>
> $ dd if=/dev/zero of=flash-test bs=1M count=32
> $ dd if=/home/joel/dev/u-boot/u-boot.bin of=flash-test conv=notrunc bs=1
> $ dd if=/home/joel/dev/obmc/fit/fitImage-core-image-minimal-
> initramfs-palmetto.bin
> of=flash-test conv=notrunc bs=1K seek=512
>
> Here it is booting in Qemu:
>
> $ qemu-system-arm -m 256M -M palmetto-bmc -nographic -nodefaults -net
> nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu -serial stdio
> -drive file=~/dev/obmc/flash-test,format=raw,if=mtd
>
>
> U-Boot 2016.11-rc2-02954-g9f82ceb7118d (Oct 26 2016 - 15:36:23 +1030)
>
> SOC : AST2400-A0
> RST : Power On
> PLL :     24 MHz
> CPU :    384 MHz
> MEM :      0 MHz, EEC:Disable
> VGA :    16 MiB
> DRAM :   init by SOC
> Model: Palmetto BMC
> DRAM:  240 MiB
> WARNING: Caches not enabled
> Flash: 32 MiB
> *** Warning - bad CRC, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Error: aspeednic#0 address not set.
>
> Hit any key to stop autoboot:  0
> ast# bootm 0x80000
> ## Loading kernel from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x00080124
>      Data Size:    1511416 Bytes = 1.4 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x40008000
>      Entry Point:  0x40008000
>      Hash algo:    sha1
>      Hash value:   1ab23fabb23234a21cd80651cd3c96a9b58a9e4c
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading ramdisk from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'ramdisk@1' ramdisk subimage
>      Description:  ramdisk image
>      Type:         RAMDisk Image
>      Compression:  uncompressed
>      Data Start:   0x001f62b8
>      Data Size:    4724736 Bytes = 4.5 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha1
>      Hash value:   202c90e945a883ba8ff73fa4e197a17d6a9ce9f4
>    Verifying Hash Integrity ... sha1+ OK
> ## Loading fdt from FIT Image at 00080000 ...
>    Using 'conf@1' configuration
>    Trying 'fdt@1' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x001f1210
>      Data Size:    20463 Bytes = 20 KiB
>      Architecture: ARM
>      Hash algo:    sha1
>      Hash value:   63054f0970e89a70a15d1faac53fe9544a83e2e5
>    Verifying Hash Integrity ... sha1+ OK
>    Booting using the fdt blob at 0x1f1210
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 4e700000, end 4eb81800 ... OK
>    Loading Ramdisk to 4e27e000, end 4e6ff800 ... OK
>    Loading Device Tree to 4e276000, end 4e27dfee ... OK
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 4.7.10-32ede9ab3deda73c484c4e2d372863bb73d0f7e0
> (joel@ka3.ozlabs.ibm.com) (gcc version 5.3.0 (GCC) ) #1 Wed Oct 26
> 13:57:23 AEDT 2016
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
> CPU: VIVT data cache, VIVT instruction cache
> Machine model: Palmetto BMC
> Memory policy: Data cache writeback
> SOC Rev: 02000303
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 60960
> Kernel command line: console=ttyS4,115200n8 root=/dev/ram rw
>
>
> Looks good!
>
> Cheers,
>
> Joel
>

--001a11421a263bdd3a053fc705f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Excellent.=C2=A0 Thank you for testing.=C2=A0 Even though =
you mentioned using qemu previously, I kept overlooking that I could do tha=
t myself.<div><br></div><div>Now the question is when and how should we swi=
tch to using FIT?=C2=A0 Do we want to switch all boards at once or select i=
t on a per-board basis?=C2=A0 At a minimum, obmc-phosphor-image_type_uboot.=
bbclass needs to be refactored to not include the initramfs directly in the=
 flash image when using a kernel fitImage.</div><div><br></div><div>I think=
 we can safely remove the initrd segment from the flash layout on all board=
s without breaking backward compatibility.=C2=A0 Basically, initrd would be=
 removed from the flash layout in aspeed-bmc-opp-flash-layout.dtsi and obmc=
-phosphor-image_type_uboot would stop including the build initramfs directl=
y in the flash image.=C2=A0 For cuImage, we&#39;d set INITRAMFS_IMAGE_BUNDL=
E so the initrd gets built into the cuImage via the kernel&#39;s CONFIG_INI=
TRAMFS_SOURCE option. =C2=A0fitImage already bundles the initramfs as a sep=
arate image in the FIT.=C2=A0 As long as nothing in userspace is assuming i=
t can access the initramfs via mtd, everything should still work.</div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Oct 25,=
 2016 at 10:22 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joe=
l@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hey Rick,<br>
<span class=3D""><br>
On Fri, Oct 14, 2016 at 6:07 AM, Rick Altherr &lt;<a href=3D"mailto:ralther=
r@google.com">raltherr@google.com</a>&gt; wrote:<br>
&gt; I&#39;ve been working on signed kernel images which depends on buildin=
g FIT<br>
&gt; images that include the kernel, initrd, and dtb.=C2=A0 The kernel_fiti=
mage branch<br>
&gt; of my tree (<a href=3D"https://github.com/kc8apf/openbmc" rel=3D"noref=
errer" target=3D"_blank">https://github.com/kc8apf/<wbr>openbmc</a>) will b=
uild an unsigned FIT<br>
&gt; image by including the dtb specified in the machine config (usually fr=
om the<br>
&gt; kernel).=C2=A0 There are also provisions in there for u-boot being bui=
lt in two<br>
&gt; stages so a control dtb that includes the public signing keys can be<b=
r>
&gt; combined into the final u-boot binary.=C2=A0 From how that is structur=
e, I<br>
&gt; suspect Maxim is right that there will be some differences between u-b=
oot&#39;s<br>
&gt; dtb and linux&#39;s dtb.=C2=A0 That shouldn&#39;t be an issue as the u=
-boot dtb gets<br>
&gt; built into the u-boot image while the kernel dtb is loaded from the FI=
T<br>
&gt; image.<br>
<br>
</span>I finally got around to testing your FIT changes.<br>
<br>
I had to build my own u-boot, as we don&#39;t have FIT support enabled. We<=
br>
should make sure to add that to your patch series (in fact, we could<br>
enable it now interdependently of the other changes).<br>
<br>
I created an image like this:<br>
<br>
$ dd if=3D/dev/zero of=3Dflash-test bs=3D1M count=3D32<br>
$ dd if=3D/home/joel/dev/u-boot/u-<wbr>boot.bin of=3Dflash-test conv=3Dnotr=
unc bs=3D1<br>
$ dd if=3D/home/joel/dev/obmc/fit/<wbr>fitImage-core-image-minimal-<wbr>ini=
tramfs-palmetto.bin<br>
of=3Dflash-test conv=3Dnotrunc bs=3D1K seek=3D512<br>
<br>
Here it is booting in Qemu:<br>
<br>
$ qemu-system-arm -m 256M -M palmetto-bmc -nographic -nodefaults -net<br>
nic -net user,hostfwd=3D:127.0.0.1:2222-:<wbr>22,hostname=3Dqemu -serial st=
dio<br>
-drive file=3D~/dev/obmc/flash-test,<wbr>format=3Draw,if=3Dmtd<br>
<br>
<br>
U-Boot 2016.11-rc2-02954-<wbr>g9f82ceb7118d (Oct 26 2016 - 15:36:23 +1030)<=
br>
<br>
SOC : AST2400-A0<br>
RST : Power On<br>
PLL :=C2=A0 =C2=A0 =C2=A024 MHz<br>
CPU :=C2=A0 =C2=A0 384 MHz<br>
MEM :=C2=A0 =C2=A0 =C2=A0 0 MHz, EEC:Disable<br>
VGA :=C2=A0 =C2=A0 16 MiB<br>
DRAM :=C2=A0 =C2=A0init by SOC<br>
Model: Palmetto BMC<br>
DRAM:=C2=A0 240 MiB<br>
WARNING: Caches not enabled<br>
Flash: 32 MiB<br>
*** Warning - bad CRC, using default environment<br>
<br>
In:=C2=A0 =C2=A0 serial<br>
Out:=C2=A0 =C2=A0serial<br>
Err:=C2=A0 =C2=A0serial<br>
Net:=C2=A0 =C2=A0aspeednic#0<br>
Error: aspeednic#0 address not set.<br>
<br>
Hit any key to stop autoboot:=C2=A0 0<br>
ast# bootm 0x80000<br>
## Loading kernel from FIT Image at 00080000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@1&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;kernel@1&#39; kernel subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Linux kernel<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Image<br>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x00080124<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 1511416 Bytes =3D 1.4 MiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
=C2=A0 =C2=A0 =C2=A0Load Address: 0x40008000<br>
=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=A0 0x40008000<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha1<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A01ab23fabb23234a21cd80651cd3c96<=
wbr>a9b58a9e4c<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha1+ OK<br>
## Loading ramdisk from FIT Image at 00080000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@1&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;ramdisk@1&#39; ramdisk subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 ramdisk image<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAMDisk Image<br=
>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x001f62b8<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 4724736 Bytes =3D 4.5 MiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
=C2=A0 =C2=A0 =C2=A0Load Address: unavailable<br>
=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=A0 unavailable<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha1<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0202c90e945a883ba8ff73fa4e197a1<=
wbr>7d6a9ce9f4<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha1+ OK<br>
## Loading fdt from FIT Image at 00080000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@1&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;fdt@1&#39; fdt subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Flattened Device Tree blob<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device Tree=
<br>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x001f1210<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 20463 Bytes =3D 20 KiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha1<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A063054f0970e89a70a15d1faac53fe9<=
wbr>544a83e2e5<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha1+ OK<br>
=C2=A0 =C2=A0Booting using the fdt blob at 0x1f1210<br>
<span class=3D"">=C2=A0 =C2=A0Loading Kernel Image ... OK<br>
</span>=C2=A0 =C2=A0Loading Ramdisk to 4e700000, end 4eb81800 ... OK<br>
=C2=A0 =C2=A0Loading Ramdisk to 4e27e000, end 4e6ff800 ... OK<br>
=C2=A0 =C2=A0Loading Device Tree to 4e276000, end 4e27dfee ... OK<br>
<span class=3D""><br>
Starting kernel ...<br>
<br>
Uncompressing Linux... done, booting the kernel.<br>
</span><span class=3D"">Booting Linux on physical CPU 0x0<br>
</span>Linux version 4.7.10-<wbr>32ede9ab3deda73c484c4e2d372863<wbr>bb73d0f=
7e0<br>
(<a href=3D"mailto:joel@ka3.ozlabs.ibm.com">joel@ka3.ozlabs.ibm.com</a>) (g=
cc version 5.3.0 (GCC) ) #1 Wed Oct 26<br>
13:57:23 AEDT 2016<br>
<span class=3D"">CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D000=
93177<br>
</span><span class=3D"">CPU: VIVT data cache, VIVT instruction cache<br>
</span>Machine model: Palmetto BMC<br>
<span class=3D"">Memory policy: Data cache writeback<br>
</span>SOC Rev: 02000303<br>
Built 1 zonelists in Zone order, mobility grouping on.=C2=A0 Total pages: 6=
0960<br>
Kernel command line: console=3DttyS4,115200n8 root=3D/dev/ram rw<br>
<br>
<br>
Looks good!<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a11421a263bdd3a053fc705f7--
