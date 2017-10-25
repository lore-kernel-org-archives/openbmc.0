Return-Path: <ckeepax@opensource.cirrus.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168;
 helo=mx0b-001ae601.pphosted.com; envelope-from=ckeepax@opensource.cirrus.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 616 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Oct 2017 19:42:58 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMNv6498NzDqlT;
 Wed, 25 Oct 2017 19:42:56 +1100 (AEDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9P8T6uG016902; Wed, 25 Oct 2017 03:32:03 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0b-001ae601.pphosted.com with ESMTP id 2dr2nks141-1;
 Wed, 25 Oct 2017 03:32:03 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
 by mail4.cirrus.com (Postfix) with ESMTP id 3A25E611CE71;
 Wed, 25 Oct 2017 03:32:01 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.301.0; Wed, 25 Oct 2017
 09:32:02 +0100
Received: from localhost.localdomain (algalon.ad.cirrus.com [198.90.223.36])
 by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id v9P8W1Z3023869;	Wed,
 25 Oct 2017 09:32:01 +0100
Date: Wed, 25 Oct 2017 09:32:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <frowand.list@gmail.com>,
 <joel@jms.id.au>, <ckeepax@opensource.wolfsonmicro.com>,
 <ldewangan@nvidia.com>, <ryan_chen@aspeedtech.com>,
 <bgolaszewski@baylibre.com>, <mwelling@emacinc.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] gpio: gpiolib: Expand sleep tolerance to include
 controller reset
Message-ID: <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
References: <20171025050417.27992-1-andrew@aj.id.au>
 <20171025050417.27992-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20171025050417.27992-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.0.1-1707230000 definitions=main-1710250117
X-Mailman-Approved-At: Mon, 30 Oct 2017 15:18:14 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 08:43:00 -0000

On Wed, Oct 25, 2017 at 03:34:16PM +1030, Andrew Jeffery wrote:
> Reset tolerance is added to gpiolib with the introduction of a new
> pinconf parameter propagating the request to hardware. The existing
> persistence support for sleep is augmented to include reset tolerance
> if the GPIO driver provides it. Persistence continues to be enabled by
> default; in-kernel consumers can opt out, but userspace (currently) does
> not have a choice.
> 
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
> 
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> I'm not wedded to the names 'transitory' and 'persistent', so feel free to
> paint the bikeshed some other colour.
> 

I am happy enough with the names.

>  drivers/gpio/gpiolib-of.c               |  6 ++--
>  drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
>  drivers/gpio/gpiolib.c                  | 58 ++++++++++++++++++++++++++++++---
>  drivers/gpio/gpiolib.h                  |  2 +-
>  include/dt-bindings/gpio/gpio.h         |  6 ++--
>  include/linux/gpio/consumer.h           |  8 +++++
>  include/linux/gpio/machine.h            |  4 +--
>  include/linux/of_gpio.h                 |  2 +-
>  include/linux/pinctrl/pinconf-generic.h |  2 ++
>  9 files changed, 84 insertions(+), 18 deletions(-)

> @@ -2424,6 +2428,46 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>  EXPORT_SYMBOL_GPL(gpiod_set_debounce);
>  
>  /**
> + * gpiod_set_transitory - Lose or retain GPIO state on suspend or reset
> + * @desc: descriptor of the GPIO for which to configure persistence
> + * @transitory: True to lose state on suspend or reset, false for persistence
> + *
> + * Returns:
> + * 0 on success, otherwise a negative error code.
> + */
> +int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
> +{
> +	struct gpio_chip *chip;
> +	unsigned long packed;
> +	int gpio;
> +	int rc;
> +
> +	/* Handle FLAG_TRANSITORY first for suspend case */
> +	if (transitory)
> +		set_bit(FLAG_TRANSITORY, &desc->flags);
> +	else
> +		clear_bit(FLAG_TRANSITORY, &desc->flags);
> +
> +	/* Configure reset persistence if the controller supports it */
> +	chip = desc->gdev->chip;
> +	if (!chip->set_config)
> +		return 0;
> +
> +	packed = pinconf_to_config_packed(PIN_CONFIG_RESET_TOLERANT,
> +					  !transitory);
> +	gpio = gpio_chip_hwgpio(desc);
> +	rc = chip->set_config(chip, gpio, packed);
> +	if (rc == -ENOTSUPP) {
> +		dev_dbg(&desc->gdev->dev, "Reset tolerance not supported for GPIO %d\n",
> +				gpio);
> +		return 0;
> +	}
> +
> +	return rc;

This means that if we have a set_config we are directly
equating PERSISTENT to RESET_TOLERANT, which seems wrong to
me. I might have a GPIO on a controller with pinconf that
doesn't have anything to do with RESET_TOLERANT. Should the
PIN_CONFIG_RESET_TOLERANT, really just be PIN_CONFIG_PERSISTENT?
And then its upto the driver what persistence means for that
chip?

Thanks,
Charles
