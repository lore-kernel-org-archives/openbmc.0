Return-Path: <maxims@google.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9TCL2kCQzDvWh
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:21:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VSwmma9V"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id d128so34690096ybh.2
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cFVO3jq15+CMCV5pP7yNz7Uw37PHhcoErj+tieoPTDs=;
 b=VSwmma9V6ed6sQSRSHKsvBynYRqi+I9p2YbkTWe3lPOnYdGlTRZ+x63hJtuoAWPeFs
 rHnzM+gCXUrzby0Qhh1Z0RXgrLPnrhmrNycyBw/CIVuOQRgcm9Nl0swBk6ojPcy0C2To
 xepv/h5gzeeXy31F1gOXNPEmfGtVuIpDcXYAdscIDT8s1/D2XQTQQIsQMD6L//deXQCf
 pTUZej+EvE/nGNtOoJYoPpoeXwh2EGXTJnkCqKwCUU6LpQ+3/MDRGiZCPFkybw7dglyL
 cKFxu0dGiurLc90UUt6AEUgOXrTQeCe0d64iMaKCei9JN/H0cNv0YL+bjGP5NwkL1BzZ
 +pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cFVO3jq15+CMCV5pP7yNz7Uw37PHhcoErj+tieoPTDs=;
 b=Dpbuje4ZfM2rBqQmrHdOX3LUBLhIp7MOwYWJPExOyYHV3kvEsrSK6SsDjaW2jAbsdf
 o3yt+GPniZiV7uH1OdYm1hIVIjhUtQeXQrFlEyXdAxKf860dME5LUb1GXOR5ozAiAmIV
 nngiCXzO2sirN0tVTZOzPu9gxfOTIp6N5e5KSJunpltwucRp50XlD1udqkVNLVRKfSOk
 5bCLvL30CZZdoQ7flWssMdtnaACm8qJ4/7izEj7nu+4+O/RtplV2geciXhP+KHicDAE1
 1P5NAOv2DKt3J+uA/byRZYRxms4VnXXHlEZdwLOz8FKZhDTlg/JaEgF/ZfLRDncMH3Yx
 DrIQ==
X-Gm-Message-State: ABUngvd3uz7OlCfn4hGJGDFJd/qedsN1290v8EfS+L04IraDTVQLhwwHro2b7F4eMbStJsvHuErGpnboc6ctdJfe
X-Received: by 10.37.2.193 with SMTP id 184mr15663041ybc.10.1478280090546;
 Fri, 04 Nov 2016 10:21:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Fri, 4 Nov 2016 10:21:30 -0700 (PDT)
In-Reply-To: <bacea3c2-98a3-65d1-018f-e28797dae181@kaod.org>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
 <bacea3c2-98a3-65d1-018f-e28797dae181@kaod.org>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 4 Nov 2016 10:21:30 -0700
Message-ID: <CAFR_W8qTtr3tbgj=kWuACnkCdBJkRTsquVZVN+MTG6E9-3nSnA@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Teddy Reed <teddy.reed@gmail.com>
Content-Type: multipart/alternative; boundary=001a113d4958ad713b05407ce72d
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
X-List-Received-Date: Fri, 04 Nov 2016 17:21:35 -0000

--001a113d4958ad713b05407ce72d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2016 at 9:08 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/04/2016 01:09 AM, Joel Stanley wrote:
> > Hi Maxim,
> >
> > On Fri, Nov 4, 2016 at 7:14 AM, Maxim Sloyko <maxims@google.com> wrote:
> >> Hi Cedric,
> >>
> >> My manager (Rick Alther) mentioned that you were working on some minim=
al
> >> "upstreamable" commit for Aspeed in U-Boot. How far were you able to
> get?
> >>
> >> This is also what I was thinking of doing, so we should be able to joi=
n
> >> forces on this.
> >>
> >> I talked to Simon Glass recently (he's an active contributor to mainli=
ne
> >> U-Boot) and basically that's the path that he also recommended -- just
> >> getting minimal amount of code in, that can just boot to a prompt. He
> also
> >> said that DRAM driver would have to be part of it.
> >
> > I agree. The downside here is Cedric has done a lot of work in
> > cleaning up the Aspeed SDK code already, so we don't want to throw
> > away the good stuff he's done.
>

