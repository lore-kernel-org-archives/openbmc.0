Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qt83/9Lt"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VhdG6TGLzDqG8
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:57:54 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id e13so318196ioq.6
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 16:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SoST7OGhQWhquSBTuHKt6W6wd7HMo3IkqArD2mWTzbw=;
 b=Qt83/9LttkkFNvD6q5Vt00w9E1S31OGoyWdnX2vs1OK/lrK6lljyvH7/gs1RDJNUYo
 BhF03cqn7GCUlKlDAoxyE6/aH0q34pGkb+9bV4OoXhkKP1APsQGsUFp0+I0GJhrWcemp
 GfappE5+PgpU4uwag+sEgRzldRuumN41U0Sx3WKROTbuxKjAVgW+7BXVyRj5DLY/L7Uw
 APoDt0Xoqn7gipThE1rm77wKSe9gakOVA9BxjKFIozdyjFZnt9zl1lyZK6qwXD6OgOLK
 UrpyrQabGG7h+RIqxdfqgtz6QI2OhFY1NMGJVZ97ART29IDlxCap1nIF1VEpAGRQOyiR
 juuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SoST7OGhQWhquSBTuHKt6W6wd7HMo3IkqArD2mWTzbw=;
 b=fRBMPWjhmxHaiKtLlqwPyFj+wOEVGk/eNVTN2GEj4wWgrm3j1751rVHG3wEWg+0wJJ
 /LJ8tBNpwg0/iyqgXl6/5RIpvw9Hn0wG9h9NWX6dN1IBWXQIPfjsHQj0WDQ4xteP+ZsM
 CuS0BTl2n7Dw1a2F3kJM0rlbXO2I9N7joO6bGVz9qkdUPaDKfjwoP6urQ1mph1r+PbvS
 IgFafNdOFncqhZPuJq9QXpFM1RNfDGC3Y73+byOei724fksOeOrTDDBv07a9utiU1xgp
 4/oW0w1ma6OgbhP3r7EOg+qAEiPQs03Ct4f2dz2tIlHEWQd0r4j0KHW7ESfEo3L9djoJ
 J7Hg==
X-Gm-Message-State: APjAAAXIDocPgD90bgI+QUFEFridMoETRN+zjo6FiR4nvKDPEZoWiVJi
 oRjOPrw8WRgey8R6lcyMnAKaAxlGYdj3vevRiaA=
X-Google-Smtp-Source: APXvYqzNp1Llp4kwCeXSonbvn+9cX63LrDCooOCyGO0doKOM6rXFHWFuem55BVUsQJlqoNdBkBxWKmdVTIJtK7Hduos=
X-Received: by 2002:a5e:c110:: with SMTP id v16mr32188018iol.289.1553817470786; 
 Thu, 28 Mar 2019 16:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190328231317.330699-1-tmaimon77@gmail.com>
 <CAFd5g44h8J9VV84QbbEeE9U-=2kpOk-vgqCnmLV_=0uMu20MZw@mail.gmail.com>
In-Reply-To: <CAFd5g44h8J9VV84QbbEeE9U-=2kpOk-vgqCnmLV_=0uMu20MZw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 29 Mar 2019 03:05:00 +0300
Message-ID: <CAP6Zq1hkeD13LzUkm-i7iPb8hzoU2AG-RGGE6uc+fZDLCumS=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Joe Perches <joe@perches.com>, Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tali Perry <tali.perry1@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000006464b105853052ac"
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
X-List-Received-Date: Thu, 28 Mar 2019 23:57:55 -0000

--0000000000006464b105853052ac
Content-Type: text/plain; charset="UTF-8"

I send it again with the email addresses

On Fri, 29 Mar 2019 at 01:21, Brendan Higgins <brendanhiggins@google.com>
wrote:

> On Thu, Mar 28, 2019 at 4:13 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > In the process of upstreaming architecture support for ARM/NUVOTON NPCM
> > include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
> > include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
> > MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
> > of this file.
> >
> > Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM
> architecture")
> > Reported-by: Joe Perches <joe@xxxxxxxxxxx>
> > Signed-off-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
>
> Hmm...looks like you just copied the text from Spinics, because the
> email addresses are x'ed out.
>
> You can download the patch here:
> https://lore.kernel.org/patchwork/patch/996114/
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3e5a5d263f29..8b305d2f2a8a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1900,7 +1900,7 @@ L:        openbmc@lists.ozlabs.org (moderated for
> non-subscribers)
> >  S:     Supported
> >  F:     arch/arm/mach-npcm/
> >  F:     arch/arm/boot/dts/nuvoton-npcm*
> > -F:     include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> > +F:     include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> >  F:     drivers/*/*npcm*
> >  F:     Documentation/devicetree/bindings/*/*npcm*
> >  F:     Documentation/devicetree/bindings/*/*/*npcm*
> > --
> > 2.14.1
> >
>

--0000000000006464b105853052ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I send it again with the email addresses=C2=A0</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 29 M=
ar 2019 at 01:21, Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins@goog=
le.com">brendanhiggins@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Mar 28, 2019 at 4:13 PM Tomer Maim=
on &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In the process of upstreaming architecture support for ARM/NUVOTON NPC=
M<br>
&gt; include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed<br>
&gt; include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating<br>
&gt; MAINTAINERS. This updates the MAINTAINERS pattern to match the new nam=
e<br>
&gt; of this file.<br>
&gt;<br>
&gt; Fixes: 6a498e06ba22 (&quot;MAINTAINERS: Add entry for the Nuvoton NPCM=
 architecture&quot;)<br>
&gt; Reported-by: Joe Perches &lt;joe@xxxxxxxxxxx&gt;<br>
&gt; Signed-off-by: Brendan Higgins &lt;brendanhiggins@xxxxxxxxxx&gt;<br>
<br>
Hmm...looks like you just copied the text from Spinics, because the<br>
email addresses are x&#39;ed out.<br>
<br>
You can download the patch here: <a href=3D"https://lore.kernel.org/patchwo=
rk/patch/996114/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/patchwork/patch/996114/</a><br>
<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 3e5a5d263f29..8b305d2f2a8a 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -1900,7 +1900,7 @@ L:=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:=
openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a> (m=
oderated for non-subscribers)<br>
&gt;=C2=A0 S:=C2=A0 =C2=A0 =C2=A0Supported<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0arch/arm/mach-npcm/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/nuvoton-npcm*<br>
&gt; -F:=C2=A0 =C2=A0 =C2=A0include/dt-bindings/clock/nuvoton,npcm7xx-clks.=
h<br>
&gt; +F:=C2=A0 =C2=A0 =C2=A0include/dt-bindings/clock/nuvoton,npcm7xx-clock=
.h<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0drivers/*/*npcm*<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/*/*npcm*=
<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/*/*/*npc=
m*<br>
&gt; --<br>
&gt; 2.14.1<br>
&gt;<br>
</blockquote></div>

--0000000000006464b105853052ac--
