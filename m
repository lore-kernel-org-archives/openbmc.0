Return-Path: <sboyd@codeaurora.org>
X-Greylist: delayed 583 seconds by postgrey-1.36 at bilbo;
 Thu, 06 Apr 2017 06:37:32 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="UeXHdJQP"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="bWUcHs7Y"; dkim-atps=neutral
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyyMJ0SGVzDqHK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 06:37:31 +1000 (AEST)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6D42460996; Wed,  5 Apr 2017 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1491424066;
 bh=Z6GteoatdK9GYtewveUHzBMqZfURXncedWGbVw9J5ZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UeXHdJQPHfKqfcLf2v9gh9avN4V0z38Ku31bZRsZxCUVxY1QsxR4V0g6mirNmxn05
 NgddaHBuLhLrCo3A0EBmH/BiT9rAvdPyxCnVaPilFqcMbFSJTZO5/l5IvlNuV7q9Ch
 r/txhDAHDO+o2IiGW/LH2X7qxzSV/NmssdtjB+Bw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,T_DKIM_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: sboyd@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05858607A2;
 Wed,  5 Apr 2017 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1491424065;
 bh=Z6GteoatdK9GYtewveUHzBMqZfURXncedWGbVw9J5ZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWUcHs7YTk2Apep1p4UnV20DxhJ7J2HjuwRGFVtOeMlijoJrROEBmo3uTmfy8NZL4
 rwqsJpbolm1LQtPSW/HejDb2Hwwck8dsnO9CiP3P5TP5moXfSLJGCB//OxkK3e806w
 4xRdf0oeO5H3H71EoROkE3KzN3pUUPAwWfXiPeR0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05858607A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=sboyd@codeaurora.org
Date: Wed, 5 Apr 2017 13:27:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rick Altherr <raltherr@google.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 linux-clk@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Alison Schofield <amsfield22@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Crestez Dan Leonard <leonard.crestez@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, Matt Ranostay <mranostay@gmail.com>
Subject: Re: [PATCH v4 2/2] iio: Aspeed ADC
Message-ID: <20170405202744.GB7065@codeaurora.org>
References: <20170323184136.7349-1-raltherr@google.com>
 <20170323184136.7349-2-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170323184136.7349-2-raltherr@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 06 Apr 2017 09:25:23 +1000
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
X-List-Received-Date: Wed, 05 Apr 2017 20:37:33 -0000

On 03/23, Rick Altherr wrote:
> +
> +static int aspeed_adc_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct aspeed_adc_data *data;
> +	const struct aspeed_adc_model_data *model_data;
> +	struct resource *res;
> +	const char *clk_parent_name;
> +	int ret;
> +	u32 adc_engine_control_reg_val;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(indio_dev);
> +	data->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	data->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	/* Register ADC clock prescaler with source specified by device tree. */
> +	spin_lock_init(&data->clk_lock);
> +	clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);

What if the parent clk is not registered yet? Or if we're not
always using DT in this driver? Put another way, this code is
fragile. But I guess it probably works well enough for now so no
big deal, just pointing out my fear.

> +
> +	data->clk_prescaler = clk_hw_register_divider(
> +				&pdev->dev, "prescaler", clk_parent_name, 0,
> +				data->base + ASPEED_REG_CLOCK_CONTROL,
> +				17, 15, 0, &data->clk_lock);
> +	if (IS_ERR(data->clk_prescaler))
> +		return PTR_ERR(data->clk_prescaler);
> +
> +	/*
> +	 * Register ADC clock scaler downstream from the prescaler. Allow rate
> +	 * setting to adjust the prescaler as well.
> +	 */
> +	data->clk_scaler = clk_hw_register_divider(
> +				&pdev->dev, "scaler", "prescaler",
> +				CLK_SET_RATE_PARENT,
> +				data->base + ASPEED_REG_CLOCK_CONTROL,
> +				0, 10, 0, &data->clk_lock);
> +	if (IS_ERR(data->clk_scaler)) {
> +		ret = PTR_ERR(data->clk_scaler);
> +		goto scaler_error;
> +	}
> +
> +	/* Start all channels in normal mode. */
> +	clk_prepare_enable(data->clk_scaler->clk);

Eventually we'd like to get rid of hw->clk pointer so that users
have to call some sort of clk_get() API and then we get warm
fuzzies from knowing who is consuming a clk structure. Can you
change this to register a clk provider and call clk_get()? I
think a device that references itself should be OK in DT still,
and would properly reflect what's going on.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
