Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bTshFuI5"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4444TQ5b21zDq8Y
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 15:32:42 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id c18so16484673otl.13
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 20:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6OiprlSNmsl57VxpE0Wl41NrNEly0ipgiH7I9tFOSk=;
 b=bTshFuI584VyI/B8aqBlKlCquSHKY/BzHyKpMX65mKNfHikOeCQY+fsAWHXXR3MkHL
 8Wv/x8SS7b8IvIm+rNNS3eTfFOeP44HTMORkVMwsonFuDkWcF3R/5dMIL8IsNZ2f6LAc
 v7dwlTbwxpNW6Ecg13HhJdg/AvMWzuZmvlPgSLqEejSxRzdqvzCv3a2gQNB9cGW6KbqD
 R4kwfGf3DCE/guY1pWK60asnoFEoZsaTuaVG18hJg2B38g/OMnhsyrr27XIytui0hCki
 d3hU8inGQcNvZXzEvevGxb8djY932Y2kVeJ2xAMT8BDDKM1lcMx1crULl9OT8gixC8gT
 rsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6OiprlSNmsl57VxpE0Wl41NrNEly0ipgiH7I9tFOSk=;
 b=YJNKzCIxLAyBIYrVsIx9XJ5Ay02fasiE0o18QtXGIzOPfH/OTNJHx8UrIFwbsIyne+
 1wUcNpB0iPNGYM0gtlnf2o6037+ZrdoABWxk6rIpbJPuZWzTV0oVdj/+k1G9zeEhqHUk
 C3KAVrIOofniHKVLG4829jI6FIEuJWomuPVvsm2KNuxF9hAp3PpXvvtps7qEUYdZ+sp0
 Brie5nCShH1d6a3KoIgLDpTQI7tu4ZU0fbEtcTTSdDKNKdy/eSrkdzF0RXwXVdgJHhMr
 8o5JzO4DKnb6je/T55215fgEsyiO1pCmbzeR3QioDNUqWkD/tJ2J5l2DWYUpc5EQ3Qu/
 qvMQ==
X-Gm-Message-State: AHQUAuZao8ammlLHLTvlujFLr/m3fZhDtQQe/ZCMuBBGsVf3qoUiUO1W
 vn1ose/lB6HopylLALDrdGCt7HbgkP8et9FMXpsNUevfpZ0=
X-Google-Smtp-Source: AHgI3IapZUnlqi4no9WRvm5/7XezzyrKNQyF4sNP/+6MDb54uC408MpLy5Zy+mPWebOamfta+s3RpbABv2OnEC+KBFg=
X-Received: by 2002:aca:61c4:: with SMTP id v187mr4489191oib.122.1550637160135; 
 Tue, 19 Feb 2019 20:32:40 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
 <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
 <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
 <CAE33tLEdEsdZ+0NXvAuVeWP3145MvL5w=VZQp-_obQPBLSpDGw@mail.gmail.com>
 <7be5b88e-5a17-4f6f-b0dc-9120945a821c@www.fastmail.com>
In-Reply-To: <7be5b88e-5a17-4f6f-b0dc-9120945a821c@www.fastmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 20 Feb 2019 10:01:52 +0530
Message-ID: <CAE33tLHidcVg74E2WVTZ-0i1pH4TfOQPVzB0n02ek3GyDeY-Zw@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001b00e105824bd903"
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
X-List-Received-Date: Wed, 20 Feb 2019 04:32:43 -0000

--0000000000001b00e105824bd903
Content-Type: text/plain; charset="UTF-8"

Andrew, Sorry for the inconvenience.

For flashing the kernel image, I used the command

$
*pflash -e -a 0 -f -p fitImage.bin*

and for flashing root file system

*$ pflash -e -a 8388608 -f -p obmc.rootfs.cpio.lzma.u-boot*

After power-off I used the command* bootm 0x30000000 0x30800000 *in u-boot
prompt.

