Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sN03k6zGSzDrgb
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 15:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eyojRnH5; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 35so3141856uaj.3
 for <openbmc@lists.ozlabs.org>; Sun, 28 Aug 2016 22:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lQDttV91ajK49TdoHCbVeBa7dGjRSNZfrw7gcAIwz+c=;
 b=eyojRnH5MVM5+aJyE74cz5k0hTAvkmBd681VO3eNt7QicLSejtvYKik+RF0+n7uI0+
 ZBKt/burueX9/QmgmsvDdFFXR0yu0Yu7PT9r9/lU/NI/Yp2BZsfCC9rfV1X4pfr5Y+3o
 KXIqVZ/EC8KhzqIL+t+7d+9T0vGI+zxOuFerrc43p32Wb6Y+Iv85nMAsq0qdvk59p90T
 L/7PNFkwbRuHcwLNYPWUgIoClBolR3Mfdxf7tfCt+JTiMLH+CtIr7xIJIZbn3YQ695oD
 ngByl02tWhjSwK3LDpd0yKf3xXAhnTREL3Zi2Cpm8/efbAfSHO4O0KEolKgWEjkUNNLV
 BFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lQDttV91ajK49TdoHCbVeBa7dGjRSNZfrw7gcAIwz+c=;
 b=cf8ujT6efAP2Zg690vuURp3KdLIt3HhIiVxHvt0Fs9yv0v5NOVzu7jT/YssISbs/Mv
 mTIN+N1t66yZNvINuo2xVFd75c8uXATkippdT+Gbwt5AiJng5QGPm67YHC+wU0coWB0h
 77/ziQAWTghZu0L89JURzo3QKdC3pJHB+AYqX0hwj6XalEUDbEoFau1EZOgJnW3XFioC
 Z0AnGCV8UhcnnQbr24hm6Cgps0kxwqX1dzyWw5lFNi8i8cz8sDiIZX1PIlFBMcj/eBCB
 Cbz+5+QwGwrK3ClI63zmmYRkkqTj347p1LyckwvDzJBdEkt9XdvaiAbsc1n5euqahxGH
 vOwA==
X-Gm-Message-State: AE9vXwPhmRZYPIyWpO/DRu7gFpmZYupA091CqfLmP7LLFm4Pn8cmW0d+bZt6aiRJXs6E4r9JxgViYtIIZezf6Q==
X-Received: by 10.31.78.3 with SMTP id c3mr8506769vkb.41.1472447167601; Sun,
 28 Aug 2016 22:06:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 28 Aug 2016 22:05:47 -0700 (PDT)
In-Reply-To: <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Aug 2016 14:35:47 +0930
X-Google-Sender-Auth: wZGTaC1H3sFhuHPwLRCuhUZwSSg
Message-ID: <CACPK8XeV4S9mhRUzLks4p3NSeCcOM=vfW+QxXxHuLe5gA=wpmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: added quirk for 24c08 devices
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 29 Aug 2016 05:06:11 -0000

Hi Brendan,

On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Some 24c08 devices exhibits a quirk where they will not NACK durring an
> acknowledge poll. Added a STOP after the dummy write to address problem.

I'm not an i2c nor a eeprom expert. Are we confident that this is this
generic enough that it should be applied to all at24c08 devices?

This needs a signed-off-by. You might want to briefly describe the
hardware you've tested this on.

Once you've added that, please rebase on Linus' tree and send it
directly upstream to the maintainer. You can find the maintainer's
email address and mailing list using scripts/get_maintainer.pl on your
patch.

You can cc me if you would like.

Cheers,

Joel

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
