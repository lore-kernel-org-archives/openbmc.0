Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZV3K0BnYzDsWc
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 17:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pNnP55hT; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id b133so642155vka.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=rX9ENalG9062luOr4j5jxMU259POUrTlmpKZJq/2ggE=;
 b=pNnP55hTlcndvaLWMt31bNCXtD7fsJ/e+oQNQTdGOYFhoQRO2klGMzCzkj4RWwc0PG
 wwDgfsz0l2vnQcIKP5jQnCCvEkC4wQ+Z1WX0LcuiEaPUWUakFKc6ZgFfotgNXECsPVs0
 qcn2ZMVcfF0ovN/bgSbQHvvpB+YAK5IUsRhR1y8BNUPOU+qiZMKQ5URuf8STh44jA4+/
 kKF1QEGJTbPsp9VWbfyif84IclLgPrch7SCIp4G1f7YF/7+gsUdmgzmznJrYZOOOprZ8
 LuBlgHY4Jg0iVgtQ7i2BvJkWYPNHK+sfnG9SiwY1AlQTJEjkoaHXUKIZ31Mo0Axq20WL
 FVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=rX9ENalG9062luOr4j5jxMU259POUrTlmpKZJq/2ggE=;
 b=ifS2uQ+3r/fXFYCDCAZwUaVFW9Nkf/UwrGttFE1PX2AOn/OGErvQjTumlYmL/RQZk8
 VimUVqitfNwiN06rz2lE3QuG4iaX0JYoMNHaiV0LBS+B6EZDlseoqsw0rif3Mwd9rZNt
 cC6Ic1aewaWOZpKZyOodpUKsR3hE0rgph+aSxyThHnfzoftbFjDK9D/qTBNxnSmI/tHQ
 8GbqGHVnkaKIgy0YBUfpEoTVikCaK0TOu5MndzlVRhtlHjg392t8Gkm2K3kKun5wA3K4
 QsQY0QLtm2HQZuaouw/f7V3UL4Fjwsvax8SC7/He/HRFYmorrSnu+K2PTvmCM92if8KZ
 I+gg==
X-Gm-Message-State: AE9vXwPfrp9krUac85MLXPkYd2axmHbBfA+A7AzbImWIqjs081sASqPm82iS4NQyw4rsabEvNISSq+t69ub//Q==
X-Received: by 10.31.21.138 with SMTP id 132mr1852464vkv.1.1473923530341; Thu,
 15 Sep 2016 00:12:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 00:11:49 -0700 (PDT)
In-Reply-To: <1473921146-19509-7-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-7-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Sep 2016 16:41:49 +0930
X-Google-Sender-Auth: 9wEq73TknUqHRIDiab9dDn_Mfqw
Message-ID: <CACPK8XdcvGKeTR5v_PZ_kwTydLjWS6FXkvdi=HWNV7KRxTLLVw@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.7 6/6] ARM: dts: aspeed: Enable BT IPMI
 BMC device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 07:12:13 -0000

On Thu, Sep 15, 2016 at 4:02 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index eb0122fa34c2..4480b858103e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -391,6 +391,12 @@
>                                 clocks =3D <&clk_apb>;
>                         };
>
> +                       ibt: ibt@1e789140 {

Given this is part of the LPC register set, and we need to expose
other parts of the LPC, I was wondering if we wanted to make this a
sub-node of a mfd device that covered all of the LPC controller's
registers. What do you think?

> +                               compatible =3D "aspeed,bt-bmc";

When getting bindings reviewed I've been told we should have something
soc specific in the string, like aspeed,ast2400-bt-bmc. I'm to too
fussed though.

> +                               reg =3D <0x1e789140 0x18>;
> +                               interrupts =3D <8>;
> +                       };
> +
>                         wdt1: wdt@1e785000 {
>                                 compatible =3D "aspeed,ast2400-wdt";
>                                 reg =3D <0x1e785000 0x1c>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 79abac876abf..7c781fb613f8 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -255,6 +255,12 @@
>                                 clocks =3D <&clk_apb>;
>                         };
>
> +                       ibt: ibt@1e789140 {
> +                               compatible =3D "aspeed,bt-bmc";
> +                               reg =3D <0x1e789140 0x18>;
> +                               interrupts =3D <8>;
> +                       };
> +
>                         wdt1: wdt@1e785000 {
>                                 compatible =3D "aspeed,ast2500-wdt";
>                                 reg =3D <0x1e785000 0x1c>;
> --
> 2.7.4
>
