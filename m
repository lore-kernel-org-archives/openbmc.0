Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ObuFSdcB"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LKbz4rWVzF3Ll;
 Thu, 27 Sep 2018 13:12:14 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id a85-v6so736108qkg.3;
 Wed, 26 Sep 2018 20:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFwqrzzDr3xGOOs7mqhftLHkD8lxO4pi0kmhvhoCsM4=;
 b=ObuFSdcBvXNwY/MeYSXYaQTb1uiDhiGnxvV90FGneI6FWC2ybHb4C3dKrfAIDxBQrT
 OzW9xx8KaZVDlZ8kKF1Y1bXt/GNabZ25N9R7suIeo92u/rvFclM4xuvggCNAssaPoBvO
 l/Q1RIAAAiweKSm+1NQ1xAJgphBY8iwz8BaqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFwqrzzDr3xGOOs7mqhftLHkD8lxO4pi0kmhvhoCsM4=;
 b=OKUVuax37lisioTcG2ZodgwR4ObZ74aZKzC/ZubbMJU0Li5hatxLu21Q/baGN9wxqg
 9o8CGvUbrvuI/luRDsSofpBmQOuN2pQwTCYFmFJXTGwFmhLWNV+qYVMhwemPwjmQvA4K
 QeTfPoqg4MvWXqTOLpfKE+qDQHI/mlLRgVws647kxHULtBVYnMeaks194t5oIXn7Pxql
 BgBwjAwcm57fvIfmU3I05cJl+tiT3V4/tzSkmNn5zDDlM/mAFfWftnMTknMNI68rDfGn
 ZKeePW34o2FldIH3yVozcDyzaggBY3AUOvixbcQJ6VdBbqlgF8eXHvnFH2w+hmkJtVvL
 QsYg==
X-Gm-Message-State: ABuFfogsVWB5yLfdbg2gBrIyvMOi+4pd4Dje39TD+jrE8dtMMcLDDnu2
 Q28PHiBzDjM0zEWt2iCn/Mw0ISfwBITQVTj7CcA=
X-Google-Smtp-Source: ACcGV62F6xgJagmjKzKPpVuZgcdocY8LC/5KOOEVeU3N+9/lJsOrB+p28TvR3nXa3C+KLXeMekoWg4TJoAPT326tJD8=
X-Received: by 2002:a37:ae86:: with SMTP id
 x128-v6mr6541286qke.25.1538017932456; 
 Wed, 26 Sep 2018 20:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180926215842.23125-1-jae.hyun.yoo@linux.intel.com>
 <20180926215842.23125-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180926215842.23125-3-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Sep 2018 07:11:59 +0400
Message-ID: <CACPK8XcKms88EcpT3soE6wLyAmvyiLfVkNeOQT0FgmY4eZoDrw@mail.gmail.com>
Subject: Re: [PATCH i2c-next v3 2/3] i2c: aspeed: Add 'aspeed,timeout' DT
 property reading code
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 03:12:16 -0000

On Thu, 27 Sep 2018 at 01:58, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds reading code of the 'aspeed,timeout' DT property
> to set 'timeout' value in adapter configuration. This value still
> case be configured through an I2C_TIMEOUT ioctl on cdev too.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 8dc9161ced38..0d934ce0c028 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -115,6 +115,9 @@
>  /* 0x18 : I2CD Slave Device Address Register   */
>  #define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
>
> +/* Timeout */
> +#define ASPEED_I2C_BUS_TIMEOUT_US_DEFAULT              (5 * 1000 * 1000)

The 5 seconds time out is way too long. On a system that doesn't have
functional i2c, this holds up boot for a long time as most i2c client
drivers try to initialise their device and fail. I realise you're not
changing the value, but we should pick a better default. 1 second?
Half a second?

> +
>  enum aspeed_i2c_master_state {
>         ASPEED_I2C_MASTER_INACTIVE,
>         ASPEED_I2C_MASTER_START,
> @@ -885,6 +888,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         struct clk *parent_clk;
>         struct resource *res;
>         int irq, ret;
> +       u32 timeout_us;
>
>         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>         if (!bus)
> @@ -918,6 +922,11 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>                 bus->bus_frequency = 100000;
>         }
>
> +       ret = of_property_read_u32(pdev->dev.of_node, "aspeed,timeout",
> +                                  &timeout_us);

Can we make this binding generic? It's not specific to aspeed's
hardware. Getting the value could even part of the i2c core.

I read the previous thread with Wolfram. I think this would still fit
with what Wolfram suggested, but please forgive my jetlagged brain if
I've missed something.

Cheers,

Joel
> +       if (ret)
> +               timeout_us = ASPEED_I2C_BUS_TIMEOUT_US_DEFAULT;
> +
>         match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
>         if (!match)
>                 bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
> @@ -930,7 +939,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         init_completion(&bus->cmd_complete);
>         bus->adap.owner = THIS_MODULE;
>         bus->adap.retries = 0;
> -       bus->adap.timeout = 5 * HZ;
> +       bus->adap.timeout = usecs_to_jiffies(timeout_us);
>         bus->adap.algo = &aspeed_i2c_algo;
>         bus->adap.dev.parent = &pdev->dev;
>         bus->adap.dev.of_node = pdev->dev.of_node;
> --
> 2.19.0
>
