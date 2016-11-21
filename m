Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCy1YTNzDvjR
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+TCkrmq"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id u15so1449105oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=uFY+7pY2SSUbRCBo1TNHHCFN2FO004ER4MrZTi0ZSl0=;
 b=h+TCkrmqfYwyXOMBTYeuzVR6IqAjpjYzOTTR5UTdTzVSq0pPIrwftr3vfrZa8M0OrV
 SGmW6cvW0YjhOjN2ex6ikQOT6sZJlTDocrX5pDm5nQojdWGfFSuev2Q/M3Z2NA3JbJ7R
 1v8zFhURTjX/MG6NgncfHQAczm0lCkS8/91B7mvRnT1rWl6KZ0lROaB0gnrMgsvbWFhT
 f1rXxUn3wScJP+VLeqhRLWS5HWwnAIQ7Kop4zL3Mj/ZSuP08HOkAEQ/yRstItGnUEiWO
 8fWyVnPjAghxmRnqYgzd0O1erSTHIGKESAu/97UPUqfsNgItiHp2RzNYitfxYcrx4geR
 sYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=uFY+7pY2SSUbRCBo1TNHHCFN2FO004ER4MrZTi0ZSl0=;
 b=a+K2n60CcNX4lz3cYmmbauue4XxRNo8Wgmawo/HObQNB7848pIPGobFmOxgyty9967
 KnpUaQJa4gcFzqfBKeg4RGE4AuMPUptiEh9Hg8IsMemB/WzmRcf3g+B6ygEQhJW2vVYx
 fsRWJIIkJ3+yHLmRiPn7LIhdvcaBzJVul5DLw2Dz8m9Ws6PgNQxk07PqjZW/F7Mgc4kz
 KKSiOqXfxkyPlYsFQu7omIee8mj9544g0oz3ILaQf3JF+TMsvaNS2AGF0gBIYlvZsegQ
 YlFigO13/5oVltTjB6LzIvoxhjmJNmLAKXvtljM5LetTJnKVnnNxeYMW8BGke6NQNaiH
 JKSw==
X-Gm-Message-State: AKaTC02O173Yt5qOWf5qeRYhuSDi2Dpa3izXTxZxJVjiQuOF1aDEliIsoZ+dZUBPL8KX8BN5GE1JfaZwvaypLg==
X-Received: by 10.157.24.41 with SMTP id b38mr7378680ote.117.1479713244429;
 Sun, 20 Nov 2016 23:27:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:27:04 -0800 (PST)
In-Reply-To: <1479478938-13267-34-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-34-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:57:04 +1030
X-Google-Sender-Auth: B5YcywsDFvi2qT5cTv2mGI9Eegw
Message-ID: <CACPK8XeWmk_uRegqwcA2Di09RBzdJbShk=H7n=ow_=8Y0HQYWQ@mail.gmail.com>
Subject: Re: [PATCH qemu 33/38] wdt: aspeed: use scu to get clock freq
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:26 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c              |  2 ++
>  hw/misc/aspeed_scu.c             | 12 ++++++++++++
>  hw/watchdog/wdt_aspeed.c         | 19 +++++++++++++++----
>  include/hw/misc/aspeed_scu.h     |  1 +
>  include/hw/watchdog/wdt_aspeed.h |  2 ++
>  5 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2926ed2dd46d..06c1f03555b1 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -173,6 +173,8 @@ static void aspeed_soc_init(Object *obj)
>      object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
>      object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
>      qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
> +    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->sc=
u),
> +                                   NULL);
>  }
>
>  static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index b5efba9121b2..3f577ca12771 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -268,6 +268,18 @@ bool is_supported_silicon_rev(uint32_t silicon_rev)
>      return false;
>  }
>
> +#define ASPEED_PLL_25MHZ    25000000
> +#define ASPEED_PLL_24MHZ    24000000
> +#define ASPEED_PLL_12MHZ    12000000
> +
> +uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
> +{
> +    if (scu->hw_strap1 & AST2400_CLK_25M_IN)
> +        return ASPEED_PLL_25MHZ;
> +    else
> +        return ASPEED_PLL_24MHZ;
> +}
> +
>  static void aspeed_scu_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 860d4b73e2b6..276783de90ad 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -7,10 +7,12 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qapi/error.h"
>  #include "sysemu/watchdog.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/watchdog/wdt_aspeed.h"
> +#include "hw/misc/aspeed_scu.h"
>
>  #define WDT_IO_REGION_SIZE      0x1000
>
> @@ -56,8 +58,6 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr of=
fset, unsigned size)
>
>  }
>
> -#define PCLK_HZ 24000000
> -
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>                               unsigned size)
>  {
> @@ -82,7 +82,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
>
>              if (pclk) {
>                  reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
> -                                  PCLK_HZ) ;
> +                                  s->pclk_freq);
>              } else {
>                  reload =3D s->reg_reload_value * 1000;
>              }
> @@ -99,7 +99,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
>
>              if (pclk) {
>                  reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
> -                                  PCLK_HZ);
> +                                  s->pclk_freq);
>              } else {
>                  reload =3D s->reg_reload_value * 1000;
>              }
> @@ -177,10 +177,21 @@ static void aspeed_wdt_realize(DeviceState *dev, Er=
ror **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      AspeedWDTState *s =3D ASPEED_WDT(dev);
> +    Object *obj;
> +    Error *err =3D NULL;
>
>      s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed,
>                              dev);
>
> +    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
> +    if (!obj) {
> +        error_setg(errp, "%s: required link 'scu' not found: %s",
> +                   __func__, error_get_pretty(err));
> +        return;
> +    }
> +
> +    s->pclk_freq =3D aspeed_scu_get_clk(ASPEED_SCU(obj));
> +
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>                            TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
>      sysbus_init_mmio(sbd, &s->iomem);
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index bd4ac013f997..067f9f01819d 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -37,6 +37,7 @@ typedef struct AspeedSCUState {
>  #define AST2500_A1_SILICON_REV   0x04010303U
>
>  extern bool is_supported_silicon_rev(uint32_t silicon_rev);
> +extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
>
>  /*
>   * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
> index dbf45ae968db..0483335ecee5 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
>      uint32_t reg_reload_value;
>      uint32_t reg_restart;
>      uint32_t reg_ctrl;
> +
> +    uint32_t pclk_freq;
>  } AspeedWDTState;
>
>  #endif  /* ASPEED_WDT_H */
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
