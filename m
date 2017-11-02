Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=74.125.82.195; helo=mail-ot0-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
 [74.125.82.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS5G00NkjzDqwS;
 Thu,  2 Nov 2017 11:15:35 +1100 (AEDT)
Received: by mail-ot0-f195.google.com with SMTP id 15so237834otj.7;
 Wed, 01 Nov 2017 17:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gf8iBPmXLWJ8xsWbH7zUNZWPAY8P2cSlesjAO8dqUnc=;
 b=X/dMHtap0zaNvzmOh2FFeCRCNjUA1NksDI2BNAx83HX7X2JmuPQBEDpNaiMqoFdWhn
 9Pk3phJtwg0tk4EqnnkUgDs9aNJiCcxGRZZXP66S4erMq0vWWB/FQySroSL6IAdzYWsZ
 JNTgBBd0j1sSYSU8UXcX0jsewhhtHi5YTBYozxIhf981jMAJ+zb5Il8h3MGUkGMxolE9
 3dMvQc70aZq1JMBZeUTj+POGBg3WEu/T8trl5NUc+M2C1urcSIw0BLjxyKsg311On0Nu
 73392r5sOtiQxgTOsAn/iZFq+59tEnF7vR11ur15PRuaONi9bA7WfVEeJA5tEHm9IvxJ
 9exg==
X-Gm-Message-State: AJaThX74Wl/VtEStxwWX/Gklk3UJQLk0/4xVryv3TZmeW+HWGH1PGHiA
 bimcIB+lqnA7eTXO+sq3uQ==
X-Google-Smtp-Source: ABhQp+SdG7LkXJuzqM0FTnxToGLxTdAGwG/aZnHv+fh80chJH1xDRU0iVYl/zTcN1RdDyqm8+5nw0A==
X-Received: by 10.157.5.36 with SMTP id 33mr1085127otw.488.1509581733252;
 Wed, 01 Nov 2017 17:15:33 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id p3sm846353oia.20.2017.11.01.17.15.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Nov 2017 17:15:32 -0700 (PDT)
Date: Wed, 1 Nov 2017 19:15:31 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 mark.rutland@arm.com, frowand.list@gmail.com, joel@jms.id.au,
 ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] gpio: gpiolib: Generalise state persistence
 beyond sleep
Message-ID: <20171102001531.6j7isyrcwjjwovho@rob-hp-laptop>
References: <20171101040457.1200-1-andrew@aj.id.au>
 <20171101040457.1200-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171101040457.1200-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-List-Received-Date: Thu, 02 Nov 2017 00:15:36 -0000

On Wed, Nov 01, 2017 at 03:04:56PM +1100, Andrew Jeffery wrote:
> General support for state persistence is added to gpiolib with the
> introduction of a new pinconf parameter to propagate the request to
> hardware. The existing persistence support for sleep is adapted to
> include hardware support if the GPIO driver provides it. Persistence
> continues to be enabled by default; in-kernel consumers can opt out, but
> userspace (currently) does not have a choice.
> 
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
> 
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/gpio/gpiolib-of.c               |  6 ++--
>  drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
>  drivers/gpio/gpiolib.c                  | 61 ++++++++++++++++++++++++++++++---
>  drivers/gpio/gpiolib.h                  |  2 +-

>  include/dt-bindings/gpio/gpio.h         |  6 ++--

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/gpio/consumer.h           |  8 +++++
>  include/linux/gpio/machine.h            |  4 +--
>  include/linux/of_gpio.h                 |  2 +-
>  include/linux/pinctrl/pinconf-generic.h |  2 ++
>  9 files changed, 87 insertions(+), 18 deletions(-)
