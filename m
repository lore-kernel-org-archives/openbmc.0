Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1HFM5N4rzDr44
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 16:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LVOSq3FY"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 84so7436502ybe.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mAB21PvOiyD3EifqSrG7lDTEhWzWGwSqfa5I6jFRjpY=;
 b=LVOSq3FYVGQ0UNfiPu2knMsRdzJyNWsmRG7CgdflRi66KQabvcmCwaxZx/YwVIz2lr
 p0gyKvUNHuB3oq2wsXXhz5d5u8Sxe21sHZVYc9ez8nwUByWP8bvoeB6t6kdLDiMkAtcc
 avE+EjuhOYaNw7dLc2++ZKDdrwCafWz3G/uNc3NrRucem4b6nXduxR+K6jC9g1mwvreI
 98x26F586aMyjjZvGZrBXa3LVj/TTqrWQ8f2MLHJhIGM4WI2yo4FWoskTfJYv00ozfkb
 W5XO7ANQyD6G8zd7TerXeXsLhm6fhWNJR28DCdRYW5hAHp58rawYadefN7NXdmAMc5TC
 el8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mAB21PvOiyD3EifqSrG7lDTEhWzWGwSqfa5I6jFRjpY=;
 b=iK9zXdvv8KQem8MOT8GRFOHxXp/BF3fxV0ZoAuDUgZ+gC++oiGRavUrL+7hkTv+APe
 Bp01buL0JQqAj41nOTzzB2y+07eeeKFDCwTf8jRMDbvuG4NZzAnQWK/YhvgRpjnqSmCv
 UZoSyI4SaLKvMU+/W9ISbc44eu7IFFBb6Olpjl+/COcgvqYvNq4lh2779kINMUcJQw7h
 /00b2dRmC7tKi/UWZdARhfQRKTeW73vo0JCedDUal8cdPotHFomrZEGt/H8S7TQTtrPJ
 hQSr5LVP0E2sGSoTYC7UIQyxsbdH7h6dUjgSJjmOfbWlwfGQrP12qqoVhkgt1JTYzzEt
 CbcA==
X-Gm-Message-State: AKS2vOwIslM2bdynqfUdNwn4SOBZ+nCEkTPe4j0VukV/QMBHC9FjcwVE
 gJUUUTg2TDFae0D9Cxai5ydUR7lSyaf+
X-Received: by 10.37.165.98 with SMTP id h89mr17537290ybi.169.1499063141557;
 Sun, 02 Jul 2017 23:25:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 23:25:21 -0700 (PDT)
In-Reply-To: <20170629033446.10782-1-joel@jms.id.au>
References: <20170629033446.10782-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 15:55:21 +0930
X-Google-Sender-Auth: KMXGifD9tQbJAt4yBWtm5x5D9Y0
Message-ID: <CACPK8Xffcw-6zGUpN_6Ni8spz-Nz9jsnr9tqGW-TDNze8DJzsw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: barreleye: Correct bad
 LED nodes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Sweta Potthuri <spotthur@in.ibm.com>,
 Adi Gangidi <adi.gangidi@rackspace.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 03 Jul 2017 06:25:44 -0000

On Thu, Jun 29, 2017 at 1:04 PM, Joel Stanley <joel@jms.id.au> wrote:
> There was a bug in the definition of the heartbeat LED that meant we
> were selecting the wrong GPIO for the driver. This fails now that we
> have the correct pinmux settings for the Ethernet MAC.
>
> When looking at the schematic for the correct number I found that the
> other LEDs were mislabeled, and in the case of the power LED not
> present at all.
>
> Finally, the keep property is reinstated. This was present in an older
> version of the dts as it is the required behaviour.
>
> The LEDs are now accurate according to the Ingrasys document
> 0101DAW00-000-G, dated Wednesday, April 20, 2016, rev A00. The file
> name is BARRELEYE-IO_BOARD-MP-HW-SCH-A00_20160419_FINAL.pdf
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I got a:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

off the list, so I will apply this fix.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index e4e853d0f561..2060831e579c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -34,16 +34,28 @@
>         leds {
>                 compatible = "gpio-leds";
>
> +               /* BMC_HEARTBRAT_LED_N */
>                 heartbeat {
> -                       gpios = <&gpio ASPEED_GPIO(R, 17) GPIO_ACTIVE_HIGH>;
> +                       gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
>                 };
>
> +               /* BMC_SYS_PWROK_IDLED_N */
>                 identify {
> -                       gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
> +                       gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
>                 };
>
> +               /* BMC_BEEP */
>                 beep {
>                         gpios = <&gpio ASPEED_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
> +                       default-state = "keep";
> +               };
> +
> +               /* BMC_PWR_LED_N */
> +               power {
> +                       gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
>                 };
>         };
>  };
> --
> 2.13.2
>
