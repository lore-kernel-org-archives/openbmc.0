Return-Path: <raltherr@google.com>
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPfG76Ds8zDqBr
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:51:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VjJgyuW6"; 
 dkim-atps=neutral
Received: by mail-it0-x22f.google.com with SMTP id h10so5508393ith.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wvwpjwNT7IABmYHfHKEZKgjgYRjCRADYmTWvpxL8gQo=;
 b=VjJgyuW6Ad9IiWU4ES4Rx9HpERpQbRNAKb5x9ti36RUi4mAo0N7MkaX7odLbK+Dn7b
 bpcqUdj8dMJSOGOpQ9knICM33ESHwtTq/BxNCxFov51HyXyvyrmjgRUFUG/4X9DsWDlM
 R39bCkD9w2JG/qhQaebbKptDRgSqDKjNWyS+zxcImRCBDJIYRoo+2XzewCaSNEbDIQZH
 IfU/uRc40Yaa1ypeWzElfZEvYlEu3mJ62mkwHOS21Nlw6IYpg+IbaDJQUZACJSlMR5+2
 xlF4d+yPifmALYpUVGpZis+xa7OfA4Ontg7TiqoMF5lCg1z+MA0L+jMmNuqLJEzpMRRW
 7vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wvwpjwNT7IABmYHfHKEZKgjgYRjCRADYmTWvpxL8gQo=;
 b=HUPZZiodhvpFgq9HPngbusCVjOY9mhGugsc0Rb9pZwjiqdnQX3eAXg55HHGHj2H0/c
 BdEPXhT7wWGgbwd4qkwnFjnEcGoZYiJxU9ZtCLWDNERtu+R8qjZRp5Y/eCflHh3S3p3n
 Sk8xO8txh+jyNkaykyeLtz4GBme+7mOD1hBSycr35tx+TNtBlVwAhhZayRI1gX2ow7Zj
 mkkc3ExEQnz0HNkR5NOL2sceWj8e1SnceJmxNJDOHJ8QEgn2hKVthJYBFxFssNSlHyra
 nV6kNbTWVVDtP4+LgAPisAE4WZjVa/vbon8Imq3F8V9hXOKxS6UarE0rPBntolKnQSTm
 g8OQ==
X-Gm-Message-State: AMke39mqsp1ugNue7Gq0bg3pbwo0/fj4Tp5aH0DCq+DBpXmUB5K+w11mw5BF6LhhQF3Osn/ezEb1cxOiBBZyyZXP
X-Received: by 10.36.64.70 with SMTP id n67mr891897ita.21.1487303485292; Thu,
 16 Feb 2017 19:51:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:51:24 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Thu, 16 Feb 2017 19:51:24 -0800 (PST)
In-Reply-To: <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
 <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
 <1487302684.3661.40.camel@aj.id.au>
 <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 16 Feb 2017 19:51:24 -0800
Message-ID: <CAPLgG==q9uh-pEDX+Ji5g0Aw0Ae4Ro3TvWY1qFh62UUoGGKM5Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary=001a1135a57aea7d6f0548b1d3bf
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
X-List-Received-Date: Fri, 17 Feb 2017 03:51:28 -0000

--001a1135a57aea7d6f0548b1d3bf
Content-Type: text/plain; charset=UTF-8

I believe mbox is needed on AST2400 for Quanta Q71L.

On Feb 16, 2017 7:42 PM, "Joel Stanley" <joel@jms.id.au> wrote:

> On Fri, Feb 17, 2017 at 2:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 2017-02-17 at 14:02 +1030, Joel Stanley wrote:
> >> On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au>
> >> wrote:
> >> > Required for pinmux, which tests some bits in the LHC's IO space.
> >> >
> >> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >>
> >> Large Hadron Collider!
> >>
> >> Does the ast2400 want to know about it's particle accelerator too?
> >
> > Nah, the ast2400 doesn't require a particle accelerator for pinctrl,
> > and I don't think we have any other reason to need it (yet).
>
> I think we need it for mbox, assuming we end up enabling ast2400
> platforms with that functionality.
>
> Cross that bridge when we get to it.
>
> Cheers,
>
> Joel
>

--001a1135a57aea7d6f0548b1d3bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I believe mbox is needed on AST2400 for Quanta Q71L. =C2=
=A0</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Feb 1=
6, 2017 7:42 PM, &quot;Joel Stanley&quot; &lt;<a href=3D"mailto:joel@jms.id=
.au">joel@jms.id.au</a>&gt; wrote:<br type=3D"attribution"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Fri, Feb 17, 2017 at 2:08 PM, Andrew Jeffery &lt;<a href=
=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; On Fri, 2017-02-17 at 14:02 +1030, Joel Stanley wrote:<br>
&gt;&gt; On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery &lt;<a href=3D"ma=
ilto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Required for pinmux, which tests some bits in the LHC&#39;s I=
O space.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj=
.id.au">andrew@aj.id.au</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Large Hadron Collider!<br>
&gt;&gt;<br>
&gt;&gt; Does the ast2400 want to know about it&#39;s particle accelerator =
too?<br>
&gt;<br>
&gt; Nah, the ast2400 doesn&#39;t require a particle accelerator for pinctr=
l,<br>
&gt; and I don&#39;t think we have any other reason to need it (yet).<br>
<br>
I think we need it for mbox, assuming we end up enabling ast2400<br>
platforms with that functionality.<br>
<br>
Cross that bridge when we get to it.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div></div>

--001a1135a57aea7d6f0548b1d3bf--
