Return-Path: <clg@kaod.org>
Received: from 1.mo178.mail-out.ovh.net (1.mo178.mail-out.ovh.net
 [178.33.251.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdvBl3Y8xzDrTh
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 18:16:30 +1000 (AEST)
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8CE2B510EE
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 09:40:40 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
 [31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 15F951C009F;
 Fri, 25 Aug 2017 09:40:32 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 2/5] leds: gpio: Allow LED to retain state
 at shutdown
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: vishwa@linux.vnet.ibm.com, bjwyman@gmail.com, geissonator@gmail.com,
 eajames@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
References: <20170825065244.488-1-andrew@aj.id.au>
 <20170825065244.488-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <38dac127-c8ac-739b-82ba-806d36355cb9@kaod.org>
Date: Fri, 25 Aug 2017 09:40:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170825065244.488-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15309705459661114114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrtdehgddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 25 Aug 2017 08:16:31 -0000

On 08/25/2017 08:52 AM, Andrew Jeffery wrote:
> In some systems, such as BMCs, we want to retain the state of LEDs
> across a reboot of the BMC whilst the host remains up.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/leds/leds-gpio.c | 7 ++++++-
>  include/linux/leds.h     | 3 +++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index d400dcaf4d29..061ab9220048 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -134,6 +134,8 @@ static int create_gpio_led(const struct gpio_led *template,
>  		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
>  	if (template->panic_indicator)
>  		led_dat->cdev.flags |= LED_PANIC_INDICATOR;
> +	if (template->retain_state_shutdown)
> +		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
>  
>  	ret = gpiod_direction_output(led_dat->gpiod, state);
>  	if (ret < 0)
> @@ -203,6 +205,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  
>  		if (fwnode_property_present(child, "retain-state-suspended"))
>  			led.retain_state_suspended = 1;
> +		if (fwnode_property_present(child, "retain-state-shutdown"))
> +			led.retain_state_shutdown = 1;
>  		if (fwnode_property_present(child, "panic-indicator"))
>  			led.panic_indicator = 1;
>  
> @@ -265,7 +269,8 @@ static void gpio_led_shutdown(struct platform_device *pdev)
>  	for (i = 0; i < priv->num_leds; i++) {
>  		struct gpio_led_data *led = &priv->leds[i];
>  
> -		gpio_led_set(&led->cdev, LED_OFF);
> +		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
> +			gpio_led_set(&led->cdev, LED_OFF);
>  	}
>  }
>  
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb531094c..4d39f767f34a 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -46,6 +46,8 @@ struct led_classdev {
>  #define LED_DEV_CAP_FLASH	(1 << 18)
>  #define LED_HW_PLUGGABLE	(1 << 19)
>  #define LED_PANIC_INDICATOR	(1 << 20)
> +#define LED_BRIGHT_HW_CHANGED	(1 << 21)

where does this come from ? is it used ?

Thanks,

C.

> +#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
>  
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;
> @@ -378,6 +380,7 @@ struct gpio_led {
>  	unsigned	retain_state_suspended : 1;
>  	unsigned	panic_indicator : 1;
>  	unsigned	default_state : 2;
> +	unsigned	retain_state_shutdown : 1;
>  	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
>  	struct gpio_desc *gpiod;
>  };
> 
