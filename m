Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="omw+cXNa"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 435fJt074qzDrQY
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 14:00:29 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id x21-v6so2040494pln.9
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 19:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=ntfpedzcpm5uNTnYqMB5axKqkpxBeYTx9xoGX3VpZUI=;
 b=omw+cXNa+IUSWAJYXyWJRQ4m/YMyYQuXmpiZpWH7rL5NBWmJAcK3Smr2SmB47OrQ54
 oFjd5LbUF7npG9zpoOHVELcfTNa7Njoy3a6f6Ok/DKJyIt6w/ELbXbkq1/GXjPJ4PrFI
 KueIqtbHNJ4x0I+lLBBH0pcg1nFQnBeaIDlFqV5DRUv74k6qqO19rmu2dYPy5aQ5c1lF
 8vSEnfTsfiVVZoIrlOVCHb0z0iuwRSS8TB54xW/TIyAfsBgxsyImp+v2QM+Am6T7YU8e
 EwjctgO2OGJjFyGecTZg1tE6L4H3nMnzPyXOx3wEb64LM2939xzbiMJ9hMukDUWRlzDE
 36aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=ntfpedzcpm5uNTnYqMB5axKqkpxBeYTx9xoGX3VpZUI=;
 b=SQzXPHZjg9+xy5A8caFj2heLQxYGPzsEQrLMSOk2hqVZE0OBpQbOthwV+loh2PrAmV
 MenMAF6bYsB5tkE5zSPPBuLXC1sNmJPUlPI8WtLGmDGh2nkMgI2XFwcu3mJ+NRutf57a
 tBn9TvuuO1P10hIW6Q2GfeusWxy2DXcCP3SuoeAlI6RwNut7rKFVyaBhqC8Ys1xbCHi/
 FzmflJ2K4trXj1mP2yQ4ha/b3uJvUyRoJBm7x+2tUYNipRGBpSPcvxR+7gyV0UQTMazz
 GRUQ6boH1olFXR7xUcyLoJM85wnJLsUuYca07EacrNieZEmpPqFmYUP97pVYjsByyW3D
 jkmQ==
X-Gm-Message-State: AA+aEWZ26buPBvKBitoTWwPGj6hCprVZPP1fZRKjKDuyoVaPG4CVH7qd
 nADuFYb13/Cj+uy3LqHAWwk=
X-Google-Smtp-Source: AFSGD/ValOkQJUOhabQGjLRAu/aP7IZ5Z6JHaZMgcSdGVcrLGG3c8SlCBwL9Sy4gyznNBKZjdqaVHA==
X-Received: by 2002:a17:902:8c91:: with SMTP id
 t17mr3830410plo.119.1543546827347; 
 Thu, 29 Nov 2018 19:00:27 -0800 (PST)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id o13sm5369524pfk.57.2018.11.29.19.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Nov 2018 19:00:26 -0800 (PST)
Date: Fri, 30 Nov 2018 11:00:19 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>, qianlihu
 <wangzhiqiang8906@gmail.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
In-Reply-To: <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
Subject: Re: [HELP] ipmi-kcs didn't work
X-Readdle-Message-ID: 4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5c00a7c8_6a2342ec_da85"
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
X-List-Received-Date: Fri, 30 Nov 2018 03:00:31 -0000

--5c00a7c8_6a2342ec_da85
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Jae,

We also encountered the same situation a month ago.
We try to enable the LPC clock on devicetree to resolve this problem not =
direct modify clock driver.

lpc=5Fctrl: lpc-ctrl=400 =7B
=E2=80=83=C2=A0compatible =3D =22aspeed,ast2500-lpc-ctrl=E2=80=9D;
=E2=80=83 reg =3D <0x0 0x80>;
=E2=80=83=C2=A0clocks =3D <&syscon ASPEED=5FCLK=5FGATE=5FLCLK>;
=C2=A0 =C2=A0 status =3D =E2=80=9Cokay=E2=80=9D;
=7D;

