Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RJpmNZOh"; 
 dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qW8q1c6dzDqS9
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 04:49:46 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id y16so244816qki.7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 09:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWzLpXJDjthQSQYhS9VZyWzbmBv1qs/UpzMbM1MK548=;
 b=RJpmNZOh3Yoy8e428brXSCqTLf5Ppdx/q0SyLzMyyA667riMAi8N6HF8yWoaYRZA6G
 pdIRlV0iyi0G+ZUXzlXmalaqh5U8yobHalR+SbFYCNCDKiXURM2qhOam2Qcf1TV3/wRo
 LNibA7akkaelKmVGwRkAfaIVuI0NaG8Hu1hRe1RZK+xgoikvhy6sgu7vcylOiL9Cvd4W
 SO/c4Xi3OVO6o4w21cyr0crxcuY1MDmeeWeTxnjw5wRnPpQq/z9r4NCX8w71KZn1Nwjt
 otpzIoAimBMo3urPVsW8pvlOAEm262D6qXkm7Q4qhXD5AXIcVKgdCTJ8RNUsoIagCCBt
 p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWzLpXJDjthQSQYhS9VZyWzbmBv1qs/UpzMbM1MK548=;
 b=teovrSGM1zbMa0ziMKPLMkOR7Ofps19idFrhVBal4fk7o6lPQ/QprsIqn0OHyXMiiT
 2VtlcYnK+8HZyx2onjxaz2h78EeEWmaPM1j8zKDRSOBSSfYFIr5sbt7Hqz/F0c4tqzzJ
 NX5lUEoevdPapknialYuUhLWp7+58o3EDWPlD9+A07sE77fp+Yr9VLjQ/IqNm6b1H73x
 0+h+UiTJft92/hLpczywIZmfb0QLUOyqwTmXWMvLm3zdU7psWl/yRlW7u/hCoFM0kIxc
 EsthZ/hZ3n/sb9uC/PH7V7+uUSIyhosktvBoNYqQA++NQseFr1S9askK7Jz8YG0+eaNG
 99Mg==
X-Gm-Message-State: AJcUukcoorzgyjfrXYIRDEEdfycuoY5wVhb7VeMUsEmVi9q2Y7Wmlz9U
 VulR79/w0JDql33kSkVb+V0rjZ4ze6DyQAHkOBRx/g==
X-Google-Smtp-Source: ALg8bN7oCxpCRgCTdphZWQUKlML8Mq2Qa5WvmdL6WoqKdsVrria+VR/iLqKqA7GEGPu6Bc5QR1AyZVlT7UieQW7Gl7U=
X-Received: by 2002:a37:4a47:: with SMTP id x68mr29020258qka.112.1548870584179; 
 Wed, 30 Jan 2019 09:49:44 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash>
 <CAARXrtkg0uoJ7L8cwme8mkckmNj5bwb1hk15iWgqVYXbJ5pOCw@mail.gmail.com>
In-Reply-To: <CAARXrtkg0uoJ7L8cwme8mkckmNj5bwb1hk15iWgqVYXbJ5pOCw@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 30 Jan 2019 09:49:32 -0800
Message-ID: <CAJoAoZmZhxFNuvRYKQ04iTYZVrHgoukbM4HdTaPP6kCZppMhDA@mail.gmail.com>
Subject: Re: OpenBMC Sensors
To: Lei YU <mine260309@gmail.com>
Cc: Aaron Williams <awilliams@marvell.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f98fa90580b08834"
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
X-List-Received-Date: Wed, 30 Jan 2019 17:49:48 -0000

--000000000000f98fa90580b08834
Content-Type: text/plain; charset="UTF-8"

Hi Aaron,

Note that you only really need to worry about sending the temperature via
IPMI if you want to send it somewhere besides the BMC.  If you plan to do
internal thermal control (BMC reads temperature, BMC adjusts fans
accordingly) you probably don't need IPMI config and can get away with
setting it up as far as DBus in the sensor architecture doc Lei sent.

Emily

On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com> wrote:

> On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <awilliams@marvell.com>
> wrote:
> > I see how to set up the hwmon portion defining the devices based on the
> device
> > tree, but I am unsure how to go about configuring the YAML and other
> files for
> > this.
>
> For sensors' config, please refer to
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> And it looks you are looking for fan controls, then you could refer to:
>
> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#fans
>
> (I really need to submit my porting guide to openbmc/docs)
>

--000000000000f98fa90580b08834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Aaron,<div><br></div><div>Note that you only really nee=
d to worry about sending the temperature via IPMI if you want to send it so=
mewhere besides the BMC.=C2=A0 If you plan to do internal thermal control (=
BMC reads temperature, BMC adjusts fans accordingly) you probably don&#39;t=
 need IPMI config and can get away with setting it up as far as DBus in the=
 sensor architecture doc Lei sent.</div><div><br></div><div>Emily</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Jan 24, 2019 at 1:27 AM Lei YU &lt;<a href=3D"mailto:mine260309@gmail.c=
om">mine260309@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams &lt;<a href=3D"mailto:a=
williams@marvell.com" target=3D"_blank">awilliams@marvell.com</a>&gt; wrote=
:<br>
&gt; I see how to set up the hwmon portion defining the devices based on th=
e device<br>
&gt; tree, but I am unsure how to go about configuring the YAML and other f=
iles for<br>
&gt; this.<br>
<br>
For sensors&#39; config, please refer to<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/sensor-architecture.=
md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/bl=
ob/master/sensor-architecture.md</a><br>
And it looks you are looking for fan controls, then you could refer to:<br>
<a href=3D"https://github.com/mine260309/openbmc-intro/blob/master/Porting_=
Guide.md#fans" rel=3D"noreferrer" target=3D"_blank">https://github.com/mine=
260309/openbmc-intro/blob/master/Porting_Guide.md#fans</a><br>
<br>
(I really need to submit my porting guide to openbmc/docs)<br>
</blockquote></div>

--000000000000f98fa90580b08834--
