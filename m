Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k0MEeis7"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Flxh35p9zF1D5
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 11:41:27 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id 128-v6so5176951itf.1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTgF70Phlqr6GuW7HVB7gl+kLc1H0VwvHIDlSbVG5to=;
 b=k0MEeis7mz5+EV96ohnlDxOGyg/YBZ7d8pn4s18IOHG532aBgG2ML6ZSkP569NDaRb
 1NqL6EZRMXIxRT1eEm3jIp0O6c4Xxg8+XcIEuh35BMocXjw48IvUDh0FnuFqoR23YH1I
 ANEXcBQHducdhV3pa9n3GZz+EqEEp5cTTZ0S7lt70eZdCGbSmzBdSvqdpOfyYuNATbBK
 LCW6REo7YA8yMA9znPsU+WuDkpDHG1VKKmUfwJLk+ZFiZq4CRzVN+fYtk61yA1GGQckb
 O+9vmjxwtoRgMHwkamuyXLkslQ5DDrSka13kpdFXPupwpeAqxACY6K3VmlQzz3Ufg0Ay
 75Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTgF70Phlqr6GuW7HVB7gl+kLc1H0VwvHIDlSbVG5to=;
 b=mk8jniiQYVVQtqOTAXqM4bseeivsWoZOOwTY5abQ+iHFxZ28CUZDcYH9dz4vICJNbe
 lM5NBbdNC5qTV9ZS2be9ITGKS2DfqIhZKCZyjxZowdxjw8eCzKRETnWfVOJVuEd2wm/8
 oUa8QUn1NqeevImVjnk/7TUHe0QkLpGCiKfdkW1KrMghs8T0cl8JJ5zrpU7J6ZGfqzcY
 wvkKWj68/i7U0xh5r8odIzVefkxIt/g9zypWqhNCMLL0FFnTKDw15Nfogfq9H0lb2fb9
 HSHhwRlVWMz+wABnNIkqOdrXWdM6fxcNXsacKZeGZYJK5e3H+CG+PW+6wAUMWjmi4ccD
 I0Kg==
X-Gm-Message-State: APt69E3O7fokRsUOZPkRLk471ije/1iGGeRT7m5uUBjYAUvdRVRa3IJZ
 M9W4a3kcoJrWVPrNgWzWV0iwz29kOwFlOkA32F3CZA==
X-Google-Smtp-Source: ADUXVKJSM6e2y2nagHWWNGOeKg8pUxpKv8MND+BNPkRRGIGoc2yEAyobWKltb1OAajRMGwBetWRTc5dYMzRb80dstrc=
X-Received: by 2002:a24:c8c5:: with SMTP id
 w188-v6mr3557660itf.30.1530063685219; 
 Tue, 26 Jun 2018 18:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
In-Reply-To: <1530061800.2502410.1421595168.7609B886@webmail.messagingengine.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 26 Jun 2018 18:40:59 -0700
Message-ID: <CAGMNF6XczffusXaDCfYcC1MGh3HmHjabV8-MSWEMN0p6Fx_RXw@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000717788056f95b636"
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
X-List-Received-Date: Wed, 27 Jun 2018 01:41:29 -0000

--000000000000717788056f95b636
Content-Type: text/plain; charset="UTF-8"

libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND

Might be caused a config change in U-boot?

