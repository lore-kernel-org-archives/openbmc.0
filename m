Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wLqyt0wh5zDqFW
 for <openbmc@lists.ozlabs.org>; Mon,  8 May 2017 14:58:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QhN9+2Fj"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 203so4369609ywe.0
 for <openbmc@lists.ozlabs.org>; Sun, 07 May 2017 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=4HCOhpjyyhKAv3WFtULw+dv3tZHxeEiJDIhZpOxve/U=;
 b=QhN9+2FjHXq5K5y7NkVcsQ1eYE67A5SAJlr9RZsulXrfIpZRGaO9lUwIsAkUboaPdj
 3mbKGA62H172X0yWCONoLNxhmduYBoTtRz16mUF0QWJzG4YbRnPyCKMhInNqM9fCr0Mx
 EhIsUBGhAqmzJnGO9dUJtGCo0hroJ8DoqPeTHR+at0cDqKj7zW+QhcA22+qpQOaEMUF4
 unDYDoKFn7lT8nC3KXb7oQJrkzy4Zv/6wf3v4dbvpPh+rOk1utsqoNeOS5ystsVCDVCc
 o1S33BDyPnzY/4DtXy7jXX2670s95dOZjfyGwQmnXxZnwX95IjP5mxFyz4LAp7ZuInmX
 Ljnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=4HCOhpjyyhKAv3WFtULw+dv3tZHxeEiJDIhZpOxve/U=;
 b=por11aone8aszfJD0DCJbMaqYXLFFAeD8tJnyhQkhX9u5t+DoWE96XAr7FHGpbK0/1
 2fDwzdGaN5LNGqEL4dJqVoVevvTIFbV7SoyM3Iaqv0TyaXrEKw9MNn9chbP6u66kg+J6
 XXtg4b6lnFy+jxUV1iX0cctwJ7oM4dQ01HEl4OvmsP9EIMSLK4S3xr/l3xvUpYyDOzWC
 bPjKjDsJT4cfm7ZpPCQDAircBr7JBsFV+v6U6gig66M4WyjXofTLveDC5iSjHSsDBeaC
 XLVgV4rq8Qhr1R8bJRPFbu7e8dqW4BjZqEIT0NYdzkdJc9HJlfZsMSNNkgqBoGFz8g3H
 nQXA==
X-Gm-Message-State: AODbwcCrfiyEEgp1td+ywDm6FhY0KO9JHiPJ1BH3ydDq4zV4ub9hE8Wq
 d70MOd02agVr5feJhSWz5megvq4PSw==
X-Received: by 10.129.81.194 with SMTP id f185mr6563849ywb.308.1494219523528; 
 Sun, 07 May 2017 21:58:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Sun, 7 May 2017 21:58:23 -0700 (PDT)
In-Reply-To: <1493989667-29466-1-git-send-email-clg@kaod.org>
References: <1493989667-29466-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 May 2017 14:28:23 +0930
X-Google-Sender-Auth: SUt0Fav7Rn53vfqEkENzGqSsjFw
Message-ID: <CACPK8XdLXdDos4MeNB2WWwsTXCHfets9FdumzvsqMJjOgdBLvA@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.10] leds: pca955x: add GPIO support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 08 May 2017 04:58:47 -0000

