Return-Path: <sjg@google.com>
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WD2vQ5zDq99
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TatfWDe7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="CP0VAUxv";
 dkim-atps=neutral
Received: by mail-ua0-x22c.google.com with SMTP id h2so5268739uaa.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xSQZSxoeVcOEMzWKccGbDj9Wbp0/45d8nKbc9zE+E4A=;
 b=TatfWDe7FQdPxCTvH9fRS8WlNGWkMqDfekkWJubhlrnf6xcTNZCuTJxx4sEnwOStYl
 GyTbSGyVsPOmeN8wrxfPvsT0zu8ZBS1o5/1y+yfz1x5WC/Lo0ZVDp2Sqlxd2PdkNGj7q
 QmNErFDM3O719mn76Cx/+OFyejkTrrYBZVhx0qRx680iNBmKRSUjlRmwUZ3XcJM4gztu
 otCV/p+IVXukNC9VFXrE/QX2mJSb1KsQVvLDqcNbjjHk5bRuNLwM1Vzy3gYZU34vRT6P
 d4W1KGK7szEgWylrY9AUUtOZBun6TlVfkjksX1tXNnivmYdpvGEY9kE19ddybBe962/7
 G5pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xSQZSxoeVcOEMzWKccGbDj9Wbp0/45d8nKbc9zE+E4A=;
 b=CP0VAUxvf03fWJCQWeuMggLsek9b9KrsEQjtX5PDGom4OnAabTRZsX5wEEWnHKP76M
 8fhMTGZQW0pMS/Vri1BjWdlwrqq92SBkT8zjjZWiFrNfyZN74oNcfXc9AKJgxT9PSjBf
 vGDV87YBdvROE5tAfl9oHIJLZavNxVeWDCd/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xSQZSxoeVcOEMzWKccGbDj9Wbp0/45d8nKbc9zE+E4A=;
 b=AhsFVV2GV4Qi75E5ELVZcIpTfJMW3uOzDFhKdFJOXutAFxqC5tewNTlbGWHnaUbADA
 IejZSlrpJzcxLpgp6XH4Rl0Yjn/RQvKph+b5Xg6MFc9dqf2eY0mdMbm1ij/LlYyJdSbx
 efBKjn7uQyt6XQga1uxeZD9RI7QFn8M8SvKtZoFkQpGIiEH11hadbcVFucMWRirO9bYM
 icUi9yBN+pXm/mwTCesfb+lhluEzZLXaeR0PF2kqVYiFtRNC27z1MWWceSC6keDPkCEl
 zxH+gh09hc9CsKKTH5lE1rUgIifz5JXEig+aF4rcS7qJtGY36oNnLrHFcUgoeJ1TuLkY
 3O8A==
X-Gm-Message-State: AN3rC/6TO1VqZJZEKsR5GIEjpOB729kaprKVisIixTHfu0lU7WObe4lv
 23ZHU1eWh26e5GEKTYEXl1lIWBY/VPsibEY=
X-Received: by 10.176.79.162 with SMTP id m34mr57499uah.62.1492560742263; Tue,
 18 Apr 2017 17:12:22 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:12:01 -0700 (PDT)
In-Reply-To: <20170417190034.71945-12-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-12-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:12:01 -0600
X-Google-Sender-Auth: c4L9e3FvMvcBFRk5lydrsRLxisQ
Message-ID: <CAPnjgZ3qis_kVdQpr2X7D2ReRev80Ce0Bfe6w5_9MEB8G3GaWg@mail.gmail.com>
Subject: Re: [PATCH v1 11/15] aspeed: Add I2C Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Heiko Schocher <hs@denx.de>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:25 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> The driver is very limited, it only supports master mode and
> synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1:
> - Style fixes
>
>
> ---
>  drivers/i2c/Kconfig   |   9 ++
>  drivers/i2c/Makefile  |   1 +
>  drivers/i2c/ast_i2c.c | 357 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
>  4 files changed, 499 insertions(+)
>  create mode 100644 drivers/i2c/ast_i2c.c
>  create mode 100644 drivers/i2c/ast_i2c.h

Reviewed-by: Simon Glass <sjg@chromium.org>

nit below

[..]
> +static int ast_i2c_ofdata_to_platdata(struct udevice *dev)
> +{
> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
> +       int ret;
> +
> +       priv->regs = dev_get_addr_ptr(dev);
> +       if (IS_ERR(priv->regs))
> +               return PTR_ERR(priv->regs);

Should be

 if (!priv->regs)

I think

> +
> +       ret = clk_get_by_index(dev, 0, &priv->clk);
> +       if (ret < 0) {
> +               debug("%s: Can't get clock for %s: %d\n", __func__, dev->name,
> +                     ret);
> +               return ret;

Regards,
Simon
