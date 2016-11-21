Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMg9m6DMWzDvPc
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NHlm4kpY"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so2036984oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=mnTlOCm3Aro1mS8EZFJ7/T9OzDjqRXvEYP0huBK62l8=;
 b=NHlm4kpYSC3Qg/AFeh3R5lAww7+NypE0wwCYS9qlVl+1bZ+eSrvfsZS2U8ig5uEtv7
 6GVuaTov8uYKDjeTpssG1cBjfzT7/aghe4f3PA3s3PqEQTbHWqvkLUpenb0RnXdrK17N
 M5g0HsED8Mh/z/TJd+Rbrs0Fcnvo6ij3/ZZBIWlcrXkDlbzJVyQkBzyVetKkb1ARif4O
 mxvCGvx37USlWy7K5JmmLGuOJT/yNXqv36NUOQExVh2Sipyynu5QwFXnoL40fxT/SMKM
 sRnJpkRJSpgMDcWkfxSpqwxdNLW3GzP0ExbpIt6c0xmnpI5+6TY8TdH1jtYDnmds0Mdl
 qPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=mnTlOCm3Aro1mS8EZFJ7/T9OzDjqRXvEYP0huBK62l8=;
 b=lZdggKWQENZdvsAebeTeHZdSn2elYwWLN4hv9Uy6ltIgbr3sQkgq+bES+0XzyXILCX
 3wlmLvQ3zTsDJlqcg9vI456D0ZDwfEFsltoy81c9R0LxYQEeT3sb7phdOZTB4Wk2RewP
 faAaihjAPZTjpDFVE4b8H5cm8uQzn1H4UrXBkASL1I9klenI6V5MqF8k1Y7OcG8XE0oL
 Rw+c0ItPmeVT1Spu2DyI9By5GkQEl4vr+hVkE0oZaOkanl21yrG9ltj+zA9HNMiTOxS0
 pMwjY6TGp3kU5dNc/0qYxXCVT0oq6zLP/EueXQhqWmT6xt5RqEWApG0uely8gHC3mY74
 1XKg==
X-Gm-Message-State: AKaTC025F4AEHfPgIy+Uy09iDwh/MO8TZQIYX2lTb3SBc1nOCBVkLXPJgV20cJ1XKog63Dafl4yHXHzpDaTaLg==
X-Received: by 10.157.63.199 with SMTP id i7mr8529286ote.63.1479713131116;
 Sun, 20 Nov 2016 23:25:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:10 -0800 (PST)
In-Reply-To: <1479478938-13267-3-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:10 +1030
X-Google-Sender-Auth: W_2ASp7HwWesrxv6EJBrlbbbRo8
Message-ID: <CACPK8XfH1ckUeFgeRtGHA6_XPqOKE4PA5ZbTQAT-jg_ReyMZKA@mail.gmail.com>
Subject: Re: [PATCH qemu 02/38] aspeed: QOMify the CPU object and attach it to
 the SoC
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:33 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c         | 17 ++++++++++++++---
>  include/hw/arm/aspeed_soc.h |  2 +-
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index e14f5c217eab..db145e201451 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -87,9 +87,13 @@ static void aspeed_soc_init(Object *obj)
>  {
>      AspeedSoCState *s =3D ASPEED_SOC(obj);
>      AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
> +    char *cpu_typename;
>      int i;
>
> -    s->cpu =3D cpu_arm_init(sc->info->cpu_model);
> +    cpu_typename =3D g_strdup_printf("%s-" TYPE_ARM_CPU, sc->info->cpu_m=
odel);
> +    object_initialize(&s->cpu, sizeof(s->cpu), cpu_typename);
> +    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    g_free(cpu_typename);
>
>      object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
>      object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> @@ -146,6 +150,13 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>      memory_region_add_subregion_overlap(get_system_memory(),
>                                          ASPEED_SOC_IOMEM_BASE, &s->iomem=
, -1);
>
> +    /* CPU */
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      /* VIC */
>      object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
>      if (err) {
> @@ -154,9 +165,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, ASPEED_SOC_VIC_BASE);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
>
>      /* Timer */
>      object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 5406b498d7ef..6f1b679c97b1 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -27,7 +27,7 @@ typedef struct AspeedSoCState {
>      DeviceState parent;
>
>      /*< public >*/
> -    ARMCPU *cpu;
> +    ARMCPU cpu;
>      MemoryRegion iomem;
>      AspeedVICState vic;
>      AspeedTimerCtrlState timerctrl;
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
