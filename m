Return-Path: <clg@kaod.org>
X-Greylist: delayed 2331 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Aug 2017 19:37:20 AEST
Received: from 1.mo177.mail-out.ovh.net (1.mo177.mail-out.ovh.net
 [178.33.107.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS5lN4sPSzDqyV
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:37:19 +1000 (AEST)
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id DC0C474070
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 10:58:25 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id E953C7C0082;
 Wed,  9 Aug 2017 10:58:16 +0200 (CEST)
Subject: Re: [PATCH for 2.11 v2 1/2] watchdog: wdt_aspeed: Add support for the
 reset width register
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, joel@jms.id.au,
 f4bug@amsat.org, ryan_chen@aspeedtech.com, openbmc@lists.ozlabs.org
References: <20170809062828.3673-1-andrew@aj.id.au>
 <20170809062828.3673-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8d122179-665f-2cbe-939e-2e466b98b28d@kaod.org>
Date: Wed, 9 Aug 2017 10:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170809062828.3673-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14893685446081088258
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrkeehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 09 Aug 2017 09:37:21 -0000

On 08/09/2017 08:28 AM, Andrew Jeffery wrote:
> The reset width register controls how the pulse on the SoC's WDTRST{1,2}
> pins behaves. A pulse is emitted if the external reset bit is set in
> WDT_CTRL. On the AST2500 WDT_RESET_WIDTH can consume magic bit patterns
> to configure push-pull/open-drain and active-high/active-low
> behaviours and thus needs some special handling in the write path.
> 
> As some of the capabilities depend on the SoC version a silicon-rev
> property is introduced, which is used to guard version-specific
> behaviour.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

One minor comment below. Nevertheless :

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/watchdog/wdt_aspeed.c         | 93 +++++++++++++++++++++++++++++++++++-----
>  include/hw/watchdog/wdt_aspeed.h |  2 +
>  2 files changed, 84 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 8bbe579b6b66..22bce364d7b5 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -8,16 +8,19 @@
>   */
>  
>  #include "qemu/osdep.h"
> +
> +#include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "qemu/timer.h"
>  #include "sysemu/watchdog.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "hw/sysbus.h"
> -#include "qemu/timer.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  
> -#define WDT_STATUS              (0x00 / 4)
> -#define WDT_RELOAD_VALUE        (0x04 / 4)
> -#define WDT_RESTART             (0x08 / 4)
> -#define WDT_CTRL                (0x0C / 4)
> +#define WDT_STATUS                      (0x00 / 4)
> +#define WDT_RELOAD_VALUE                (0x04 / 4)
> +#define WDT_RESTART                     (0x08 / 4)
> +#define WDT_CTRL                        (0x0C / 4)
>  #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
>  #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
>  #define   WDT_CTRL_1MHZ_CLK             BIT(4)
> @@ -25,18 +28,41 @@
>  #define   WDT_CTRL_WDT_INTR             BIT(2)
>  #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
>  #define   WDT_CTRL_ENABLE               BIT(0)
> +#define WDT_RESET_WIDTH                 (0x18 / 4)
> +#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
> +#define     WDT_POLARITY_MASK           (0xFF << 24)
> +#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
> +#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
> +#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
> +#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
> +#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
> +#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
>  
> -#define WDT_TIMEOUT_STATUS      (0x10 / 4)
> -#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
> -#define WDT_RESET_WDITH         (0x18 / 4)
> +#define WDT_TIMEOUT_STATUS              (0x10 / 4)
> +#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
>  
> -#define WDT_RESTART_MAGIC       0x4755
> +#define WDT_RESTART_MAGIC               0x4755
>  
>  static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
>  {
>      return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
>  }
>  
> +static bool is_ast2500(const AspeedWDTState *s)

I think we could use this routine in other controllers (scu, sdmc). 
So may be, in a follow-up patch, we could move it in aspeed_scu.h

Thanks,

C. 
 
> +{
> +    switch (s->silicon_rev) {
> +    case AST2500_A0_SILICON_REV:
> +    case AST2500_A1_SILICON_REV:
> +        return true;
> +    case AST2400_A0_SILICON_REV:
> +    case AST2400_A1_SILICON_REV:
> +    default:
> +        break;
> +    }
> +
> +    return false;
> +}
> +
>  static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      AspeedWDTState *s = ASPEED_WDT(opaque);
> @@ -55,9 +81,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      case WDT_CTRL:
>          return s->regs[WDT_CTRL];
> +    case WDT_RESET_WIDTH:
> +        return s->regs[WDT_RESET_WIDTH];
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> @@ -119,9 +146,27 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>              timer_del(s->timer);
>          }
>          break;
> +    case WDT_RESET_WIDTH:
> +    {
> +        uint32_t property = data & WDT_POLARITY_MASK;
> +
> +        if (property && is_ast2500(s)) {
> +            if (property == WDT_ACTIVE_HIGH_MAGIC) {
> +                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
> +            } else if (property == WDT_ACTIVE_LOW_MAGIC) {
> +                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
> +            } else if (property == WDT_PUSH_PULL_MAGIC) {
> +                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
> +            } else if (property == WDT_OPEN_DRAIN_MAGIC) {
> +                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
> +            }
> +        }
> +        s->regs[WDT_RESET_WIDTH] &= ~s->ext_pulse_width_mask;
> +        s->regs[WDT_RESET_WIDTH] |= data & s->ext_pulse_width_mask;
> +        break;
> +    }
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> @@ -167,6 +212,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
>      s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
>      s->regs[WDT_RESTART] = 0;
>      s->regs[WDT_CTRL] = 0;
> +    s->regs[WDT_RESET_WIDTH] = 0xFF;
>  
>      timer_del(s->timer);
>  }
> @@ -187,6 +233,25 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      AspeedWDTState *s = ASPEED_WDT(dev);
>  
> +    if (!is_supported_silicon_rev(s->silicon_rev)) {
> +        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
> +                s->silicon_rev);
> +        return;
> +    }
> +
> +    switch (s->silicon_rev) {
> +    case AST2400_A0_SILICON_REV:
> +    case AST2400_A1_SILICON_REV:
> +        s->ext_pulse_width_mask = 0xff;
> +        break;
> +    case AST2500_A0_SILICON_REV:
> +    case AST2500_A1_SILICON_REV:
> +        s->ext_pulse_width_mask = 0xfffff;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
>  
>      /* FIXME: This setting should be derived from the SCU hw strapping
> @@ -199,6 +264,11 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
>  
> +static Property aspeed_wdt_properties[] = {
> +    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -207,6 +277,7 @@ static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
>      dc->reset = aspeed_wdt_reset;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      dc->vmsd = &vmstate_aspeed_wdt;
> +    dc->props = aspeed_wdt_properties;
>  }
>  
>  static const TypeInfo aspeed_wdt_info = {
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index 080c2231222e..7de3e5c224fb 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -27,6 +27,8 @@ typedef struct AspeedWDTState {
>      uint32_t regs[ASPEED_WDT_REGS_MAX];
>  
>      uint32_t pclk_freq;
> +    uint32_t silicon_rev;
> +    uint32_t ext_pulse_width_mask;
>  } AspeedWDTState;
>  
>  #endif  /* ASPEED_WDT_H */
> 
