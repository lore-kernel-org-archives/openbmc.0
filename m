Return-Path: <ckeepax@opensource.cirrus.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25;
 helo=mx0b-001ae601.pphosted.com; envelope-from=ckeepax@opensource.cirrus.com;
 receiver=<UNKNOWN>)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQVK85ScRzDqMY;
 Mon, 30 Oct 2017 20:57:46 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9U9sx2U015973; Mon, 30 Oct 2017 04:57:29 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0a-001ae601.pphosted.com with ESMTP id 2dvqa2qb8g-1;
 Mon, 30 Oct 2017 04:57:29 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
 by mail4.cirrus.com (Postfix) with ESMTP id B5D23611CE6D;
 Mon, 30 Oct 2017 04:57:26 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.301.0; Mon, 30 Oct 2017
 09:57:28 +0000
Received: from localhost.localdomain (algalon.ad.cirrus.com [198.90.223.36])
 by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id v9U9vQqm026306;	Mon,
 30 Oct 2017 09:57:26 GMT
Date: Mon, 30 Oct 2017 09:57:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <frowand.list@gmail.com>,
 <joel@jms.id.au>, <ckeepax@opensource.wolfsonmicro.com>,
 <ldewangan@nvidia.com>, <ryan_chen@aspeedtech.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] gpio: gpiolib: Generalise state persistence
 beyond sleep
Message-ID: <20171030095726.a43lpshlyfta4vrq@localhost.localdomain>
References: <20171030062218.27005-1-andrew@aj.id.au>
 <20171030062218.27005-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20171030062218.27005-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.0.1-1707230000 definitions=main-1710300142
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
X-List-Received-Date: Mon, 30 Oct 2017 09:57:50 -0000

On Mon, Oct 30, 2017 at 04:52:17PM +1030, Andrew Jeffery wrote:
> General support for state persistence is added to gpiolib with the
> introduction of a new pinconf parameter to propagate the request to
> hardware. The existing persistence support for sleep is adapted to
> include hardware support if the GPIO driver provides it. Persistence
> continues to be enabled by default; in-kernel consumers can opt out, but
> userspace (currently) does not have a choice.
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

This comment could use an update.

> +	chip = desc->gdev->chip;
> +	if (!chip->set_config)
> +		return 0;
> +
> +	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
> +					  !transitory);
> +	gpio = gpio_chip_hwgpio(desc);
> +	rc = chip->set_config(chip, gpio, packed);
> +	if (rc == -ENOTSUPP) {
> +		dev_dbg(&desc->gdev->dev, "Reset tolerance not supported for GPIO %d\n",
> +				gpio);

And this debug message.

> +		return 0;
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_set_transitory);
> +

Otherwise think this all looks good to me.

Thanks,
Charles