On Tue, Jun 26, 2018 at 6:10 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:
> > I assume this is just a recipe change such that I need to now specify
> > something -- with OpenBMC v2.1 I see:
> >
> > """
> > U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)
> >
> > DRAM:  120 MiB
> > WARNING: Caches not enabled
> > Flash: 64 MiB
> > *** Warning - bad CRC, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   aspeednic#0
> > Error: aspeednic#0 address not set.
> >
> > Hit any key to stop autoboot:  0
> > ## Loading kernel from FIT Image at 20080000 ...
> >    Using 'conf@1' configuration
> >    Trying 'kernel@1' kernel subimage
> >      Description:  Linux kernel
> >      Type:         Kernel Image
> >      Compression:  uncompressed
> >      Data Start:   0x20080128
> >      Data Size:    1721352 Bytes = 1.6 MiB
> >      Architecture: ARM
> >      OS:           Linux
> >      Load Address: 0x40008000
> >      Entry Point:  0x40008000
> >      Hash algo:    sha1
> >      Hash value:   de140d9d803c22f731c4d99a4250979489383a81
> >    Verifying Hash Integrity ... sha1+ OK
> > ## Loading ramdisk from FIT Image at 20080000 ...
> >    Using 'conf@1' configuration
> >    Trying 'ramdisk@1' ramdisk subimage
> >      Description:  obmc-phosphor-initramfs
> >      Type:         RAMDisk Image
> >      Compression:  lzma compressed
> >      Data Start:   0x2022ad00
> >      Data Size:    1592362 Bytes = 1.5 MiB
> >      Architecture: ARM
> >      OS:           Linux
> >      Load Address: unavailable
> >      Entry Point:  unavailable
> >      Hash algo:    sha1
> >      Hash value:   9f6f2feb110e27e07f81bb60bb372b4083672f19
> >    Verifying Hash Integrity ... sha1+ OK
> > ## Loading fdt from FIT Image at 20080000 ...
> >    Using 'conf@1' configuration
> >    Trying 'fdt@1' fdt subimage
> >      Description:  Flattened Device Tree blob
> >      Type:         Flat Device Tree
> >      Compression:  uncompressed
> >      Data Start:   0x20224624
> >      Data Size:    26139 Bytes = 25.5 KiB
> >      Architecture: ARM
> >      Hash algo:    sha1
> >      Hash value:   37864a4c4a608d5f4e370bbccf93ccbe3e77462d
> >    Verifying Hash Integrity ... sha1+ OK
> >    Booting using the fdt blob at 0x20224624
> >    Loading Kernel Image ... OK
> >    Loading Ramdisk to 47213000, end 47397c2a ... OK
> >    Loading Device Tree to 47209000, end 4721261a ... OK
> >
> > Starting kernel ...
> > """
> >
> > With v2.2 I see:
> > """
> > U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)
> >
> > DRAM:  120 MiB
> > WARNING: Caches not enabled
> > Flash: 64 MiB
> > *** Warning - bad CRC, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Net:   aspeednic#0
> > Error: aspeednic#0 address not set.
> >
> > Hit any key to stop autoboot:  0
> > libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>
> From below it looks like u-boot finds the kernel in the FIT, but your
> ramdisk is "corrupt". The error above suggests something is missing from
> the FIT. Can you check the initrd/ramdisk node in your FIT to make sure it
> is present and uses all the correct options and paths with respect to the
> initrd you intended to package?
>
> Might also be helpful to provide the content of the .its file.
>
> > ## Loading kernel from FIT Image at 20080000 ...
> >    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
> >    Trying 'kernel@1' kernel subimage
> >      Description:  Linux kernel
> >      Type:         Kernel Image
> >      Compression:  uncompressed
> >      Data Start:   0x20080124
> >      Data Size:    1723192 Bytes = 1.6 MiB
> >      Architecture: ARM
> >      OS:           Linux
> >      Load Address: 0x40008000
> >      Entry Point:  0x40008000
> >      Hash algo:    sha1
> >      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
> >    Verifying Hash Integrity ... sha1+ OK
> > Wrong Ramdisk Image Format
> > Ramdisk image is corrupt or invalid
> > """
> >
> > I figured I'd reach out first as I'm sure this will be familiar to
> someone :D
> >
> > Patrick
>


-- 
Regards,
Kun

