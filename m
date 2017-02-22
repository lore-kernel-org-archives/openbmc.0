Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSjm969vRzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 14:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzko3lZe"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so6752395ywz.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 19:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ab9odDjfKhLM+8M5R1BFP/O5lCCkj4hBFCcjWjTvClI=;
 b=lzko3lZeqDIEO7WtaHtrD+23VHnxqJffCb4fCAUaCgDM0H9YLHtWFES/r4eBW/I2Bz
 enlu8gaPv40SrSIJyj16loXlC1kUxXv+Wptvvs9r2BDJe2BnAo9SBGKbwsWbuEX3vIDC
 YFNieKJcxFTxKMro/44Bc/4Z63cKqRPiiG2SLEZ5R9fOOcbt0Am40lOjVRYEuJoG1w0s
 Pw0opvm9L+T3+RuKS7pAWYgYnsp3H6DZUFcNQ40OZCRuMr1CK3eu2efSIwP3kaj+tgsX
 2fxLmdlll226NIigAHHmh4Aq7l4/HoM9EvVH+zDGR8y+QzYXMDl2uHlvTmh69IddN8c8
 umNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ab9odDjfKhLM+8M5R1BFP/O5lCCkj4hBFCcjWjTvClI=;
 b=b5Xb4/Lagar1PQhI/leFS41awAH0sHRqqXJ2C6eZR/HOZ+tjR47nUqreH+tZMMurqe
 mgQWUcurYMprzRJkdbVbyN3rUHL1tswF7FMELCi9ML/E6GCf9ghw8v2kJWQQmKLrPKK9
 36VMrlJ/ThGauJ4u2+iYigZCTPRDZCV9WenNRqwAD36PY35duZaxi36UNKH4A5cCY3qm
 0CoiWt/mUMBDk6uMyYYRLXNg0ZEy5XaNzw9X2itBvDCpTlGoRvCdrcFDnr571BsXxwxy
 zK1dwB8zRCOlhgOdqIZ8ISKs88Yp+AQugMHiIdggMWQr+5WNkMMoXpLUDxJh9aUlFABL
 6Fug==
X-Gm-Message-State: AMke39kYMzps5tyGFk6V/sUSwww+e1KHO0Yh27gvlCWbT1eMKVgZBx5FPWoBx9s0yZFoBe3pKzp8Xnf9/fxHmA==
X-Received: by 10.129.73.65 with SMTP id w62mr21937243ywa.288.1487734775324;
 Tue, 21 Feb 2017 19:39:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 21 Feb 2017 19:39:14 -0800 (PST)
In-Reply-To: <20170220143850.10723-1-andrew@aj.id.au>
References: <20170220143850.10723-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2017 14:09:14 +1030
X-Google-Sender-Auth: VA3bmD2tdhidhuK_TMqkU4AL5ak
Message-ID: <CACPK8XeXW_YjGkV0S5OJj2b814DA1tT33o-_0ToNvJ7UM4sy7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Add initial pinconf support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
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
X-List-Received-Date: Wed, 22 Feb 2017 03:39:38 -0000

On Tue, Feb 21, 2017 at 1:08 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Several pinconf parameters have a fairly straight-forward mapping onto
> the Aspeed pin controller. These include management of pull-down bias,
> drive-strength, and some debounce configuration.
>
> Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
> ADC and RMII/RGMII pins. As the bias configuration for each pin in a
> bank maps onto a single per-bank bit, configuration tables are
> introduced to describe the ranges of pins and the supported pinconf
> parameter. The use of tables also helps with the sparse support of
> pinconf properties, and the fact that not all GPIO banks support
> biasing or drive-strength configuration.
>
> Further, as the pin controller uses a consistent approach for bias and
> drive strength configuration at the register level, a second table is
> defined for looking up the the bit-state required to enable or query the
> provided configuration.
>
> Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> system, and pinctrl-aspeed-g5 on an AST2500EVB. The test method was to
> set the appropriate bits via devmem and verify the result through the
> controller's pinconf-pins debugfs file. This simultaneously validates
> the get() path and half of the set() path. The remainder of the set()
> path was validated by configuring a handful of pins via the devicetree
> with the supported pinconf properties and verifying the appropriate
> registers were touched.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Looks good. I assume the bindings are generic and don't need any
update for this. Perhaps an update to the example would be helpful.

Some minor comments below.

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 117 +++++++++++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 153 ++++++++++++++++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 207 +++++++++++++++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  28 ++++
>  4 files changed, 503 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> index 7de596e2b9d4..3e8625110136 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -2234,6 +2234,110 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
>         ASPEED_PINCTRL_FUNC(WDTRST2),
>  };
>
> +static struct aspeed_pin_config aspeed_g4_configs[] = {

I think this could be const.

> +       /* GPIO banks ranges [A, B], [D, J], [M, R] */
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { D6,  D5  }, SCU8C, BIT(16) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { D6,  D5  }, SCU8C, BIT(16) },
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { J21, E18 }, SCU8C, BIT(17) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { J21, E18 }, SCU8C, BIT(17) },

I didn't verify every definition is correct. I wondered why we skipped
bit 18, but it is reserved by the looks.

> +       { PIN_CONFIG_BIAS_PULL_DOWN, { A18, E15 }, SCU8C, BIT(19) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { A18, E15 }, SCU8C, BIT(19) },
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { D15, B14 }, SCU8C, BIT(20) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { D15, B14 }, SCU8C, BIT(20) },

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 43221a3c7e23..b22523bdd79b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c

>  static struct pinmux_ops aspeed_g5_pinmux_ops = {
> @@ -2308,16 +2450,25 @@ static struct pinctrl_ops aspeed_g5_pinctrl_ops = {
>         .get_group_name = aspeed_pinctrl_get_group_name,
>         .get_group_pins = aspeed_pinctrl_get_group_pins,
>         .pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
> -       .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_all,
>         .dt_free_map = pinctrl_utils_free_map,
>  };
>
> +static struct pinconf_ops aspeed_g5_conf_ops = {

const here too?

> +       .is_generic = true,
> +       .pin_config_get = aspeed_pin_config_get,
> +       .pin_config_set = aspeed_pin_config_set,
> +       .pin_config_group_get = aspeed_pin_config_group_get,
> +       .pin_config_group_set = aspeed_pin_config_group_set,
> +};

> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -514,6 +514,20 @@ struct aspeed_pin_desc {
>         SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
>         MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
>
> +/**
> + * @param The pinconf parameter type
> + * @pins The pin range this config struct covers, [low, high]
> + * @reg The register housing the configuration bits
> + * @mask The mask to select the bits of interest in @reg
> + */
> +struct aspeed_pin_config {
> +       enum pin_config_param param;
> +       unsigned int pins[2];
> +       unsigned int reg;
> +       u32 mask;
> +       u32 value;

Can we save some space by making these smaller types. pins could be
u16 at least.

> +};
> +
