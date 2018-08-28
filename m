Return-Path: <beccabroek@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c29; helo=mail-yw1-xc29.google.com;
 envelope-from=beccabroek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZR4xnIE"; 
 dkim-atps=neutral
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420M4g2RyMzF0dp
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 07:16:18 +1000 (AEST)
Received: by mail-yw1-xc29.google.com with SMTP id x67-v6so1181228ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQ4pNIZm9ezHT6pISwlMSqL4y0kIzERwy8an4Tntm5A=;
 b=OZR4xnIEhHQ7uwD0Hrn9+toSbbCjrTtDZZ3zotnayLmjv2nQz+QnK2Y0Ek9oFL/fkR
 58r/4CTbdu+yOL/kv7AEVz1cqfM801FTbRgCzx0gEM10Ovwdc1UfCF5ZAdUipfYSAz2c
 gi8kwufVs7mZjZp6asepfKa1W+kKR//hQdNTcHaU4QF2eI0KtKLbWwT+JQaWJXa2bnGn
 pnKu9mXiLyrDODahBylruf/7OT3KX9vVIVq+34Wx2nQAtjLMF/CpOrq3OfwjhJe/aRK+
 5JYrIboKNloujmbX4H+TqOPz1Dm5gwSIXUdw+EbzNrp/Pqwf5J9QXCHmhWZeW/Dau2U0
 cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQ4pNIZm9ezHT6pISwlMSqL4y0kIzERwy8an4Tntm5A=;
 b=IoLB+uHNac53Az3MOhmAa/jn7cf8pjgEcTWolk02svhTG6k5fcTOjcpFx7qpHOLd1X
 lmwKqqpaN4hafdzp50q/EBK3Y7LTjMbe8JB7Pntyy8YK4ovUw6r4z65G/xoMRGPCTVPr
 LKqrnfz7Z7q9AWHdy8/04YtybsL5oTWNdlY8B5xcrPuemud/7WfoqzCw40OvFmxqxGC9
 U7MGBwDXgU7n9UOkUoGmkqttUSddQrSbT+7HBmyV1XlajSQyFGLIxpv8Ge0oZ+20ogca
 ylbiGB9/WflsymjD8AzLMuw2lT6iscaJBrAsGZjICbkU5BWknfZE4AsTpdmc7/k2767W
 Z/JA==
X-Gm-Message-State: APzg51DKLZbsg2qoStDLYdVhZIkrUT1x+ucAD9Ja0dILooki1EA9dGfr
 mC1Nj7BCSNlhNO+WA3wfFn0E2L6KFbXOojNtdvI=
X-Google-Smtp-Source: ANB0VdapVmpLT9mXH7t6b6bHL8xN7Vp0O7u9S3bxuFa3s6hIeJD8JDS4tfLg2Uih3xcdwpj1z4zoL5apeSu5RQTcKhA=
X-Received: by 2002:a0d:c705:: with SMTP id
 j5-v6mr1859694ywd.466.1535490976472; 
 Tue, 28 Aug 2018 14:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <d94fd642-a114-1ed8-aa89-e2951848adbb@ozlabs.org>
In-Reply-To: <d94fd642-a114-1ed8-aa89-e2951848adbb@ozlabs.org>
From: Rebecca Broekhuis <beccabroek@gmail.com>
Date: Tue, 28 Aug 2018 16:16:04 -0500
Message-ID: <CABzWfrk0XZy0SibsaUqqBDWzXa9uXSsioeF7z1HWXOts=M3y=g@mail.gmail.com>
Subject: Re: SOL Logging
To: jk@ozlabs.org
Cc: ed.tanous@intel.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003564820574855a8c"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 21:16:20 -0000

--0000000000003564820574855a8c
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy,

You mentioned the possibility of pre-populating the scrollback buffer of
the console interface. I am wondering if you have any more information about
how difficult this would be to implement. Our concern when thinking about
doing this was how complex it might get to fetch the file and populate the
console
while at the same time receiving messages by websocket without missing any
messages. Any insight on this?

Thanks!
Becca

On Mon, Aug 27, 2018 at 12:00 PM Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Ed,
>
> > Instead, other BMCs implement it as a circular buffer inside the BMC
> > itself, which allows SOL to log data all the time, not just while the
> > user is logged in.
>
> The obmc-console infrastructure does exactly that; the circular buffer
> is available under /var/log/obmc-console.log (by default), and the
> maximum size is configurable.
>
> We may want to augment that with some other bits, like:
>
>   - making this file available over the web UI (including
>     transparently pre-populating the scrollback buffer of the
>     console interface);
>
>     and/or
>
>   - archiving the log on certain events (like specific host state
>     changes; checkstop on OpenPOWER implementeations)
>
> If there's anything that I can change in obmc-console to make things
> work with your plans, let me know.
>
> Cheers,
>
>
> Jeremy
>

--0000000000003564820574855a8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jeremy,<div><br></div><div>You mentioned the possibilit=
y of pre-populating the scrollback buffer of the console interface. I am wo=
ndering if you have any more information about<br></div><div>how difficult =
this would be to implement. Our concern when thinking about doing this was =
how complex it might get to fetch the file and populate the console</div><d=
iv>while at the same time receiving messages by websocket without missing a=
ny messages. Any insight on this?</div><div><br></div><div>Thanks!</div><di=
v>Becca</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, =
Aug 27, 2018 at 12:00 PM Jeremy Kerr &lt;<a href=3D"mailto:jk@ozlabs.org">j=
k@ozlabs.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Ed,<=
br>
<br>
&gt; Instead, other BMCs implement it as a circular buffer inside the BMC <=
br>
&gt; itself, which allows SOL to log data all the time, not just while the =
<br>
&gt; user is logged in.<br>
<br>
The obmc-console infrastructure does exactly that; the circular buffer <br>
is available under /var/log/obmc-console.log (by default), and the <br>
maximum size is configurable.<br>
<br>
We may want to augment that with some other bits, like:<br>
<br>
=C2=A0 - making this file available over the web UI (including<br>
=C2=A0 =C2=A0 transparently pre-populating the scrollback buffer of the<br>
=C2=A0 =C2=A0 console interface);<br>
<br>
=C2=A0 =C2=A0 and/or<br>
<br>
=C2=A0 - archiving the log on certain events (like specific host state<br>
=C2=A0 =C2=A0 changes; checkstop on OpenPOWER implementeations)<br>
<br>
If there&#39;s anything that I can change in obmc-console to make things <b=
r>
work with your plans, let me know.<br>
<br>
Cheers,<br>
<br>
<br>
Jeremy<br>
</blockquote></div>

--0000000000003564820574855a8c--
