Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oMBRjynE"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wPRh1dGgzF3Xk
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 12:49:19 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id t81-v6so13272911iod.10
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 17:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O1aY7LPmM1dh1NpMT5NMlfW52E2jeR8VNQbfC0ZGtYo=;
 b=oMBRjynElxWnwUdiIu7Jof0tEna8QTbFJwAEvEEs3MFnABxEGZJpU8YtfAYUss/7XM
 7fH/B2wrzbkBV6i6OmONl2S7VxzcEuzrp9IqT1GEOT1w+Q0ZeZdXw8pQucPQTo86HpCP
 kduQUqtQ2JK/saExCcd9xMjM//jGLm//8Ar5BnGR1+fakf6+PWXtuFnRxy+cZw5pL7mY
 SNqsNbM6mfYjIG2XpbmCMLFQ59oGX21lzMKM1LSVopQVzRuuqErHYsDy4D8/NcE7i5fw
 YmhE390YL8TNx5Ck6RNorY3ubj307a5HJW2tI1IBtqR0q6yavU38o8Rd6tYhQal8PpcX
 EiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O1aY7LPmM1dh1NpMT5NMlfW52E2jeR8VNQbfC0ZGtYo=;
 b=JfXmSUvHYOi7ivNh0ggpS3JJR51AQ6E0BF/B4+tl8Ne19KnSqpwC21so2+vc7Aneu9
 +Ees4hN4qu7DzylxHyoIkBzfQdItqaluNvoGlENuoXGLPqDNHs0YNPQ9ztQ5svs6mcle
 dkRiLdZVYIyp4OuM3z9O9QcoMycTKrcSygTl8/RqiH+zulIkA5ENs+NXBM2nhnyc6L/r
 kb2DGoOu50fmY4RWnIgeShBoWCoMome3ubb8h890Wfg1G4Mf4rcdMX1UgXzp4JNPk5Ia
 kBRwzMJI0oBOja46pwUpWWCYjP6jUk9Yq8PeV2uULAS3DXT2q7w4dI5p9csBMynhaFIy
 CzoQ==
X-Gm-Message-State: AA+aEWbDVyxhyE6TPXfX0m6q+0oksIevYqyaZw1uZ78Xo+IHlCcNXxm9
 UT2Bw82IWyGSAj4wtK9U6kP1FJj0Qf6w3Vmedwo=
X-Google-Smtp-Source: AJdET5e2HQgjchPXBfppJYE1H9W2z6KYmd5sjcvyKCkaskRxXuzPEAiI7RQ+8Ui6dsnhiy8r9T2wdcE/6tQorX7Vaqc=
X-Received: by 2002:a5e:c303:: with SMTP id a3-v6mr3777453iok.24.1542246557668; 
 Wed, 14 Nov 2018 17:49:17 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
In-Reply-To: <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Thu, 15 Nov 2018 09:49:06 +0800
Message-ID: <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2018 01:49:21 -0000

Hi,Jae

>
> Hi,
>
> On 11/14/2018 2:38 AM, qianlihu wrote:
> > Hi,
> >
> > I add ipmi kcs node,but it didn't work
> >
> > here is the patch for dts.
> >
> >          lpc_bmc: lpc-bmc@0 {
> > -               compatible =3D "aspeed,ast2500-lpc-bmc";
> > +               compatible =3D "aspeed,ast2500-lpc-bmc", "simple-mfd", =
"syscon";
> > +
> >                  reg =3D <0x0 0x80>;
> > +               reg-io-width =3D <4>;
> > +
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges =3D <0x0 0x0 0x80>;
> > +
> > +               kcs3: kcs3@0 {
> > +                       compatible =3D "aspeed,ast2500-kcs-bmc";
> > +                       reg =3D <0x0 0x80>;
> > +                       interrupts =3D <8>;
> > +                       kcs_chan =3D <3>;
> > +                       kcs_addr =3D <0xca2>;
>
> Probably, you should add a clock setting for KCS H/W block into here.
>
>         clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>
I tried ,but it didn't work=EF=BC=8E

> Cheers,
>
> Jae
>
> > +                       status =3D "disabled";
> > +
> > +               };
> >          };
> >
> > +&kcs3 {
> >                           +       status =3D "okay";
> >          +};
> >
> >
> > The device node /dev/ipmi-kcs3 is created.
> >
> >
> > root@sanjose:/tmp# ./kcsbridged --vv --d /dev/ipmi-kcs3
> > Debug logging
> > Starting
> > Registering dbus methods/signals
> > Requesting dbus name: org.openbmc.HostIpmi
> > Getting dbus file descriptors
> > Opening /dev/ipmi-kcs3
> > Creating timer fd
> > Entering polling loop
> > Processed 1 dbus events
> > Processed 1 dbus events
> > Processed 1 dbus events
> > Processed 1 dbus events
> > Processed 1 dbus events
> > Processed 1 dbus events
> > Processed 1 dbus events
> >
> > but there is nothing output.
> >

this is the dmesg info

root@sanjose:~# dmesg |grep kcs
[    2.052340] aspeed-kcs-bmc: channel=3D3 addr=3D0xca2 idr=3D0x2c odr=3D0x=
38 str=3D0x44

I also checked the hardtrap:
0x1e6e2070[bit25]  enabled the lpc mode

I'm sure the IO port is 0xca2.


should I config the pin for LPC,I checked the ibt node,it didn't.


thank you

--qianlihu
