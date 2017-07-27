Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHvhj0gmRzDrD6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 11:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PI8cbb+x"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id l82so6181476ywc.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 18:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4NNx2826IKRPWjkca4qcV16cfkQpS/4eiNgLB9+uc0k=;
 b=PI8cbb+xMfAuTS8hHB9qaJGQ4G/rMR/r9TFlYogbtV91Ob2MHFwNJueyqZfOxSc1Hf
 ij9DIJiYLsP/PMVHOBSltNEKT4TsRYdasHDs4j6OqGMX+fRvuz7Oo9VaSYs/F8dVwyHn
 nFhcES3AA3iPNPkjzVogIHK0qtW9AVUr9U7kucInnpo3/Zbf3xpf7uysYJz2bPa3y/Q4
 xHGm1b+F0COF6nPA2nBpme5imJcP4Rr3iESnSRfbYg8k/mzucSqeGzrzACq+RkOWE9zb
 wZxZ/Ma8yul5DYjXhioBCrE9IadGUCdu0rFlo54K6W7v1MYnB3j+M8Ifag/kJtubcCa/
 UcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4NNx2826IKRPWjkca4qcV16cfkQpS/4eiNgLB9+uc0k=;
 b=kxtgPHG+4lW9X0jdyqYSJHwVM9mwDAYZiT6ojxT1F0qk32yHOk+hdmUFk8C9MmJyIG
 OxYY5d9ZjLZmHXgiva+3dRRV7ybw993uAcSbh7sn1YGaugyzxoXIrjG+8FTWfqy3ajFY
 IiJAID3HFm2ounPpdABufdJwKC04PdaH4Hj7+Go6h6bfXTOmzYD3PSlM8g0Z3F9wVdjK
 HeZHjOJsbTB1ZXNT3jvaaVKextXtnqrUQgNzppjh4iqwGtut+La5ABn05Io7NKCy4TmH
 yUE2hsuVTw9RJHZs8yCHhf2OAr6DoVVB0lOXteAbcAF6OKuV0GGZfmo97DavyLXfDQ/J
 nxgA==
X-Gm-Message-State: AIVw112qJ2Vi6TkgYRqoAn8MKozN0DLzf0BNCkdCkrZrkNklVJbd+LgX
 m+/9z9blQVUjS4OyzdQTp3WiPr3RXg==
X-Received: by 10.37.114.198 with SMTP id n189mr2391121ybc.21.1501119394382;
 Wed, 26 Jul 2017 18:36:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 26 Jul 2017 18:36:13 -0700 (PDT)
In-Reply-To: <20170726145227.26466-1-c_mykolak@mellanox.com>
References: <20170726145227.26466-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jul 2017 11:06:13 +0930
X-Google-Sender-Auth: PcT7l6_W5mqnXUbS5hEx2XCIUIc
Message-ID: <CACPK8XedO05y1r54rkGfByQ7sWZSsMZ1JGztdwFHQe9gs_HmVA@mail.gmail.com>
Subject: Re: [patch v5] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>,
 Ohad Oz <ohado@mellanox.com>
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
X-List-Received-Date: Thu, 27 Jul 2017 01:36:37 -0000

On Thu, Jul 27, 2017 at 12:22 AM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Looks good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
>
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
>
> v3 -> v4:
>  Pointed out by Joel Stanley:
>  - Move patch history after Signoff.
>  - Remove unnecessary type cast.
>  - Use array instead of pointers for colling_levels.
>  - Rename num_level to num_levels.
>  - Use local variable to make function easier to read.
>  - Drop unnesesary sizeof(u8).
>  - Use IS_ERR instead of PTR_ERR_OR_ZERO.
>
> v4 -> v5:
>  Pointed out by Joel Stanley:
>  - Use snprintf to fill cdev->name[16].
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 117 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index ddfe66b..049e4eb 100644
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
> @@ -166,6 +167,18 @@
>  /* How long we sleep in us while waiting for an RPM result. */
>  #define ASPEED_RPM_STATUS_SLEEP_USEC   500
>
> +#define MAX_CDEV_NAME_LEN 16
> +
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
> @@ -180,6 +193,7 @@ struct aspeed_pwm_tacho_data {
>         u8 pwm_port_type[8];
>         u8 pwm_port_fan_ctrl[8];
>         u8 fan_tach_ch_source[16];
> +       struct aspeed_cooling_device *cdev[8];
>         const struct attribute_group *groups[3];
>  };
>
> @@ -765,6 +779,94 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
>         }
>  }
>
> +static int
> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long *state)
> +{
> +       struct aspeed_cooling_device *cdev = tcdev->devdata;
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
> +       struct aspeed_cooling_device *cdev = tcdev->devdata;
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
> +       struct aspeed_cooling_device *cdev = tcdev->devdata;
> +
> +       if (state > cdev->max_state)
> +               return -EINVAL;
> +
> +       cdev->cur_state = state;
> +       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =
> +                                       cdev->cooling_levels[cdev->cur_state];
> +       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> +                                    cdev->cooling_levels[cdev->cur_state]);
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
> +                                    struct device_node *child,
> +                                    struct aspeed_pwm_tacho_data *priv,
> +                                    u32 pwm_port, u8 num_levels)
> +{
> +       int ret;
> +       struct aspeed_cooling_device *cdev;
> +
> +       cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +
> +       if (!cdev)
> +               return -ENOMEM;
> +
> +       cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +       if (!cdev->cooling_levels)
> +               return -ENOMEM;
> +
> +       cdev->max_state = num_levels - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       cdev->cooling_levels,
> +                                       num_levels);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +       snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, pwm_port);
> +
> +       cdev->tcdev = thermal_of_cooling_device_register(child,
> +                                                        cdev->name,
> +                                                        cdev,
> +                                                        &aspeed_pwm_cool_ops);
> +       if (IS_ERR(cdev->tcdev))
> +               return PTR_ERR(cdev->tcdev);
> +
> +       cdev->priv = priv;
> +       cdev->pwm_port = pwm_port;
> +
> +       priv->cdev[pwm_port] = cdev;
> +
> +       return 0;
> +}
> +
>  static int aspeed_create_fan(struct device *dev,
>                              struct device_node *child,
>                              struct aspeed_pwm_tacho_data *priv)
> @@ -778,6 +880,15 @@ static int aspeed_create_fan(struct device *dev,
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
> @@ -834,10 +945,12 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
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
>
>         priv->groups[0] = &pwm_dev_group;
>         priv->groups[1] = &fan_dev_group;
> --
> 2.8.4
>
