Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="GPFcYWaS"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHSc0T0zzDqJ7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 18:27:42 +1100 (AEDT)
Received: by mail-io0-x242.google.com with SMTP id e89so12351140ioi.11
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 00:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pPEPewjZItdda/aEONm6+lTkFVhM2srGINc9FzOD72o=;
 b=GPFcYWaS2vH6GlSI2xdh5ueaCoEJy2Zala2AnlvWdyEgpo85SsqC8u+ohNUjsnIqy8
 e5njXXjFn0CDmzNFEP/xTluBSm8jOgdsOtgo639TSvym4aNIjXu+QjO7nBpAT4scqP8W
 RbhFP8BOK0Ld6BNRajOTH6YH0UUv/dtORqHps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pPEPewjZItdda/aEONm6+lTkFVhM2srGINc9FzOD72o=;
 b=ngss3rzZLHXugwLJo4Ph18vv6fQzPxO8QGszFLyT2zBxeKlSTwtex076u0eZv7mrKE
 Y19QyEikBODlQIpnfDenV1OB6nS7k1nkxH+eqvgzmzC6crafV0JONccvcpyG+FrMMrAJ
 hZz1N2+QDryq+PhHnsDGjEOi6FSyqD/5cQMflGI650tAu7NqOBAgX7JlkLzi8H+HEbUL
 TiGHwViKYwwiZ5xrdKCahKc0gkDfQiZ1wPHlynKqs/+D+2VoaiDbzNymnKt48s4AdSMQ
 Cj8ratqd7pifYpZKZHNss8erSZlu/BtVVblhdG+mBc6awZYY/uikhG/jR6IdZAqxmtV4
 zFPQ==
X-Gm-Message-State: AMCzsaUPh/b2uADOy0YM8KgBPCphFNf0NlJTNbIKYIGICV8U+pbWJT7n
 spgotbdXIGuTYoXMlthuomKU02QdgDrsYnJc5zs6ehvm
X-Google-Smtp-Source: ABhQp+TFclO8l6a2Br2+FL7fDAo+zC3ozF5Q6UA6hXRlrPHbBja7LYY3aInurwW4jAvD7FlXg6BH9QgKngaAylCcIJs=
X-Received: by 10.107.46.199 with SMTP id u68mr5333654iou.174.1508484459585;
 Fri, 20 Oct 2017 00:27:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Fri, 20 Oct 2017 00:27:39 -0700 (PDT)
In-Reply-To: <20171020033727.21557-4-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2017 09:27:39 +0200
Message-ID: <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
To: Andrew Jeffery <andrew@aj.id.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 Michael Welling <mwelling@emacinc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Fri, 20 Oct 2017 07:27:44 -0000

I paged Bartosz and Michael on this, they are experts on the use cases for
the character device and their opinions are likely more valuable than mine.

On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Similar to devicetree support, add flags and mappings to expose reset
> tolerance configuration through the chardev interface.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
(...)

> +                * Unconditionally configure reset tolerance, as it's possible
> +                * that the tolerance flag itself becomes tolerant to resets.
> +                * Thus it could remain set from a previous environment, but
> +                * the current environment may not expect it so.
> +                */
> +               ret = gpiod_set_reset_tolerant(desc,
> +                               !!(lflags & GPIOHANDLE_REQUEST_RESET_TOLERANT));
> +               if (ret < 0)
> +                       goto out_free_descs;

First, as noted in the first patch, IMO we should just go for persistance,
i.e. you want to flag to the system to keep the line persistent in any case,
no matter if the system goes to sleep or resets.

So the usecase is going to be a control system or similar, a makerspace
project, an industrial product of some kind, driving GPIO from userspace.

I don't see it as helpful to give userspace control over whether the line
is persistent or not. It is more reasonable to assume persistance for
userspace use cases, don't you think? Whether the system goes to sleep
or the gpiochip resets should not make a door suddenly close or the
lights in the christmas tree go out, right? I think if the gpiochip supports
persistance of any kind, we should try to use it and not have userspace
provide flags for that.

Yours,
Linus Walleij
