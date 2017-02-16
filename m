Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNz060BgyzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 12:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CQFqUgzj"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id 123so119992ybe.0
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 17:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=F/Z+q3+3LsB87ZcC1fcYKOZ4Kk2UEWpqAFs6ke7WvOs=;
 b=CQFqUgzjmlpw6LMvO3McnryS1GDciLUY7DpwrXI5oITg/E62tmPRL9B9wKojOHiXY4
 rpLW4Ed/HNCl8dlTHVWqjEMMAbpDiNleoONJjeIXZ1QY6KuRy81gDEpwQ9vLC8C5aikm
 PTU+t1LF0qCHLNXtPycZ7ACXFpsgGD4ONMvFIcoUbSY+9rpyZ2c3tTfCTBsUeK3w3a+N
 4Cd8Tp1Uv9h5QCAxi+Lo3gqkTKU0mFyw9WKW/+0qM8XNvjdHUoAlzB1v3CRgHxhgwZDq
 KZ9w+ARcjdodzJ5cewGwhtwOWpdgMmd1yCvRAnPI8oh+Ss0zfGOhEVK/T4EdPyq/+c4h
 ZA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=F/Z+q3+3LsB87ZcC1fcYKOZ4Kk2UEWpqAFs6ke7WvOs=;
 b=KdHdRFevdUae6nRIemjr01nXjcA6BEtFq7T26rduoDr/bNgJSN1Xc6y8YwAMuVrvks
 +D52W43SiACU9Jxtst3u/pvply5pUBEpfNb5Hs/Pf4RFXygP1GRz+yqww2oCZYwYaH7z
 N46nJsCWHAS5tPnCqyjSFKMZezHL8wUQ9N8//oHU91di4r1GKifvg+D2Rle/yzEEeARG
 PFZoUA2xKITg3m6z9Df2w94K61Fw4Ecdmac5rcgzZ0ZKl6KuiB47lCUGSiek2io32bXa
 vs/Lwxu7fWbMh6dlCEZ65n/jw/MT7RbxJQbAn0ohNENML5/RLY6I3jNmiiYtjlxI7NBr
 W7hA==
X-Gm-Message-State: AMke39lmGkFjwVRgcYVqswHnWXjTLdx4SPAfJVcGQJ1SFHJ53ies1KEKGgzaDAaFgvyQMXTHBm8FEgdFhotKBw==
X-Received: by 10.37.194.5 with SMTP id s5mr26267752ybf.136.1487208115681;
 Wed, 15 Feb 2017 17:21:55 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Wed, 15 Feb 2017 17:21:35 -0800 (PST)
In-Reply-To: <20170215065514.16673-1-raltherr@google.com>
References: <20170215065514.16673-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Feb 2017 11:51:35 +1030
X-Google-Sender-Auth: HeVvNlAqmytSOYCC0Z3NZBHGXI4
Message-ID: <CACPK8XeaWAcMANFcYMSo_-_s2Hh0oiTRW=EP+Ah+9GVy0qasOA@mail.gmail.com>
Subject: Re: [RESEND PATCH linux] aspeed: pinctrl: Allow disabling Port D and
 Port E loopback mode
To: Rick Altherr <raltherr@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 16 Feb 2017 01:21:58 -0000

On Wed, Feb 15, 2017 at 5:25 PM, Rick Altherr <raltherr@google.com> wrote:
> Port D and port E GPIO loopback modes are commonly enabled via hardware
> straps for use with front-panel buttons.  When the BMC is powered
> off or fails to boot, the front-panel buttons are directly connected to
> the host chipset via the loopback to allow direct power-on and reset
> control. Once the BMC has booted, the loopback mode must be disabled for
> the BMC to take over control of host power-on and reset.
>
> Disabling these loopback modes requires writing to the hardware strap
> register which violates the current design of assuming the system
> designer chose the strap settings for a specific reason and they should
> be treated as read-only. Only the two bits of the strap register related
> to these loopback modes are allowed to be written and comments have been
> added to explain why.

I had to clarify this on IRC. The Aspeed soc is flexible if you want
no-passthrough when powered off and want to enable it at  runtime with
normal SCU registers.
However if you want passthrough when powered off, and then disable it
at runtime, you need to change the strap. Hence the patch.

> Signed-off-by: Rick Altherr <raltherr@google.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 76f62bd45f02..5b49952e5fad 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -198,9 +198,19 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                  * them. This may mean that certain functions cannot be
>                  * deconfigured and is the reason we re-evaluate after writing
>                  * all descriptor bits.
> +                *
> +                * Port D and port E GPIO loopback modes are the only exception
> +                * as those are commonly used with front-panel buttons to allow
> +                * normal operation of the host when the BMC is powered off or
> +                * fails to boot. Once the BMC has booted, the loopback mode
> +                * must be disabled for the BMC to control host power-on and
> +                * reset.
>                  */
> -               if ((desc->reg == HW_STRAP1 || desc->reg == HW_STRAP2) &&
> -                               desc->ip == ASPEED_IP_SCU)
> +               if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
> +                   !(desc->mask & (BIT(21) | BIT(22))))
> +                       continue;
> +
> +               if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
>                         continue;
>
>                 ret = regmap_update_bits(maps[desc->ip], desc->reg,
> --
> 2.11.0.483.g087da7b7c-goog
>
