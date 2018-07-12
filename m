Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vaHnIFYA"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R8Yd4fNpzF35W
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:41:41 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id d189-v6so54323053oib.6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0oLKNLvbtt4M5cmDqij/V3Z0/38n4hnXPd1c76xLDo=;
 b=vaHnIFYAcMh63nSIdU/9S3MefjNsPxg8cwn4rZGjb4k5HYLm7V3ZDyGV7C2HJsugSH
 1oVqCMeTSW5Vry8zJYKewg5U91BT+HXPswsCiB6fEHn45qDUKMgvPjydcvmN8SosdecC
 dh0Ejr5trZyZ83Eozk0aIp4xVt242luldqx6vR1QD8Esn52EmykveYnp/JrtLBjL44Qe
 iLR3xdMQYcotvs7ljMcXwsykTePZwE2JHr/swnCImxKDxx+t/SQ+VD/i+su6pGKIJ3Um
 gBly4wKL0UtPQq/xcpsnKlP272zjosYpFhev/XIRT1Sw9K5euKNiJy3Wsl5p3MKYOMMR
 /cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0oLKNLvbtt4M5cmDqij/V3Z0/38n4hnXPd1c76xLDo=;
 b=eGOtcZVSMjvRUQVSl1O9ae7+XO8IlcpEvl4ACz2EpKDUd0erNWoPRUpn/74YY9YcLu
 LW83cgVBTekAXMoLH8NIpJPQhM3+zRhPgx38gWd3IjqahfjSSo3Xc2n+xLmtryWKb6Wl
 8d+D82+aVBAV/QHMuB2pUPqa+8vl7FMReT0I2jKouvU9Z361pySucxR02f9XkUz3uX8i
 2Ie2YGzzoqABVaZgyVA6nCO9+bFUWtKfSJZQhhmld5+bY0H2YnX//lKb63a7ztSpn9L6
 nPmBmXfIhGrgoHVzJWBp1NubUrEHdBkH5lhzmDjhD50g6zRCtLoDqzV6SsMNgxSafA69
 V0mw==
X-Gm-Message-State: AOUpUlHeLCcb8Er3rRVTm/mqplHHkalezns1wJO7AwuecE5E4UM9EBsV
 r7c9/U3K46dT6emG3kTPPx1CCPUFc9ts6ojvFm0EKg==
X-Google-Smtp-Source: AAOMgpdGumOq5nzaRl1lTQupC3i8c4mmcSnF5ti1RNrUUvicYWfpFlovKl+ASxHy2sy5u4kau82uMT5KoV2tWHpl0QI=
X-Received: by 2002:aca:e2d3:: with SMTP id
 z202-v6mr1364424oig.121.1531384899312; 
 Thu, 12 Jul 2018 01:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180702214011.16071-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180702214011.16071-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 12 Jul 2018 01:41:28 -0700
Message-ID: <CAFd5g47nBCbF0mcYqEnQkDpz0Dhh0F0S1-wEL_yBHgs1b3yE5w@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Adjust spinlock scope in the irq handler
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 08:41:42 -0000

On Mon, Jul 2, 2018 at 2:40 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This patch adjusts spinlock scope to make it wrap the whole irq
> handler using a single lock/unlock which covers both master and
> slave handlers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 60e4d0e939a3..9f02aa959a3e 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -234,7 +234,6 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>         bool irq_handled = true;
>         u8 value;
>
> -       spin_lock(&bus->lock);
>         if (!slave) {
>                 irq_handled = false;
>                 goto out;
> @@ -325,7 +324,6 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>         writel(status_ack, bus->base + ASPEED_I2C_INTR_STS_REG);
>
>  out:
> -       spin_unlock(&bus->lock);
>         return irq_handled;
>  }
>  #endif /* CONFIG_I2C_SLAVE */
> @@ -389,7 +387,6 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>         u8 recv_byte;
>         int ret;
>
> -       spin_lock(&bus->lock);
>         irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>         /* Ack all interrupt bits. */
>         writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
> @@ -547,22 +544,29 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 dev_err(bus->dev,
>                         "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>                         irq_status, status_ack);
> -       spin_unlock(&bus->lock);
>         return !!irq_status;
>  }
>
>  static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  {
>         struct aspeed_i2c_bus *bus = dev_id;
> +       bool ret;
> +
> +       spin_lock(&bus->lock);
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>         if (aspeed_i2c_slave_irq(bus)) {
>                 dev_dbg(bus->dev, "irq handled by slave.\n");
> -               return IRQ_HANDLED;
> +               ret = true;
> +               goto out;
>         }
>  #endif /* CONFIG_I2C_SLAVE */
>
> -       return aspeed_i2c_master_irq(bus) ? IRQ_HANDLED : IRQ_NONE;
> +       ret = aspeed_i2c_master_irq(bus);
> +
> +out:
> +       spin_unlock(&bus->lock);
> +       return ret ? IRQ_HANDLED : IRQ_NONE;
>  }
>
>  static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> --
> 2.17.1
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
