Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rxetrnhg"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynPDF2pSMzDr4P
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 15:14:05 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id 74so6399400lfs.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 20:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5P9mfHXg2dHKpZ5vWQGnl19Zzl+VqNXbHpB8KrGkvSY=;
 b=Rxetrnhgnm7oOvNlWZydsUMj2vQc5sLynHgCpeBsi1SrYEuwzV2zLa6yP5hRgQRXM5
 pKFBOnbBjCCeH4kAqGlopZS1GXm1wT4dOX6RTV2Q1nRNu6FIUCRsGVapN5bzfE1nn8FR
 XDfsS4PAWLQBl/3M6hZ2xJE4Gf0KwBAibAoVx4ViSdkvmUG8u1JTYcA2UOUyJBl49Mh0
 oEdC7558zze0f7ySwyAd/QrxoCzjdn2tLcfY1vQwysIXUTY7NUx4pG7VDSur1BCqAS0I
 JHosWdrp2jm7H0r0HKMc6dn18T434zTbaftEZqj+0AuXp01Or2nZirrXGy/7pgn1LGfP
 h+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5P9mfHXg2dHKpZ5vWQGnl19Zzl+VqNXbHpB8KrGkvSY=;
 b=QbOSf+q4+CgTFCmf4QjeSHXNdnCsRmrHW4LSU7hvGacLae6SocydpxdijBnYKvzs66
 a2syx/zNTlHvJ9PDJr5PQWBjNRdw2mpqeV0s+P6DhYLNa6ZgZjCqEZyqWSrCx9/GfcAY
 5xGiqQgDwik4DJSvaJH+kqB/wnSiQHsWiPvKhn1mOGrCYPonmkdUk2suEHCaSpEhFmgx
 yEb76ML3qIO7Nc6iOwTvOBw7j9J1dK0nLodOAL0F6NQrycWS5bCEwnd7coRQXNUjQoEM
 24FPtdHcfHjalF5GECd2MKS1zOccLcbdnrxRHfpWpt78X4V0VrxPCREuVUvOIu+1/ADO
 ASDw==
X-Gm-Message-State: AJaThX6sgsUVnyvZKTulHC3hFXSW3SeP3gMI5W1R20LjzNNoHGI4TQ4D
 3cBDsE+0NysKjL09/ZOPOh4fTDcPr0njfub6HdX8pg==
X-Google-Smtp-Source: AGs4zMakvPWInmDo+I6trEB7C8IUPp1jkzD2trVFHChAKT8zaF5NmM5PtcCKwqaw/R14hPNZEKj5KxdSu9xRRzbjlss=
X-Received: by 10.25.210.210 with SMTP id j201mr2046885lfg.45.1512015241649;
 Wed, 29 Nov 2017 20:14:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 20:13:38 -0800 (PST)
In-Reply-To: <1511861129-13455-1-git-send-email-mine260309@gmail.com>
References: <1511861129-13455-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Nov 2017 14:43:38 +1030
X-Google-Sender-Auth: s03CEEVqbWrlg6UAHw1s50DWSPs
Message-ID: <CACPK8Xeu0p1yNyRzoLD7PR2+OjpgACFcR-8m_ZUUNYAf5sa+Bw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: P8: Add checkstop gpio
 key
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 04:14:06 -0000

On Tue, Nov 28, 2017 at 7:55 PM, Lei YU <mine260309@gmail.com> wrote:
> The checkstop gpio key is missing in P8 systems.
> Define the checkstop gpio key for Barreleye, Firestone, Garrison,
> Palmetto so they can use it for checkstop monitor.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10. I also fixed up a mistake where garrison's dtb
did not build due to a missing include.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 10 ++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 10 ++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 10 ++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 10 ++++++++++
>  4 files changed, 40 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 6e70ca5..026cda5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -54,6 +54,16 @@
>                         default-state = "keep";
>                 };
>         };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(P, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(P, 5)>;
> +               };
> +       };
>  };
>
>  &fmc {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 93ad3ea..fb7d5f9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -43,6 +43,16 @@
>                         gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(H, 0)>;
> +               };
> +       };
>  };
>
>  &fmc {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 95552c8..a2906ccd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -26,6 +26,16 @@
>                         reg = <0x5f000000 0x01000000>; /* 16MB */
>                 };
>         };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(H, 0)>;
> +               };
> +       };
>  };
>
>  &fmc {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index ab3fee6..8ba7d05 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -58,6 +58,16 @@
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 trans-gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
>         };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(P, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(P, 5)>;
> +               };
> +       };
>  };
>
>  &fmc {
> --
> 1.9.1
>