On Fri, May 5, 2017 at 10:37 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The PCA955x family of chips are I2C LED blinkers whose pins not used
> to control LEDs can be used as general purpose I/Os (GPIOs).
>
> The following adds support for device tree and Open Firmware to be
> able do define different operation modes for each pin. See bindings
> documentation for more details. The pca955x driver is then extended
> with a gpio_chip when pins are operating in GPIO mode.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  I made some experiments on a witherspoon with this tree :
>
>    https://github.com/legoater/linux/commits/openbmc-4.10
>
>  Looks OK but I don't know what is happening behind the chip.
>
>  Please take a look at the DT bindings.
>
>  Thanks,
>
>  C.
>
>  .../devicetree/bindings/leds/leds-pca955x.txt      | 103 ++++++++
>  drivers/leds/Kconfig                               |  11 +
>  drivers/leds/leds-pca955x.c                        | 290 +++++++++++++++=
+++---
>  3 files changed, 374 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Do=
cumentation/devicetree/bindings/leds/leds-pca955x.txt
> new file mode 100644
> index 000000000000..98d1053dd1b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> @@ -0,0 +1,103 @@
> +LEDs connected to pca9550, pca9551, pca9552, pca9553,
> +
> +Required properties:
> +- compatible : should be one of :
> +       "nxp,pca9550"
> +       "nxp,pca9551"
> +       "nxp,pca9552"
> +       "nxp,pca9553"
> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +- reg: I2C slave address. depends on the model.
> +
> +Optional properties:
> +- gpio-controller: allows pins to be used as GPIOs.
> +- #gpio-cells: if present, must not be 0.
> +- gpio-base : base number of the pins used as GPIOs. If there are more
> +              than one, they should be contiguous. See 'type' property
> +              below.
> +
> +LED sub-node properties:
> +- reg   : number of LED line.
> +               from 0 to  1 in pca9550
> +               from 0 to  7 in pca9551
> +               from 0 to 15 in pca9552
> +               from 0 to  3 in pca9553
> +- compatible: either "none", "led" (default) or "gpio".
> +- label : (optional)
> +          see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +          see Documentation/devicetree/bindings/leds/common.txt
> +
> +Examples:
> +
> +pca9552: pca9552@60 {
> +       compatible =3D "nxp,pca9552";
> +       #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +       reg =3D <0x60>;
> +
> +       gpio-controller;
> +       #gpio-cells =3D <2>;
> +       gpio-base =3D <12>;
> +
> +       gpio@12 {
> +               label =3D "GPIO12";
> +               reg =3D <12>;
> +               compatible =3D "gpio";
> +       };
> +       gpio@13 {
> +               label =3D "GPIO13";
> +               reg =3D <13>;
> +               compatible =3D "gpio";
> +       };
> +       gpio@14 {
> +               label =3D "GPIO14";
> +               reg =3D <14>;
> +               compatible =3D "gpio";
> +       };
> +       gpio@15 {
> +               label =3D "GPIO15";
> +               reg =3D <15>;
> +               compatible =3D "gpio";
> +       };

This is a bit unusual as normally GPIOs aren't described until they're
being used.

In that sense, we should have a GPIO controller that covers all of the
pins in the device. When requested as LEDs the driver should return
EBUSY to things that are asking for LEDs.

Perhaps you should just send your RFC upstream and see what they have to sa=
y?

Cheers,

Joel

> +
> +       led@0 {
> +               label =3D "LED0";
> +               linux,default-trigger =3D "default-on";
> +               reg =3D <0>;
> +       };
> +       led@1 {
> +               label =3D "LED1";
> +               reg =3D <1>;
> +       };
> +       led@2 {
> +               label =3D "LED2";
> +               reg =3D <2>;
> +       };
> +       led@3 {
> +               label =3D "LED3";
> +               reg =3D <3>;
> +       };
> +
> +       none@4 {
> +               reg =3D <4>;
> +               compatible =3D "none";
> +       };
> +       none@5 {
> +               reg =3D <5>;
> +               compatible =3D "none";
> +       };
> +       none@6 {
> +               reg =3D <6>;
> +               compatible =3D "none";
> +       };
> +       none@7 {
> +               reg =3D <7>;
> +               compatible =3D "none";
> +       };
> +
> +       led@8 {
> +               label =3D "LED8";
> +               reg =3D <8>;
> +       };
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index c621cbbb5768..0177a36dab3d 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -352,6 +352,17 @@ config LEDS_PCA955X
>           LED driver chips accessed via the I2C bus.  Supported
>           devices include PCA9550, PCA9551, PCA9552, and PCA9553.
>
> +config LEDS_PCA955X_GPIO
> +       bool "Enable GPIO support for PCA955X"
> +       depends on LEDS_PCA955X
> +       depends on GPIOLIB
> +       help
> +         Allow unused pins on PCA955X to be used as gpio.
> +
> +         To use a pin as gpio the pin type should be set to
> +         PCA955X_TYPE_GPIO in the device tree.
> +
> +
>  config LEDS_PCA963X
>         tristate "LED support for PCA963x I2C chip"
>         depends on LEDS_CLASS
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 78a7ce816a47..afbdccb0e8b6 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -45,10 +45,13 @@
>  #include <linux/delay.h>
>  #include <linux/string.h>
>  #include <linux/ctype.h>
> +#include <linux/gpio.h>
>  #include <linux/leds.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>
>  /* LED select registers determine the source that drives LED outputs */
>  #define PCA955X_LS_LED_ON      0x0     /* Output LOW */
> @@ -56,6 +59,10 @@
>  #define PCA955X_LS_BLINK0      0x2     /* Blink at PWM0 rate */
>  #define PCA955X_LS_BLINK1      0x3     /* Blink at PWM1 rate */
>
> +#define PCA955X_TYPE_NONE         0
> +#define PCA955X_TYPE_LED          1
> +#define PCA955X_TYPE_GPIO         2
> +
>  enum pca955x_type {
>         pca9550,
>         pca9551,
> @@ -115,6 +122,9 @@ struct pca955x {
>         struct pca955x_led *leds;
>         struct pca955x_chipdef  *chipdef;
>         struct i2c_client       *client;
> +#ifdef CONFIG_LEDS_PCA955X_GPIO
> +       struct gpio_chip gpio;
> +#endif
>  };
>
>  struct pca955x_led {
> @@ -122,6 +132,14 @@ struct pca955x_led {
>         struct led_classdev     led_cdev;
>         int                     led_num;        /* 0 .. 15 potentially */
>         char                    name[32];
> +       u32                     type;
> +       const char              *default_trigger;
> +};
> +
> +struct pca955x_platform_data {
> +       struct pca955x_led      *leds;
> +       int                     num_leds;
> +       int                     gpio_base;
>  };
>
>  /* 8 bits per input register */
> @@ -200,6 +218,14 @@ static u8 pca955x_read_ls(struct i2c_client *client,=
 int n)
>                 pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
>  }
>
> +/*
> + * Read the INPUT register, which constains the state of LEDs.
> + */
> +static u8 pca955x_read_input(struct i2c_client *client, int n)
> +{
> +       return (u8)i2c_smbus_read_byte_data(client, n);
> +}
> +
>  static int pca955x_led_set(struct led_classdev *led_cdev,
>                             enum led_brightness value)
>  {
> @@ -250,6 +276,156 @@ static int pca955x_led_set(struct led_classdev *led=
_cdev,
>         return 0;
>  }
>
> +#ifdef CONFIG_LEDS_PCA955X_GPIO
> +static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int o=
ffset)
> +{
> +       struct pca955x *pca955x =3D gpiochip_get_data(gc);
> +       struct pca955x_led *led =3D &pca955x->leds[gc->base + offset];
> +
> +       if (led->type =3D=3D PCA955X_TYPE_GPIO)
> +               return 0;
> +
> +       return -EBUSY;
> +}
> +
> +static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int of=
fset,
> +                                  int val)
> +{
> +       struct pca955x *pca955x =3D gpiochip_get_data(gc);
> +       struct pca955x_led *led =3D &pca955x->leds[gc->base + offset];
> +
> +       if (val)
> +               pca955x_led_set(&led->led_cdev, LED_FULL);
> +       else
> +               pca955x_led_set(&led->led_cdev, LED_OFF);
> +}
> +
> +static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int off=
set)
> +{
> +       struct pca955x *pca955x =3D gpiochip_get_data(gc);
> +       struct pca955x_led *led =3D &pca955x->leds[gc->base + offset];
> +       u8 reg =3D pca955x_read_input(pca955x->client, led->led_num / 8);
> +
> +       return !!(reg & (1 << (led->led_num % 8)));
> +}
> +
> +static int pca955x_gpio_direction_input(struct gpio_chip *gc,
> +                                       unsigned int offset)
> +{
> +       /* To use as input ensure pin is not driven */
> +       pca955x_gpio_set_value(gc, offset, 0);
> +
> +       return 0;
> +}
> +
> +static int pca955x_gpio_direction_output(struct gpio_chip *gc,
> +                                        unsigned int offset, int val)
> +{
> +       pca955x_gpio_set_value(gc, offset, val);
> +
> +       return 0;
> +}
> +#endif /* CONFIG_LEDS_PCA955X_GPIO */
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static struct pca955x_platform_data *
> +pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef =
*chip)
> +{
> +       struct device_node *np =3D client->dev.of_node;
> +       struct device_node *child;
> +       struct pca955x_platform_data *pdata;
> +       int count;
> +
> +       count =3D of_get_child_count(np);
> +       if (!count || count > chip->bits)
> +               return ERR_PTR(-ENODEV);
> +
> +       pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> +       if (!pdata)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pdata->leds =3D devm_kzalloc(&client->dev,
> +                          sizeof(struct pca955x_led) * chip->bits, GFP_K=
ERNEL);
> +       if (!pdata->leds)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for_each_child_of_node(np, child) {
> +               const char *name;
> +               u32 reg;
> +               int res;
> +
> +               res =3D of_property_read_u32(child, "reg", &reg);
> +               if ((res !=3D 0) || (reg >=3D chip->bits))
> +                       continue;
> +
> +               if (of_property_read_string(child, "label", &name))
> +                       name =3D child->name;
> +
> +               snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].n=
ame),
> +                        "%s", name);
> +
> +               pdata->leds[reg].type =3D PCA955X_TYPE_LED;
> +               if (of_property_match_string(child, "compatible", "gpio")=
 >=3D 0)
