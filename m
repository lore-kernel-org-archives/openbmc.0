Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wprWJ2fCCzDq8B
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VoYWUSNn"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id j65so1366138ybj.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IK6aQcDIWpl3Zh21YoaFYv15fCfP3akvLIPOVvcQL7g=;
 b=VoYWUSNnC2lIgkkTKd7OQpOuYfAmClSN9K7vM00MsRN6h6+XzjRBK17Ow6hrbawM/f
 Xbq+Sm7dPFvnhoGrPTI0nhlyU49I4OwSyD2YtWCH0O+d2bYOH8ZgxgTlvGciRROoRPi8
 TO+Bhiw+DulTW8a6rd+hgJ2njhpiXPe2dt1erw6jz0lRJas2GQDhhwut4RgZ/Iye5y1A
 KeU/apGsPlF6JUMLHkyG0g0I0jqofWdp84av/opN74IdZ9iDL9k8mpGJ00RIMBz3NOyY
 OCDXgHpdqfXVGHFnplm8lnqCjIvsyjxXpxbH66HeQ98tZSKag0BqDeTgoLpFQ5Jbz/wW
 Cmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IK6aQcDIWpl3Zh21YoaFYv15fCfP3akvLIPOVvcQL7g=;
 b=kbaCRMzjPnfbfhgDiayBLSXFa2A5X3Ni0NUKenLWDZ1NfkaBBT14MzfIVXRfRPnpCg
 NVpPWmGk5U/LDlDrOOU29i8T0ZnaaqiId4HaaXCKkMVU8FxNmo4wo5yUe5ueH3HFdPad
 G45424iX8XJBDABfar4TP3zaeiaIzRFhGhTEtuJwAwHR7/UeQuYdrqiBrzuuruHfvq0R
 X+327+Vwfpi/hkUm75TeADE2NyrhUu1QK9RkdAnoy0RVxSKWEnhbT7RwhWYiByl51QL6
 xO4Hqg5zHuKnAU1h5HQ69Z/0KDIddvm52wQHsft5uot8R5Pk5pJW1OwHM2F0oSmaQgg2
 E8Dw==
X-Gm-Message-State: AKS2vOwULHRpglPmwQYRYkqigpNp+QQAxLbun6lgBtYUrRlau5YEccTU
 77oU1iAoholei4roYeCk85Kkgz3m7DTIdPg=
X-Received: by 10.37.175.144 with SMTP id g16mr1120896ybh.169.1497595594219;
 Thu, 15 Jun 2017 23:46:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:46:13 -0700 (PDT)
In-Reply-To: <1497013949-8786-2-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
 <1497013949-8786-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 16:16:13 +0930
X-Google-Sender-Auth: o4gqeZWrfA1Br-fQiOHWurkDhT8
Message-ID: <CACPK8XfMUszkpDGsNMg1nxsqFtRwMUA6HJTJ76pg+du-CB_O6Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] leds: pca955x: add device tree support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 16 Jun 2017 06:46:37 -0000

On Fri, Jun 9, 2017 at 10:42 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> It will be used in a following patch to define different operation
> modes for each pin.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

I've applied this series to dev-4.10 make it easier for us to get some test=
ing.

Thanks for sorting this out.

Cheers,

Joel
> ---
>  drivers/leds/leds-pca955x.c | 88 +++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 83 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 78a7ce816a47..a3e61a57d574 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -41,14 +41,17 @@
>   */
>
>  #include <linux/acpi.h>
> -#include <linux/module.h>
> -#include <linux/delay.h>
> -#include <linux/string.h>
>  #include <linux/ctype.h>
> -#include <linux/leds.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
> +#include <linux/gpio.h>
>  #include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>
>  /* LED select registers determine the source that drives LED outputs */
>  #define PCA955X_LS_LED_ON      0x0     /* Output LOW */
> @@ -122,6 +125,12 @@ struct pca955x_led {
>         struct led_classdev     led_cdev;
>         int                     led_num;        /* 0 .. 15 potentially */
>         char                    name[32];
> +       const char              *default_trigger;
> +};
> +
> +struct pca955x_platform_data {
> +       struct pca955x_led      *leds;
> +       int                     num_leds;
>  };
>
>  /* 8 bits per input register */
> @@ -250,6 +259,69 @@ static int pca955x_led_set(struct led_classdev *led_=
cdev,
>         return 0;
>  }
>
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
> +               of_property_read_string(child, "linux,default-trigger",
> +                                       &pdata->leds[reg].default_trigger=
);
> +       }
> +
> +       pdata->num_leds =3D chip->bits;
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
>  static int pca955x_probe(struct i2c_client *client,
>                                         const struct i2c_device_id *id)
>  {
> @@ -257,8 +329,8 @@ static int pca955x_probe(struct i2c_client *client,
>         struct pca955x_led *pca955x_led;
>         struct pca955x_chipdef *chip;
>         struct i2c_adapter *adapter;
> -       struct led_platform_data *pdata;
>         int i, err;
> +       struct pca955x_platform_data *pdata;
>
>         if (id) {
>                 chip =3D &pca955x_chipdefs[id->driver_data];
> @@ -272,6 +344,11 @@ static int pca955x_probe(struct i2c_client *client,
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
> @@ -378,6 +455,7 @@ static struct i2c_driver pca955x_driver =3D {
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