--000000000000717788056f95b636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">libfdt fdt_path_offset() return=
ed FDT_ERR_NOTFOUND</span><br><div><span style=3D"text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline"><br></span></=
div><div><span style=3D"text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">Might be caused a config change in U-bo=
ot?</span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tu=
e, Jun 26, 2018 at 6:10 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.i=
d.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On Wed, 27 Jun 2018, at 01:49, Patrick Venture wrote:<br>
&gt; I assume this is just a recipe change such that I need to now specify<=
br>
&gt; something -- with OpenBMC v2.1 I see:<br>
&gt; <br>
&gt; &quot;&quot;&quot;<br>
&gt; U-Boot 2016.07 (May 24 2018 - 12:55:55 -0700)<br>
&gt; <br>
&gt; DRAM:=C2=A0 120 MiB<br>
&gt; WARNING: Caches not enabled<br>
&gt; Flash: 64 MiB<br>
&gt; *** Warning - bad CRC, using default environment<br>
&gt; <br>
&gt; In:=C2=A0 =C2=A0 serial<br>
&gt; Out:=C2=A0 =C2=A0serial<br>
&gt; Err:=C2=A0 =C2=A0serial<br>
&gt; Net:=C2=A0 =C2=A0aspeednic#0<br>
&gt; Error: aspeednic#0 address not set.<br>
&gt; <br>
&gt; Hit any key to stop autoboot:=C2=A0 0<br>
&gt; ## Loading kernel from FIT Image at 20080000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@1&#39; configuration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;kernel@1&#39; kernel subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 Linux kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Imag=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x20080128<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 1721352 Bytes =3D 1.6 MiB<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Load Address: 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Entry Point:=C2=A0 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A0de140d9d803c22f731c4d99a42=
50979489383a81<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt; ## Loading ramdisk from FIT Image at 20080000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@1&#39; configuration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;ramdisk@1&#39; ramdisk subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 obmc-phosphor-initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAMDisk Ima=
ge<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 lzma compressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x2022ad00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 1592362 Bytes =3D 1.5 MiB<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Load Address: unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Entry Point:=C2=A0 unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A09f6f2feb110e27e07f81bb60bb=
372b4083672f19<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt; ## Loading fdt from FIT Image at 20080000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@1&#39; configuration<br>
&gt;=C2=A0 =C2=A0 Trying &#39;fdt@1&#39; fdt subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 Flattened Device Tree blob<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device=
 Tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x20224624<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 26139 Bytes =3D 25.5 KiB<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A037864a4c4a608d5f4e370bbccf=
93ccbe3e77462d<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt;=C2=A0 =C2=A0 Booting using the fdt blob at 0x20224624<br>
&gt;=C2=A0 =C2=A0 Loading Kernel Image ... OK<br>
&gt;=C2=A0 =C2=A0 Loading Ramdisk to 47213000, end 47397c2a ... OK<br>
&gt;=C2=A0 =C2=A0 Loading Device Tree to 47209000, end 4721261a ... OK<br>
&gt; <br>
&gt; Starting kernel ...<br>
&gt; &quot;&quot;&quot;<br>
&gt; <br>
&gt; With v2.2 I see:<br>
&gt; &quot;&quot;&quot;<br>
&gt; U-Boot 2016.07 (Jun 25 2018 - 10:07:57 -0700)<br>
&gt; <br>
&gt; DRAM:=C2=A0 120 MiB<br>
&gt; WARNING: Caches not enabled<br>
&gt; Flash: 64 MiB<br>
&gt; *** Warning - bad CRC, using default environment<br>
&gt; <br>
&gt; In:=C2=A0 =C2=A0 serial<br>
&gt; Out:=C2=A0 =C2=A0serial<br>
&gt; Err:=C2=A0 =C2=A0serial<br>
&gt; Net:=C2=A0 =C2=A0aspeednic#0<br>
&gt; Error: aspeednic#0 address not set.<br>
&gt; <br>
&gt; Hit any key to stop autoboot:=C2=A0 0<br>
&gt; libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND<br>
<br>
From below it looks like u-boot finds the kernel in the FIT, but your ramdi=
sk is &quot;corrupt&quot;. The error above suggests something is missing fr=
om the FIT. Can you check the initrd/ramdisk node in your FIT to make sure =
it is present and uses all the correct options and paths with respect to th=
e initrd you intended to package?<br>
<br>
Might also be helpful to provide the content of the .its file.<br>
<br>
&gt; ## Loading kernel from FIT Image at 20080000 ...<br>
&gt;=C2=A0 =C2=A0 Using &#39;conf@aspeed-bmc-quanta-q71l.dtb&#39; configura=
tion<br>
&gt;=C2=A0 =C2=A0 Trying &#39;kernel@1&#39; kernel subimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Description:=C2=A0 Linux kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Imag=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Start:=C2=A0 =C2=A00x20080124<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Data Size:=C2=A0 =C2=A0 1723192 Bytes =3D 1.6 MiB<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 Load Address: 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Entry Point:=C2=A0 0x40008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hash value:=C2=A0 =C2=A095ed76c9361d9f6f991a6a859a=
06eb7626af80df<br>
&gt;=C2=A0 =C2=A0 Verifying Hash Integrity ... sha1+ OK<br>
&gt; Wrong Ramdisk Image Format<br>
&gt; Ramdisk image is corrupt or invalid<br>
&gt; &quot;&quot;&quot;<br>
&gt; <br>
&gt; I figured I&#39;d reach out first as I&#39;m sure this will be familia=
r to someone :D<br>
&gt; <br>
&gt; Patrick<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--000000000000717788056f95b636--
