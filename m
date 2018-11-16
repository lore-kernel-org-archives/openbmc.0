Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FBNqhJ1X"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xDvk1hbkzF3Tb
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 21:28:01 +1100 (AEDT)
Received: by mail-it1-x144.google.com with SMTP id t190-v6so33960028itb.2
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2mawpApkFVNrUv6SbJ7+sPKrZ/iNArMcQO4tZVfRX6U=;
 b=FBNqhJ1XLn2u2KcQt0Z6DNqC0HAxKu8FQtchAO1PU8Ool7o35PCILc9Fp/JQZdZIUw
 z6ot4CgL5zF/A0We1AIT4NEiskQ0GjEinv2EyJ1JndaUT6DOW0F3AQ7xbRRkVnA8FORo
 bEKF/+Gqdjb0AIBqs5D0uVomb1q4QKnd/GjqHfz+Qm7V0FR5fy2qk3LRl2lizGyqi0rw
 sB1fK590qJL1DIQiFu3KQ5nqxTWZq91eX0L36Z9cNKfck//f6aEOUvE7j/HYCbZOu7ge
 AdzM6+tqMrAzTnhtATcDMrf37yvAHYEEQiCAn10h+0QYxD5mJC4O8tUpyHfq+IdA02ZH
 SSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2mawpApkFVNrUv6SbJ7+sPKrZ/iNArMcQO4tZVfRX6U=;
 b=R2QRt9872y+TDB+AKsemd1FSd6hs1zfDaBQaHEzPeaEn+POSYqpxKc9OXC2ge96p/3
 pcmOlj85q2oelrpr81j5W6OHbbzZ71wALIkg0vb8JfEUfhSECOth7lc0lSk5gljpCYgC
 XJ6G+Djpyan3vszGVhYlIdUNbEo3TtFi4HKwSXPF3jXTUCwY8ZHK3bG65gypSW9OMt1V
 buv0z8l6I/NWYXRoQE3wsL3RNNiTNvwOYhLCWEkOxFnYyU8GqWc7HPfk4uOtPazLmnFW
 FQpVmDXxK8z4yBRDfW75r1dRNV0KMaNK5SoENIu8lsTWFm2Ig+S3KezehqnUGqUdUVUs
 8hpA==
X-Gm-Message-State: AGRZ1gJDkucAIBaCgfjIuAJ8cXYy9aW4HIGDaS44tXgDvyaMFqmi8YXd
 Ldy3NnxDU7ELEV149uH1w+QqcIJVCY619ecrpb0=
X-Google-Smtp-Source: AJdET5fT2krsP1Ex/wdxMdp2JO8bomyFNIJzeor+9lnEw3rnm/fn2R3CyvKfQmhMVxucPzgEgNYbsd0j6fg2rV6gVok=
X-Received: by 2002:a24:3c3:: with SMTP id e186mr7013985ite.155.1542364079818; 
 Fri, 16 Nov 2018 02:27:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
