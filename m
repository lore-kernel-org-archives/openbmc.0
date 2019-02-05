Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bpmd68Hg"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tsFQ18JpzDqL2;
 Tue,  5 Feb 2019 15:35:21 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id e12so3719330otl.5;
 Mon, 04 Feb 2019 20:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=manHmcpcJ0S+vAqhLLhme3DHJNbbEVsLBQAEcmQy3rA=;
 b=Bpmd68Hg3Y+9mEf65VHr1aq8C2VHiLe+Hl/6jMx1P5lfxgF819hjY6K39/Rur0GAoo
 IkGzo1qo2BnXGp+XmJwJu5qtRbmWsnJ8qPytHI6fXuKc4U5KdB5A4/p1eSRj5U7jiO6z
 qQMuvLZ+a9KDJpwmNMaVvBG1qCLmHzrtP+pzhERuC4tzl7sJXCn29yP+ZmKdnCiBiWOz
 RQLJ96D6GTrUfCZ0VudgNIHHgL7YV0WDbwayKf7e+iAZh1xtAVLLP2UhBVVT1HM97JDq
 I+PDbyhMoAwrMY7tu7D4TJ477m9+jMJLz5DArntFvR3SSo29hVmahVNkylyWutndzzBg
 gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=manHmcpcJ0S+vAqhLLhme3DHJNbbEVsLBQAEcmQy3rA=;
 b=gxtmOb4uO80f5mzQ7wEP6NC0bT1Q0KhKIQpCYZjf9z35zZ5NTOTsUq0/RQVCYDH+dJ
 kBaz5+PndqPTkxWZWLP05Uc2Cq6Jw4311rI9DT3bJYYVNOVPGroBoBs6hCAEpSFN3/se
 D+0AsKsQqhvs1T1myp3zjcx4ik3z4xJ8wprKRfico8pqBVWup2NOg/UWrKIF2CNg0efl
 aSTLFFJL8N3/RWktTi2SB4cRgMXKlc3jwMANvPHIhMdtodySLBvnrJhHGWRAvQDUNKa0
 Ukg11uJ4qzm1RJGJErHSbPxa8WL4ejuh/bVK4CwGrLHIiIoXEMp6svT5HTz/Ibeq5RRV
 tslw==
X-Gm-Message-State: AHQUAuaXoMvyD5s9cOGY4EUgiwMxsyvQuiMgiorWGTOVDyjQRDX0n5Dl
 NjTQ4TH8F6XhfqbKwYtwKD3RE42MczvhncLyn6k=
X-Google-Smtp-Source: AHgI3IYfX1wHVzONoBBdIDd0VIY2dU5+ia7Hjm2f6z0xjPaHE4pRAHEI+lFh5l331x193nGxS0PUlusqRkruhYXQQfE=
X-Received: by 2002:aca:bcc6:: with SMTP id m189mr1501300oif.337.1549341319067; 
 Mon, 04 Feb 2019 20:35:19 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEsh+Oh8LYY0tkO98tVzVDjZwbxO9J49zp2fAWz_dysbQ@mail.gmail.com>
 <f9f2f2ecdbfbc94f8a6afcbd7ab06ced@linux.vnet.ibm.com>
In-Reply-To: <f9f2f2ecdbfbc94f8a6afcbd7ab06ced@linux.vnet.ibm.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 5 Feb 2019 10:04:36 +0530
Message-ID: <CAE33tLHZ6LOa4CtYwYVuKZxgZoNkCzxfNM7LGLQDQfDoww7dww@mail.gmail.com>
Subject: Re: LED not Blinking
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, 
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f57b4b05811e22ee"
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
X-List-Received-Date: Tue, 05 Feb 2019 04:35:23 -0000

--000000000000f57b4b05811e22ee
Content-Type: text/plain; charset="UTF-8"

I am using zaius machine configuration. In that led.yaml file is not
available.

On Mon, Feb 4, 2019 at 9:21 PM Matt Spinler <mspinler@linux.vnet.ibm.com>
wrote:

> On 2019-02-04 06:18, AKASH G J wrote:
> > Hi all,
> >
> > We have a board containing BMC Aspeed AST-2500. One LED is connected
> > to GPIO-E0. I am using zaius machine configuration for building the
> > image. I want that LED to blink after BMC is booted. So I changed the
> > following files.
> >
> > Patched the device tree file aspeed-bmc-opp-zaius.dts
> >
> >  leds {
> >             compatible = "gpio-leds";
> > +        power {
> > +            gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
> > +        };
> >   };
> >
> > Added the following configuration to sensor inventory file
> >
> openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
> >
> > bmc_booted:
> >     power:
> >         Action: 'Blink'
> >         DutyOn: 50
> >         Period: 1000
> >         Priority: 'On'
> >
> > The LED is glowing when the BMC boots up. But it is not blinking.
> > Please someone help to resolve the issue.
> >
>
>
> Hi,
>
> The LEDs are defined in a different file, check out, for example,
>
> meta-ibm/meta-romulus/recipes-phosphor/leds/romulus-led-manager-config/led.yaml.
>
>
> You can tell it should be working when you see a
> /xyz/openbmc_project/led/groups/bmc_booted  object on D-Bus.
>
>
>
> > Thanks in advance.
>
>

--000000000000f57b4b05811e22ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using zaius machine configuration. In that led.yaml f=
ile is not available.<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Feb 4, 2019 at 9:21 PM Matt Spinler &lt;<a=
 href=3D"mailto:mspinler@linux.vnet.ibm.com">mspinler@linux.vnet.ibm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
2019-02-04 06:18, AKASH G J wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; We have a board containing BMC Aspeed AST-2500. One LED is connected<b=
r>
&gt; to GPIO-E0. I am using zaius machine configuration for building the<br=
>
&gt; image. I want that LED to blink after BMC is booted. So I changed the<=
br>
&gt; following files.<br>
&gt; <br>
&gt; Patched the device tree file aspeed-bmc-opp-zaius.dts<br>
&gt; <br>
&gt;=C2=A0 leds {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;gp=
io-leds&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 power {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpios =3D &lt;&amp;gpio ASP=
EED_GPIO(E, 0) GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; <br>
&gt; Added the following configuration to sensor inventory file<br>
&gt; openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-s=
ensor-inventory%/config.yaml<br>
&gt; <br>
&gt; bmc_booted:<br>
&gt;=C2=A0 =C2=A0 =C2=A0power:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Action: &#39;Blink&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DutyOn: 50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Period: 1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Priority: &#39;On&#39;<br>
&gt; <br>
&gt; The LED is glowing when the BMC boots up. But it is not blinking.<br>
&gt; Please someone help to resolve the issue.<br>
&gt; <br>
<br>
<br>
Hi,<br>
<br>
The LEDs are defined in a different file, check out, for example,<br>
meta-ibm/meta-romulus/recipes-phosphor/leds/romulus-led-manager-config/led.=
yaml.<br>
<br>
<br>
You can tell it should be working when you see a<br>
/xyz/openbmc_project/led/groups/bmc_booted=C2=A0 object on D-Bus.<br>
<br>
<br>
<br>
&gt; Thanks in advance.<br>
<br>
</blockquote></div>

--000000000000f57b4b05811e22ee--
