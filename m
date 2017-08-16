Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXKjT3xL3zDqZy;
 Wed, 16 Aug 2017 16:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nlNdghwF"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id w199so1873869lff.2;
 Tue, 15 Aug 2017 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=l+q+WkswTBF8Uiz+ilqlN7zWUzttWKRnK7mHBoIgP6Y=;
 b=nlNdghwFAUcNCDCe1cJO/y96SR9bc3zMXg784mMBPMcQElzRqO8Qj7exlSpbLx27jb
 g1fizAb7eJAinv4rYC4iEXsUVVZ/pIoEBH6cX+tCEZ7uJNOGOnI09auwQifnsTlN0n/l
 AH2lj44+MoUZiZyBbKh80tqR+6w8pNZ1Rze+EfCOBksJiKSok4s2JLmWD5tTaof3mrjW
 7dRfdnz0vnQ7VIJdh6gJH2dX3QRE7I83vyLl5NF+zSg7clXCQFyNdojQy3W5xZTLBkRR
 WAgcBp9Oo/9qosMflEwqJl8cpnlfe8sbjSn5V4fHyLBjRuXX2Jhlhhue/g0ZXy/xy0lV
 14kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=l+q+WkswTBF8Uiz+ilqlN7zWUzttWKRnK7mHBoIgP6Y=;
 b=t4frhMD01wFxuy7OCB80ieKi5sVMETpkYo0B9mQ1P4VlqUg83RqSe1Q3IYSSpbwxVb
 FzJGjYlkMocQJ/I+A9UN0pH4jf0vberD0DxUF4NLopuKE7ZqC5vmE8Z55ColLCWOiCe1
 ee9H1vGWqIQiQnYMKnFFlx0jhVSlYgnJsY2aChT8CbwQUTTYsMGUPFzaYV1euXaZhWGk
 J1kIQ49fRjCVLNAE+ssQLu6SKZJZXbbko9976Bnn/bugD8G1TAfAz5HAncn2ikyHRGsq
 dDGrLGRJX2IBE8lCrD2CpYl29nhCpf42DOES8+k381GVjzCP0vFvhHAUdgAj84bu7STf
 ECiQ==
X-Gm-Message-State: AHYfb5jx2yh4j4VXdQX1Njne3ZLBIFmFff3iqzbTabd7192/aZUHX/BF
 cqacyhesMeHGTfodydZmEIK+mJHGVQ==
X-Received: by 10.25.235.18 with SMTP id j18mr260934lfh.257.1502866217923;
 Tue, 15 Aug 2017 23:50:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Tue, 15 Aug 2017 23:49:57 -0700 (PDT)
In-Reply-To: <20170815072102.23067-1-andrew@aj.id.au>
References: <20170815072102.23067-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Aug 2017 16:19:57 +0930
X-Google-Sender-Auth: AQ8qr6ETJz1vQ4gT11ELm8aFiuw
Message-ID: <CACPK8XeNDxo14KRsAqo3a0Rs26h-1vRsLyqSX+bt2jfZHq=5yA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, 
 Brendan Higgins <brendanhiggins@google.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, 
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
X-List-Received-Date: Wed, 16 Aug 2017 06:50:22 -0000

On Tue, Aug 15, 2017 at 4:51 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Instead of keeping the u-boot values (which appear to be hard-coded),
should we instead put the known working values in the register?

Cheers,

Joel
