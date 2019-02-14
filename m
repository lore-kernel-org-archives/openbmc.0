Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WEBo6x6G"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440Njx3nGzzDq7j
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 15:30:45 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id z19so8416711otm.2
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 20:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WiTQjW79TumJ5+JY7o9yvnvawLQ9OQ5SIP/iGznnjF0=;
 b=WEBo6x6G1hD97i6t2yelWM8PNakgXhBzTjGVmH/m3DjY2EYBfJ8DSRG+aoYl3gzvyT
 VlTfeIwmlUSgGSsKRuwrQzDIDPowcxzAa61sOwG0li9nSZ/vRILZnwYyXFNv6JrQa4Uy
 1cEzJTAnZZWgKERD9S2VJ/BXzKGeB3KUWVfGcVuexcuHpIZ2SGH8X8cfqm4IpvAc8mZa
 mvMWkwgSnCPkYFILHjjqoYClBxjitl3H6rT+qZo5Bjp9vDadBDOiHZZh3W0kVmsMkQBK
 fSvVCfYdDgeAx9Dt2v83y0F8BoIP3jOecS6GIydFnFdj35m4d8ODzDwFcHAvVBkH+dpw
 gIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WiTQjW79TumJ5+JY7o9yvnvawLQ9OQ5SIP/iGznnjF0=;
 b=b9nfuR7XHHJfWUr7JzPyATFXuaVdz/L/df8NAF2uH0iNlacha7yrbDOdlW1G3QK7at
 SCbfrDuxKWPEEEUR+8ub/ws7nkpvOQNqiT58u/jg8k9ZrdcE/JQeuJhmBUzFT3DzjUcP
 4evJOcp2HDujP8Vlv1+4fC8HGxjo45p918sPrt6r3LNSXvwfNMhjbv62XbAjFvrYFWVT
 MX19xoiqN31d6fCmTzDewgh5bXLNxUAE4Knmz60wzn6+73CPdNexo7GA9LIUNPYO8MiU
 hjJz754/taFyJyZtviIdK1mX5h/V1MfUGWjg0fAtecs916Wqw+8jmxyH+Rdvtvezl38/
 yFgw==
X-Gm-Message-State: AHQUAuZjiX82d73xNaUyJHR9cMSLUHtqsnRrbuO+DfgTH6bfHZ22/bqt
 WStS9Uih+uGmCPAiyA733EFR1VXDbtpjQouIOqtYjzCWnf0=
X-Google-Smtp-Source: AHgI3IbcB8in+hQVSrIuveSp7Ki9ocB9iw1+w4gxgk9Lm/sdt6Rv7YRuRIQ6dyikgvrPfhoA2tvd+pyzjWEQiT+/gTw=
X-Received: by 2002:a05:6830:10cd:: with SMTP id
 z13mr311713oto.57.1550118642735; 
 Wed, 13 Feb 2019 20:30:42 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
In-Reply-To: <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 14 Feb 2019 09:59:56 +0530
Message-ID: <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000f60de0581d31fd7"
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
X-List-Received-Date: Thu, 14 Feb 2019 04:30:46 -0000

--0000000000000f60de0581d31fd7
Content-Type: text/plain; charset="UTF-8"

I am using the following command to write data to SPI1 flash.
*pflash -e -a 0 -f -p <filename>*

On Thu, Feb 14, 2019 at 4:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Wed, 13 Feb 2019, at 19:24, AKASH G J wrote:
> > Hi all,
> >
> > We have a test board containing BMC Aspeed AST-2500. It contains BMC
> flash
> > memory, SPI1 flash memory and SPI2 flash memory. we are using zaius
> machine
> > configuration for building Linux. When I am trying to write to SPI1 flash
> > at address 30000000 using pflash tool, the modified data is not reflected
> > after reboot. Same with SPI2 flash. With pflash tool I am able to write
> > data permanently to BMC flash memory. The device tree for SPI devices is
> > following.
> >
> > &fmc {
> >     status = "okay";
> >
> >     flash@0 {
> >         status = "okay";
> >         label = "bmc";
> >         m25p,fast-read;
> >         spi-max-frequency = <50000000>;
> > #include "openbmc-flash-layout.dtsi"
> >     };
> > };
> >
> > &spi1 {
> >     status = "okay";
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&pinctrl_spi1_default>;
> >
> >     flash@0 {
> >         status = "okay";
> >         label = "pnor";
> >         m25p,fast-read;
> >         spi-max-frequency = <100000000>;
> >     };
> > };
> >
> > &spi2 {
> >     status = "okay";
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&pinctrl_spi2ck_default
> >              &pinctrl_spi2cs0_default
> >              &pinctrl_spi2cs1_default
> >              &pinctrl_spi2miso_default
> >              &pinctrl_spi2mosi_default>;
> >
> >     flash@0 {
> >         status = "okay";
> >     };
> > };
>
> How are you invoking pflash? You should not be using the /dev/mem backend
> when you have the flash controller and devices enabled via the devicetree.
> You
> should be using the mtd backend instead.
>
> Andrew
>

--0000000000000f60de0581d31fd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I am using the following command to =
write data to SPI1 flash.</div></div><div dir=3D"ltr"><i>pflash -e -a 0 -f =
-p &lt;filename&gt;</i><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019 at 4:13 AM Andrew Jef=
fery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 13 Feb 2=
019, at 19:24, AKASH G J wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; We have a test board containing BMC Aspeed AST-2500. It contains BMC f=
lash<br>
&gt; memory, SPI1 flash memory and SPI2 flash memory. we are using zaius ma=
chine<br>
&gt; configuration for building Linux. When I am trying to write to SPI1 fl=
ash<br>
&gt; at address 30000000 using pflash tool, the modified data is not reflec=
ted<br>
&gt; after reboot. Same with SPI2 flash. With pflash tool I am able to writ=
e<br>
&gt; data permanently to BMC flash memory. The device tree for SPI devices =
is<br>
&gt; following.<br>
&gt; <br>
&gt; &amp;fmc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;bmc&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,fast-read;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D &lt;50000000&gt=
;;<br>
&gt; #include &quot;openbmc-flash-layout.dtsi&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; };<br>
&gt; <br>
&gt; &amp;spi1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_spi1_default&gt;;<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;pnor&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,fast-read;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D &lt;100000000&g=
t;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; };<br>
&gt; <br>
&gt; &amp;spi2 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_spi2ck_default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_spi2cs0_d=
efault<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_spi2cs1_d=
efault<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_spi2miso_=
default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_spi2mosi_=
default&gt;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; };<br>
<br>
How are you invoking pflash? You should not be using the /dev/mem backend<b=
r>
when you have the flash controller and devices enabled via the devicetree. =
You<br>
should be using the mtd backend instead.<br>
<br>
Andrew<br>
</blockquote></div>

--0000000000000f60de0581d31fd7--
