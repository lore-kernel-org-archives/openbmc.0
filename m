Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22e; helo=mail-qt0-x22e.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwSN8JYF"; 
 dkim-atps=neutral
Received: from mail-qt0-x22e.google.com (mail-qt0-x22e.google.com
 [IPv6:2607:f8b0:400d:c0d::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9lYQ2qQczDqv8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 03:09:13 +1100 (AEDT)
Received: by mail-qt0-x22e.google.com with SMTP id x54so43998891qth.12
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gDvDZUsdL3dRhAApbuvpi7Q1QBvW+LDepX/oG5GWOJA=;
 b=BwSN8JYFM3xSWolJiKOVA5leLcSTmDw5jiEEWsjxLeycH/bX7IglLArkhHjPgin55H
 rqfWz4cLq/tlJW/73YPJkSRDjxdqq9cvr+4DAAyZ5I22Bxcphi8c7CjQL/jp/XXKe2EJ
 tVvO8mKOv5Sp0tZsQBgDCRKyKmRru+pziDVEP2IXIwg35t5LqxBSnrlAOQyHAktcpVe+
 U/6wmMmtjCYhmrTiEj9e35eqCr1+JPMksc1umqphEE2qQD5JfL49N9+6QijAzkVKavKM
 w5LHQpDN4orV61iAPADN2DMjTXzPIeJgqxrKN2b8xFRBL0+tVR+D4usfuZrSE6lhHOuo
 2Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gDvDZUsdL3dRhAApbuvpi7Q1QBvW+LDepX/oG5GWOJA=;
 b=QeGFj5aYGgDSt8ZkNZSgFkT+z1pfSTdy2EbIbUudRhEsAzusgmiPV9aBGLoF6LloiS
 ab0A+tz7Ql8h0QNgW2AYsXRIAxXgZuFZDOPuO++iwaMjnWAqatjsVdKn29jDryYiuVRF
 IslPL/bgveGHjbsl9ezR0U9+Bp2zb8ZybyljyNwDUL/ktFn3Qrjp5EbvK3Mx+ZiSA+tt
 hi101VI17M5KqkqfeQk1ah7Udchpe5otFN0FIlS33lUp9LolsFdsW8gdvup0wrUg6B6N
 3j27bl6rxW/xpQpcyDTMCU2BlW9WmGw0OHgNAAPWUTiUdyUmr/wuXDEBJg32Fjbsq2zB
 TZhw==
X-Gm-Message-State: AMCzsaXOjl46kYmA8xtw/5s3LaPQa4gMEOj2S7VzrCIfodjSi/X6+jGh
 wXCHgmK2Lth71UMnwrfpsEJNMWcMVb1yjFy6SzE=
X-Google-Smtp-Source: AOwi7QAbSK1FBT9MG/W4N5F8LLBZaxXF7f4YP+1HyYcpHL3DIK7g2TG+eGLrezYdOaIkwYh6SsMFYL40nbZxvM2hQVM=
X-Received: by 10.237.60.37 with SMTP id t34mr12514154qte.224.1507565350877;
 Mon, 09 Oct 2017 09:09:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Mon, 9 Oct 2017 09:09:10 -0700 (PDT)
In-Reply-To: <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
From: Javier Romero <xavinux@gmail.com>
Date: Mon, 9 Oct 2017 13:09:10 -0300
Message-ID: <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c0e7fda370937055b1f69a0"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 16:09:15 -0000

--94eb2c0e7fda370937055b1f69a0
Content-Type: text/plain; charset="UTF-8"

Andrew,

"*More generally, knowledge of Python (Yocto/bitbake, some OpenBMC
userspace), C (u-boot, kernel, qemu, also requires a some comfort with
assembler) and C++ (most of the phosphor reference userspace applications)
is useful.*"

I see, but I'm not a programmer, have start by building an image of Yocto
for the Raspberry PI to learn more about Yocto, Poky and bitbake. Links you
provided are very welcome and useful!


Yi,



*"The original target was to build an OpenBMC image for RaspberryPi, but I
never tested on a real hardware.*
I've the Raspberry PI 3 at disposal for testing on a real hardware.

*More work is required to run OpenBMC on a Raspberry Pi. The
"meta-phosphor" layer has been changed since that time, we need to update
RaspberryPi configurations accordingly."*

Something I can help and with this although Im not a programmer?

Thanks for your answers and kind attention.

Regards,




*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-10-09 6:39 GMT-03:00 Yi TZ Li <shliyi@cn.ibm.com>:

> Javier,
>
> Andrew has mentioned the cause of the bug.
>
> When I added the RaspberryPi configure to OpenBMC, I referred to
> configuration of other boards, like:
> "meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf",
> you might also refer to other working machines.
>
> The original target was to build an OpenBMC image for RaspberryPi, but I
> never tested on a real hardware.
> More work is required to run OpenBMC on a Raspberry Pi.
>
> The "meta-phosphor" layer has been changed since that time, we need to
> update RaspberryPi configurations accordingly.
>
> Thanks,
> -Yi
>
> > From: Andrew Jeffery <andrew@aj.id.au>
> > To: Javier Romero <xavinux@gmail.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Date: 09/10/2017 02:41 PM
> > Subject: Re: OpenBMC on Raspberry PI 3.
> > Sent by: "openbmc" <openbmc-bounces+shliyi=cn.ibm.com@lists.ozlabs.org>
> >
> > On Sun, 2017-10-08 at 23:57 -0300, Javier Romero wrote:
> > > Andrew,
> > >
> > > Thans for your answer.
> > >
> > > Bug reported: https://github.com/openbmc/openbmc/issues/2434
> > >
> > > I`d like to try to cook up a patch, but do I need to know a specific
> > > language programming to do this ?
> >
> > Hmm, good question. This is probably a bug in how a bitbake
> > configuration/recipe configures the kernel. As such I'd suggest getting a
> > handle on Yocto, which is the build and configuration system we
> use.Here's the
>
> > quick start guide:
> >
> > http://www.yoctoproject.org/docs/2.1/yocto-project-qs/
> yocto-project-qs.html
> >
> > There's also a rather daunting Mega Manual, which is useful as a
> reference
> > (rather than reading the whole thing):
> >
> > http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html
> >
> > Back to the bug itself, from the output that you gave I expect it's some
> issue
> > with the following directive:
> >
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/
> > distro/openbmc-phosphor.conf#L57
> >
> > i.e. the issue is that that linux-raspberrypi (the kernel recipe used
> for the
> > raspberry pi[1][2]) doesn't have a 'phosphor-gpio-keys' feature. The
> implicit
> > assumption is that the configuration will be using the linux-obmc
> > tree[3][4][5], which
> > is our fork of the kernel (primarily for Aspeed SoC support).
> >
> > More generally, knowledge of Python (Yocto/bitbake, some OpenBMC
> userspace), C
> > (u-boot, kernel, qemu, also requires a some comfort with assembler)
> > and C++ (most
> > of the phosphor reference userspace applications) is useful.
> >
> > Hope that helps.
> >
> > Andrew
> >
> > [1] https://github.com/openbmc/openbmc/blob/
> > 4f2d85233d23eedaf1d4846d3d861ba28bc49b00/import-layers/meta-
> > raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.4.bb
> > [2] https://github.com/openbmc/openbmc/blob/
> > 4f2d85233d23eedaf1d4846d3d861ba28bc49b00/import-layers/meta-
> > raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
> > [3] https://github.com/openbmc/openbmc/blob/
> > 4f2cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/
> > recipes-kernel/linux/linux-obmc_4.10.bb
> > [4] https://github.com/openbmc/openbmc/blob/
> > 4f2cddf103aaca6df26ddb766655fdf49c56a6ae/meta-phosphor/common/
> > recipes-kernel/linux/linux-obmc.inc[attachment "signature.asc"
> > deleted by Yi TZ Li/China/IBM]
>
>

--94eb2c0e7fda370937055b1f69a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Andrew,<br><br></div><span style=3D"fo=
nt-family:monospace,monospace">&quot;<b>More generally, knowledge of Python=
 (Yocto/bitbake, some OpenBMC userspace), C (u-boot, kernel, qemu, also req=
uires a some comfort with assembler) and C++ (most of the phosphor referenc=
e userspace applications) is useful.</b>&quot;</span><br><br></div>I see, b=
ut I&#39;m not a programmer, have start by building an image of Yocto for t=
he Raspberry PI to learn more about Yocto, Poky and bitbake. Links you prov=
ided are very welcome and useful!<br><br></div><br>Yi,<br><br><font size=3D=
"4"><b><i><tt>&quot;The original target was to build an OpenBMC image for R=
aspberryPi, but I never tested on a real hardware.</tt><br><br></i></b></fo=
nt></div><font size=3D"4"><font size=3D"2">I&#39;ve the Raspberry PI 3 at d=
isposal for testing on a real hardware.</font><br></font><div><div><div><di=
v><font size=3D"4"><b><i><br><tt>More work is required to run OpenBMC on a =
Raspberry Pi.</tt> <tt>The &quot;meta-phosphor&quot; layer has been changed=
 since that time, we need to update RaspberryPi configurations accordingly.=
&quot;</tt></i></b></font><br><div><br></div><div>Something I can help and =
with this although Im not a programmer? <br></div><div><br></div><div>Thank=
s for your answers and kind attention.<br><br></div><div>Regards,<br><br>=
=C2=A0<br></div></div></div></div></div></div><div class=3D"gmail_extra"><b=
r clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Ro=
mero<br></b></i></div><div style=3D"text-align:left"><span style=3D"color:r=
gb(19,79,92)"><i><b><span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"=
color:rgb(0,0,255)"> </span></span><span style=3D"color:rgb(0,0,255)"><a hr=
ef=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></sp=
an><br></b></i></span></div><div style=3D"text-align:left"><i><b><span styl=
e=3D"color:rgb(19,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <s=
pan style=3D"color:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xa=
vinux</span><br></u></span></span></b></i></div><div style=3D"text-align:le=
ft"><br></div> </div></div></div>
<br><div class=3D"gmail_quote">2017-10-09 6:39 GMT-03:00 Yi TZ Li <span dir=
=3D"ltr">&lt;<a href=3D"mailto:shliyi@cn.ibm.com" target=3D"_blank">shliyi@=
cn.ibm.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p><tt><f=
ont size=3D"2">Javier,</font></tt><br><br><tt><font size=3D"2">Andrew has m=
entioned the cause of the bug.</font></tt><br><br><tt><font size=3D"2">When=
 I added the RaspberryPi configure to OpenBMC, I referred to configuration =
of other boards, like:</font></tt><br><tt><font size=3D"2">&quot;</font></t=
t><tt><font size=3D"2">meta-openbmc-machines/meta-<wbr>evb/meta-evb-aspeed/=
meta-evb-<wbr>ast2500/conf</font></tt><tt><font size=3D"2">&quot;, you migh=
t also refer to other working machines.</font></tt><br><br><tt><font size=
=3D"2">The original target was to build an OpenBMC image for RaspberryPi, b=
ut I never tested on a real hardware.</font></tt><br><tt><font size=3D"2">M=
ore work is required to run OpenBMC on a Raspberry Pi.</font></tt><br><br><=
tt><font size=3D"2">The &quot;meta-phosphor&quot; layer has been changed si=
nce that time, we need to update RaspberryPi configurations accordingly.</f=
ont></tt><br><br><tt><font size=3D"2">Thanks,</font></tt><br><tt><font size=
=3D"2">-Yi</font></tt><br><tt><font size=3D"2"><br>&gt; From: Andrew Jeffer=
y &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au<=
/a>&gt;</font></tt><br><tt><font size=3D"2">&gt; To: Javier Romero &lt;<a h=
ref=3D"mailto:xavinux@gmail.com" target=3D"_blank">xavinux@gmail.com</a>&gt=
;</font></tt><br><tt><font size=3D"2">&gt; Cc: OpenBMC Maillist &lt;<a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs=
.org</a>&gt;</font></tt><br><tt><font size=3D"2">&gt; Date: 09/10/2017 02:4=
1 PM</font></tt><br><tt><font size=3D"2">&gt; Subject: Re: OpenBMC on Raspb=
erry PI 3.</font></tt><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&=
quot; &lt;openbmc-bounces+shliyi=3D<a href=3D"mailto:cn.ibm.com@lists.ozlab=
s.org" target=3D"_blank">cn.<wbr>ibm.com@lists.ozlabs.org</a>&gt;</font></t=
t><br><tt><font size=3D"2"><span class=3D"">&gt; <br>&gt; On Sun, 2017-10-0=
8 at 23:57 -0300, Javier Romero wrote:<br>&gt; &gt; Andrew,<br>&gt; &gt;=C2=
=A0<br>&gt; &gt; Thans for your answer.<br>&gt; &gt;=C2=A0<br>&gt; &gt; Bug=
 reported:=C2=A0<a href=3D"https://github.com/openbmc/openbmc/issues/2434" =
target=3D"_blank">https://github.com/<wbr>openbmc/openbmc/issues/2434</a><b=
r>&gt; &gt;=C2=A0<br>&gt; &gt; I`d like to try to cook up a patch, but do I=
 need to know a specific<br>&gt; &gt; language programming to do this ?<br>=
&gt; <br>&gt; Hmm, good question. This is probably a bug in how a bitbake<b=
r>&gt; configuration/recipe configures the kernel. As such I&#39;d suggest =
getting a<br></span>&gt; handle on Yocto, which is the build and configurat=
ion system we use.Here&#39;s the</font></tt></p><div><div class=3D"h5"><tt>=
<font size=3D"2"><br>&gt; quick start guide:<br>&gt; <br>&gt; <a href=3D"ht=
tp://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.html" =
target=3D"_blank">http://www.yoctoproject.org/<wbr>docs/2.1/yocto-project-q=
s/<wbr>yocto-project-qs.html</a><br>&gt; <br>&gt; There&#39;s also a rather=
 daunting Mega Manual, which is useful as a reference<br>&gt; (rather than =
reading the whole thing):<br>&gt; <br>&gt; <a href=3D"http://www.yoctoproje=
ct.org/docs/2.1/mega-manual/mega-manual.html" target=3D"_blank">http://www.=
yoctoproject.org/<wbr>docs/2.1/mega-manual/mega-<wbr>manual.html</a><br>&gt=
; <br>&gt; Back to the bug itself, from the output that you gave I expect i=
t&#39;s some issue<br>&gt; with the following directive:<br>&gt; <br>&gt; <=
a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf=
/" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/blob/master/me=
ta-<wbr>phosphor/conf/</a><br>&gt; distro/openbmc-phosphor.conf#<wbr>L57<br=
>&gt; <br>&gt; i.e. the issue is that that linux-raspberrypi (the kernel re=
cipe used for the<br>&gt; raspberry pi[1][2]) doesn&#39;t have a &#39;phosp=
hor-gpio-keys&#39; feature. The implicit<br>&gt; assumption is that the con=
figuration will be using the linux-obmc <br>&gt; tree[3][4][5], which<br>&g=
t; is our fork of the kernel (primarily for Aspeed SoC support).<br>&gt; <b=
r>&gt; More generally, knowledge of Python (Yocto/bitbake, some OpenBMC use=
rspace), C<br>&gt; (u-boot, kernel, qemu, also requires a some comfort with=
 assembler) <br>&gt; and C++ (most<br>&gt; of the phosphor reference usersp=
ace applications) is useful.<br>&gt; <br>&gt; Hope that helps.<br>&gt; <br>=
&gt; Andrew<br>&gt; <br>&gt; [1] <a href=3D"https://github.com/openbmc/open=
bmc/blob/" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/blob/<=
/a><br>&gt; 4f2d85233d23eedaf1d4846d3d861b<wbr>a28bc49b00/import-layers/met=
a-<br>&gt; raspberrypi/recipes-kernel/<wbr>linux/<a href=3D"http://linux-ra=
spberrypi_4.4.bb" target=3D"_blank">linux-raspberrypi_4.4.bb</a><br>&gt; [2=
] <a href=3D"https://github.com/openbmc/openbmc/blob/" target=3D"_blank">ht=
tps://github.com/openbmc/<wbr>openbmc/blob/</a><br>&gt; 4f2d85233d23eedaf1d=
4846d3d861b<wbr>a28bc49b00/import-layers/meta-<br>&gt; raspberrypi/recipes-=
kernel/<wbr>linux/linux-raspberrypi.inc<br>&gt; [3] <a href=3D"https://gith=
ub.com/openbmc/openbmc/blob/" target=3D"_blank">https://github.com/openbmc/=
<wbr>openbmc/blob/</a><br>&gt; 4f2cddf103aaca6df26ddb766655fd<wbr>f49c56a6a=
e/meta-phosphor/<wbr>common/<br>&gt; recipes-kernel/linux/<a href=3D"http:/=
/linux-obmc_4.10.bb" target=3D"_blank">linux-<wbr>obmc_4.10.bb</a><br>&gt; =
[4] <a href=3D"https://github.com/openbmc/openbmc/blob/" target=3D"_blank">=
https://github.com/openbmc/<wbr>openbmc/blob/</a><br>&gt; 4f2cddf103aaca6df=
26ddb766655fd<wbr>f49c56a6ae/meta-phosphor/<wbr>common/<br></font></tt></di=
v></div><tt><font size=3D"2">&gt; recipes-kernel/linux/linux-<wbr>obmc.inc[=
attachment &quot;signature.asc&quot; <br>&gt; deleted by Yi TZ Li/China/IBM=
] </font></tt><br>
<p></p></div>
</blockquote></div><br></div>

--94eb2c0e7fda370937055b1f69a0--
