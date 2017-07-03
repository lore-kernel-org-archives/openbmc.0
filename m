Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1GFF6FGDzDr2R
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 15:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBKTD8KO"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id 84so7402559ybe.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lj+hu93wyVcMxfLlyicRLEVlXP83O6RGnleIVYWAW/U=;
 b=YBKTD8KOYqBzjWLg3oWy92h5fuUnPlljbKKGcAwOfgQsaoaiJHL/kBEQWiNKZbyLHP
 F6Qm416BiPDUpLtQGN0XO4C7AS4cJqrjYSEVpvr3qtMJeoecApyo+SvZXc+iVt8fACFQ
 hPGoG9LnaVUcURf/hT/PD7dG3+dd2f+nwfuq412vxxrKLDdcqTEIR62ymxRWiAGnxhMW
 ZvrcrucHMxpfcpRqrzGiVTMuy7tI6Cqw6GlaI10fo/YVuFl32Bt7NO+WwB7ehbBynX4n
 EdwTIb+bgfvJzLBT+WNQSmC6t7waFU+NPJS4SeJi0tRZEGEe/M5n3XECA/24yq13dm1F
 bSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lj+hu93wyVcMxfLlyicRLEVlXP83O6RGnleIVYWAW/U=;
 b=IWReSSKekoAQNCttCmw4SDbu2Ogcsvu/ku1BxVp0BuajDT6sPFbT2BcwKj4wso+VDS
 HJFVpWam5IJHFpeT2x/8WXCRfckZgcZa/HHF8rNE4dTxVtdgKfGwy21R8WdCc/clVoV5
 K5nEZ5GRvvok03qrZO+RIfZFlkuy4ODc8s+GhRRYvZoKg7yoqyIr7zkrj+ljBrdR3oEN
 Q5brrMAjOifH7Mij8dewzWar7b8paGgCjIv1l36ZpK5ZVwMmGJBx2Wq+26v/+AWkTKC3
 Hy7iAf9thVUsPZlECvYX5dvZOmm4KZcstvbhz7TqjtW53HxooyKVWpefd9Jw010DJCz8
 r0Fw==
X-Gm-Message-State: AKS2vOzUUMqrfPlh23ghq/n5N85573cWVoe4Ypa5SM51kzleGbHtGGIW
 oL7lxVEhyPwPvB6JEWZUvME78lXIvg==
X-Received: by 10.37.177.158 with SMTP id h30mr25640590ybj.214.1499060431519; 
 Sun, 02 Jul 2017 22:40:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 22:40:10 -0700 (PDT)
In-Reply-To: <20170630225521.7612-1-cbostic@linux.vnet.ibm.com>
References: <20170630225521.7612-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 15:10:10 +0930
X-Google-Sender-Auth: rBCPt8V36NYfURTieYpP2VjhTzk
Message-ID: <CACPK8XeNz_paeutQF=ZjUURYWnWNHjWGr_Hb23C1S9tiqaRORg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/leds: Add GPIO keys for PCA955x
 and ast24/2500 gpio
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 03 Jul 2017 05:40:34 -0000

On Sat, Jul 1, 2017 at 8:25 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Define gpio keys for power supply presence, ucd alert, and fan presence.
>
> Link pca955x to parent i2c interrupt controller so that new pca955x gpio
> keys for fan presence haning off of pca955x can be defined.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 77 ++++++++++++++++++++++++
>  drivers/leds/leds-pca955x.c                      | 64 ++++++++++++++++++++

The change to the source file and the .dts should be in separate patches.

>  2 files changed, 141 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..24ea9944 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -46,6 +46,48 @@
>                         gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>                         linux,code = <ASPEED_GPIO(J, 2)>;
>                 };
> +
> +               ps0-presence {
> +                       label = "ps0-presence";
> +                       gpios = <&gpio ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(P, 7)>;
> +               };
> +
> +               ps1-presence {
> +                       label = "ps1-presence";
> +                       gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(N, 0)>;
> +               };
> +
> +               ucd-alert {
> +                       label = "ucd-alert";
> +                       gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(I, 2)>;
> +               };

I don't think this is correct. Isn't the alert line part of the sbmus device?

> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
> +                       linux,code = <0>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +                       linux,code = <1>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +                       linux,code = <2>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +                       linux,code = <3>;
> +               };
>         };
>
>         leds {
> @@ -203,6 +245,41 @@
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
>         };
> +
> +       pca0: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-parent = <&i2c_ic>;
> +               interrupts = <3>;
> +
> +               gpio-line-names = "FAN0_PRESENSE_N", "FAN1_PRESENSE_N",
> +                               "FAN2_PRESENSE_N", "FAN3_PRESENSE_N";
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
>  };
>
>  &i2c4 {
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 9216742..88990f1 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -52,6 +52,7 @@
>  #include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/interrupt.h>
>
>  #include <dt-bindings/leds/leds-pca955x.h>
>
> @@ -389,6 +390,66 @@ static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>  }
>  #endif
>
> +static void pca955x_irq_mask(struct irq_data *d)
> +{
> +}
> +
> +static void pca955x_irq_unmask(struct irq_data *d)
> +{
> +}
> +
> +static void pca955x_irq_bus_lock(struct irq_data *d)
> +{
> +}
> +
> +static void pca955x_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +}

It looks like you sent a half-finished version.

> +
> +static int pca955x_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       return 0;
> +}
> +
> +static struct irq_chip pca955x_irq_chip = {
> +       .name                   = "pca955x",
> +       .irq_mask               = pca955x_irq_mask,
> +       .irq_unmask             = pca955x_irq_unmask,
> +       .irq_bus_lock           = pca955x_irq_bus_lock,
> +       .irq_bus_sync_unlock    = pca955x_irq_bus_sync_unlock,
> +       .irq_set_type           = pca955x_irq_set_type,
> +};
> +
> +static int pca955x_irq_setup(struct pca955x *chip, int irq_base)
> +{
> +       struct i2c_client *client;
> +       int ret;
> +
> +       if (!chip)
> +               return 0;
> +
> +       client = chip->client;
> +       if (!client)
> +               return 0;
> +
> +       if (client->irq && irq_base >= 0) {
> +               ret = gpiochip_irqchip_add_nested(&chip->gpio,
> +                                               &pca955x_irq_chip,
> +                                               irq_base,
> +                                               handle_simple_irq,
> +                                               IRQ_TYPE_NONE);
> +               if (ret) {
> +                       dev_err(&client->dev,
> +                               "could not connect irqchip to gpiochip\n");
> +                       return ret;
> +               }
> +               gpiochip_set_nested_irqchip(&chip->gpio,
> +                                       &pca955x_irq_chip,
> +                                       client->irq);
> +       }
> +       return 0;
> +}
> +
>  static int pca955x_probe(struct i2c_client *client,
>                                         const struct i2c_device_id *id)
>  {
> @@ -543,6 +604,9 @@ static int pca955x_probe(struct i2c_client *client,
>                 }
>         }
>  #endif
> +       err = pca955x_irq_setup(pca955x, 0);
> +       if (err)
> +               return err;
>
>         return 0;
>  }
> --
> 1.8.2.2
>
