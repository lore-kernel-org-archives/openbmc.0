Return-Path: <venture@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x2rqn4vN4zDq5b
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 05:42:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Lv8QlIJ/"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id c73so134466179pfk.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wbIP+4vSHM4KTJrvz0NJy7IOCwrU4ECn6Ob2RCUXksA=;
 b=Lv8QlIJ/JToHYUELQKlFkIDXUMYcGpFeBPvoKMLj+gxwLfpZYDXQA48niEvxYynwPx
 Nd8Pk/GaeF/CR2ntCOUIdvoBsjjOsletCQJBcxkVmmuDrIvOQgzzG3QmaK/td+6LKEbZ
 thnqYvKGo+CRt7nEiXXa8ONCHnnrdurXrp9/P8274ACeiKCMoDR7JbZLDl/Hx9WhwtxJ
 8c9rovnKtkQwLg0bFmSkyxzJJoECoCsJcJ9VL3Ad9UXBgKc897iZlMylZCypJ6cGUzgi
 dz5IW2I4MKFelSCsyVKjw6szrKPS+LYbWj7SB7GAJgzYRzQKL8YP3RT1gRp+XXbeg1xC
 rBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wbIP+4vSHM4KTJrvz0NJy7IOCwrU4ECn6Ob2RCUXksA=;
 b=egImODK4gOiIBDDg8o4NR9VQwLtewllu2jeuqAk9+0q5SsN+Q7gqCMgWT1+8KSQa2H
 l0fVn3zaVy1CVUXsbgBce+D7ki9RwFjwkmErdAk/Y+x/hrokVmNmkqUuaxjR35RsSH+G
 hYTYyI1BYdPZVyUwe8704R5Jl8ILffS616dchNLnrCbETMd7hxpB1dYJAmyOx1zkDshF
 24FEe2616/ToznHVIlwX7cOxkeqTEZ969HxQ/C6zMOMXvffHpGJtP89cANLIgql2BFQS
 6AEA9trUFLEuhHAuRhRiRlwTL2U2w5thjh+Xd3N8aKYodThyaQL6wTPibVsO8V8zh3Qr
 sdDg==
X-Gm-Message-State: AIVw110zIXGBX2YZJqqhqDxrYenXm9EFdbgnNj23VLke857fNoiODvF4
 NyBNa9al/sdHQFfa3uZ5gnaxsEsk7HXn
X-Received: by 10.84.192.3 with SMTP id b3mr24084956pld.76.1499283747097; Wed,
 05 Jul 2017 12:42:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Wed, 5 Jul 2017 12:42:06 -0700 (PDT)
In-Reply-To: <20170704135608.12334-1-c_mykolak@mellanox.com>
References: <20170704135608.12334-1-c_mykolak@mellanox.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 5 Jul 2017 12:42:06 -0700
Message-ID: <CAO=notx8D46SqpVvGKzo-L_MD70SyOWprfLeosiWBKp4mgygcg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon: (aspeed-pwm-tacho) cooling device
 support
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 05 Jul 2017 19:42:30 -0000

On Tue, Jul 4, 2017 at 6:56 AM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> Add basic pwm-tacho-controller node to ast-g5 dtsi.
> Add basic pwm-tacho-controller node to ast-g4 dtsi.
>
> Change pwm-tacho in aspeed-bmc-quanta-q71l.dts according new
> pwm-tacho structure.
>
> Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts |  61 +++++++++++
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  | 103 +++++++++----------
>  arch/arm/boot/dts/aspeed-g4.dtsi              |   9 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  17 ++++
>  drivers/hwmon/aspeed-pwm-tacho.c              | 139 +++++++++++++++++++++++++-
>  5 files changed, 273 insertions(+), 56 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index c71a6db..57d5951 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -144,3 +144,64 @@
>         status = "okay";
>  };
>
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default>;
> +
> +       tach-channels {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               fan@0 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +               };
> +
> +               fan@1 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +               };
> +
> +               fan@2 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +               };
> +
> +               fan@3 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +               };
> +
> +               fan@4 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +               };
> +
> +               fan@5 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +               };
> +
> +               fan@6 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +               };
> +
> +               fan@7 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +               };
> +       };
> +
> +       pwm-channels {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #cooling-cells = <2>;
> +
> +               pwm@0 {
> +                       reg = <0x00>;
> +                       cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index bb287fb..43ada5b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -46,57 +46,6 @@
>                         gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
>                 };
>         };
> -
> -       pwm_tacho: pwm-tacho-controller@1e786000 {
> -               compatible = "aspeed,ast2500-pwm-tacho";
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               reg = <0x1e786000 0x1000>;
> -               clocks = <&pwm_tacho_fixed_clk>;
> -               pinctrl-names = "default";
> -               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> -                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> -
> -               fan@0 {
> -                       reg = <0x00>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> -               };
> -
> -               fan@1 {
> -                       reg = <0x01>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> -               };
> -
> -               fan@2 {
> -                       reg = <0x02>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> -               };
> -
> -               fan@3 {
> -                       reg = <0x03>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> -               };
> -
> -               fan@4 {
> -                       reg = <0x00>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> -               };
> -
> -               fan@5 {
> -                       reg = <0x01>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> -               };
> -
> -               fan@6 {
> -                       reg = <0x02>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> -               };
> -
> -               fan@7 {
> -                       reg = <0x03>;
> -                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> -               };
> -       };
>  };
>
>  &fmc {
> @@ -299,3 +248,55 @@
>  &wdt2 {
>         status = "okay";
>  };
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                               &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> +
> +       tach-channels {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               fan@0 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +               };
> +
> +               fan@1 {
> +                       reg = <0x01>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +               };
> +
> +               fan@2 {
> +                       reg = <0x02>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +               };
> +
> +               fan@3 {
> +                       reg = <0x03>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +               };
> +
> +               fan@4 {
> +                       reg = <0x00>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +               };
> +
> +               fan@5 {
> +                       reg = <0x01>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +               };
> +
> +               fan@6 {
> +                       reg = <0x02>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +               };
> +
> +               fan@7 {
> +                       reg = <0x03>;
> +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 9cc959f..c69ad77 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -318,7 +318,14 @@
>                                 ranges = <0 0x1e78a000 0x1000>;
>                         };
>
> -
> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
> +                               compatible = "aspeed,ast2500-pwm-tacho";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x1e786000 0x1000>;
> +                               clocks = <&pwm_tacho_fixed_clk>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 992242d..1ed29d9 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -35,6 +35,14 @@
>                 i2c13 = &i2c13;
>         };
>
> +       clocks {
> +               pwm_tacho_fixed_clk: fixedclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <24000000>;
> +               };
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> @@ -366,6 +374,15 @@
>                                 #size-cells = <1>;
>                                 ranges = <0 0x1e78a000 0x1000>;
>                         };
> +
> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
> +                               compatible = "aspeed,ast2500-pwm-tacho";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x1e786000 0x1000>;
> +                               clocks = <&pwm_tacho_fixed_clk>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>  };
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index ddfe66b..eab18af 100644
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
> @@ -794,10 +806,111 @@ static int aspeed_create_fan(struct device *dev,
>         return 0;
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
> +
> +       if (state > cdev->max_state)
> +               return -EINVAL;
> +
> +       cdev->cur_state = state;
> +       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] = *(cdev->cooling_levels
> +                                                         + cdev->cur_state);
> +       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> +                                    *(cdev->cooling_levels +
> +                                      cdev->cur_state));
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
> +static int aspeed_create_pwm(struct device *dev,
> +                            struct device_node *child,
> +                            struct aspeed_pwm_tacho_data *priv)