However, I=E2=80=99m not sure which is better for LPC=5FCLCK setting.
Whether we should modify driver if original data is enabled or should ena=
ble on the device tree, correct=3F


Thanks,

Samuel Jiang
On Nov 30, 2018, 2:58 AM +0800, Jae Hyun Yoo <jae.hyun.yoo=40linux.intel.=
com>, wrote:
> On 11/29/2018 12:42 PM, Vijay Khemka wrote:
> > Try below fix on clk-aspeed.c
> >
> > diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> > index 596136793fc4..b55d35e3eb5e 100644
> > --- a/drivers/clk/clk-aspeed.c
> > +++ b/drivers/clk/clk-aspeed.c
> > =40=40 -95,7 +95,7 =40=40 static const struct aspeed=5Fgate=5Fdata as=
peed=5Fgates=5B=5D =3D =7B
> > =5BASPEED=5FCLK=5FGATE=5FDCLK=5D =3D =7B 5, -1, =22dclk-gate=22,
> > NULL, CLK=5FIS=5FCRITICAL =7D, /* DAC */
> > =5BASPEED=5FCLK=5FGATE=5FRE=46CLK=5D =3D =7B 6, -1, =22refclk-gate=22=
,
> > =22clkin=22, CLK=5FIS=5FCRITICAL =7D,
> > =5BASPEED=5FCLK=5FGATE=5FUSBPORT2CLK=5D =3D =7B 7, 3, =22usb-port2-ga=
te=22,
> > NULL, 0 =7D, /* USB2.0 Host port 2 */
> > - =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,
> > NULL, 0 =7D, /* LPC */
> > + =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,
> > NULL, CLK=5FIS=5FCRITICAL =7D, /* LPC */
> > =5BASPEED=5FCLK=5FGATE=5FUSBUHCICLK=5D =3D =7B 9, 15, =22usb-uhci-gat=
e=22,
> > NULL, 0 =7D, /* USB1.1 (requires port 2 enabled) */
> > =5BASPEED=5FCLK=5FGATE=5FD1CLK=5D =3D =7B 10, 13, =22d1clk-gate=22,
> > NULL, 0 =7D, /* G=46X CRT */
> > =5BASPEED=5FCLK=5FGATE=5FYCLK=5D =3D =7B 13, 4, =22yclk-gate=22,
> > NULL, 0 =7D, /* HAC */
> >
> > In my experiments on my system, LCLK was not enabled due to the null
> > parent dependency so I added CLK=5FIS=5FCRITICAL flag to enable the c=
lk.
> >
> > LPC interface is default pin pad setting of AST2500 so you might not
> > need a pinctrl setting on it if you didn't change it's pin pads to GP=
IO
> > or eSPI.
> >
> > Cheers,
> > Jae
> >
> > Jae,
> > Are you planning to upstream this patch as it is needed for kcsbridge=
 to work. Also aspeed-g5 dtsi file.
>
> Okay, I'll submit this patch and dtsi patch to community.
>
> Thanks,
> Jae
>
> >
> > Regards
> > -Vijay
> >
> >

