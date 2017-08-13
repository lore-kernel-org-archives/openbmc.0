Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVg7D6fS8zDrF9
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 23:48:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="37O8u9va";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PuF+7JgJinvQcP4DTD3mrPhXD/kyr7l4u4p6D22al/A=; b=37O8u9vagYs7UbJy8MUkq1E9Fn
 h8m7Rqu0mQ5lioyjcc3KupQimYMp7IeK3vWTFpRDzLjfSLvkatwIQN9OUE1MrlB8in/C2qwZBLRDq
 ytGHZ4tloPXuhe6g7Kl8c8MA87yeR8pxsuoHSj4UY8LUdJpYd4wykSsba3BZ+FuEtKuTYb3cBU14L
 KAAmTacO5AGdpWf7iqVpAC5JiVZhtHqRGLU95FeXJU9e+UiDMo2Yv2Esnj7dX0B7wNBVFAptCz9sk
 QoQDVvw8ztZvaICsEgg3LYL6upgJP/68eMQNydbS3HBTddWlDmWQDGIBSG7s2OnxpVjrt0QMDaNpy
 8Oz2YHFQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:49426 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dgtFd-000UnO-Mw; Sun, 13 Aug 2017 13:48:22 +0000
Date: Sun, 13 Aug 2017 06:48:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [v6,resend] hwmon: (aspeed-pwm-tacho) cooling device support.
Message-ID: <20170813134820.GA6258@roeck-us.net>
References: <20170803085044.55456-1-c_mykolak@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170803085044.55456-1-c_mykolak@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Sun, 13 Aug 2017 13:48:25 -0000

On Thu, Aug 03, 2017 at 11:50:44AM +0300, Mykola Kostenok wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v5 -> v6:
>  Pointed out by Andrew Jeffery:
>  - remove unnecessary of_node_put() after loop.
> 
> v4 -> v5:
>  Pointed out by Joel Stanley:
>  - Use snprintf to fill cdev->name[16].
> 
> v3 -> v4:
>  Pointed out by Joel Stanley:
>  - Move patch history after Signoff.
>  - Remove unnecessary type cast.
>  - Use array instead of pointers for colling_levels.
>  - Rename num_level to num_levels.
>  - Use local variable to make function easier to read.
>  - Drop unnecessary sizeof(u8).
>  - Use IS_ERR instead of PTR_ERR_OR_ZERO.
> 
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
> 
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 116 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index ddfe66b..69b97d4 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/regmap.h>
> +#include <linux/thermal.h>
>  
>  /* ASPEED PWM & FAN Tach Register Definition */
>  #define ASPEED_PTCR_CTRL		0x00
> @@ -166,6 +167,18 @@
>  /* How long we sleep in us while waiting for an RPM result. */
>  #define ASPEED_RPM_STATUS_SLEEP_USEC	500
>  
> +#define MAX_CDEV_NAME_LEN 16
> +
> +struct aspeed_cooling_device {
> +	char name[16];
> +	struct aspeed_pwm_tacho_data *priv;
> +	struct thermal_cooling_device *tcdev;
> +	int pwm_port;
> +	u8 *cooling_levels;
> +	u8 max_state;
> +	u8 cur_state;
> +};
> +
>  struct aspeed_pwm_tacho_data {
>  	struct regmap *regmap;
>  	unsigned long clk_freq;
> @@ -180,6 +193,7 @@ struct aspeed_pwm_tacho_data {
>  	u8 pwm_port_type[8];
>  	u8 pwm_port_fan_ctrl[8];
>  	u8 fan_tach_ch_source[16];
> +	struct aspeed_cooling_device *cdev[8];
>  	const struct attribute_group *groups[3];
>  };
>  
> @@ -765,6 +779,94 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
>  	}
>  }
>  
> +static int
> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> +			    unsigned long *state)
> +{
> +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> +
> +	*state = cdev->max_state;
> +
> +	return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> +			    unsigned long *state)
> +{
> +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> +
> +	*state = cdev->cur_state;
> +
> +	return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> +			    unsigned long state)
> +{
> +	struct aspeed_cooling_device *cdev = tcdev->devdata;
> +
> +	if (state > cdev->max_state)
> +		return -EINVAL;
> +
> +	cdev->cur_state = state;
> +	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =
> +					cdev->cooling_levels[cdev->cur_state];
> +	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> +				     cdev->cooling_levels[cdev->cur_state]);
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops = {
> +	.get_max_state = aspeed_pwm_cz_get_max_state,
> +	.get_cur_state = aspeed_pwm_cz_get_cur_state,
> +	.set_cur_state = aspeed_pwm_cz_set_cur_state,
> +};
> +
> +static int aspeed_create_pwm_cooling(struct device *dev,
> +				     struct device_node *child,
> +				     struct aspeed_pwm_tacho_data *priv,
> +				     u32 pwm_port, u8 num_levels)
> +{
> +	int ret;
> +	struct aspeed_cooling_device *cdev;
> +
> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +	if (!cdev->cooling_levels)
> +		return -ENOMEM;
> +
> +	cdev->max_state = num_levels - 1;
> +	ret = of_property_read_u8_array(child, "cooling-levels",
> +					cdev->cooling_levels,
> +					num_levels);
> +	if (ret) {
> +		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +		return ret;
> +	}
> +	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, pwm_port);
> +
> +	cdev->tcdev = thermal_of_cooling_device_register(child,
> +							 cdev->name,
> +							 cdev,
> +							 &aspeed_pwm_cool_ops);
> +	if (IS_ERR(cdev->tcdev))
> +		return PTR_ERR(cdev->tcdev);
> +
> +	cdev->priv = priv;
> +	cdev->pwm_port = pwm_port;
> +
> +	priv->cdev[pwm_port] = cdev;
> +
> +	return 0;
> +}
> +
>  static int aspeed_create_fan(struct device *dev,
>  			     struct device_node *child,
>  			     struct aspeed_pwm_tacho_data *priv)
> @@ -778,6 +880,15 @@ static int aspeed_create_fan(struct device *dev,
>  		return ret;
>  	aspeed_create_pwm_port(priv, (u8)pwm_port);
>  
> +	ret = of_property_count_u8_elems(child, "cooling-levels");
> +
> +	if (ret > 0) {
> +		ret = aspeed_create_pwm_cooling(dev, child, priv, pwm_port,
> +						ret);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	count = of_property_count_u8_elems(child, "aspeed,fan-tach-ch");
>  	if (count < 1)
>  		return -EINVAL;
> @@ -834,9 +945,10 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  
>  	for_each_child_of_node(np, child) {
>  		ret = aspeed_create_fan(dev, child, priv);
> -		of_node_put(child);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(child);
>  			return ret;
> +		}
>  	}
>  
>  	priv->groups[0] = &pwm_dev_group;
