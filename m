Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aNjpFLaD"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h4Dq6PlMzDr1d
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 02:12:27 +1100 (AEDT)
Received: by mail-it1-x143.google.com with SMTP id m62so7099457ith.5
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWkPhkaFnKyXFo9a6Dffnu2jTW1r4SiVL4pARfRuAJ4=;
 b=aNjpFLaDOB5b/YYxGgkK03WwNajOYCiBqC3zMz3w2nOnLp/WaXA7t6LZ59wEvz6WAU
 XaUeb2ne4eF/oDXaIq2o7+90bRGjg3V6lNnPie6AUCeiBRxyIw0tsMCxeRqdc8Azpfrl
 HYkwm6NPjgpvX5vWvPhkXUt4xwhP+L375oaP5ee77CJMFEop+5H4t/nZyy+IK2uhMS7L
 A5FdgOBBuuRefHgoV5HqwyYsdeySHZGDp15VuqlWfXtD9V0/uMESt7o8rSFTUlEUWDaZ
 HxY1DBxc5jnBGYKBzrqHbdVuUx9vAtO6mzmNCrEXE2Ei0zTiwGQSi0AAcRfEF7QD0tya
 vDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWkPhkaFnKyXFo9a6Dffnu2jTW1r4SiVL4pARfRuAJ4=;
 b=Bwr+A4fFXSfWs4DXN01Dm0LC4QpCts4WCy1W32OZ07N7/EX906bqhPJ0IRdEaF5ZHr
 k5fHIt8TdkMIh/Sg2ptzNTSe0hJpAbIRco9miOqAeJEu+0bXb993HvRt4istg9wheVOg
 /uSXBxRXu5JNH70XY8/VCR1mfPI7XPXR0zK2wNyqtK2NCqvpBUozDmCwYBOiYbxcdSTb
 u+xmLOmOe1+4bwEPyVTWgsU8KG2Dhfm5lTQdTBoLjW7982qZRZBJeMWiS1AlT56kmRbX
 MwHVM3LMycEwth2ddu6Bbrk834YFUVsqOfhvotoeuOOqXvbXWhe3xo1zVrdW/e4NSybd
 jMtA==
X-Gm-Message-State: AJcUukflwXeqweiqGYwrpx/2+bGCpUdxExQsEsPnjw9lGNBTAKTFTL3C
 r+oOonDweOYWLOG+i7LlU6NuUDA3+IapJ1My+Ms=
X-Google-Smtp-Source: ALg8bN6ex0Ae3B84NOozBt0RPghOrzf8XENyd8ro5yeR3TCIZ9LHgIw2gZo7tO8J2LJydv8agSydldB50J8b7+2RlLE=
X-Received: by 2002:a24:7094:: with SMTP id f142mr11002495itc.90.1547824345487; 
 Fri, 18 Jan 2019 07:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
In-Reply-To: <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 18 Jan 2019 17:18:43 +0200
Message-ID: <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
To: Joel Stanley <joel@jms.id.au>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, linux-iio@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000049a21e057fbcf02a"
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
X-List-Received-Date: Fri, 18 Jan 2019 15:12:28 -0000

--00000000000049a21e057fbcf02a
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

Thanks for bringing this to my attention,

I think I will leave it the same way it is now because I will like to
develop the reset driver and to handle the NPCM7xx SOC resets.

Cheers,

Tomer



On Wed, 16 Jan 2019 at 01:21, Joel Stanley <joel@jms.id.au> wrote:

> On Thu, 10 Jan 2019 at 03:44, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > +Required Node in the NPCM7xx BMC:
> > +An additional register is present in the NPCM7xx SOC which is
> > +assumed to be in the same device tree, with and marked as
> > +compatible with "nuvoton,npcm750-rst".
>
> Is there a reason you don't include a phandle to the reset node?
>
> I think doing that would make more sense.
>
> > +adc: adc@f000c000 {
> > +       compatible = "nuvoton,npcm750-adc";
> > +       reg = <0xf000c000 0x8>;
> > +       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +       clocks = <&clk NPCM7XX_CLK_ADC>;
> > +};
>
> > +
> > +rst: rst@f0801000 {
> > +       compatible = "nuvoton,npcm750-rst", "syscon",
> > +       "simple-mfd";
> > +       reg = <0xf0801000 0x6C>;
> > +};
>

--00000000000049a21e057fbcf02a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Thanks for bringing this to my=
 attention,</div><div><br></div><div>I think I will leave it the same way i=
t is now because I will like to develop the reset driver and to handle the =
NPCM7xx SOC resets.</div><div><br></div><div>Cheers,</div><div><br></div><d=
iv>Tomer</div><div><br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Wed, 16 Jan 2019 at 01:21, Joel Stanley &lt;<a hr=
ef=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Thu, 10 Jan 2019 at 03:44, To=
mer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tma=
imon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +Required Node in the NPCM7xx BMC:<br>
&gt; +An additional register is present in the NPCM7xx SOC which is<br>
&gt; +assumed to be in the same device tree, with and marked as<br>
&gt; +compatible with &quot;nuvoton,npcm750-rst&quot;.<br>
<br>
Is there a reason you don&#39;t include a phandle to the reset node?<br>
<br>
I think doing that would make more sense.<br>
<br>
&gt; +adc: adc@f000c000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-adc&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf000c000 0x8&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GIC_SPI 0 IRQ_TYPE_LEVE=
L_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk NPCM7XX_CLK_ADC&gt=
;;<br>
&gt; +};<br>
<br>
&gt; +<br>
&gt; +rst: rst@f0801000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-rst&q=
uot;, &quot;syscon&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;simple-mfd&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf0801000 0x6C&gt;;<br>
&gt; +};<br>
</blockquote></div>

--00000000000049a21e057fbcf02a--