On Wed, Feb 20, 2019 at 4:52 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Tue, 19 Feb 2019, at 14:53, AKASH G J wrote:
> > I flashed OpenBMC image to system flash using pflash. After power-off,
> > I tried to boot the BMC (Aspeed AST-2500) from the system flash. For
> > that I used the command *bootm <system flash address>* in u-boot
> > prompt. That gives error "no image found".
>
> Akash, I can't help you any further if you do not give me the exact
> commands
> you are using to flash the system and verify your claims. For instance,
> there's
> no reason to abstract `<system flash address>` here and it's value is
> actually
> crucial to understanding what you are trying to do.
>
> Please, literally copy and paste the output of your console into your
> response.
> Please do not edit it, do not type it out by hand, do not invent or
> abstract the
> commands that you're executing. Without that I'm going to leave it for
> someone else to help.
>
> That said, bootm expects a kernel image in memory, not the address of the
> system flash. As far as I'm aware, if you're providing anything other than
> the
> kernel address it won't work. If you want to just start executing
> instructions
> at some random address, the `go` command is what you need:
>
> ```
> root@witherspoon:~# reboot -ff
> Rebooting.[42291.288011] reboot: Restarting system
>
>
>
> U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)
>
>        Watchdog enabled
> DRAM:  496 MiB
> Flash: 32 MiB
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Hit any key to stop autoboot:  0
> ast#
> ast# help go
> go - start application at address 'addr'
>
> Usage:
> go addr [arg ...]
>     - start application at address 'addr'
>       passing 'arg' as arguments
> ast# go 0
> ## Starting application at 0x00000000 ...
>
>
> U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)
>
>        Watchdog enabled
> DRAM:  496 MiB
> Flash: 32 MiB
> In:    serial
> Out:   serial
> Err:   serial
> Net:   aspeednic#0
> Hit any key to stop autoboot:  0
> ast#
> ```
>
>
> Andrew
>
> >
> > On Tue, Feb 19, 2019 at 5:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >  On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:
> > >  > I wrote a bootable version of OpenBMC Linux image in system SPI
> flash.
> > >  >
> > >  > I tried to boot it before power-off, it was successfully booted.
> Then I
> > >  > tried to boot the same, that time it was unsuccessful.
> > >
> > >  But you just said you flashed an OpenBMC image to the system flash.
> > >  That's never going to work. You need the host firmware on the host
> > >  flash to successfully boot the host, and OpenBMC is not the host
> > >  firmware.
> > >
> > >  Am I understanding you correctly?
> > >
> > >  >
> > >  > Do I need to make any change in the Linux device tree for resolving
> this issue?
> > >  >
> > >  > On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery <andrew@aj.id.au>
> wrote:
> > >  > >
> > >  > >
> > >  > > On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> > >  > > > I just powered off the entire board. After that the data is not
> present in
> > >  > > > the SPI1 flash. But before power-off it was there.
> > >  > >
> > >  > > How were you verifying the data was there before the poweroff?
> > >  > >
> > >  > > >
> > >  > > > We are using OpenBMC Linux version 4.18.7 and pflash v6.1
> > >  > >
> > >  > > Thanks for the versions. Should be handy as we dig deeper.
> > >  > >
> > >  >
> > >
> >
>

--0000000000001b00e105824bd903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>An=
drew, Sorry for the inconvenience.</div><div><br></div><div>For flashing th=
e kernel image, I used the command</div><div><br></div><div>$ <i>pflash -e =
-a 0 -f -p fitImage.bin<br></i></div><div><i><br></i></div><div>and for fla=
shing root file system</div><div><i><br></i></div><div><i>$ <i>pflash -e -a=
 <i>8388608</i> -f -p obmc.rootfs.cpio.lzma.u-boot</i></i></div><div><i><i>=
<br></i></i></div><div><i><i> </i></i>After power-off I used the command<i>=
<i> <i>bootm 0x30000000 0x30800000</i> </i></i>in u-boot prompt.</div></div=
></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Feb 20, 2019 at 4:52 AM Andrew Jeffery &lt;<a href=3D"=
mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, 19 Feb 2019, at 14:53, AKASH=
 G J wrote:<br>
&gt; I flashed OpenBMC image to system flash using pflash. After power-off,=
 <br>
&gt; I tried to boot the BMC (Aspeed AST-2500) from the system flash. For <=
br>
&gt; that I used the command *bootm &lt;system flash address&gt;* in u-boot=
 <br>
