Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXKGQ57J5zDqY3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 16:30:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hzxP6ZD+"; 
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id x191so15267039qka.5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 23:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QAoVSNh2qBweUI4CnasldT+G4w4hmUSIELVKR1g3hdI=;
 b=hzxP6ZD+FvdYbre3IxCJIMrdILjSHpD/AZWFYuoBcQaJAPktxpse4WdnP0NlL0MR1G
 CLpLUewkDX8Jv5OAOVO8A6QM35DKyZTZD/srZQP2pc6dkZIl8UUKhVxlS9bY10qzUCSW
 UqUwiUR38QqTBu400ydazbrBBad6MveI9O2QcdTJ6d81gZxGb7ySyt45Dlm/3vsLrGua
 RrT8xBXp50ydlPgHvdhNImwOTNxVQqXkAqDWunLRQPu/q7FHUMNIVnOvN0UeSUfCWh/Y
 L+Agpmbypa6N2vRILjcGvSdOZojRgkOTjU2g6LEEQx3T1HgfZeY8JyVGQEprgG3M9K6f
 3sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QAoVSNh2qBweUI4CnasldT+G4w4hmUSIELVKR1g3hdI=;
 b=DvtguYUoFjM7cOc5ambFhh9aTEs15c7fhKTblncw/dDMnMbciP8pvum/rP4nGZgczL
 BzAg2KG6sAxCiqNB73WZcKEt+cJhjg0ZN73T3ujHDuvYN05PPfXO/CGff1V2RNhoHwpx
 jpCCmBMlW677MMypswWMqgnfvHUPYAsxFIYO7R0SiiMXRUtgxpwz0pTytHhYiR53Ipk/
 LkWBjySsP3R1hxcrKjKL2urWHZQBRKXvfBsyW75bm8LYXJ7Al8Uq7iUMVhOaiu/oWssY
 wJABHarx0gSwdQP2Lc5B0o9ELPWC1QUW9OwzzDISfDetVjsO9BEjb+YqkrBRziDbRMxG
 bdFw==
X-Gm-Message-State: AHYfb5hFRXQUO7uCJ0eQbzAIvGFyi9lROFlYq2es3t/favWETVO2J/hm
 zS/3m0z+ibh9w/kzujraUtjvUnFEG5nD
X-Received: by 10.55.207.211 with SMTP id v80mr751364qkl.51.1502865019401;
 Tue, 15 Aug 2017 23:30:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.44.53 with HTTP; Tue, 15 Aug 2017 23:30:18 -0700 (PDT)
In-Reply-To: <20170815072102.23067-1-andrew@aj.id.au>
References: <20170815072102.23067-1-andrew@aj.id.au>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 16 Aug 2017 09:30:18 +0300
Message-ID: <CAFd5g45r+YAz706Uhwj9_Gf6iJy8P92K_JZmo22skDWNOXf8rw@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Wed, 16 Aug 2017 06:30:23 -0000

On Tue, Aug 15, 2017 at 10:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> In addition to the base, low and high clock configuration, the AC timing
> register #1 on the AST2400 houses fields controlling:
>
> 1. tBUF: Minimum delay between Stop and Start conditions
> 2. tHDSTA: Hold time for the Start condition
> 3. tACST: Setup time for Start and Stop conditions, and hold time for the
>    Repeated Start condition
>
> These values are defined in hardware on the AST2500 and therefore don't
> need to be set.
>
> aspeed_i2c_init_clk() was performing a direct write of the generated
> clock values rather than a read/mask/modify/update sequence to retain
> tBUF, tHDSTA and tACST, and therefore cleared the tBUF, tHDSTA and tACST
> fields on the AST2400. This resulted in a delay/setup/hold time of 1
> base clock, which in some configurations is not enough for some devices
> (e.g. the MAX31785 fan controller, with an APB of 48MHz and a desired
> bus speed of 100kHz).
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ee76e6dddc4b..284f8670dbeb 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -53,6 +53,9 @@
>  #define ASPEED_I2CD_MASTER_EN                          BIT(0)
>
>  /* 0x04 : I2CD Clock and AC Timing Control Register #1 */
> +#define ASPEED_I2CD_TIME_TBUF_MASK                     GENMASK(31, 28)
> +#define ASPEED_I2CD_TIME_THDSTA_MASK                   GENMASK(27, 24)
> +#define ASPEED_I2CD_TIME_TACST_MASK                    GENMASK(23, 20)
>  #define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT                        16
>  #define ASPEED_I2CD_TIME_SCL_HIGH_MASK                 GENMASK(19, 16)
>  #define ASPEED_I2CD_TIME_SCL_LOW_SHIFT                 12
> @@ -744,7 +747,11 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>         u32 divisor, clk_reg_val;
>
>         divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
> -       clk_reg_val = bus->get_clk_reg_val(divisor);
> +       clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
> +       clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
> +                       ASPEED_I2CD_TIME_THDSTA_MASK |
> +                       ASPEED_I2CD_TIME_TACST_MASK);
> +       clk_reg_val |= bus->get_clk_reg_val(divisor);
>         writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
>         writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
>
> --
> 2.11.0
>

Awesome! I think this might fix an issue we saw on one of our boards.
I am out of the country right now, so I cannot test this myself, until Monday.
