Return-Path: <jic23@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xFhTL561RzDqyB
 for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2017 21:04:06 +1000 (AEST)
Received: from localhost.localdomain
 (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76ACF22B4B;
 Sun, 23 Jul 2017 11:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76ACF22B4B
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
 spf=none smtp.mailfrom=jic23@kernel.org
Date: Sun, 23 Jul 2017 12:03:59 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: linux-iio@vger.kernel.org, Rick Altherr <raltherr@google.com>,
 openbmc@lists.ozlabs.org, Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz
 <ohado@mellanox.com>
Subject: Re: [patch v2] iio: aspeed-adc: wait for initial sequence.
Message-ID: <20170723120359.6fdae971@kernel.org>
In-Reply-To: <20170717090035.11691-1-c_mykolak@mellanox.com>
References: <20170717090035.11691-1-c_mykolak@mellanox.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 23 Jul 2017 11:04:07 -0000

On Mon, 17 Jul 2017 12:00:35 +0300
Mykola Kostenok <c_mykolak@mellanox.com> wrote:

> This patch enables adc engine at initialization time and waits
> for the initial sequence completion before enabling adc channels.
> 
> Without this code adc channels are not functional and shows
> zeros for all connected channels.
> 
> Tested on mellanox msn platform.
> 
> v1 -> v2:
> Pointed by Rick Altherr:
>  - Wait init sequence code enabled by bool
> from OF match table.
> 
> Reviewed-by: Rick Altherr <raltherr@google.com>
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Applied to the fixes-togreg branch of iio.git and marked for
stable.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/aspeed_adc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 2283ed2..cfa7ee1 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -22,6 +22,7 @@
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
> +#include <linux/iopoll.h>
>  
>  #define ASPEED_RESOLUTION_BITS		10
>  #define ASPEED_CLOCKS_PER_SAMPLE	12
> @@ -38,11 +39,17 @@
>  
>  #define ASPEED_ENGINE_ENABLE		BIT(0)
>  
> +#define ASPEED_ADC_CTRL_INIT_RDY	BIT(8)
> +
> +#define ASPEED_ADC_INIT_POLLING_TIME	500
> +#define ASPEED_ADC_INIT_TIMEOUT		500000
> +
>  struct aspeed_adc_model_data {
>  	const char *model_name;
>  	unsigned int min_sampling_rate;	// Hz
>  	unsigned int max_sampling_rate;	// Hz
>  	unsigned int vref_voltage;	// mV
> +	bool wait_init_sequence;
>  };
>  
>  struct aspeed_adc_data {
> @@ -210,6 +217,24 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  		goto scaler_error;
>  	}
>  
> +	model_data = of_device_get_match_data(&pdev->dev);
> +
> +	if (model_data->wait_init_sequence) {
> +		/* Enable engine in normal mode. */
> +		writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
> +		       data->base + ASPEED_REG_ENGINE_CONTROL);
> +
> +		/* Wait for initial sequence complete. */
> +		ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
> +					 adc_engine_control_reg_val,
> +					 adc_engine_control_reg_val &
> +					 ASPEED_ADC_CTRL_INIT_RDY,
> +					 ASPEED_ADC_INIT_POLLING_TIME,
> +					 ASPEED_ADC_INIT_TIMEOUT);
> +		if (ret)
> +			goto scaler_error;
> +	}
> +
>  	/* Start all channels in normal mode. */
>  	clk_prepare_enable(data->clk_scaler->clk);
>  	adc_engine_control_reg_val = GENMASK(31, 16) |
> @@ -269,6 +294,7 @@ static const struct aspeed_adc_model_data ast2500_model_data = {
>  	.vref_voltage = 1800, // mV
>  	.min_sampling_rate = 1,
>  	.max_sampling_rate = 1000000,
> +	.wait_init_sequence = true,
>  };
>  
>  static const struct of_device_id aspeed_adc_matches[] = {