&gt; prompt. That gives error &quot;no image found&quot;.<br>
<br>
Akash, I can&#39;t help you any further if you do not give me the exact com=
mands<br>
you are using to flash the system and verify your claims. For instance, the=
re&#39;s<br>
no reason to abstract `&lt;system flash address&gt;` here and it&#39;s valu=
e is actually<br>
crucial to understanding what you are trying to do.<br>
<br>
Please, literally copy and paste the output of your console into your respo=
nse.<br>
Please do not edit it, do not type it out by hand, do not invent or abstrac=
t the<br>
commands that you&#39;re executing. Without that I&#39;m going to leave it =
for<br>
someone else to help.<br>
<br>
That said, bootm expects a kernel image in memory, not the address of the<b=
r>
system flash. As far as I&#39;m aware, if you&#39;re providing anything oth=
er than the<br>
kernel address it won&#39;t work. If you want to just start executing instr=
uctions<br>
at some random address, the `go` command is what you need:<br>
<br>
```<br>
root@witherspoon:~# reboot -ff<br>
Rebooting.[42291.288011] reboot: Restarting system<br>
<br>
<br>
<br>
U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Watchdog enabled<br>
DRAM:=C2=A0 496 MiB<br>
Flash: 32 MiB<br>
In:=C2=A0 =C2=A0 serial<br>
Out:=C2=A0 =C2=A0serial<br>
Err:=C2=A0 =C2=A0serial<br>
Net:=C2=A0 =C2=A0aspeednic#0<br>
Hit any key to stop autoboot:=C2=A0 0<br>
ast#<br>
ast# help go<br>
go - start application at address &#39;addr&#39;<br>
<br>
Usage:<br>
go addr [arg ...]<br>
=C2=A0 =C2=A0 - start application at address &#39;addr&#39;<br>
=C2=A0 =C2=A0 =C2=A0 passing &#39;arg&#39; as arguments<br>
ast# go 0<br>
## Starting application at 0x00000000 ...<br>
<br>
<br>
U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Watchdog enabled<br>
DRAM:=C2=A0 496 MiB<br>
Flash: 32 MiB<br>
In:=C2=A0 =C2=A0 serial<br>
Out:=C2=A0 =C2=A0serial<br>
Err:=C2=A0 =C2=A0serial<br>
Net:=C2=A0 =C2=A0aspeednic#0<br>
Hit any key to stop autoboot:=C2=A0 0<br>
ast#<br>
```<br>
<br>
<br>
Andrew<br>
<br>
&gt; <br>
&gt; On Tue, Feb 19, 2019 at 5:33 AM Andrew Jeffery &lt;<a href=3D"mailto:a=
ndrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:<br>
&gt; &gt;=C2=A0 &gt; I wrote a bootable version of OpenBMC Linux image in s=
ystem SPI flash. <br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; I tried to boot it before power-off, it was successful=
ly booted. Then I <br>
&gt; &gt;=C2=A0 &gt; tried to boot the same, that time it was unsuccessful.=
<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 But you just said you flashed an OpenBMC image to the syste=
m flash. <br>
&gt; &gt;=C2=A0 That&#39;s never going to work. You need the host firmware =
on the host<br>
&gt; &gt;=C2=A0 flash to successfully boot the host, and OpenBMC is not the=
 host<br>
&gt; &gt;=C2=A0 firmware.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Am I understanding you correctly?<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; Do I need to make any change in the Linux device tree =
for resolving this issue?<br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; w=
rote:<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:<b=
r>
&gt; &gt;=C2=A0 &gt; &gt; &gt; I just powered off the entire board. After t=
hat the data is not present in<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; the SPI1 flash. But before power-off it was =
there.<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; How were you verifying the data was there before =
the poweroff?<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; We are using OpenBMC Linux version 4.18.7 an=
d pflash v6.1<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; Thanks for the versions. Should be handy as we di=
g deeper.<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt;<br>
&gt; &gt;=C2=A0 <br>
&gt;<br>
</blockquote></div>

--0000000000001b00e105824bd903--