For this, I would recommend just renaming to aspeed_create_pwm_cooling

> +{
> +       u32 pwm_port;
> +       int ret;
> +
> +       ret = of_property_read_u32(child, "reg", &pwm_port);
> +       if (ret)
> +               return ret;
> +
> +       ret = of_property_count_u8_elems(child, "cooling-levels");
> +       if (ret <= 0) {
> +               dev_err(dev, "Wrong cooling-levels data.\n");
> +               return -EINVAL;
> +       }
> +
> +       priv->cdev[pwm_port] = devm_kzalloc(dev, sizeof(*priv->cdev[pwm_port]),
> +                                           GFP_KERNEL);
> +       if (!priv->cdev[pwm_port])
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->cooling_levels = devm_kzalloc(dev, ret *
> +                                                           sizeof(u8),
> +                                                           GFP_KERNEL);
> +       if (!priv->cdev[pwm_port]->cooling_levels)
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->max_state = ret - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       priv->cdev[pwm_port]->cooling_levels,
> +                                       ret);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +
> +       sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name, pwm_port);
> +       priv->cdev[pwm_port]->tcdev = thermal_of_cooling_device_register(child,
> +                                               priv->cdev[pwm_port]->name,
> +                                               priv->cdev[pwm_port],
> +                                               &aspeed_pwm_cool_ops);
> +       if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
> +               return PTR_ERR(priv->cdev[pwm_port]->tcdev);
> +
> +       priv->cdev[pwm_port]->priv = priv;
> +       priv->cdev[pwm_port]->pwm_port = pwm_port;
> +
> +       return 0;
> +}
> +
>  static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct device_node *np, *child;
> +       struct device_node *np, *child, *grandchild;
>         struct aspeed_pwm_tacho_data *priv;
>         void __iomem *regs;
>         struct resource *res;
> @@ -833,10 +946,28 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>         aspeed_create_type(priv);
>
>         for_each_child_of_node(np, child) {
> -               ret = aspeed_create_fan(dev, child, priv);
> +               if (!of_node_cmp(child->name, "tach-channels")) {
> +                       for_each_child_of_node(child, grandchild) {
> +                               ret = aspeed_create_fan(dev, grandchild, priv);
> +                               of_node_put(grandchild);
> +                               if (ret) {
> +                                       of_node_put(child);
> +                                       return ret;
> +                               }
> +                       }
> +               }
> +
> +               if (!of_node_cmp(child->name, "pwm-channels")) {
> +                       for_each_child_of_node(child, grandchild) {
> +                               ret = aspeed_create_pwm(dev, grandchild, priv);
> +                               of_node_put(grandchild);
> +                               if (ret) {
> +                                       of_node_put(child);
> +                                       return ret;
> +                               }
> +                       }
> +               }
>                 of_node_put(child);
> -               if (ret)
> -                       return ret;
>         }
>
>         priv->groups[0] = &pwm_dev_group;
> --
> 2.8.4
>

Presumably it's been tested and won't impact users who don't configure
this behaviour, so I don't have a lot of feedback about functionality.