Why would that be thrown away? The idea is to prepare minimum amount of
stuff required for the first commit upstream.
The rest won't be thrown away, it will just follow.


>
> half of that work is yours, Joel.
>
> >> So, the way I see it, there are two big chunks of work here:
> >>  1. Setting up the whole structure. This would include actually adding=
 a
> >> board, minimum amount of supporting code, debug serial console init,
> >
> > I have a tree where I've started pulling the build scaffolding -
> > kconfig, makefiles, etc - out of the patch we have.
> >
> > The second part of it is writing a clean serial driver. The hardware a
> > pretty standard layout, so I imagine we don't need to do much here.
> > Perhaps doing some calculations based on the clock speed to set a baud
> > rate.
> >
> >>  2. DDR3/DDR4 driver. This is the biggest part of what we have in
> platform.S
> >> now. A lot of work, but relatively straightforward, just rewrite ~1.5k
> lines
> >> of assembly in C.
> >
> > Our concern with rewriting this is future maintainability. If we
> > rewrite it, it becomes harder to incorporate fixes and new hardware
> > support from Aspeed SDKs.
>
> Yes that is one big concern I think. The platform*.s files are
> exactly the one shipped by Aspeed.
>

Since they are not helping, I don't see any other way. We will just have to
look at their diffs and incorporate those fixes in our tree. I would take
this option any day over having to make fixes in platform.s, if we need to
change something.


>
> > On the other hand, there's no way we can upstream it as-is. So lets
> > re-write it in C, and where we can document parts of the
> > reimplementation with reference to the assembly so making updates is
> > possible.
> >
> >>
> >> Personally, I don't have preference on who does what, as long as we
> don't
> >> step on each other's toes. It would probably be easier for me to take
> (1),
> >> because I can easily talk to two people who are in our time zone and
> have a
> >> lot of mainline U-Boot experience.
>
> sure.
>
> > I think we've got a good handle on (1), however I'll let Cedric
> > comment as to what he would prefer to work on.
>
> My main concern is keeping a full patchset working with the HW
> we have. I don't think there is much value in pushing mainline
> some code we don't use because it is too far away from our
> current need. So whatever we send should be used in our openbmc
> tree, but not in the stable branch of course.
>
> As said in the other email, I think we are at point where we
> should dismantle lowlevel_init in little parts.
>
> Maxim, may be you could take a look at the SDRAM calibration ?
>
> This is the biggest part when this is done, the rest should
> flow.
>

Sounds good to me, I'll start pulling out SDRAM part out.


>
> Cheers,
>
> C.
>
> > Note that this work is continuing on from some work done by Teddy
> > several months ago. He has a tree here:
> >
> >  https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r3
> >
> > Cheers,
> >
> > Joel
>
>


--=20
*M*axim *S*loyko

--001a113d4958ad713b05407ce72d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 4, 2016 at 9:08 AM, C=C3=A9dric Le Goater <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 11/04/=
2016 01:09 AM, Joel Stanley wrote:<br>
&gt; Hi Maxim,<br>
&gt;<br>
&gt; On Fri, Nov 4, 2016 at 7:14 AM, Maxim Sloyko &lt;<a href=3D"mailto:max=
ims@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;&gt; Hi Cedric,<br>
&gt;&gt;<br>
&gt;&gt; My manager (Rick Alther) mentioned that you were working on some m=
inimal<br>
&gt;&gt; &quot;upstreamable&quot; commit for Aspeed in U-Boot. How far were=
 you able to get?<br>
&gt;&gt;<br>
&gt;&gt; This is also what I was thinking of doing, so we should be able to=
 join<br>
&gt;&gt; forces on this.<br>
&gt;&gt;<br>
&gt;&gt; I talked to Simon Glass recently (he&#39;s an active contributor t=
o mainline<br>
&gt;&gt; U-Boot) and basically that&#39;s the path that he also recommended=
 -- just<br>
&gt;&gt; getting minimal amount of code in, that can just boot to a prompt.=
 He also<br>
