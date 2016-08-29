Return-Path: <xow@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNSR522kWzDrdq
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 09:24:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=BMLzDZHR; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id l2so2716048qkf.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 16:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jQ1c+Bkh0/bMhx5SBDUa68RoGAgZ7XgfMkQvv2f1mWc=;
 b=BMLzDZHRMxOx0WJ22q31QMWS6fYyqUVh7LmxnLNeInVztq+GMr5s+1Xqpq9wxCgT/U
 JLMhkbFniAYUyZa7ZwSxyTLfSAvFjWWEA953kRcFb9JVqRYd35SB6ALSv3CbKjIj7Icj
 QT3vab61xZ02F1JWXy0D0tspWoHm2GHSfw1CVeMB8peIXVUftEpvdDu4jT5t+ihhdv6Q
 X+vaqX1Whzr5kD+jnhol+oka7u+do3GvCpk9Jbx/yC3AOiqrc/9ECrOIyNguH3R8qn86
 2hZ4qGC8POEnDQn5cl35ZzoV4IopacN05DY4wzPriOO38gPn62mzaI5JdQ6BDUfEQute
 7MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jQ1c+Bkh0/bMhx5SBDUa68RoGAgZ7XgfMkQvv2f1mWc=;
 b=FX9nomU+p2kW8riIlqT7FBdF8/PZs5+0OlDCFCAgwYyMX2oTUmMNCTAytnGrPM0ZGy
 BRjrBKqL3+h9XEzjMrg7u7daIp1tbfpDYQVwdaIQhbdUROy8nZhxSopykOBJEbJEg8JZ
 PXJWlSMOpJB9qxFUnidMpUN+NBfMneDO4F2CR85DocMDUGP/JPP4KMG2vfxh9CIWu+uV
 b1NoFpL0KXPMagjTWOkONCXu66aUWfrybTZ3of2NxRRJu/+jFBaeZiIzbTeEwi30/jU8
 fONmFg9Y9Ugh/xGKdnWbmsV7UqTuwsZvbattc5B8Hym/MUnalY0juD2Y6uNTZeZBkm+p
 9UIw==
X-Gm-Message-State: AE9vXwNjRfLQJbMCHM4qhoXaxFBIV86R6TGGvF4/pGAg16jpuGKgnku5dIzCIu56EfAuxXGi+JAJWozbgY/WRyzX
X-Received: by 10.55.185.197 with SMTP id j188mr670995qkf.288.1472513071080;
 Mon, 29 Aug 2016 16:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.42.194 with HTTP; Mon, 29 Aug 2016 16:24:30 -0700 (PDT)
In-Reply-To: <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
From: Xo Wang <xow@google.com>
Date: Mon, 29 Aug 2016 16:24:30 -0700
Message-ID: <CAPH-5w6ZZPY4Gpx7VpgR2hNcmUTN218Vd3XEt1j+Mdgc5UzJ9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: added quirk for 24c08 devices
To: Brendan Higgins <brendanhiggins@google.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 23:24:34 -0000

On Sat, Aug 20, 2016 at 6:34 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Some 24c08 devices exhibits a quirk where they will not NACK durring an

BTW, the I2C EEPROM on our AST2500 EVBs are actually generic clones of
the 24C04, with 4K of storage. This isn't mentioned on the schematic,
which is why the DTS for dev-4.7 shows a 24C08-compatible device.

> acknowledge poll. Added a STOP after the dummy write to address problem.
> ---
>  drivers/misc/eeprom/at24.c         | 12 +++++++++++-
>  include/linux/platform_data/at24.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 9ceb63b..c647efb 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -120,7 +120,11 @@ static const struct i2c_device_id at24_ids[] = {
>                 AT24_FLAG_READONLY | AT24_FLAG_IRUGO) },
>         { "24c04", AT24_DEVICE_MAGIC(4096 / 8, 0) },
>         /* 24rf08 quirk is handled at i2c-core */
> -       { "24c08", AT24_DEVICE_MAGIC(8192 / 8, 0) },
> +       /* 24c08 exhibits a quirk where it will not NACK durring an
> +        * acknowledge poll so we have to send a stop after the dummy write in
> +        * a read.
> +        */
> +       { "24c08", AT24_DEVICE_MAGIC(8192 / 8, AT24_FLAG_STOPPOLL) },
>         { "24c16", AT24_DEVICE_MAGIC(16384 / 8, 0) },
>         { "24c32", AT24_DEVICE_MAGIC(32768 / 8, AT24_FLAG_ADDR16) },
>         { "24c64", AT24_DEVICE_MAGIC(65536 / 8, AT24_FLAG_ADDR16) },
> @@ -212,6 +216,12 @@ static ssize_t at24_eeprom_read(struct at24_data *at24, char *buf,
>                 msgbuf[i++] = offset;
>
>                 msg[0].addr = client->addr;
> +               /*
> +                * Some EEPROMs do not perform the acknowledge poll correctly
> +                * and have to send a STOP after the dummy write.
> +                */
> +               if (at24->chip.flags & AT24_FLAG_STOPPOLL)
> +                       msg[0].flags = I2C_M_STOP;
>                 msg[0].buf = msgbuf;
>                 msg[0].len = i;
>
> diff --git a/include/linux/platform_data/at24.h b/include/linux/platform_data/at24.h
> index be830b1..1773822 100644
> --- a/include/linux/platform_data/at24.h
> +++ b/include/linux/platform_data/at24.h
> @@ -47,6 +47,7 @@ struct at24_platform_data {
>  #define AT24_FLAG_READONLY     0x40    /* sysfs-entry will be read-only */
>  #define AT24_FLAG_IRUGO                0x20    /* sysfs-entry will be world-readable */
>  #define AT24_FLAG_TAKE8ADDR    0x10    /* take always 8 addresses (24c00) */
> +#define AT24_FLAG_STOPPOLL     0x08    /* Send stop before ACK poll */
>
>         void            (*setup)(struct nvmem_device *nvmem, void *context);
>         void            *context;
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

cheers
xo
