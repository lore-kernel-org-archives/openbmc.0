Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svb3k6zh3zDsxn
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 13:56:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AFbZxmPS; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 2so2918245vkb.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 19:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=bx8TFsPyCWgjWpB3uIL0/MsZxSSd6ZogAtyLoWUZ0zU=;
 b=AFbZxmPSMqn/1Li2t77LVkVR3nrRO80JY9o9MCqbn5II6YZVhWU72rD+OHzhmttmTQ
 Z5xaoi3rhyPPi1f2Yz6PIEsYbGNlEYuFuWa5Tz8yGVm5JBa/T+AEFCQnyUfy5pRKJlz3
 pOV62eL98XO0GfKXQ7trkB8d0xuntLPaxveD7NY8Jh7vB57+QIZzqIxdMZ8puPxTOHLw
 o1X/GXfS/XQdfmGhLRZ8UYMqnbKg6SWehzAKqt3LevF36BS2/5YFwQM8jWLCU55160Eb
 IVCCEl0IMZG5ilD/Q2JLBVszqEgvPvBOEQCEFagty5yzZMg0NlyMS2cJuu+0f2+4N4QT
 DNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=bx8TFsPyCWgjWpB3uIL0/MsZxSSd6ZogAtyLoWUZ0zU=;
 b=R294cLUTtBXmVAmBiYEpiFQQ/NjK3whoZ/f7dIRFCIrQuRtJ3v6zvbzQxESsBatwBs
 2anSgpasqSKWHzQMuXEGYv7gJU4t0jwCMu9xkGl5ninbAJD/F7sLRlt+Aim0GToSxguQ
 yZuWOaAMU7bc+gMnqkZ7waLdXKUqhq+021eBhgJ1ZRuYb5muexl4+yNYiRnngYR0ph9P
 iMRjB5fo4/jL3CT9QnbnzgD7agQ9RxCNuz/dzCRNDsJ+7W28b8exA8enIu11kj8LzWPC
 hOfBu8CULQRzcV7jr40rqBj97u7BvAKp1dsJICgvIFPXvHDZwSnu+f+6YSSPiN0og3th
 tVkQ==
X-Gm-Message-State: AA6/9RkREpEZAV0dTS3gho/Bpa5gacB0KufyH7MtWDUZatnWIjX+8e6gBDADiiV2ynKZMJ9j/C7FadaQnkfIYQ==
X-Received: by 10.31.115.8 with SMTP id o8mr2978180vkc.2.1476327409051; Wed,
 12 Oct 2016 19:56:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 12 Oct 2016 19:56:28 -0700 (PDT)
In-Reply-To: <1476312288-100725-3-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
 <1476312288-100725-3-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Oct 2016 13:56:28 +1100
X-Google-Sender-Auth: Cp23i4EU_Egkyq8afl3S4al3_Vw
Message-ID: <CACPK8XezWQHmDr_BMf780YDA_Qp2RwVaXXCwMqCzmouk9iW5Vg@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: aspeed: zaius: Add static GPIO config
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
X-List-Received-Date: Thu, 13 Oct 2016 02:56:51 -0000

On Thu, Oct 13, 2016 at 9:44 AM, Xo Wang <xow@google.com> wrote:
> Add GPIO hogs that turn on I2C muxes and I2C level shifter.
>
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 541455f..cc2e84b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>
>  #include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>
>  / {
>         model = "Zaius BMC";
> @@ -205,6 +206,29 @@
>          */
>  };
>
> +&gpio {
> +       line_iso_u146_en {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "iso_u164_en";
> +       };
> +
> +       line_bmc_i2c2_sw_rst_n {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "bmc_i2c2_sw_rst_n";
> +       };
> +
> +       line_bmc_i2c5_sw_rst_n {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "bmc_i2c5_sw_rst_n";
> +       };
> +};
> +
>  &vuart {
>         status = "okay";
>  };
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
