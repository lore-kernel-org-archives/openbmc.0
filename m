Return-Path: <andresoportus@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=andresoportus@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rIXyCXiz"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lH0k1gj1zF3MK
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 09:27:16 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id p3-v6so14668550itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86NUCvxdHtG3QRrydjubq3w5f3kFNogxgHbnBCs9TkI=;
 b=rIXyCXiz4aM0kIUuBiF+aEaAlNBWGqzNwr2iQ8jUNvEiWfrBv4q2F2Mo2+7AZb1Wo+
 chjYmx9cOmnYeuln/B1iEQfjcz52zPE/E+UI1OjZf3OnaQSt60NUG0eBx8OcIO0fIyR1
 OmFCan2QWWqMtmtnCPpSf2fLJ/ZcXjhq8UvD6jDSvQUJA6hKyU6sQvarTJ4wY6VmuJBq
 KP5VNss5Cb5nC7MbPqy2dT9hrP7buD2Okldj/SyJVpJPNkE/xLbvUGlTdvjS5lTeRu32
 4PzECjH4ygVgnm4HcGbUH1n5s6gFQz7IAL17bBt7ZCJhfIMmyy6MCXzOPsd+M7BncWvW
 RTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86NUCvxdHtG3QRrydjubq3w5f3kFNogxgHbnBCs9TkI=;
 b=r/t1KZJIjXPR5pQ5p9FIZw1v8AwPXK6UDAdFlWRVsVPXNfFalT0TH37LZJePfYaGAN
 /yDG6lfdN7SLtOX4lvkmKAsxq6YxjwAHlJMlENt/tw5TxHx8T+kKvX2mK2oyrhRJL3f1
 PIF+heJHjWRLjtJikleXHTljRoB7avyu81W9b4Ap9rSfcYWUOhgPx1ajZtaK4L6Wv3Xp
 8wvN7ozS5REcp2C4NJwm8PdKh1RehnTGxTTmFls4oStR0vfsaGXOaPhRlZ3/Khx+E8cR
 8Cg2nCy+reCZ6WjmoKx6e3GPl+MWXZV3Csi+Jju/KaYXNMgb1waTzd2zerQjto141STu
 z85A==
X-Gm-Message-State: ALKqPwc8sbqthl3923HDFnMPoe5QbMUxCpsx5vtJpCkxQsrfq+z9/NuU
 RsunqKahtdzjifE2ugODxdI83mQV0BO8w4KLQd6KPw==
X-Google-Smtp-Source: AB8JxZqqznE7F1HAABlkgqBqBo26baJ15Rw/SWCgVI+Septbw1wRbf8k12PTdQL7N6EbgqxRFAv1Ynxey+Ha4C9KVEU=
X-Received: by 2002:a6b:590a:: with SMTP id
 n10-v6mr12301542iob.228.1526340433737; 
 Mon, 14 May 2018 16:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
In-Reply-To: <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
From: Andres Oportus <andresoportus@google.com>
Date: Mon, 14 May 2018 16:26:37 -0700
Message-ID: <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
Subject: Re: Question on States monitoring
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005c9c2f056c32d3d6"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 23:27:19 -0000

--0000000000005c9c2f056c32d3d6
Content-Type: text/plain; charset="UTF-8"

Thanks Andrew, yeah I see the design philosophy of not exposing low level
stuff like GPIOs unless they mean something more high level (hence the
"State" reference) that could be exposed/monitored/changed/etc.  I'm just
checking to see if we have anything already being thought of or implemented
as to not come up with a custom solution.  The problem is managing "States"
at least initially backed by GPIOs, and it does not have to be on the DBUS
although from what I've seen for instance on IPMI we use DBUS extensively
for things that get exported.

On Mon, May 14, 2018 at 4:16 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Andres,
>
> On Tue, 15 May 2018, at 01:16, Andres Oportus wrote:
> > Are there any ongoing efforts on expanding States (say provided by GPIOs)
> > monitoring/management?  I see that phosphor-state-manager has
> > Chassis/Host/BMC states that are placed onto DBUS but not a more generic
> > mechanism.  On the GPIO specific side, I see that phosphor-gpio-monitor
> > allows for interrupt driven GPIO monitoring (seemly only used under a
> > gpio-keys driver with /dev/input for Power's checkstop monitoring?), but
> no
> > generic GPIO setting/getting for those not allowing interrupt type
> > monitoring (say output GPIOs).
>
> It's not clear to me what you're looking for here. Are you hoping for
> something to expose the GPIOs on DBus? I don't think we have anything like
> that, which is more of a design philosophy thing (we should probably
> provide a higher-level capability on DBus, not just directly expose GPIOs).
>
> Alternatively if you're looking to handle GPIOs from your application, I
> would recommend libgpiod:
>
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>
> Cheers,
>
> Andrew
>

--0000000000005c9c2f056c32d3d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Thanks Andrew, yeah I see the design philosophy of not exposin=
g low level stuff like GPIOs unless they mean something more high level (he=
nce the &quot;State&quot; reference) that could be exposed/monitored/change=
d/etc.=C2=A0 I&#39;m just checking to see if we have anything already being=
 thought of or implemented as to not come up with a custom solution.=C2=A0 =
The problem is managing &quot;States&quot; at least initially backed by GPI=
Os, and it does not have to be on the DBUS although from what I&#39;ve seen=
 <span style=3D"color:rgb(34,34,34);font-family:monospace,monospace;font-si=
ze:13px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">for instance=C2=A0</span>on IPMI we use DBUS e=
xtensively for things that get exported.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Mon, May 14, 2018 at 4:16 PM Andrew Jeffery &lt=
;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Andres,<br>
<br>
On Tue, 15 May 2018, at 01:16, Andres Oportus wrote:<br>
&gt; Are there any ongoing efforts on expanding States (say provided by GPI=
Os)<br>
&gt; monitoring/management?=C2=A0 I see that phosphor-state-manager has<br>
&gt; Chassis/Host/BMC states that are placed onto DBUS but not a more gener=
ic<br>
&gt; mechanism.=C2=A0 On the GPIO specific side, I see that phosphor-gpio-m=
onitor<br>
&gt; allows for interrupt driven GPIO monitoring (seemly only used under a<=
br>
&gt; gpio-keys driver with /dev/input for Power&#39;s checkstop monitoring?=
), but no<br>
&gt; generic GPIO setting/getting for those not allowing interrupt type<br>
&gt; monitoring (say output GPIOs).<br>
<br>
It&#39;s not clear to me what you&#39;re looking for here. Are you hoping f=
or something to expose the GPIOs on DBus? I don&#39;t think we have anythin=
g like that, which is more of a design philosophy thing (we should probably=
 provide a higher-level capability on DBus, not just directly expose GPIOs)=
.<br>
<br>
Alternatively if you&#39;re looking to handle GPIOs from your application, =
I would recommend libgpiod: <br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/libs/libgp=
iod/libgpiod.git/</a><br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div>

--0000000000005c9c2f056c32d3d6--
