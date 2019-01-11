Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="CozDhYXb"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bj0243GTzDqy9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 23:31:11 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id h15so12971831edb.4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLfjnslUyHOwTs+DTO/MK/7eciaauiYb9jcGuH/WBrM=;
 b=CozDhYXbUvfid0wyMbwOJE0wwhD4QL3A8nKFj2fiLVTZjdx00UEprhcXGqgmwwSuQo
 HT4S4Mcp/zII4CrEYyBxyX/YBF67wq6xDEG/Kll3hOwasHaYF7DMyk82ZB0y5rRUipIk
 xNpL8ynNY2e8T9mgsC2nQ3Ag3NE6Ss3jLpelA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLfjnslUyHOwTs+DTO/MK/7eciaauiYb9jcGuH/WBrM=;
 b=jyFO4dg0/E5FYT1zcHELR6pkvALXLJiK6wiulSC2H4kpjN9doiZKrqXil227XbhKtR
 BIhVpJunPBAqfAu8vLGV1aL09qtzkFG+DpvRN9PUgbk9e2Jx3eOIyNujjrnLi0UeRsXN
 zzfhgGslVKSVibsesfL2nrHNeKU088ZD+B5I8v6iovDIbx1OKs4ZzZp32QQPTMSY5sFb
 oydzExRKII/+0EbXXsFac6DGjPkyoFhWZMuu65LSy48sgYJVOkCoUPPIxfRAR/rMEvmZ
 39k+kQvFqmKjo3nacOKKdvLBXVVfkcDuqsX7PE/BGJt1Ridu9RnFoozW6f9qVJtvU6fn
 HQDw==
X-Gm-Message-State: AJcUukc6aSoIkkQKoK9pEpyFXR9hDVji1gk0KvSzpFY/dn9XLZjWpcVD
 ztQYEy8mxlhtMGy3xUc6r3DCXbjVR2tK4yI7rRHMwA==
X-Google-Smtp-Source: ALg8bN4Vqf/LydBNOr2kAQd/9gAh8+b5fJ+NiKMQISdv7l3VaQRRM2Qkl/vAfazUZOF6X2DLLhahOpmHVyohJBRLnXo=
X-Received: by 2002:a17:906:1001:: with SMTP id
 1-v6mr11303001ejm.91.1547209868909; 
 Fri, 11 Jan 2019 04:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
 <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
 <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
In-Reply-To: <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
From: Christian Svensson <blue@cmd.nu>
Date: Fri, 11 Jan 2019 13:30:58 +0100
Message-ID: <CADiuDARu6fwudJjcfJ0=sDpjQvtsog+GT5gUWu1WPTzPejFaZg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
To: Andrew Jeffery <andrew@aj.id.au>
Cc: clg@kaod.org, Christian Svensson <bluecmd@google.com>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000a156e3057f2dde8a"
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
X-List-Received-Date: Fri, 11 Jan 2019 12:31:15 -0000

--000000000000a156e3057f2dde8a
Content-Type: text/plain; charset="UTF-8"

Ping. What's left to be done here?

On Tue, Nov 13, 2018 at 9:58 AM Christian Svensson <blue@cmd.nu> wrote:

>
>
> On Tue, Nov 13, 2018 at 1:27 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > By inspection the concept of the patch seems okay to me. However, the
> issue
> > that host-utils.h takes care of in addition to providing helpers is
> support for
> > those helpers on systems that don't support 128-bit integers. The patch
> should
> > be sent to the upstream lists, and I don't think we should be breaking
> > qemu-arm-* generally for systems that we might not care about.
>
> Ah, yes - I missed that there were two - one for systems with int128 and
> one for them
> without. Hm, that does complicate things.
>
> Given that we only have one operand that is ever negative, how do you feel
> about a patch
> that goes along the lines of:
>
> if (delta >= 0) {
>   t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
> } else {
>    t->start = (int64_t)t->start - muldiv64(-delta, NANOSECONDS_PER_SECOND,
> rate);
> }
>
> That should avoid any issues I think, save us/me from implementing a
> signed muldiv,
> but cost a bit on the readable code side.
>
>

--000000000000a156e3057f2dde8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping. What&#39;s left to be done here?</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Nov 13, 2018 at 9:58 AM Christian=
 Svensson &lt;<a href=3D"mailto:blue@cmd.nu">blue@cmd.nu</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><b=
r><br>On Tue, Nov 13, 2018 at 1:27 AM Andrew Jeffery &lt;<a href=3D"mailto:=
andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>&gt; B=
y inspection the concept of the patch seems okay to me. However, the issue<=
br>&gt; that host-utils.h takes care of in addition to providing helpers is=
 support for<br>&gt; those helpers on systems that don&#39;t support 128-bi=
t integers. The patch should<br>&gt; be sent to the upstream lists, and I d=
on&#39;t think we should be breaking<br>&gt; qemu-arm-* generally for syste=
ms that we might not care about.<div><br></div><div>Ah, yes - I missed that=
 there were two - one for systems with int128 and one for them</div><div>wi=
thout. Hm, that does complicate things.</div><div><br></div><div>Given that=
 we only have one operand that is ever negative, how do you feel about a pa=
tch</div><div>that goes along the lines of:</div><div><br></div><div>if (de=
lta &gt;=3D 0) {</div><div>=C2=A0 t-&gt;start +=3D muldiv64(delta, NANOSECO=
NDS_PER_SECOND, rate);=C2=A0=C2=A0<br></div><div>} else {</div><div>=C2=A0=
=C2=A0

t-&gt;start =3D (int64_t)t-&gt;start=C2=A0-=C2=A0muldiv64(-delta, NANOSECON=
DS_PER_SECOND, rate);</div><div>}</div><div><br></div><div>That should avoi=
d any issues I think, save us/me from implementing a signed muldiv,</div><d=
iv>but cost a bit on the readable code side.</div><div><br></div></div>
</blockquote></div>

--000000000000a156e3057f2dde8a--
