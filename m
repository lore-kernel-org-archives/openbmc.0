Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVYks3GVXzDqfP
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 16:44:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Y4+HdAqH; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id j2so6186191qkf.1
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ZOZlvYizoFiillog1jWHet5zUDhhRpZbOhsPj9TrTNU=;
 b=Y4+HdAqHp2hI59MM8wlSFKCBRdHTR1MXHyqserSSLkAcgTC6VW1o4f3o58bljG92J4
 xr58O8zfy8RepAb6u+qTWqgLCizLy5Gz+dmZMxrkQVtPw2Nx1O5o3o2RP7B2Rweb1c4E
 8D4kIWI8fVTeIQ/4wQODovcf8KGOGCACWPvckNJjGNaAW8P11xXd0upMZGZDONCreV54
 IiTCe/QB2Zvpi5IUrWD0CYIR9jjjNiTMpw6XeM0NpOLe6icI5440EK7rCzWK78jb+H7L
 ZIrrp99ISUgak4dl1Hfg48rQ7phtARGejyVPWpq9oS3uS5DsktfoEr+203uUwKgdBPJM
 1oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ZOZlvYizoFiillog1jWHet5zUDhhRpZbOhsPj9TrTNU=;
 b=fWpYs6QlEvQBFIoS+OVNxeItv8ZsbizCj2NzK3V8wjMlyWcqO6eaeSWHyUEx97R1gF
 QJijygZU3JSpXWRdx7GCR0dbymEiiQDVpi0R3vt4+qW4BJD20CzUaL40haaDHjp1WDGF
 CLMYBzqdBZHESnfUfrexjqFfHWHNXQ59WgMp8RUZOCfZMXw2wgCrSlSj37ylqkoqzTPO
 OV1WYuCqz0whT4iBjj6SExERvmTwXPZJObyngYXfWhR/twikCOnw8ScttFDHjdZ+wyyz
 bMrMtk6XKfLUb0Z76LVIjJGFX0EsTXxzhnL1VYUvzAvrd/T7Hc75bi2HFE5Q3zrX/Ecd
 j+2A==
X-Gm-Message-State: ALyK8tIXJHh6J5RoLQX0vf8OsZhFNDWtkE1tk2rALr0W6quF60d5T3k2L8lQh+gq8vAefji/GPAmVmdTko61Zg==
X-Received: by 10.55.40.68 with SMTP id o65mr2756821qkh.201.1466059443560;
 Wed, 15 Jun 2016 23:44:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 15 Jun 2016 23:43:44 -0700 (PDT)
In-Reply-To: <1466055100-16521-3-git-send-email-andrew@aj.id.au>
References: <1466055100-16521-1-git-send-email-andrew@aj.id.au>
 <1466055100-16521-3-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2016 16:43:44 +1000
X-Google-Sender-Auth: 6rYFAPV_u403PVWFCLVg3zLAsrA
Message-ID: <CACPK8Xe5eytOZT3FiaMWdVZFiVigTq3DXrfd-aU5ku_cr56sKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ast2400: Integrate the SCU model and configure
 reset values
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Teddy Reed <teddy.reed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 16 Jun 2016 06:44:06 -0000

On Thu, Jun 16, 2016 at 3:31 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Almost all configured reset values are specified by the datasheet. The
> exception is ASPEED_SCU_SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised by the SoC to avoid unnecessary dark corners in
> the SoC's u-boot support.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

