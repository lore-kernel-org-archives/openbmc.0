Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGgvC0wwqzDrD6
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 11:41:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kYsqog/L"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id i6so2848917ywb.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=m3j3Dn3LPlOLRmkbv/xBNQUkh/rmPyUnxyQbsr7UOG8=;
 b=kYsqog/Lz37Qz0lAMHfPvhWTQnKHsv4IypB3G5QoQErdR95kgXwiVsjQGsGMSw/EGZ
 WCyz1BuVjmtfznqGG15gCqzeN64HoE/mc1LvbajHDafATgguFOzqJtv7osbQ/x94duj7
 CoErXHSxUbEW6wbUh7Vehn/aa1SOax7322joDAdE1RlGgtaIe86XUqHsFcMbvTEOKoyG
 lLjWkx5d/NBW0AUbso2C2B/PWbdTvJKqXKnDTwcD9lme2lJTPI2DjmFLEREyMuC8tu2E
 UspFM62e7RlBzXPC7QsCDa4fYJjFjZT5YxH/QSgwhzfLpBpAxUUfPtI3oA2CmjQgriNk
 RsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=m3j3Dn3LPlOLRmkbv/xBNQUkh/rmPyUnxyQbsr7UOG8=;
 b=GEcyFx3gHgmnbMm3uJQRd/MNIHsIzLWrB+UgLUi49lf2PWNVJgg8TcgqZm0FQbAeSF
 ndUfDWsjBHahIOXPBoyEfF7/JURXk0mQFoljkgubsjD6BXnWkzLroyLlGewgMAVJVGlh
 DdQmvU6TuQozHXp4njC0zz6LMFujEXmjvPupNd8bvMNEw73OPfQ6nLvMaf5aU/qxND+5
 n5BDX8/M7SuZ/011Fkr8FR5T8fiizH/4gqIdcvr7cO0Qnp8ootFzAPveBjsNtrC3a3hg
 UHvP1pINuVRE99KE1WlJeytaF2DN8EubISektk6A0sBAbAg/4Epl9sJoFtRcxJh8cdgl
 PInQ==
X-Gm-Message-State: AIVw111DS6syf2AKxl0CVtAl7PnYbLs0qqmB2ekSRjOo39XJyfGhcj71
 j640leVyClEEuaWe2Jc3aicPIcRhi5Y0
X-Received: by 10.37.230.141 with SMTP id d135mr14892717ybh.281.1500946885091; 
 Mon, 24 Jul 2017 18:41:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Mon, 24 Jul 2017 18:41:04 -0700 (PDT)
In-Reply-To: <20170724212509.85197-2-cbostic@linux.vnet.ibm.com>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
 <20170724212509.85197-2-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jul 2017 11:11:04 +0930
X-Google-Sender-Auth: W3rcP-PpyhQ7wgjvRR3xRidXr9A
Message-ID: <CACPK8XetDCZc7F=DzL_wg=jH_t-6Z=FDVb-0FkRz8x9k7oK2bQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/2] drivers/iio: dps310 Temperature
 measurement fix.
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
X-List-Received-Date: Tue, 25 Jul 2017 01:41:27 -0000

On Tue, Jul 25, 2017 at 6:55 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Add a manufacturer's suggested workaround to deal with early revisions
> of chip that don't indicate correct temperature.  Readings can be in the
> ~60C range when they should be in the ~20's.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Looks okay Chris. Has there been an errata issued for the device so I
can check what we're doing here?

I don't think there's much value in the #defines without meaningful
labels, so I removed them when applying the patch.

Cheers,

Joel

> ---
>  drivers/iio/pressure/dps310.c | 49 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 1b54ae0..f351c26 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -56,7 +56,12 @@
>  #define  DPS310_FIFO_EN                BIT(5)
>  #define  DPS310_SPI_EN         BIT(6)
>  #define DPS310_RESET           0x0c
> +#define DPS310_TEMP_FIX_E      0x0e
> +#define DPS310_TEMP_FIX_F      0x0f
>  #define  DPS310_RESET_MAGIC    (BIT(0) | BIT(3))
> +#define DPS310_TEMP_FIX_32     0x32
> +#define  DPS310_TEMP_ERR_FIXED BIT(1)
> +#define DPS310_TEMP_FIX_62     0x62
>  #define DPS310_COEF_BASE       0x10
>
>  #define DPS310_PRS_BASE                DPS310_PRS_B0
> @@ -219,6 +224,9 @@ static bool dps310_is_writeable_reg(struct device *dev, unsigned int reg)
>         case DPS310_MEAS_CFG:
>         case DPS310_CFG_REG:
>         case DPS310_RESET:
> +       case DPS310_TEMP_FIX_E:
> +       case DPS310_TEMP_FIX_F:
> +       case DPS310_TEMP_FIX_62:
>                 return true;
>         default:
>                 return false;
> @@ -308,7 +316,7 @@ static int dps310_read_raw(struct iio_dev *iio,
>         .writeable_reg = dps310_is_writeable_reg,
>         .volatile_reg = dps310_is_volatile_reg,
>         .cache_type = REGCACHE_RBTREE,
> -       .max_register = 0x29,
> +       .max_register = 0x62,
>  };
>
>  static const struct iio_info dps310_info = {
> @@ -317,6 +325,41 @@ static int dps310_read_raw(struct iio_dev *iio,
>         .write_raw = dps310_write_raw,
>  };
>
> +/*
> + * Some verions of chip will read temperatures in the ~60C range when
> + * its acutally ~20C. This is the manufacturer recommended workaround
> + * to correct the issue.
> + */
> +static int dps310_temp_workaround(struct dps310_data *data)
> +{
> +       int r, reg;
> +
> +       r = regmap_read(data->regmap, DPS310_TEMP_FIX_32, &reg);
> +       if (r < 0)
> +               return r;
> +
> +       if (!(reg & DPS310_TEMP_ERR_FIXED)) {
> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0xA5);
> +               if (r < 0)
> +                       return r;
> +
> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x96);
> +               if (r < 0)
> +                       return r;
> +
> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_62, 0x02);
> +               if (r < 0)
> +                       return r;
> +
> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0x00);
> +               if (r < 0)
> +                       return r;
> +
> +               r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x00);
> +       }
> +       return r;
> +}
> +
>  static int dps310_probe(struct i2c_client *client,
>                         const struct i2c_device_id *id)
>  {
> @@ -379,6 +422,10 @@ static int dps310_probe(struct i2c_client *client,
>         if (r < 0)
>                 return r;
>
> +       r = dps310_temp_workaround(data);
> +       if (r < 0)
> +               return r;
> +
>         r = devm_iio_device_register(&client->dev, iio);
>         if (r)
>                 return r;
> --
> 1.8.2.2
>