--5c00a7c8_6a2342ec_da85
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>Hi Jae,
<div><br /></div>
<div>
<div>We also encountered the same situation a month ago.<br />
We try to enable the LPC clock on devicetree to resolve this problem not =
direct modify clock driver.<br /></div>
<div><br /></div>
<div>lpc=5Fctrl: lpc-ctrl=400 =7B&=23160;</div>
<div>=E2=80=83&=23160;compatible =3D =22aspeed,ast2500-lpc-ctrl=E2=80=9D;=
&=23160;</div>
<div>=E2=80=83 reg =3D &lt;0x0 0x80&gt;;&=23160;</div>
<div>=E2=80=83&=23160;clocks =3D &lt;&amp;syscon ASPEED=5FCLK=5FGATE=5FLC=
LK&gt;;&=23160;</div>
<div>&=23160; &=23160; status =3D =E2=80=9Cokay=E2=80=9D;&=23160;</div>
<div>=7D;</div>
</div>
<div><br /></div>
<div>However, I=E2=80=99m not sure which is better for LPC=5FCLCK setting=
.<br /></div>
<div>Whether we should modify driver if original data is enabled or shoul=
d enable on the device tree, correct=3F<br /></div>
<div><br /></div>
</div>
<div name=3D=22messageSignatureSection=22 style=3D=22font-size: 14px; fon=
t-family: -apple-system, BlinkMacSystem=46ont, sans-serif;=22><br />
Thanks,
<div><br /></div>
<div>Samuel Jiang</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On Nov 30, 2018=
, 2:58 AM +0800, Jae Hyun Yoo &lt;jae.hyun.yoo=40linux.intel.com&gt;, wro=
te:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =231abc9c;=22>On 11/29/2018 12:42 PM, Vijay =
Khemka wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23e67e22;=22>Try below fix on clk-aspeed.c<=
br />
<br />
diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c<br />
index 596136793fc4..b55d35e3eb5e 100644<br />
--- a/drivers/clk/clk-aspeed.c<br />
+++ b/drivers/clk/clk-aspeed.c<br />
=40=40 -95,7 +95,7 =40=40 static const struct aspeed=5Fgate=5Fdata aspeed=
=5Fgates=5B=5D =3D =7B<br />
=5BASPEED=5FCLK=5FGATE=5FDCLK=5D =3D =7B 5, -1, =22dclk-gate=22,<br />
NULL, CLK=5FIS=5FCRITICAL =7D, /* DAC */<br />
=5BASPEED=5FCLK=5FGATE=5FRE=46CLK=5D =3D =7B 6, -1, =22refclk-gate=22,<br=
 />
=22clkin=22, CLK=5FIS=5FCRITICAL =7D,<br />
=5BASPEED=5FCLK=5FGATE=5FUSBPORT2CLK=5D =3D =7B 7, 3, =22usb-port2-gate=22=
,<br />
NULL, 0 =7D, /* USB2.0 Host port 2 */<br />
- =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,<br />
NULL, 0 =7D, /* LPC */<br />
+ =5BASPEED=5FCLK=5FGATE=5FLCLK=5D =3D =7B 8, 5, =22lclk-gate=22,<br />
NULL, CLK=5FIS=5FCRITICAL =7D, /* LPC */<br />
=5BASPEED=5FCLK=5FGATE=5FUSBUHCICLK=5D =3D =7B 9, 15, =22usb-uhci-gate=22=
,<br />
NULL, 0 =7D, /* USB1.1 (requires port 2 enabled) */<br />
=5BASPEED=5FCLK=5FGATE=5FD1CLK=5D =3D =7B 10, 13, =22d1clk-gate=22,<br />=

NULL, 0 =7D, /* G=46X CRT */<br />
=5BASPEED=5FCLK=5FGATE=5FYCLK=5D =3D =7B 13, 4, =22yclk-gate=22,<br />
NULL, 0 =7D, /* HAC */<br />
<br />
In my experiments on my system, LCLK was not enabled due to the null<br /=
>
parent dependency so I added CLK=5FIS=5FCRITICAL flag to enable the clk.<=
br />
<br />
LPC interface is default pin pad setting of AST2500 so you might not<br /=
>
need a pinctrl setting on it if you didn't change it's pin pads to GPIO<b=
r />
or eSPI.<br />
<br />
Cheers,<br />
Jae<br />
<br />
Jae,<br />
Are you planning to upstream this patch as it is needed for kcsbridge to =
work. Also aspeed-g5 dtsi file.<br /></blockquote>
<br />
Okay, I'll submit this patch and dtsi patch to community.<br />
<br />
Thanks,<br />
Jae<br />
<br />
<blockquote type=3D=22cite=22 style=3D=22margin: 5px 5px; padding-left: 1=
0px; border-left: thin solid =23e67e22;=22><br />
Regards<br />
-Vijay<br />
<br />
<br /></blockquote>
</blockquote>
<div></div>
</div>
</body>
</html>

--5c00a7c8_6a2342ec_da85--
