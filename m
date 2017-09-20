Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lyHxeAfv"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxq6m488xzDqBd;
 Wed, 20 Sep 2017 16:08:16 +1000 (AEST)
Received: by mail-lf0-x243.google.com with SMTP id h80so827112lfe.1;
 Tue, 19 Sep 2017 23:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wu2QglLepokzqYMiz+yY6trIpR1HHe2rvfHITsmedmk=;
 b=lyHxeAfvImMSCyKPHIoBchjL00I38SQ/MQNZj+LY3z9x9OKItfV68lFhQMtHEKK1go
 CwM6XtMBpu0JjNtu7axvVxuWDyxV44fp+dH9g1xXjyHxauRxE0H2FbUzOsNjCnW/Y2FH
 +WDPuugiSPhPakSzcS3pHZE6lwtNijtzvl847O9I34A++KTlTbEm5o6aU4wBhXe7f4Yv
 Sx3f12fuMYb0CHXsAWruRo3lFFzhUGd4WL2NSY6xg+xt4Qi9UoAI0UT+vA5HyCMQt418
 /Hi2+GeVjGNVstsGO7RtJPU+f5jkOP30VCukQcmUjDrotcZ6tmODA+pwN05T8SfNXWgv
 pPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wu2QglLepokzqYMiz+yY6trIpR1HHe2rvfHITsmedmk=;
 b=Bqa4Vg7a72HhEt1SimN9hsgWsgvBH6VRnyi2D0lG6UOoonB7vayvhEmSt04WvZSR2v
 +0EvlX9xOKS+trzFatoPu1Ahkn9CiE40pAl9ilj3IOO0dA6QTbIKoVtXkeqiVq2pXjiK
 dlYvesY95e0CoV8GgAvkdsaPEsd4PfgdT2CF/oMmdk+vYZvI691FMfqNiqUAhZpKB2VL
 V8QmjZIhqTNHPFWIUuN+RHXWtPZXpvhgMafNFQz9Kb0lRjDI5PcwDK47EhOpHuMyMWr2
 y2zHe7QjJHPTjKz1Pugm8Enp0BmQ4hvnu5b5uawoG9REBZ+g0Cf9IxA+IgzucCR72M3O
 F/Wg==
X-Gm-Message-State: AHPjjUiHIcug+RNlbHORUJXikuM+9gX6jmAYBJAWUPMapeU3Bgo+a4Lv
 F8ndCtqXaSaMWYp9yj/nXcnikyvoueMIiuN9nsI=
X-Google-Smtp-Source: AOwi7QCmZgwykc18ewQLugAi45WVVfBnWjjIicDFh1rl0iExzH4RHaEyB0ffrwlHOQS2GDgzFGSSil7yPl+O8HApAas=
X-Received: by 10.25.181.5 with SMTP id e5mr375447lff.42.1505887693531; Tue,
 19 Sep 2017 23:08:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 23:07:53 -0700 (PDT)
In-Reply-To: <20170920053020.6860-3-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 15:37:53 +0930
X-Google-Sender-Auth: ZaJHjMeNJFjUHtxamB6v5LE9B6c
Message-ID: <CACPK8Xf+sirCvKLJcLvew3onRvSHrozQr=ZX_cJZHa4pqpdNrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] watchdog: aspeed: Fix 'Apseed' typo in Kconfig
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Wed, 20 Sep 2017 06:08:17 -0000

On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Apseed sounds like a good name for a web/mobile start-up incubator, but
> isn't a reflection of Aspeed themselves.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c722cbfdc7e6..b562d2e03eb9 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -746,7 +746,7 @@ config ASPEED_WATCHDOG
>         select WATCHDOG_CORE
>         help
>           Say Y here to include support for the watchdog timer
> -         in Apseed BMC SoCs.
> +         in Aspeed BMC SoCs.

lol.

Reviewed-by: Joel Stanley <joel@jms.id.au>
