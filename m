Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnDbW5KYBzDq5g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 11:44:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kruZv21k"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id o4so15654444ywd.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 17:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=O+SbIEebXTCw6symDysPoN+Vdr955Q095OnqWHnCrGs=;
 b=kruZv21khJgc3ol24xxaKTf+jRq+NzRcn0v146vDqq1m6sdBpSqiNa/ntBlEo4P/i9
 hwpyKendOBTjA21z5UwPybE3HbHWEMEUU7ywLK9KZXK05+/kzRVv8PogUkW5ILIht+7z
 lCJ9xwTYfMJ7klWFon3Mi0BFDo/hXe0siPwON7TEFGaxeRG6TXZN923GdO7/kfGkUfpx
 qajTIWO6MwYUcZxbc1T8kIhj+9EP1YF9RnB+AQqWbFjYRmDC6byHabyosXs0l4C5YAO8
 2YRlgEkUUwY25ErFllDOo/a7+uFRDwQVS3ZG4YgUOefnbIXQZh1UOgIpcwe76zivyPu0
 FsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=O+SbIEebXTCw6symDysPoN+Vdr955Q095OnqWHnCrGs=;
 b=nvYqNMW3g5o5u3GJ8Aw3+jxS9f4RJqYOPD8L0PJCs64CvwBUynSvKiHekuA8E9YWxG
 EiFGLRdTH66PevTW/LGZG5Ot3HCYQty9+0mpydXOkNJAtQUIqbzjlcg9l/SSWBwXzI/P
 ndobFCUk0nt6ui6PcKB9VSLDH4HGBjlNQQCOgtqvu6euXk+e40XZX1cspLodr5a2I1Ob
 XbvDFbDCWNbcCwUPhb9ZIaWRDv3eADT27CA22mTShP3RW8UUgoUHpvUB60reoS4FDB1N
 QUO4tW7A2SH3hRYyqgV+LGurUAnFEvu/GNHta6DyFFXLAlQW4dKkZelaa9TABzIsDrCk
 yGXQ==
X-Gm-Message-State: AFeK/H3lo6uMeuzdk8qNUlUvIepaGp81HKfmVhWBvRPV4Y9s9UwWlgZSItD3xdv3aF7qSraDLuOqvqwPZX2u+w==
X-Received: by 10.129.91.86 with SMTP id p83mr16809524ywb.50.1490057061012;
 Mon, 20 Mar 2017 17:44:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Mon, 20 Mar 2017 17:44:00 -0700 (PDT)
In-Reply-To: <1489562028-22480-1-git-send-email-mine260309@gmail.com>
References: <1489562028-22480-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Mar 2017 11:14:00 +1030
X-Google-Sender-Auth: NSFnzpXtQ4-sVz4yHPu4Dv8W3Nk
Message-ID: <CACPK8Xey7qvU4_POhc3wXTuNs7tvQjRqNaJsZ2QuMnv=wgqYkA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: Add GPIO hogs
 for nic_mode_func
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 00:44:24 -0000

On Wed, Mar 15, 2017 at 5:43 PM, Lei YU <mine260309@gmail.com> wrote:
> GPIOD3/D4 are the "NIC_FUNC_MODE_0/1" pins connected to Broadcom
> 5719 which control the PCIe functions.
> Add GPIO hogs to pull down GPIOD3/D4 to use that function.

On other systems we had three GPIOs that set the mode of the NIC. I
notice the schematic for romulus has three FUNC_MODE pins. Is there a
reason you're only setting two of them?

I have applied this to dev-4.7. Please send a follow up for
FUNC_MODE_2 if you want to set that.

Cheers,

Joel


>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index b8b2d7f..2266c85 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -181,6 +181,21 @@
>         status = "disabled";
>  };
>
> +&gpio {
> +    nic_func_mode0 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "nic_func_mode0";
> +    };
> +    nic_func_mode1 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "nic_func_mode1";
> +    };
> +};
> +
>  &vuart {
>         status = "okay";
>  };
> --
> 1.9.1
>