> +                       pdata->leds[reg].type =3D PCA955X_TYPE_GPIO;
> +               if (of_property_match_string(child, "compatible", "none")=
 >=3D 0)
> +                       pdata->leds[reg].type =3D PCA955X_TYPE_NONE;
> +
> +               of_property_read_u32(child, "type", &pdata->leds[reg].typ=
e);
> +               of_property_read_string(child, "linux,default-trigger",
> +                                       &pdata->leds[reg].default_trigger=
);
> +       }
> +
> +       pdata->num_leds =3D chip->bits;
> +
> +       if (of_property_read_u32(np, "gpio-base", &pdata->gpio_base))
> +               pdata->gpio_base =3D -1;
> +
> +       return pdata;
> +}
> +
> +static const struct of_device_id of_pca955x_match[] =3D {
> +       { .compatible =3D "nxp,pca9550", .data =3D (void *)pca9550 },
> +       { .compatible =3D "nxp,pca9551", .data =3D (void *)pca9551 },
> +       { .compatible =3D "nxp,pca9552", .data =3D (void *)pca9552 },
> +       { .compatible =3D "nxp,pca9553", .data =3D (void *)pca9553 },
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_pca955x_match);
> +#else
> +static struct pca955x_platform_data *
> +pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef =
*chip)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +static int pca955x_destroy_devices(struct pca955x *data, int n_devs)
> +{
> +       int i =3D n_devs;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       while (--i >=3D 0) {
> +               switch (data->leds[i].type) {
> +               case PCA955X_TYPE_NONE:
> +               case PCA955X_TYPE_GPIO:
> +                       break;
> +               case PCA955X_TYPE_LED:
> +                       led_classdev_unregister(&data->leds[i].led_cdev);
> +                       break;
> +               }
> +       }
> +
> +#ifdef CONFIG_LEDS_PCA955X_GPIO
> +       if (data->gpio.parent)
> +               gpiochip_remove(&data->gpio);
> +#endif
> +
> +       return 0;
> +}
> +
>  static int pca955x_probe(struct i2c_client *client,
>                                         const struct i2c_device_id *id)
>  {
> @@ -257,8 +433,9 @@ static int pca955x_probe(struct i2c_client *client,
>         struct pca955x_led *pca955x_led;
>         struct pca955x_chipdef *chip;
>         struct i2c_adapter *adapter;
> -       struct led_platform_data *pdata;
>         int i, err;
> +       struct pca955x_platform_data *pdata;
> +       int ngpios =3D 0;
>
>         if (id) {
>                 chip =3D &pca955x_chipdefs[id->driver_data];
> @@ -272,6 +449,11 @@ static int pca955x_probe(struct i2c_client *client,
>         }
>         adapter =3D to_i2c_adapter(client->dev.parent);
>         pdata =3D dev_get_platdata(&client->dev);
> +       if (!pdata) {
> +               pdata =3D pca955x_pdata_of_init(client, chip);
> +               if (IS_ERR(pdata))
> +                       return PTR_ERR(pdata);
> +       }
>
>         /* Make sure the slave address / chip type combo given is possibl=
e */
>         if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=3D
> @@ -313,36 +495,52 @@ static int pca955x_probe(struct i2c_client *client,
>         pca955x->chipdef =3D chip;
>
>         for (i =3D 0; i < chip->bits; i++) {
> +               struct pca955x_led *pled =3D &pdata->leds[i];
> +
>                 pca955x_led =3D &pca955x->leds[i];
>                 pca955x_led->led_num =3D i;
>                 pca955x_led->pca955x =3D pca955x;
> -
> -               /* Platform data can specify LED names and default trigge=
rs */
> -               if (pdata) {
> -                       if (pdata->leds[i].name)
> +               pca955x_led->type =3D pled->type;
> +
> +               switch (pca955x_led->type) {
> +               case PCA955X_TYPE_NONE:
> +                       break;
> +               case PCA955X_TYPE_GPIO:
> +                       ngpios++;
> +                       break;
> +               case PCA955X_TYPE_LED:
> +                       /*
> +                        * Platform data can specify LED names and
> +                        * default triggers
> +                        */
> +                       if (pdata) {
> +                               if (pdata->leds[i].name)
> +                                       snprintf(pca955x_led->name,
> +                                                sizeof(pca955x_led->name=
),
> +                                                "pca955x:%s",
> +                                                pdata->leds[i].name);
> +                               if (pdata->leds[i].default_trigger)
> +                                       pca955x_led->led_cdev.default_tri=
gger =3D
> +                                               pdata->leds[i].default_tr=
igger;
> +                       } else {
>                                 snprintf(pca955x_led->name,
> -                                       sizeof(pca955x_led->name), "pca95=
5x:%s",
> -                                       pdata->leds[i].name);
> -                       if (pdata->leds[i].default_trigger)
> -                               pca955x_led->led_cdev.default_trigger =3D
> -                                       pdata->leds[i].default_trigger;
> -               } else {
> -                       snprintf(pca955x_led->name, sizeof(pca955x_led->n=
ame),
> -                                "pca955x:%d", i);
> -               }
> +                                        sizeof(pca955x_led->name),
> +                                        "pca955x:%d", i);
> +                       }
>
> -               pca955x_led->led_cdev.name =3D pca955x_led->name;
> -               pca955x_led->led_cdev.brightness_set_blocking =3D pca955x=
_led_set;
> +                       pca955x_led->led_cdev.name =3D pca955x_led->name;
> +                       pca955x_led->led_cdev.brightness_set_blocking =3D
> +                               pca955x_led_set;
>
> -               err =3D led_classdev_register(&client->dev,
> -                                       &pca955x_led->led_cdev);
> -               if (err < 0)
> -                       goto exit;
> -       }
> +                       err =3D led_classdev_register(&client->dev,
> +                                                   &pca955x_led->led_cde=
v);
> +                       if (err < 0)
> +                               goto exit;
>
> -       /* Turn off LEDs */
> -       for (i =3D 0; i < pca95xx_num_led_regs(chip->bits); i++)
> -               pca955x_write_ls(client, i, 0x55);
> +                       /* Turn off LEDs */
> +                       pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +               }
> +       }
>
>         /* PWM0 is used for half brightness or 50% duty cycle */
>         pca955x_write_pwm(client, 0, 255-LED_HALF);
> @@ -354,22 +552,53 @@ static int pca955x_probe(struct i2c_client *client,
>         pca955x_write_psc(client, 0, 0);
>         pca955x_write_psc(client, 1, 0);
>
> +#ifdef CONFIG_LEDS_PCA955X_GPIO
> +       if (ngpios) {
> +               if (pdata->gpio_base =3D=3D -1) {
> +                       dev_warn(&client->dev, "gpio-base is undefined\n"=
);
> +                       goto exit;
> +               }
> +
> +               pca955x->gpio.label =3D "gpio-pca955x";
> +               pca955x->gpio.direction_input =3D pca955x_gpio_direction_=
input;
> +               pca955x->gpio.direction_output =3D pca955x_gpio_direction=
_output;
> +               pca955x->gpio.set =3D pca955x_gpio_set_value;
> +               pca955x->gpio.get =3D pca955x_gpio_get_value;
> +               pca955x->gpio.request =3D pca955x_gpio_request_pin;
> +               pca955x->gpio.can_sleep =3D 1;
> +               pca955x->gpio.base =3D pdata->gpio_base;
> +               pca955x->gpio.ngpio =3D ngpios;
> +               pca955x->gpio.parent =3D &client->dev;
> +               pca955x->gpio.owner =3D THIS_MODULE;
> +
> +               err =3D gpiochip_add_data(&pca955x->gpio, pca955x);
> +               if (err) {
> +                       /* Use data->gpio.dev as a flag for freeing gpioc=
hip */
> +                       pca955x->gpio.parent =3D NULL;
> +                       dev_warn(&client->dev, "could not add gpiochip\n"=
);
> +               } else {
> +                       dev_info(&client->dev, "gpios %i...%i\n",
> +                                pca955x->gpio.base, pca955x->gpio.base +
> +                                pca955x->gpio.ngpio - 1);
> +               }
> +       }
> +#endif
> +
>         return 0;
>
>  exit:
> -       while (i--)
> -               led_classdev_unregister(&pca955x->leds[i].led_cdev);
> -
> +       pca955x_destroy_devices(pca955x, i);
>         return err;
>  }
>
>  static int pca955x_remove(struct i2c_client *client)
>  {
>         struct pca955x *pca955x =3D i2c_get_clientdata(client);
> -       int i;
> +       int err;
>
> -       for (i =3D 0; i < pca955x->chipdef->bits; i++)
> -               led_classdev_unregister(&pca955x->leds[i].led_cdev);
> +       err =3D pca955x_destroy_devices(pca955x, pca955x->chipdef->bits);
> +       if (err)
> +               return err;
>
>         return 0;
>  }
> @@ -378,6 +607,7 @@ static struct i2c_driver pca955x_driver =3D {
>         .driver =3D {
>                 .name   =3D "leds-pca955x",
>                 .acpi_match_table =3D ACPI_PTR(pca955x_acpi_ids),
> +               .of_match_table =3D of_match_ptr(of_pca955x_match),
>         },
>         .probe  =3D pca955x_probe,
>         .remove =3D pca955x_remove,
> --
> 2.7.4
>
