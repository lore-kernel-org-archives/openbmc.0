Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vD88J2z7rzDq96
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 03:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YG3gnKAI"; 
 dkim-atps=neutral
Received: by mail-wm0-x22e.google.com with SMTP id b65so47308534wmf.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 08:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4A/SoN2yKZtwVg6RbBHxATPzpkY4lVs9sMRg53s/A7s=;
 b=YG3gnKAI4grLHMmhWK3fPBLGLnLp0pF2n03DKFtO44B40l4co+H2yAeH1Y750+v9JG
 dZMYmlVcWuaeThvXDJjzbXG7h2fB8Ii+mAsfpwYMwHe72SqFG/ic5EkRopDEtgmjexZ/
 jK5meMcWqEELy8K5WipaPO4HyKn1YEw2We38MnsX2uHQF7zw0Y60bnX+HFJBbZX+rFpX
 v5WUbLd9m12YH3rFdpUS6v62IsQRskpM6wDDIcdO4saw1lpifye8wAd6YZcLIxxz/7y9
 +xoyzejZlK/qKpcJ1tQjg3otq6DdOT7fqz5PScqpkOuRW8+gevEJ4me8MSXOwq7JX5uk
 zMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4A/SoN2yKZtwVg6RbBHxATPzpkY4lVs9sMRg53s/A7s=;
 b=gOv11yHthILD9hO3VRGd9K/WW/cPY51czgk0G5fc6uo1P5P3B3Yfc+qKwsuDYY7HmK
 F7JUwgXJDSQYaxBEq6IwgfjMbyGb2E+BkQotzcxIosdI5CkOSFPgZypvRERIUtdRenA7
 iXg2k78h4nsNyrzZJiDMWv8NzO8G7Bxh2C7rae7p+eo4TWFrpVIYfeXmVd8IW4tt0HC+
 1/JBLq/SCz6G2WNnBkSVCBZmGqiQBv5Yac21HiHFC2mCwVimmQejsJt2Xbw6JM17vK2X
 t66nrd+hcNi7OaaBALjB2xIR/lLv9r9fODjbUNN20MpPOvXm/ShcYBqMeqVZLqEgax3B
 8WWg==
X-Gm-Message-State: AIkVDXK6Lr7yMjxjWr+M2QijpCv8I9Pcd500c/oW4rdsfaUWzgVU/DiFSmuCfZVJEiqRHZUNyQ7enL//m3tkUk1w
X-Received: by 10.28.175.138 with SMTP id y132mr4052315wme.86.1485967405505;
 Wed, 01 Feb 2017 08:43:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.158.15 with HTTP; Wed, 1 Feb 2017 08:43:24 -0800 (PST)
In-Reply-To: <e7627b17-2ac8-a954-5bd7-bcd3cd0e8ece@kaod.org>
References: <CAFR_W8qLw174HCxC4kmPuxZp30nA+n1Ug6FRkk1xSsYBUxZSpg@mail.gmail.com>
 <e7627b17-2ac8-a954-5bd7-bcd3cd0e8ece@kaod.org>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Feb 2017 08:43:24 -0800
Message-ID: <CAPLgG=mbzGMfKWTvm7QxU9FqFvvLX99tg_jsyyCA4FjadjFAdw@mail.gmail.com>
Subject: Re: Support for Aspeed SoC in upstream U-Boot
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11444dc25ace5105477abfba
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
X-List-Received-Date: Wed, 01 Feb 2017 16:43:29 -0000

--001a11444dc25ace5105477abfba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FWIW, the Quanta Q71L I'm playing with uses an AST2400 so I'm interested in
getting those drivers moved to upstream.  I have a few other things to
finish before i'll get to it though.

On Wed, Feb 1, 2017 at 1:15 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 01/31/2017 01:00 AM, Maxim Sloyko wrote:
> > Hi all,
> >
> > I'm happy to announce that the basic support for aspeed (ast2500 eval
> > board, to be specific) has been accepted into the upstream U-Boot and
> > will appear in 2017.03 release.
> >
> > It's a bare minimum required to boot the board into U-Boot prompt, but
> > it already has WDT, Timer, Sysreset, Clock (very basic) and SDRAM MC
> > drivers, all implemented in C from scratch.
>
> Nice job. Thanks for working on this.
>
> > Of these drivers, WDT, Timer and Sysreset *should* be ast2400
> > compatible, but I haven't tested it,
> > since I don't have the hardware. Clock driver is not ast2400
> > compatible, but it should not be hard to make it such.
>
> indeed. a couple of dividers are different. SCU also.
>
> > SDRAM driver is not compatible and my understanding that the controller=
s
> > on ast2500 and ast2400 boards are different enough to require different
> > drivers.
>
> That is the main issue and the driver will be much more complex but
> maybe we can start with some assembly.
>
> > I plan to continue expanding this support, which basically means
> > adding more drivers :)
>
> What is on your todo list  ? Have you tried to rebase the current
> missing drivers, even in an hacky way, on top of upstream u-boot ?
>
>
> Thanks,
>
> C.
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a11444dc25ace5105477abfba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW, the Quanta Q71L I&#39;m playing with uses an AST2400=
 so I&#39;m interested in getting those drivers moved to upstream.=C2=A0 I =
have a few other things to finish before i&#39;ll get to it though.</div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 1, 2017=
 at 1:15 AM, C=C3=A9dric Le Goater <span dir=3D"ltr">&lt;<a href=3D"mailto:=
clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D"">On 01/31/2017 01:00 AM, Maxim Sl=
oyko wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m happy to announce that the basic support for aspeed (ast2500 e=
val<br>
&gt; board, to be specific) has been accepted into the upstream U-Boot and<=
br>
&gt; will appear in 2017.03 release.<br>
&gt;<br>
&gt; It&#39;s a bare minimum required to boot the board into U-Boot prompt,=
 but<br>
&gt; it already has WDT, Timer, Sysreset, Clock (very basic) and SDRAM MC<b=
r>
&gt; drivers, all implemented in C from scratch.<br>
<br>
</span>Nice job. Thanks for working on this.<br>
<span class=3D""><br>
&gt; Of these drivers, WDT, Timer and Sysreset *should* be ast2400<br>
&gt; compatible, but I haven&#39;t tested it,<br>
&gt; since I don&#39;t have the hardware. Clock driver is not ast2400<br>
&gt; compatible, but it should not be hard to make it such.<br>
<br>
</span>indeed. a couple of dividers are different. SCU also.<br>
<span class=3D""><br>
&gt; SDRAM driver is not compatible and my understanding that the controlle=
rs<br>
&gt; on ast2500 and ast2400 boards are different enough to require differen=
t<br>
&gt; drivers.<br>
<br>
</span>That is the main issue and the driver will be much more complex but<=
br>
maybe we can start with some assembly.<br>
<span class=3D""><br>
&gt; I plan to continue expanding this support, which basically means<br>
&gt; adding more drivers :)<br>
<br>
</span>What is on your todo list=C2=A0 ? Have you tried to rebase the curre=
nt<br>
missing drivers, even in an hacky way, on top of upstream u-boot ?<br>
<br>
<br>
Thanks,<br>
<br>
C.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div>

--001a11444dc25ace5105477abfba--
