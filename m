Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHQgH4qztzDqmV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 16:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pFGnijGl"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id p68so4113468ywg.5
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=g8PR1/PGCdSobI8hyE5nlsx65jkK1gxC/vSbjtCrs68=;
 b=pFGnijGl51OgZG7K+2qno50LaEvJ6oDKdv3rwaPJW5kBEwEy9i6VFsK+rZG6IZRcBh
 ajCQ97VKV1ae2HmSSJ3Gmu2xBFvst90FWE/TcKEi4uA4nUDCnzZvzpJHAaJ//QIq1obB
 STnW/gmzw+qLs8k8MnwJtqi7dIZ3XbbQSbK2izxKWGlNADifAqpIRWE2mziSsBpX68yp
 maTitbxYoL5aikHR1UD7pOF7iQElzusru7Gh/OV3A2caqDxOl9v0Lws6baLAfCrwjYJD
 gSJVwiWzWIJg7t8wnC6XODBE4fA6na1EYoBe8wiLfcJnY4z919zqYGtJK8WOB+FATcVu
 fvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=g8PR1/PGCdSobI8hyE5nlsx65jkK1gxC/vSbjtCrs68=;
 b=sC528BZHlMkWleTZ0C6DM+3izM6sItdaQndplJOcGKYxRZDhlI21cXUB8WSfHPwqEl
 AtmsCLaQWBl3kyeghtHIjY8dHDR40Du7RsdMHANO1TB3LIn4E2CKr1OcvqaiGNFtzusy
 w/9PNa7j2d21/KPDBYM9ZpoKDYaYxFsnpolYRPeKmIq/F1vbt2OVG8dHx8UG3606Vltu
 BOUy//QXe49m755ZiiP8J8gL9SpYVVUsfp+ZWWnPhKKt78dF8h+TbDGfBbwCbheETQpt
 eumgpkI3PEP0JRyoVvMjrHeVY9yoY5WZsI8LPm0QXNdLPDUvk9dcPnSSuZOnpBPp7EED
 EhnA==
X-Gm-Message-State: AIVw11336G1BtY5e53xqsuDBH75bDcRmZccQSwuNHtgPIWU72bA1tIw0
 6iLYrZvCfiwxysynh88HGQJmuCfhQw==
X-Received: by 10.37.114.198 with SMTP id n189mr17799170ybc.21.1501051720969; 
 Tue, 25 Jul 2017 23:48:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Tue, 25 Jul 2017 23:48:20 -0700 (PDT)
In-Reply-To: <20170725141727.13105-1-c_mykolak@mellanox.com>
References: <20170725141727.13105-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 16:18:20 +0930
X-Google-Sender-Auth: VgGwVWM2Qh4Zyk2XcUTzyLhhQ3o
Message-ID: <CACPK8XeidChD_LT6o8MQBmyJ4r3mPCPfwEX_1REmQJkMNGELeQ@mail.gmail.com>
Subject: Re: [patch v3] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 Ohad Oz <ohado@mellanox.com>, 
 Vadim Pasternak <vadimp@mellanox.com>, Patrick Venture <venture@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 26 Jul 2017 06:48:45 -0000

Hi Mykola,

On Tue, Jul 25, 2017 at 11:47 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
>
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.

Looking better! I have a few comments below. Some are nits (small
issues that aren't a big deal), but I chose to point them out so you
learn for next time. If you have any questions then please ask.

>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---

Convention is to stick the changes between versions (the v2-> v3 bits)
down here, so that it doesn't end up in the final commit message.


>  drivers/hwmon/aspeed-pwm-tacho.c | 118 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index ddfe66b..ae8dfee 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/regmap.h>
> +#include <linux/thermal.h>
>
>  /* ASPEED PWM & FAN Tach Register Definition */
>  #define ASPEED_PTCR_CTRL               0x00
> @@ -166,6 +167,16 @@
>  /* How long we sleep in us while waiting for an RPM result. */
>  #define ASPEED_RPM_STATUS_SLEEP_USEC   500
>
> +struct aspeed_cooling_device {
> +       char name[16];
> +       struct aspeed_pwm_tacho_data *priv;
> +       struct thermal_cooling_device *tcdev;
> +       int pwm_port;
> +       u8 *cooling_levels;
> +       u8 max_state;
> +       u8 cur_state;
> +};
> +
>  struct aspeed_pwm_tacho_data {
>         struct regmap *regmap;
>         unsigned long clk_freq;
> @@ -180,6 +191,7 @@ struct aspeed_pwm_tacho_data {
>         u8 pwm_port_type[8];
>         u8 pwm_port_fan_ctrl[8];
>         u8 fan_tach_ch_source[16];
> +       struct aspeed_cooling_device *cdev[8];
>         const struct attribute_group *groups[3];
>  };
>
> @@ -765,6 +777,97 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
>         }
>  }
>
> +static int
> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long *state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;
> +
> +       *state = cdev->max_state;
> +
> +       return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long *state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;
> +
> +       *state = cdev->cur_state;
> +
> +       return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;