LGTM. Can we have an ast2500 one as well?

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  hw/arm/ast2400.c         | 57 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/arm/ast2400.h |  2 ++
>  2 files changed, 59 insertions(+)
>
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 4a9de0e10cbc..fc0da5c38557 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -24,12 +24,48 @@
>  #define AST2400_IOMEM_SIZE       0x00200000
>  #define AST2400_IOMEM_BASE       0x1E600000
>  #define AST2400_VIC_BASE         0x1E6C0000
> +#define AST2400_SCU_BASE         0x1E6E2000
>  #define AST2400_TIMER_BASE       0x1E782000
>  #define AST2400_I2C_BASE         0x1E78A000
>
>  static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
>  static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
>
> +static const AspeedSCUResetCfg scu_reset[] =3D {
> +    /* Values are defaults from the datasheet except where noted */
> +    { ASPEED_SCU_SYS_RST_CTRL,   0xFFCFFEDCU },
> +    { ASPEED_SCU_CLK_SEL,        0xF3F40000U },
> +    { ASPEED_SCU_CLK_STOP_CTRL,  0x19FC3E8BU },
> +    { ASPEED_SCU_D2PLL_PARAM,    0x00026108U },
> +    { ASPEED_SCU_MPLL_PARAM,     0x00030291U },
> +    { ASPEED_SCU_HPLL_PARAM,     0x00000291U },
> +    { ASPEED_SCU_MISC_CTRL1,     0x00000010U },
> +    { ASPEED_SCU_PCI_CTRL1,      0x20001A03U },
> +    { ASPEED_SCU_PCI_CTRL2,      0x20001A03U },
> +    { ASPEED_SCU_PCI_CTRL3,      0x04000030U },
> +    { ASPEED_SCU_SYS_RST_STATUS, 0x00000001U },
> +    { ASPEED_SCU_SOC_SCRATCH1,   0x000000C0U }, /* SoC completed DRAM in=
it */
> +    { ASPEED_SCU_MISC_CTRL2,     0x00000023U },
> +    { ASPEED_SCU_HW_STRAP1,      0x120CE416U }, /* Extracted after boot =
*/
> +    { ASPEED_SCU_RNG_CTRL,       0x0000000EU },
> +    { ASPEED_SCU_REV_ID,         0x02000303U },
> +    { ASPEED_SCU_PINMUX_CTRL2,   0x0000F000U },
> +    { ASPEED_SCU_PINMUX_CTRL3,   0x01000000U },
> +    { ASPEED_SCU_PINMUX_CTRL4,   0x000000FFU },
> +    { ASPEED_SCU_PINMUX_CTRL5,   0x0000A000U },
> +    { ASPEED_SCU_WDT_RST_CTRL,   0x003FFFF3U },
> +    { ASPEED_SCU_PINMUX_CTRL8,   0xFFFF0000U },
> +    { ASPEED_SCU_PINMUX_CTRL9,   0x000FFFFFU },
> +    { ASPEED_SCU_FREE_CNTR4,     0x000000FFU },
> +    { ASPEED_SCU_FREE_CNTR4_EXT, 0x000000FFU },
> +    { ASPEED_SCU_CPU2_BASE_SEG1, 0x80000000U },
> +    { ASPEED_SCU_CPU2_BASE_SEG4, 0x1E600000U },
> +    { ASPEED_SCU_CPU2_BASE_SEG5, 0xC0000000U },
> +    { ASPEED_SCU_UART_HPLL_CLK,  0x00001903U },
> +    { ASPEED_SCU_PCIE_CTRL,      0x0000007BU },
> +    { ASPEED_SCU_BMC_DEV_ID,     0x00002402U }
> +};
> +
>  /*
>   * IO handlers: simply catch any reads/writes to IO addresses that aren'=
t
>   * handled by a device mapping.
> @@ -57,6 +93,7 @@ static const MemoryRegionOps ast2400_io_ops =3D {
>
>  static void ast2400_init(Object *obj)
>  {
> +    int i;
>      AST2400State *s =3D AST2400(obj);
>
>      s->cpu =3D cpu_arm_init("arm926");
> @@ -72,6 +109,18 @@ static void ast2400_init(Object *obj)
>      object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
>      object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
>      qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> +
> +    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
> +    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> +
> +    qdev_prop_set_uint32(DEVICE(&s->scu), "len-reset", ASPEED_SCU_NR_REG=
S);
> +    for (i =3D 0; i < ARRAY_SIZE(scu_reset); i++) {
> +        int reg =3D ASPEED_SCU_TO_REG(scu_reset[i].offset);
> +        char *propname =3D g_strdup_printf("reset[%d]", reg);
> +        qdev_prop_set_uint32(DEVICE(&s->scu), propname, scu_reset[i].val=
);
> +        g_free(propname);
> +    }
>  }
>
>  static void ast2400_realize(DeviceState *dev, Error **errp)
> @@ -110,6 +159,14 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>
> +    /* SCU */
> +    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
> +
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hds[0]) {
>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
> index c05ed5376736..f1a64fd3893d 100644
> --- a/include/hw/arm/ast2400.h
> +++ b/include/hw/arm/ast2400.h
> @@ -14,6 +14,7 @@
>
>  #include "hw/arm/arm.h"
>  #include "hw/intc/aspeed_vic.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "hw/timer/aspeed_timer.h"
>  #include "hw/i2c/aspeed_i2c.h"
>
> @@ -27,6 +28,7 @@ typedef struct AST2400State {
>      AspeedVICState vic;
>      AspeedTimerCtrlState timerctrl;
>      AspeedI2CState i2c;
> +    AspeedSCUState scu;
>  } AST2400State;
>
>  #define TYPE_AST2400 "ast2400"
> --
> 2.7.4
>
