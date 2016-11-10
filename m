Return-Path: <raltherr@google.com>
Received: from mail-yb0-x22e.google.com (mail-yb0-x22e.google.com
 [IPv6:2607:f8b0:4002:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDjq12Qq9zDt1G
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 11:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mXsedItd"; 
 dkim-atps=neutral
Received: by mail-yb0-x22e.google.com with SMTP id d128so83236278ybh.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=L8EUOEIHRm4XyhFMf/w8JflWYBXKE79jWTjDp/Y3T0g=;
 b=mXsedItd+GPWP6X8lp5mq2wufpVoKsung9P8eHpvktoMAMeIySafP8N6Lryl5c2A8o
 W2YpU+Fs6gfITC8t9zKrQjLeJ2xl/RRW6p//6M8fXZR0lRGplNLCAtN7ITmkvyu9Xe1C
 qAhMKgaGxLW4W0QLCxP04OhZ5Ds3KbiqhOPHdyb0WSOz/8uXTx2mvoldwupcaR105khX
 VrSP2eH0n8CoAhxqxo3kM0fChe85rM3tyDPYJOsQr8cqu4htt/XjUq5Vou5/1UvkcqEm
 418xTpYY7mPDzzRa8bGpgn94Q7wnCiTjJCYxR4Y+qtpZz1DxRTXEcdvBgnsb0TIM3Ogt
 XtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=L8EUOEIHRm4XyhFMf/w8JflWYBXKE79jWTjDp/Y3T0g=;
 b=N5NXHxLyge6rz0mqQ7qAbeCciMdUafZfH9CPsv1QbzghJnp7qNCEyR6Apzd+Ifp3al
 LbEA+CtqXQtMdtK/PPYFVSqwXdrWGgZi5+V13Smg0Ms8aklC0lXxRNtRt6txbs8ndbA8
 MiHgq4Hkwm9U9uOJ1tHMRVk7QgR3+VIwHd8w4R8WEXUo94fA5cHzPOcHydQttHrzQaW7
 rbcjBidMJetHAFlCLORVU6SqpjN1IZLlWn51IxuAMyzDUkvPls1YbgUPS8XuuBebgcju
 gJsMOMSLfMeWaYvi02L2Sgb08OoiLadOH5WPJTUN1DWfAsrQQSk1Lv+mpTWVr4FU/V6O
 T0IQ==
X-Gm-Message-State: ABUngvd7l4gMVl5dSu3YGYtgZLBIUdZWv5EwiKxAIjAgI4fYq7irUPBhe0V6fxqD+GTD4dTQbfm3mjo6peXr4/OD
X-Received: by 10.37.174.14 with SMTP id a14mr2259462ybj.143.1478736009895;
 Wed, 09 Nov 2016 16:00:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.206.84 with HTTP; Wed, 9 Nov 2016 16:00:09 -0800 (PST)
In-Reply-To: <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
References: <1478064386-29575-1-git-send-email-raltherr@google.com>
 <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 9 Nov 2016 16:00:09 -0800
Message-ID: <CAPLgG==PvpmFWm94esWZET9=8FPVdYvCcOaS24vokOvwnpwCtA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045db91e96abe50540e70e3d
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
X-List-Received-Date: Thu, 10 Nov 2016 00:00:14 -0000

--f403045db91e96abe50540e70e3d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2016 at 11:31 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hi Rick,
>
> On Wed, Nov 2, 2016 at 3:56 PM, Rick Altherr <raltherr@google.com> wrote:
> > FIT is the modern u-boot native image format for kernels, device trees,
> > and ramdisks.  Enabling FIT only compiles in support for the image
> > format.  For these devices, the kernel+dtb and ramdisk are loaded from
> > separate locations in flash and can be any mix of legacy or FIT images.
> > When using FIT images, the dtb is stored as a separate entry that
> > requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel=
.
> >
> > Tested under qemu with both legacy and FIT kernel+dtb images for
> > palmetto and witherspoon.
>
> The changes look good to me.
>
> Is the FIT support in v2016.07 new enough for us? Is there any reason
> to move to a v2016.09 base?
>
>
AFAIK, v2016.07 is new enough.  It certainly includes FIT, FDT loading, and
FIT signature checking.


> It does introduce a warning in a hack we carry for loading the
> initramfs, which I think points to a legitimate issue:
>
> common/image.c: In function =E2=80=98boot_get_ramdisk=E2=80=99:
> common/image.c:1078:4: warning: =E2=80=98rd_load=E2=80=99 may be used uni=
nitialized in
> this function [-Wmaybe-uninitialized]
>     memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This code an Aspeed hack we carry. It is required to copy the
> initramfs from flash. Cedric was doing some investigation into why we
> need the hack, and it appears to be an upstream bug.
>
> If I read the code correctly, prior to enabling FIT we only accepted
> IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we
> should be ok, as we don't need to do the hack when loading from FIT.
>
> Can you try that and add a second patch to your series that moves the hac=
k?
>
>
Looks like Cedric has a patch that just removes the hack.  I'll look into
this more and add it to my series.


> Finally, I took a look at the impact on code size. I used
> arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005 from
> Ubuntu 16.10.
>
> $ size u-boot
>    text   data    bss    dec    hex filename
>  151636   4576  61620 217832  352e8 u-boot
>  222302   7952  62768 293022  4789e u-boot
>
> Wow, the FIT image is fatter. What does FIT support pull in that
> increases the code size so much?
>
> The on disk size suggests that size isn't lying:
>
> Unfit: 156012
> FIT: 230056
>
> Did we expect the change to be that large?
>
> This is not a blocker, as we currently set aside 384KB for u-boot.
>

I tried a few variations to see where the increase comes from.  Looks like
it is an even split between the FIT image format support and the FDT
loading support.  I expected a sizable increase from libfdt (brought in by
both FIT and FDT options) and additional hash algorithms (sha1, sha256).

Palmetto orig: 165336
Palmetto FIT: 201356
Palmetto FIT w/ verbose: 201720
Palmetto FIT w/ verbose+FDT: 238976
Palmetto FIT w/ verbose+FDT-EFI: 223380

Enabling FDT seems to enable EFI by default as well.  Explicitly turning
off EFI loading support saves ~13k.  I'm uncertain if it is reasonable to
say that EFI support should be turned off by default.  OpenBMC certainly
doesn't need it but the u-boot configuration is ideally more generic.


> Cheers,
>
> Joel
>
>
> >
> > Signed-off-by: Rick Altherr <raltherr@google.com>
> > ---
> > Changes since v1:
> > - Fixed commit message grammar
> > - Clarified config option needed for FDT loading
> > ---
> >  configs/ast_g4_ncsi_defconfig | 3 +++
> >  configs/ast_g4_phy_defconfig  | 3 +++
> >  configs/ast_g5_ncsi_defconfig | 3 +++
> >  configs/ast_g5_phy_defconfig  | 3 +++
> >  4 files changed, 12 insertions(+)
> >
> > diff --git a/configs/ast_g4_ncsi_defconfig
> b/configs/ast_g4_ncsi_defconfig
> > index 4ee71c5..70cd3c2 100644
> > --- a/configs/ast_g4_ncsi_defconfig
> > +++ b/configs/ast_g4_ncsi_defconfig
> > @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G4=3Dy
> >  CONFIG_SYS_PROMPT=3D"ast# "
> >  CONFIG_CMD_DHCP=3Dy
> >  CONFIG_CMD_PING=3Dy
> > +CONFIG_FIT=3Dy
> > +CONFIG_FIT_VERBOSE=3Dy
> > +CONFIG_OF_LIBFDT=3Dy
> >  CONFIG_SPI_FLASH=3Dy
> >  CONFIG_SYS_NS16550=3Dy
> > diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfi=
g
> > index 61fd69b..468fbc4 100644
> > --- a/configs/ast_g4_phy_defconfig
> > +++ b/configs/ast_g4_phy_defconfig
> > @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy
> >  CONFIG_SYS_PROMPT=3D"ast# "
> >  CONFIG_CMD_DHCP=3Dy
> >  CONFIG_CMD_PING=3Dy
> > +CONFIG_FIT=3Dy
> > +CONFIG_FIT_VERBOSE=3Dy
> > +CONFIG_OF_LIBFDT=3Dy
> >  CONFIG_SPI_FLASH=3Dy
> >  CONFIG_SYS_NS16550=3Dy
> > diff --git a/configs/ast_g5_ncsi_defconfig
> b/configs/ast_g5_ncsi_defconfig
> > index 6d11afb..8a9c297 100644
> > --- a/configs/ast_g5_ncsi_defconfig
> > +++ b/configs/ast_g5_ncsi_defconfig
> > @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G5=3Dy
> >  CONFIG_SYS_PROMPT=3D"ast# "
> >  CONFIG_CMD_DHCP=3Dy
> >  CONFIG_CMD_PING=3Dy
> > +CONFIG_FIT=3Dy
> > +CONFIG_FIT_VERBOSE=3Dy
> > +CONFIG_OF_LIBFDT=3Dy
> >  CONFIG_SPI_FLASH=3Dy
> >  CONFIG_SYS_NS16550=3Dy
> > diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfi=
g
> > index 20f62e0..fd450b9 100644
> > --- a/configs/ast_g5_phy_defconfig
> > +++ b/configs/ast_g5_phy_defconfig
> > @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy
> >  CONFIG_SYS_PROMPT=3D"ast# "
> >  CONFIG_CMD_DHCP=3Dy
> >  CONFIG_CMD_PING=3Dy
> > +CONFIG_FIT=3Dy
> > +CONFIG_FIT_VERBOSE=3Dy
> > +CONFIG_OF_LIBFDT=3Dy
> >  CONFIG_SPI_FLASH=3Dy
> >  CONFIG_SYS_NS16550=3Dy
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>

--f403045db91e96abe50540e70e3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 1, 2016 at 11:31 PM, Joel Stanley <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Rick,<br=
>
<span><br>
On Wed, Nov 2, 2016 at 3:56 PM, Rick Altherr &lt;<a href=3D"mailto:raltherr=
@google.com" target=3D"_blank">raltherr@google.com</a>&gt; wrote:<br>
&gt; FIT is the modern u-boot native image format for kernels, device trees=
,<br>
&gt; and ramdisks.=C2=A0 Enabling FIT only compiles in support for the imag=
e<br>
&gt; format.=C2=A0 For these devices, the kernel+dtb and ramdisk are loaded=
 from<br>
&gt; separate locations in flash and can be any mix of legacy or FIT images=
.<br>
&gt; When using FIT images, the dtb is stored as a separate entry that<br>
&gt; requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kerne=
l.<br>
&gt;<br>
&gt; Tested under qemu with both legacy and FIT kernel+dtb images for<br>
&gt; palmetto and witherspoon.<br>
<br>
</span>The changes look good to me.<br>
<br>
Is the FIT support in v2016.07 new enough for us? Is there any reason<br>
to move to a v2016.09 base?<br>
<br></blockquote><div><br></div><div>AFAIK, v2016.07 is new enough.=C2=A0 I=
t certainly includes FIT, FDT loading, and FIT signature checking.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It does introduce a warning in a hack we carry for loading the<br>
initramfs, which I think points to a legitimate issue:<br>
<br>
common/image.c: In function =E2=80=98boot_get_ramdisk=E2=80=99:<br>
common/image.c:1078:4: warning: =E2=80=98rd_load=E2=80=99 may be used unini=
tialized in<br>
this function [-Wmaybe-uninitialized]<br>
=C2=A0 =C2=A0 memmove ((void *)rd_load, (uchar *)rd_data, rd_len);<br>
=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~~~<br>
<br>
This code an Aspeed hack we carry. It is required to copy the<br>
initramfs from flash. Cedric was doing some investigation into why we<br>
need the hack, and it appears to be an upstream bug.<br>
<br>
If I read the code correctly, prior to enabling FIT we only accepted<br>
IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we<br>
should be ok, as we don&#39;t need to do the hack when loading from FIT.<br=
>
<br>
Can you try that and add a second patch to your series that moves the hack?=
<br>
<br></blockquote><div><br></div><div>Looks like Cedric has a patch that jus=
t removes the hack.=C2=A0 I&#39;ll look into this more and add it to my ser=
ies.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Finally, I took a look at the impact on code size. I used<br>
arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005 from<br>
Ubuntu 16.10.<br>
<br>
$ size u-boot<br>
=C2=A0 =C2=A0text=C2=A0 =C2=A0data=C2=A0 =C2=A0 bss=C2=A0 =C2=A0 dec=C2=A0 =
=C2=A0 hex filename<br>
=C2=A0151636=C2=A0 =C2=A04576=C2=A0 61620 217832=C2=A0 352e8 u-boot<br>
=C2=A0222302=C2=A0 =C2=A07952=C2=A0 62768 293022=C2=A0 4789e u-boot<br>
<br>
Wow, the FIT image is fatter. What does FIT support pull in that<br>
increases the code size so much?<br>
<br>
The on disk size suggests that size isn&#39;t lying:<br>
<br>
Unfit: 156012<br>
FIT: 230056<br>
<br>
Did we expect the change to be that large?<br>
<br>
This is not a blocker, as we currently set aside 384KB for u-boot.<br></blo=
ckquote><div><br></div><div>I tried a few variations to see where the incre=
ase comes from.=C2=A0 Looks like it is an even split between the FIT image =
format support and the FDT loading support.=C2=A0 I expected a sizable incr=
ease from libfdt (brought in by both FIT and FDT options) and additional ha=
sh algorithms (sha1, sha256). =C2=A0</div><div><br></div><div>Palmetto orig=
:=C2=A0<span style=3D"color:rgb(0,0,0)">165336</span></div><div><span style=
=3D"color:rgb(0,0,0)">Palmetto FIT:=C2=A0</span><font color=3D"#000000">201=
356</font></div><div><span style=3D"color:rgb(0,0,0)"></span><span style=3D=
"color:rgb(0,0,0)">Palmetto FIT w/ verbose:=C2=A0</span><font color=3D"#000=
000">201720</font></div><div><span style=3D"color:rgb(0,0,0)">Palmetto FIT =
w/ verbose+FDT:=C2=A0</span><font color=3D"#000000">238976</font><br></div>=
<div><font color=3D"#000000">Palmetto FIT w/ verbose+FDT-EFI:=C2=A0223380</=
font></div><div><br></div><div>Enabling FDT seems to enable EFI by default =
as well.=C2=A0 Explicitly turning off EFI loading support saves ~13k.=C2=A0=
 I&#39;m uncertain if it is reasonable to say that EFI support should be tu=
rned off by default.=C2=A0 OpenBMC certainly doesn&#39;t need it but the u-=
boot configuration is ideally more generic.</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Joel<br>
<div><div class=3D"gmail-m_-5140069579929286666gmail-m_8960449125377829950m=
_8480033853154680325gmail-m_1903516065268380482h5"><br>
<br>
&gt;<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
 target=3D"_blank">raltherr@google.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt; - Fixed commit message grammar<br>
&gt; - Clarified config option needed for FDT loading<br>
&gt; ---<br>
&gt;=C2=A0 configs/ast_g4_ncsi_defconfig | 3 +++<br>
&gt;=C2=A0 configs/ast_g4_phy_defconfig=C2=A0 | 3 +++<br>
&gt;=C2=A0 configs/ast_g5_ncsi_defconfig | 3 +++<br>
&gt;=C2=A0 configs/ast_g5_phy_defconfig=C2=A0 | 3 +++<br>
&gt;=C2=A0 4 files changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/configs/ast_g4_ncsi_defconfi<wbr>g b/configs/ast_g4_ncsi_=
defconfi<wbr>g<br>
&gt; index 4ee71c5..70cd3c2 100644<br>
&gt; --- a/configs/ast_g4_ncsi_defconfi<wbr>g<br>
&gt; +++ b/configs/ast_g4_ncsi_defconfi<wbr>g<br>
&gt; @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G4=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_PROMPT=3D&quot;ast# &quot;<br>
&gt;=C2=A0 CONFIG_CMD_DHCP=3Dy<br>
&gt;=C2=A0 CONFIG_CMD_PING=3Dy<br>
&gt; +CONFIG_FIT=3Dy<br>
&gt; +CONFIG_FIT_VERBOSE=3Dy<br>
&gt; +CONFIG_OF_LIBFDT=3Dy<br>
&gt;=C2=A0 CONFIG_SPI_FLASH=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_NS16550=3Dy<br>
&gt; diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconf=
ig<br>
&gt; index 61fd69b..468fbc4 100644<br>
&gt; --- a/configs/ast_g4_phy_defconfig<br>
&gt; +++ b/configs/ast_g4_phy_defconfig<br>
&gt; @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_PROMPT=3D&quot;ast# &quot;<br>
&gt;=C2=A0 CONFIG_CMD_DHCP=3Dy<br>
&gt;=C2=A0 CONFIG_CMD_PING=3Dy<br>
&gt; +CONFIG_FIT=3Dy<br>
&gt; +CONFIG_FIT_VERBOSE=3Dy<br>
&gt; +CONFIG_OF_LIBFDT=3Dy<br>
&gt;=C2=A0 CONFIG_SPI_FLASH=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_NS16550=3Dy<br>
&gt; diff --git a/configs/ast_g5_ncsi_defconfi<wbr>g b/configs/ast_g5_ncsi_=
defconfi<wbr>g<br>
&gt; index 6d11afb..8a9c297 100644<br>
&gt; --- a/configs/ast_g5_ncsi_defconfi<wbr>g<br>
&gt; +++ b/configs/ast_g5_ncsi_defconfi<wbr>g<br>
&gt; @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G5=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_PROMPT=3D&quot;ast# &quot;<br>
&gt;=C2=A0 CONFIG_CMD_DHCP=3Dy<br>
&gt;=C2=A0 CONFIG_CMD_PING=3Dy<br>
&gt; +CONFIG_FIT=3Dy<br>
&gt; +CONFIG_FIT_VERBOSE=3Dy<br>
&gt; +CONFIG_OF_LIBFDT=3Dy<br>
&gt;=C2=A0 CONFIG_SPI_FLASH=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_NS16550=3Dy<br>
&gt; diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconf=
ig<br>
&gt; index 20f62e0..fd450b9 100644<br>
&gt; --- a/configs/ast_g5_phy_defconfig<br>
&gt; +++ b/configs/ast_g5_phy_defconfig<br>
&gt; @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_PROMPT=3D&quot;ast# &quot;<br>
&gt;=C2=A0 CONFIG_CMD_DHCP=3Dy<br>
&gt;=C2=A0 CONFIG_CMD_PING=3Dy<br>
&gt; +CONFIG_FIT=3Dy<br>
&gt; +CONFIG_FIT_VERBOSE=3Dy<br>
&gt; +CONFIG_OF_LIBFDT=3Dy<br>
&gt;=C2=A0 CONFIG_SPI_FLASH=3Dy<br>
&gt;=C2=A0 CONFIG_SYS_NS16550=3Dy<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@=
lists.ozlabs.org</a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc</a><br>
</blockquote></div><br></div></div>

--f403045db91e96abe50540e70e3d--