You can drop the cast, as devdata is a void *:

      struct aspeed_cooling_device *cdev = tcdev->devdata;

> +
> +       if (state > cdev->max_state)
> +               return -EINVAL;
> +
> +       cdev->cur_state = state;
> +       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] = *(cdev->cooling_levels
> +                                                         + cdev->cur_state);

That pointer maths looks scary :) How about this instead?

       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =
cdev->cooling_levels[cdev->cur_state]


> +       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> +                                    *(cdev->cooling_levels +
> +                                      cdev->cur_state));

Same here:

       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,

cdev->cooling_levels[cdev->cur_state]);

> +
> +       return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops = {
> +       .get_max_state = aspeed_pwm_cz_get_max_state,
> +       .get_cur_state = aspeed_pwm_cz_get_cur_state,
> +       .set_cur_state = aspeed_pwm_cz_set_cur_state,
> +};
> +
> +static int aspeed_create_pwm_cooling(struct device *dev,
> +                            struct device_node *child,
> +                            struct aspeed_pwm_tacho_data *priv,
> +                            u32 pwm_port, u8 num_level)

Can we call this num_levels instead of num_level?

> +{
> +       int ret;
> +
> +       priv->cdev[pwm_port] = devm_kzalloc(dev, sizeof(*priv->cdev[pwm_port]),
> +                                           GFP_KERNEL);

This function would be easier to read if we used a local variable:

struct pwm_port *port;
port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);

Then at the bottom of the function, do

priv->cdev[pwm_port] = port;


> +       if (!priv->cdev[pwm_port])
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->cooling_levels = devm_kzalloc(dev, num_level *

The sizeof(8) isn't useful, you could drop it.

> +                                                           sizeof(u8),
> +                                                           GFP_KERNEL);
> +       if (!priv->cdev[pwm_port]->cooling_levels)
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->max_state = num_level - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       priv->cdev[pwm_port]->cooling_levels,
> +                                       num_level);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +       sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name, pwm_port);
> +
> +       priv->cdev[pwm_port]->tcdev = thermal_of_cooling_device_register(child,
> +                                               priv->cdev[pwm_port]->name,
> +                                               priv->cdev[pwm_port],
> +                                               &aspeed_pwm_cool_ops);
> +       if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
> +               return PTR_ERR(priv->cdev[pwm_port]->tcdev);

I think you meant this:

if (IS_ERR(priv->cdev[pwm_port]->tcdev))
   return PTR_ERR(priv->cdev[pwm_port]->tcdev);

> +
> +       priv->cdev[pwm_port]->priv = priv;
> +       priv->cdev[pwm_port]->pwm_port = pwm_port;
> +
> +       return 0;
> +}
> +
>  static int aspeed_create_fan(struct device *dev,
>                              struct device_node *child,
>                              struct aspeed_pwm_tacho_data *priv)
> @@ -778,6 +881,15 @@ static int aspeed_create_fan(struct device *dev,
>                 return ret;
>         aspeed_create_pwm_port(priv, (u8)pwm_port);
>
> +       ret = of_property_count_u8_elems(child, "cooling-levels");
> +
> +       if (ret > 0) {
> +               ret = aspeed_create_pwm_cooling(dev, child, priv, pwm_port,
> +                                               ret);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         count = of_property_count_u8_elems(child, "aspeed,fan-tach-ch");
>         if (count < 1)
>                 return -EINVAL;
> @@ -834,10 +946,12 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>
>         for_each_child_of_node(np, child) {
>                 ret = aspeed_create_fan(dev, child, priv);
> -               of_node_put(child);
> -               if (ret)
> +               if (ret) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>         }
> +       of_node_put(child);

I'm not sure about these.

Cheers,

Joel
