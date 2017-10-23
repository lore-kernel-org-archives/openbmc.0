Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22e; helo=mail-ua0-x22e.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jDaGUByj"; 
 dkim-atps=neutral
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com
 [IPv6:2607:f8b0:400c:c08::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLQkT3jx2zDqXj
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 06:02:08 +1100 (AEDT)
Received: by mail-ua0-x22e.google.com with SMTP id n38so13664836uai.11
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 12:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mcVYTTATP18FHrDcfgQ8ooBbbn34i9TPewPml16iTkw=;
 b=jDaGUByjItKuHr+aeF0KlNCHTAG9/Swv4hCSSkt0MRfDU0/maBZ5MkruRaAlnbV0y2
 Nyb8gp4uZ5T8GNwMcj6pScekEQ+i1eAXFuhL3uSHnZhRvHGgBtkzFVqMW1c5FtP+2QKc
 D8fWhH1iUw+R6Fr6d96Q13T/UJ3tL1CEt44dvW8tJF45GlYVVmQwNsnewlY1QVGDTvqm
 G7i/SRvYZ7sWOQepnROBcC4+OnbR0fNzxYvzV/jfiB5KZxiV1oyIAUbkymDSOHHRFoTD
 K2FPmF6nfz6i/F9F1elugchOUxH+09LbcIT05EZdeEjJaM5q+5zk1OQmCLR6Gx2ZU3D0
 Ldww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mcVYTTATP18FHrDcfgQ8ooBbbn34i9TPewPml16iTkw=;
 b=JBZg37JTMUw5EkkCaPkvcOtJHxrfTKvvHkkJsPVJgdE81vii90QgJBjEhtBohGOZi+
 gfSn1K8EyepFHZfSrXkik9WgmuOwRxi73XMcAx/O0Re+JqdLSiAZMarCMzMSheoSnzpX
 B+vgUoy1UbHx5+V85EO9ma+0L4vxMgcuI3q7OKSSkjGafkMJ8B361aAnggdCqKMMDVbK
 WJi/0QJ31q7b/f9R2rw9dwlTLc3kBIOvXaxHwoEVCGf8ediB79RoHtjFAMjN1m+FU3ku
 pt2sSsYBr2jAXW524smm25zjMyefr4AHrV2wotcJaidWljnHSJfGf1D/EDE+aihT3Z0j
 EUSQ==
X-Gm-Message-State: AMCzsaWjGj59BZyF3NhcBFHcM9Jk5jb4sRo0PbdbRh7j5JDh6WYSFGeT
 DFJP+TiQAeFWGGmAOHAIiHA9zdtB8tLoStV0w85s8A==
X-Google-Smtp-Source: ABhQp+TYG5i56HrAWs8HpVwDdgVBruWLBZ/e9OVqoeUvuuExPMpYjGr0M/1PwrUWa9NynpBg6xH91qmfk6XCxTwJcHs=
X-Received: by 10.159.56.9 with SMTP id p9mr12108413uad.50.1508785325963; Mon,
 23 Oct 2017 12:02:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Mon, 23 Oct 2017 12:02:05 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
 <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 23 Oct 2017 12:02:05 -0700
Message-ID: <CAPLgG=nsq1XiJZ_86nJHYAqOHFmM6i2_=XW+Ls-2iRQsXvu2VQ@mail.gmail.com>
Subject: Re: PECI API?
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: =?UTF-8?Q?David_M=C3=BCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1149590865e524055c3b7530"
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
X-List-Received-Date: Mon, 23 Oct 2017 19:02:10 -0000

--001a1149590865e524055c3b7530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there a kernel subsystem for PECI defined upstream?  I'm not aware of a
PECI device driver for Aspeed upstream.

On Mon, Oct 23, 2017 at 9:44 AM, Tanous, Ed <ed.tanous@intel.com> wrote:

> We had looked at building one, and had one prototyped for a simple
> read/write interface, but we were on the fence about whether such a low
> level control (PECI read/write) should be put on dbus at all for security
> reasons, especially when the drivers read/write API isn't that difficult =
to
> use.
>
> What are you looking at doing with it?
>
> -Ed
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.=
org]
> On Behalf Of David M=C3=BCller (ELSOFT AG)
> Sent: Saturday, October 21, 2017 1:57 AM
> To: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: PECI API?
>
> Hello
>
> Is anyone working on an API definition for PECI?
>
>
> Dave
>

--001a1149590865e524055c3b7530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a kernel subsystem for PECI defined upstream?=C2=
=A0 I&#39;m not aware of a PECI device driver for Aspeed upstream.=C2=A0=C2=
=A0</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, =
Oct 23, 2017 at 9:44 AM, Tanous, Ed <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">We had looked at building one, and=
 had one prototyped for a simple read/write interface, but we were on the f=
ence about whether such a low level control (PECI read/write) should be put=
 on dbus at all for security reasons, especially when the drivers read/writ=
e API isn&#39;t that difficult to use.<br>
<br>
What are you looking at doing with it?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Ed<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
-----Original Message-----<br>
From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bed.tanous">openbm=
c-bounces+ed.<wbr>tanous</a>=3D<a href=3D"mailto:intel.com@lists.ozlabs.org=
">intel.com@lists.ozlabs.<wbr>org</a>] On Behalf Of David M=C3=BCller (ELSO=
FT AG)<br>
Sent: Saturday, October 21, 2017 1:57 AM<br>
To: OpenBMC &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.o=
zlabs.org</a>&gt;<br>
Subject: PECI API?<br>
<br>
Hello<br>
<br>
Is anyone working on an API definition for PECI?<br>
<br>
<br>
Dave<br>
</div></div></blockquote></div><br></div>

--001a1149590865e524055c3b7530--
