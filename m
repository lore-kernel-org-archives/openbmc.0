Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svb3D1S88zDsxn
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 13:56:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wikrTbXN; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id 2so2918057vkb.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1aEawAHu/ROEY/xshsVN1iROjqC47/cRZ6DRNf4fRvA=;
 b=wikrTbXN4RX2HqtfLAlbwel/OGvMV0isrnAgnm4SzZDV4YJCz9eeRDg6B1pGbcQK0u
 m+15lTjTkKOly9vJ1SBLJy/dPJqyPLGV8Q+skQHbsg8mPMQsrMjLufi1GKTcigPHmqpl
 qaSAeiyTSMZ6x5d470ZtG+2s7ZLg60bQ5IONoZX1gx6q2aTdyG5Ifn5P7Onl80HqSSi4
 DgKa8M8ISx27zCWGWSuQYr5ZVUlnIwLcF7DywNX6bY3OEqybVrXHvqXwNeIRejfsy6lO
 ZeAUeMvCN9+tP1OCUeiGVtvAArd0cxuOwqvbS7m+FpDWw7EsW299RkNqH6MuNYbhwcnM
 ysnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1aEawAHu/ROEY/xshsVN1iROjqC47/cRZ6DRNf4fRvA=;
 b=F+ROon0u0R41R8ytqmHrrZCDN5t49jDMFPBmZZmntEUM2bQmYRfFLqZZw4zvA0K6xz
 4t2ja1RvDHy0YjD9tLSEcgNZwbghp6Y0vwRJO5mR3KmlWm26/ne57QNZs72X5IYlTftR
 85SxTv+Trrw+kFFID8ubQsoKofYGkF3UEdZvRaWlzLEcIV0sRJ33cPJdg+9WUZO1/y2P
 wO2ttGubs5NzOVnT8xjlJrpp5l5bvK817/YnSfrPQd1enou1Um+HJjA3nKvuZH6VU69e
 JfCv6u5Ili5zg1tEaQuRWG6htma/7KWg+Z8g2VAbDdn/6aZtMPH5lnLdchLhMe69k8Gq
 QgBg==
X-Gm-Message-State: AA6/9Rl/jzg6G/ladaKK7gG1hxnBINA4A1JZnJfgZ3Lvly7ZAWKHSZqbvceU+ytu/vDRQMeeFNAUeO+hQ03YiA==
X-Received: by 10.31.183.134 with SMTP id h128mr1953981vkf.124.1476327381300; 
 Wed, 12 Oct 2016 19:56:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 12 Oct 2016 19:56:00 -0700 (PDT)
In-Reply-To: <1476312288-100725-2-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
 <1476312288-100725-2-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Oct 2016 13:56:00 +1100
X-Google-Sender-Auth: _GJRAjnhFdmkjSRoUbrOJ3ytpj4
Message-ID: <CACPK8XeRwcKLKLwP3yQNDm6Jme+fWWV4MhA=hZkA7+1PYwAduQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: zaius: Fix pinctrl on MACs
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 02:56:24 -0000

On Thu, Oct 13, 2016 at 9:44 AM, Xo Wang <xow@google.com> wrote:
> Update the Zaius dts to reflect that MAC1 is intended for NCSI and MAC2
> is connected to a BCM54612E gigabit PHY.
>
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 4c4754b..541455f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -68,7 +68,7 @@
>         status = "okay";
>
>         pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_rgmii1_default>;
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
>         use-ncsi;
>  };
>
> @@ -76,7 +76,7 @@
>         status = "okay";
>
>         pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_rgmii2_default>;
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>  };
>
>  &i2c0 {
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