&gt;&gt; said that DRAM driver would have to be part of it.<br>
&gt;<br>
&gt; I agree. The downside here is Cedric has done a lot of work in<br>
&gt; cleaning up the Aspeed SDK code already, so we don&#39;t want to throw=
<br>
&gt; away the good stuff he&#39;s done.<br></span></blockquote><div><br></d=
iv><div>Why would that be thrown away? The idea is to prepare minimum amoun=
t of stuff required for the first commit upstream.</div><div>The rest won&#=
39;t be thrown away, it will just follow.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><span class=3D"">
<br>
</span>half of that work is yours, Joel.<br>
<span class=3D""><br>
&gt;&gt; So, the way I see it, there are two big chunks of work here:<br>
&gt;&gt;=C2=A0 1. Setting up the whole structure. This would include actual=
ly adding a<br>
&gt;&gt; board, minimum amount of supporting code, debug serial console ini=
t,<br>
&gt;<br>
&gt; I have a tree where I&#39;ve started pulling the build scaffolding -<b=
r>
&gt; kconfig, makefiles, etc - out of the patch we have.<br>
&gt;<br>
&gt; The second part of it is writing a clean serial driver. The hardware a=
<br>
&gt; pretty standard layout, so I imagine we don&#39;t need to do much here=
.<br>
&gt; Perhaps doing some calculations based on the clock speed to set a baud=
<br>
&gt; rate.<br>
&gt;<br>
&gt;&gt;=C2=A0 2. DDR3/DDR4 driver. This is the biggest part of what we hav=
e in platform.S<br>
&gt;&gt; now. A lot of work, but relatively straightforward, just rewrite ~=
1.5k lines<br>
&gt;&gt; of assembly in C.<br>
&gt;<br>
&gt; Our concern with rewriting this is future maintainability. If we<br>
&gt; rewrite it, it becomes harder to incorporate fixes and new hardware<br=
>
&gt; support from Aspeed SDKs.<br>
<br>
</span>Yes that is one big concern I think. The platform*.s files are<br>
exactly the one shipped by Aspeed.<br></blockquote><div><br></div><div>Sinc=
e they are not helping, I don&#39;t see any other way. We will just have to=
 look at their diffs and incorporate those fixes in our tree. I would take =
this option any day over having to make fixes in platform.s, if we need to =
change something.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; On the other hand, there&#39;s no way we can upstream it as-is. So let=
s<br>
&gt; re-write it in C, and where we can document parts of the<br>
&gt; reimplementation with reference to the assembly so making updates is<b=
r>
&gt; possible.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Personally, I don&#39;t have preference on who does what, as long =
as we don&#39;t<br>
&gt;&gt; step on each other&#39;s toes. It would probably be easier for me =
to take (1),<br>
&gt;&gt; because I can easily talk to two people who are in our time zone a=
nd have a<br>
&gt;&gt; lot of mainline U-Boot experience.<br>
<br>
</span>sure.<br>
<span class=3D""><br>
&gt; I think we&#39;ve got a good handle on (1), however I&#39;ll let Cedri=
c<br>
&gt; comment as to what he would prefer to work on.<br>
<br>
</span>My main concern is keeping a full patchset working with the HW<br>
we have. I don&#39;t think there is much value in pushing mainline<br>
some code we don&#39;t use because it is too far away from our<br>
current need. So whatever we send should be used in our openbmc<br>
tree, but not in the stable branch of course.<br>
<br>
As said in the other email, I think we are at point where we<br>
should dismantle lowlevel_init in little parts.<br>
<br>
Maxim, may be you could take a look at the SDRAM calibration ?<br>
<br>
This is the biggest part when this is done, the rest should<br>
flow.<br></blockquote><div><br></div><div>Sounds good to me, I&#39;ll start=
 pulling out SDRAM part out.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
Cheers,<br>
<br>
C.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Note that this work is continuing on from some work done by Teddy<br>
&gt; several months ago. He has a tree here:<br>
&gt;<br>
&gt;=C2=A0 <a href=3D"https://github.com/theopolis/u-boot-openbmc/tree/v201=
6.03-openbmc-r3" rel=3D"noreferrer" target=3D"_blank">https://github.com/th=
eopolis/<wbr>u-boot-openbmc/tree/v2016.03-<wbr>openbmc-r3</a><br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M=
</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a113d4958ad713b05407ce72d--
