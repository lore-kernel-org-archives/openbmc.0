Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd4gQ4mDzzDrJr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 10:20:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PBLOgX7o"; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id p13so2813532qtp.5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ddC/UspMPjCr7vqzTXrsSr/IkMUjrGf/HBubYZMCf/o=;
 b=PBLOgX7o0+H9oYhm3bJm3ut0LC3asRPz4LWRzKuyDdZqZPDUG9Itjro9fT673n7PQC
 tujN408Vcfx7d5J3mYODOfP9sC73EV+IZJEoRV6D3TuKAb/D+AWGNBc4ZuqxpZzXiMA/
 7Y5iZLfrwunMsI7aPe88Kvp3rMiy8CRZmieZNvji7EclXVPTkdkaZub7V5RbfZiLCzul
 nTVps8pQupxlG+33LLxCDqsHme3bzF4vN0ZrOPpHANirFU45EyVAi+FdwiN7XCsoiICF
 Lcdk3inK/CExZXzj7SUXM9Gzo8a9flCaUXbq/rd25lR1MbtJxEtxe8O/cIkUyWQbhw+0
 yUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ddC/UspMPjCr7vqzTXrsSr/IkMUjrGf/HBubYZMCf/o=;
 b=aHGoTs55xLzzS3yAlK6/uyAlUg6qLiLYKtNPDMxqROfxampXHRm0+A55D06dkzn5Dj
 evzeVJMqS2tTUwIbh/aeDdAv/WTOevkSNyJf4iOhhqrNTg8c9wrx4wqPR0zGGyC4CBde
 5hKqx8T/jwRsx7JveQrM5rv8HJLTU0VvUs4hrzomfMPbQdtVJMh0qUjNcIdXUI7+U1DJ
 Il93xni/m2Fu+NPbjjJyE0pbx+wk63J3JClRkfoOqD4rDC80UoK/s3Au4dnyZnwZHgEp
 PReoJMt7MYo/QXslb95fhlfEZF7roFFdDJgQSjrGr9wxInwFDt7KEWMi1HSsF1Bwx5RT
 xtjg==
X-Gm-Message-State: AHYfb5if7jFW0C4baGTCGvV7/PphrF70mKX+aP7jUN71WWTOhYtge+bM
 5Z2WodVqjm00W69byumtKt4nVwxkNaaZ
X-Google-Smtp-Source: ADKCNb5O3iccHaXWXVw0j6+IE2ru/uky6B6s0SylLRiB4fnJf6QgZdI6ahUFn+nVsKPhPLuNa3xo+Zfk47tDpW0K1Cs=
X-Received: by 10.200.34.195 with SMTP id g3mr6015961qta.4.1503533999599; Wed,
 23 Aug 2017 17:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.181 with HTTP; Wed, 23 Aug 2017 17:19:59 -0700 (PDT)
In-Reply-To: <20170815072102.23067-1-andrew@aj.id.au>
References: <20170815072102.23067-1-andrew@aj.id.au>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 23 Aug 2017 17:19:59 -0700
Message-ID: <CAFd5g46ZtSxY2MfCLEUArbByFUTDHFp3HRAg6YDJ8oYf42G3OA@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Aug 2017 00:20:03 -0000

On Tue, Aug 15, 2017 at 12:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Sorry for the delay.

We tried this out and it fixes a problem similar to the one you described.

Thanks again!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