In-Reply-To: <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Fri, 16 Nov 2018 18:27:48 +0800
Message-ID: <CAHkHK0_bF6Ao2NLNb6JNg0RmKMsZpBV-t3B=geccuT-q5va_jQ@mail.gmail.com>
Subject: Re: [HELP] ipmi-kcs didn't work
To: jae.hyun.yoo@linux.intel.com
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 16 Nov 2018 10:28:03 -0000

Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> =E4=BA=8E2018=E5=B9=B411=E6=9C=
=8816=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=883:30=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On 11/14/2018 5:49 PM, qianlihu wrote:
> > Hi,Jae
> >
> >>
> >> Hi,
> >>
> >> On 11/14/2018 2:38 AM, qianlihu wrote:
> >>> Hi,
> >>>
> >>> I add ipmi kcs node,but it didn't work
> >>>
> >>> here is the patch for dts.
> >>>
> >>>           lpc_bmc: lpc-bmc@0 {
> >>> -               compatible =3D "aspeed,ast2500-lpc-bmc";
> >>> +               compatible =3D "aspeed,ast2500-lpc-bmc", "simple-mfd"=
, "syscon";
> >>> +
> >>>                   reg =3D <0x0 0x80>;
> >>> +               reg-io-width =3D <4>;
> >>> +
> >>> +               #address-cells =3D <1>;
> >>> +               #size-cells =3D <1>;
> >>> +               ranges =3D <0x0 0x0 0x80>;
> >>> +
> >>> +               kcs3: kcs3@0 {
> >>> +                       compatible =3D "aspeed,ast2500-kcs-bmc";
> >>> +                       reg =3D <0x0 0x80>;
> >>> +                       interrupts =3D <8>;
> >>> +                       kcs_chan =3D <3>;
> >>> +                       kcs_addr =3D <0xca2>;
> >>
> >> Probably, you should add a clock setting for KCS H/W block into here.
> >>
> >>          clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> >>
> > I tried ,but it didn't work=EF=BC=8E
> >
> >> Cheers,
> >>
> >> Jae
> >>
> >>> +                       status =3D "disabled";
> >>> +
> >>> +               };
> >>>           };
> >>>
> >>> +&kcs3 {
> >>>                            +       status =3D "okay";
> >>>           +};
> >>>
> >>>
> >>> The device node /dev/ipmi-kcs3 is created.
> >>>
> >>>
> >>> root@sanjose:/tmp# ./kcsbridged --vv --d /dev/ipmi-kcs3
> >>> Debug logging
> >>> Starting
> >>> Registering dbus methods/signals
> >>> Requesting dbus name: org.openbmc.HostIpmi
> >>> Getting dbus file descriptors
> >>> Opening /dev/ipmi-kcs3
> >>> Creating timer fd
> >>> Entering polling loop
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>> Processed 1 dbus events
> >>>
> >>> but there is nothing output.
> >>>
> >
> > this is the dmesg info
> >
> > root@sanjose:~# dmesg |grep kcs
> > [    2.052340] aspeed-kcs-bmc: channel=3D3 addr=3D0xca2 idr=3D0x2c odr=
=3D0x38 str=3D0x44
> >
> > I also checked the hardtrap:
> > 0x1e6e2070[bit25]  enabled the lpc mode
> >
> > I'm sure the IO port is 0xca2.
> >
> >
> > should I config the pin for LPC,I checked the ibt node,it didn't.
> >
> >
> > thank you
> >
> > --qianlihu
> >
>
> Try below fix on clk-aspeed.c
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..b55d35e3eb5e 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] =3D=
 {
>          [ASPEED_CLK_GATE_DCLK] =3D        {  5, -1, "dclk-gate",
> NULL,   CLK_IS_CRITICAL }, /* DAC */
>          [ASPEED_CLK_GATE_REFCLK] =3D      {  6, -1, "refclk-gate",
> "clkin", CLK_IS_CRITICAL },
>          [ASPEED_CLK_GATE_USBPORT2CLK] =3D {  7,  3, "usb-port2-gate",
> NULL,   0 }, /* USB2.0 Host port 2 */
> -       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",
> NULL,   0 }, /* LPC */
> +       [ASPEED_CLK_GATE_LCLK] =3D        {  8,  5, "lclk-gate",
> NULL,   CLK_IS_CRITICAL }, /* LPC */
>          [ASPEED_CLK_GATE_USBUHCICLK] =3D  {  9, 15, "usb-uhci-gate",
> NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>          [ASPEED_CLK_GATE_D1CLK] =3D       { 10, 13, "d1clk-gate",
> NULL,   0 }, /* GFX CRT */
>          [ASPEED_CLK_GATE_YCLK] =3D        { 13,  4, "yclk-gate",
> NULL,   0 }, /* HAC */
>
> In my experiments on my system, LCLK was not enabled due to the null
> parent dependency so I added CLK_IS_CRITICAL flag to enable the clk.
>
Worked! thanks
> LPC interface is default pin pad setting of AST2500 so you might not
> need a pinctrl setting on it if you didn't change it's pin pads to GPIO
> or eSPI.
>
> Cheers,
> Jae
