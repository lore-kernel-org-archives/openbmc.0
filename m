Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TMfQbD7B"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Luv5lpgb"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DZgs2GHSzF16W
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 13:40:25 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id a18-v6so10842260qtj.4
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jun 2018 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=EkCTlvXs8iNWXLmm+fvL9wj6a6cQhkmTjYNOeZ8xxk8=;
 b=TMfQbD7BZCNhCyvs4PecFRTvpLpHIbfjvKyGMnL0fFy6fqTBCKxgdHn5J02Ugg3cO2
 uJlw0KD5imYXEOHSsdUG+Bxgsf3/Wuo2F4dC1YK0/0WNEXpbup8BCjvV0LLEdahLdsPe
 7896vqvIEqLHD1Da+5u+9XewLg/865eHQ/AMmjoVy1WwpWw541Z2XYqjN/o4Y2WBQG5u
 rwefJ194x6Ez5EqdbpG9ekdCAPKISt3UJ75z//sn3YSakn8P9yUNWFXcp224AAHqstKh
 KljdRGLIo5FRNMUFtM+pYG57iAOlmcGJClKu5UDZ2NikcXNfolrmU8Ih58qwYnDnayEj
 f0fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=EkCTlvXs8iNWXLmm+fvL9wj6a6cQhkmTjYNOeZ8xxk8=;
 b=Luv5lpgbZ/GPifcCkLi7ZNUEL4vviCelLuy8dPpI+l5r8QJQDYvr2ELGXMDZwi3Onc
 E+mr49OZntaZma2GtJHWEguE8k9vAb+rCyNb2+ncXnxNqhzYy9Y36XjR4xjDKUh++CCS
 ExQMQs+tLUUYu8SFVLfUTOoYnTGAgkx6Gto/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=EkCTlvXs8iNWXLmm+fvL9wj6a6cQhkmTjYNOeZ8xxk8=;
 b=Se60EJ2H4km4rx8gZWKD7hUWCMEOaVUeTcUPqVKPvhcqpuge3/M+dRzh8W1VqxoO/o
 +clAULhAucllKsc3U3ZGIBpT+Mrkyc/gC4B+1VaEVR/B8Ui7YIA7MgbJH+TMKnJRZG5f
 pG9+1G/b5qIKIpZQPxnJwYAHzAz8ZdiUf/3gZNXaKcy47Dj2TC96PZcxHiupWBFTBIW4
 QE9sPTKWqWz92LRM4YqirZG74576GX7HP1Y7UFSoKSOHuADY+ew5/+3ii/d30lm1U4Wi
 zf7bZsFEWsTjJlWpBOn+hs9HNX5uAgFJavCGm88ipidxZOfrdDzF/PmATAilZ3CpItYA
 ymeQ==
X-Gm-Message-State: APt69E2LdGCwFy5laou99EhY0Hjn3BBLpZPGn5/AWIkHkk9dtDnFB9lB
 bvFmRbegBPS6WtvD6TOvWvlgoqJOTBz60GtIDqM=
X-Google-Smtp-Source: ADUXVKLuyB15mihglIWaRP9bntc1JTZt0D8lng2Jfe2ctAla1W3/caSynCUcq9hOEmdr4/9qCRiyoHoT2tHWCgLIp1U=
X-Received: by 2002:ac8:322:: with SMTP id
 q34-v6mr1797001qtg.342.1529898022288; 
 Sun, 24 Jun 2018 20:40:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Sun, 24 Jun 2018 20:40:01
 -0700 (PDT)
In-Reply-To: <20180622070937.21498-2-clg@kaod.org>
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jun 2018 13:10:01 +0930
X-Google-Sender-Auth: al3kA-1OYHZdM5KuCSu41Fr4CnY
Message-ID: <CACPK8XenvZXcciV_sY-f4ZEjV+H1UtA1Ef5JYnvr2CKwM3NXtw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v2 1/2] ARM: dts: aspeed: Add
 "spi-max-frequency" property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 25 Jun 2018 03:40:26 -0000

Hi Cedric,

On 22 June 2018 at 16:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Keep the FMC controller chips at a safe 50 MHz rate and use 100 MHz
> for the PNOR on the machines using a AST2500 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++

The changes look good. I notice you've only modified the openpower
platforms and the evb. Is there a reason we don't do this for all of
the ast2500 boards?

$ grep -l ast2500 arch/arm/boot/dts/aspeed-*.dts
arch/arm/boot/dts/aspeed-ast2500-evb.dts
arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts

Cheers,

Joel

>  arch/arm/boot/dts/aspeed-g4.dtsi                 | 2 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 7 +++++++
>  7 files changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index c0a7f51e7eb6..6b78e40d3259 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -41,6 +41,7 @@
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>         };
>  };
> @@ -51,6 +52,7 @@
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "pnor";
> +               spi-max-frequency =3D <100000000>;
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index e6095f51ecf5..af41973a3882 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -66,6 +66,7 @@
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>         };
>  };
> @@ -78,6 +79,7 @@
>         flash@0 {
>                 status =3D "okay";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <50000000>;
>                 label =3D "pnor";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 347938673c83..ffe0c991d985 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -93,6 +93,7 @@
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>         };
>  };
> @@ -106,6 +107,7 @@
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "pnor";
> +               spi-max-frequency =3D <100000000>;
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index d05ace220a09..c51e3e8ece62 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -190,6 +190,7 @@
>                 status =3D "okay";
>                 label =3D "bmc";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>         };
>
> @@ -197,6 +198,7 @@
>                 status =3D "okay";
>                 label =3D "alt";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <50000000>;
>         };
>  };
>
> @@ -209,6 +211,7 @@
>                 status =3D "okay";
>                 label =3D "pnor";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <100000000>;
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index 80cc7cba163c..757d6b3eb041 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -124,6 +124,7 @@
>                 status =3D "okay";
>                 label =3D "bmc";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>         };
>  };
> @@ -137,6 +138,7 @@
>                 status =3D "okay";
>                 label =3D "pnor";
>                 m25p,fast-read;
> +               spi-max-frequency =3D <100000000>;
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 79257bf415a8..e526f54f400e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -65,6 +65,7 @@
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -80,6 +81,7 @@
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                 };
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 9cc50551c42e..afd33112c329 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -65,16 +65,19 @@
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                         flash@2 {
>                                 reg =3D < 2 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -90,11 +93,13 @@
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -110,11 +115,13 @@
>                         flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                         flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
> +                               spi-max-frequency =3D <50000000>;
>                                 status =3D "disabled";
>                         };
>                 };
> --
> 2.13.6
>
