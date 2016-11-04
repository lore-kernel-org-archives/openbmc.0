Return-Path: <clg@kaod.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9FCf2FyGzDvYf
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 19:21:01 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7DF2B18D1A
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:04:09 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 2543A3C0080;
 Fri,  4 Nov 2016 09:04:04 +0100 (CET)
Subject: Re: [PATCH qemu] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
To: Andrew Jeffery <andrew@aj.id.au>
References: <1478150842-5636-1-git-send-email-andrew@aj.id.au>
 <bc8975a5-ad34-636d-7c29-ecd4c0a4aea3@kaod.org>
 <1478224157.27396.49.camel@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1972407c-b1f2-0a79-cb91-865ac2744dea@kaod.org>
Date: Fri, 4 Nov 2016 09:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478224157.27396.49.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4681491813291822035
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeekgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 04 Nov 2016 08:21:02 -0000

On 11/04/2016 02:49 AM, Andrew Jeffery wrote:
> On Thu, 2016-11-03 at 09:02 +0100, Cédric Le Goater wrote:
>> On 11/03/2016 06:27 AM, Andrew Jeffery wrote:
>>>
>>> The implementation was incorrectly scaling the reload value by
>>> nanoseconds per second. In reality the span represented by the reload
>>> value is determined by the selected clock, either APB or 1MHz.
>>>
>>> Test the selected clock and apply the appropriate scaling, then convert to
>>> nanoseconds for the timer infrastructure. Note that the APB rate is hard-coded
>>> and reflects the value used by the timer controller, and isn't necessarily an
>>> accurate representation of the clock configuration programmed in the SCU.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ah ! reboot works ! thanks for taking some time to fix this.
>>
>>>
>>> ---
>>>
>>> I'm hesitant to send this upstream as I don't like the idea of hardcoding the
>>> clock rates in the way that we have (i.e. the timer as well). I think we should
>>> rework the timer and the watchdog to derive their clocks from the SCU, but
>>> that's more work than I'm willing to put in to get reboots working.
>> I agree that we should start being more precise in our models and use SCU
>> when needed. See below for a first try 
>>
>> Cheers,
>>
>> C.
>>
>>
>>
>> wdt: aspeed: use scu to get clock freq
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/aspeed_soc.c              |    2 ++
>>  hw/misc/aspeed_scu.c             |   12 ++++++++++++
>>  hw/watchdog/wdt_aspeed.c         |   17 +++++++++++++++--
>>  include/hw/misc/aspeed_scu.h     |    1 +
>>  include/hw/watchdog/wdt_aspeed.h |    2 ++
>>  5 files changed, 32 insertions(+), 2 deletions(-)
>>
>> Index: qemu-aspeed.git/hw/arm/aspeed_soc.c
>> ===================================================================
>> --- qemu-aspeed.git.orig/hw/arm/aspeed_soc.c
>> +++ qemu-aspeed.git/hw/arm/aspeed_soc.c
> 
> !

yeah. I still use quilt :)


>> @@ -144,6 +144,8 @@ static void aspeed_soc_init(Object *obj)
>>      object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
>>      object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
>> +    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
>> +                                   NULL);
>>  }
>>  
>>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>> Index: qemu-aspeed.git/hw/misc/aspeed_scu.c
>> ===================================================================
>> --- qemu-aspeed.git.orig/hw/misc/aspeed_scu.c
>> +++ qemu-aspeed.git/hw/misc/aspeed_scu.c
>> @@ -266,6 +266,18 @@ bool is_supported_silicon_rev(uint32_t s
>>      return false;
>>  }
>>  
>> +#define ASPEED_PLL_25MHZ    25000000
>> +#define ASPEED_PLL_24MHZ    24000000
>> +#define ASPEED_PLL_12MHZ    12000000
>> +
>> +uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
>> +{
>> +    if (scu->hw_strap1 & AST2400_CLK_25M_IN)
>> +        return ASPEED_PLL_25MHZ;
>> +    else
>> +        return ASPEED_PLL_24MHZ;
>> +}
>> +
>>  static void aspeed_scu_realize(DeviceState *dev, Error **errp)
>>  {
>>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> Index: qemu-aspeed.git/hw/watchdog/wdt_aspeed.c
>> ===================================================================
>> --- qemu-aspeed.git.orig/hw/watchdog/wdt_aspeed.c
>> +++ qemu-aspeed.git/hw/watchdog/wdt_aspeed.c
>> @@ -7,10 +7,12 @@
>>  
>>  #include "qemu/osdep.h"
>>  #include "qemu/log.h"
>> +#include "qapi/error.h"
>>  #include "sysemu/watchdog.h"
>>  #include "hw/sysbus.h"
>>  #include "qemu/timer.h"
>>  #include "hw/watchdog/wdt_aspeed.h"
>> +#include "hw/misc/aspeed_scu.h"
>>  
>>  #define WDT_IO_REGION_SIZE 0x1000
>>  
>> @@ -87,7 +89,7 @@ static void aspeed_wdt_write(void *opaqu
>>  
>>              if (pclk) {
>>                  reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
>> -                        PCLK_HZ) ;
>> +                        s->pclk_freq) ;
>>              } else {
>>                  reload = s->reg_reload_value * 1000;
>>              }
>> @@ -104,7 +106,7 @@ static void aspeed_wdt_write(void *opaqu
>>  
>>              if (pclk) {
>>                  reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
>> -                        PCLK_HZ) ;
>> +                        s->pclk_freq) ;
>>              } else {
>>                  reload = s->reg_reload_value * 1000;
>>              }
>> @@ -183,10 +185,21 @@ static void aspeed_wdt_realize(DeviceSta
>>  {
>>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>      AspeedWDTState *s = ASPEED_WDT(dev);
>> +    Object *obj;
>> +    Error *err = NULL;
>>  
>>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired,
>>                              dev);
>>  
>> +    obj = object_property_get_link(OBJECT(dev), "scu", &err);
>> +    if (!obj) {
>> +        error_setg(errp, "%s: required link 'scu' not found: %s",
>> +                   __func__, error_get_pretty(err));
>> +        return;
>> +    }
>> +
>> +    s->pclk_freq = aspeed_scu_get_clk(ASPEED_SCU(obj));
>> +
>>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>>                            TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
>>      sysbus_init_mmio(sbd, &s->iomem);
>> Index: qemu-aspeed.git/include/hw/misc/aspeed_scu.h
>> ===================================================================
>> --- qemu-aspeed.git.orig/include/hw/misc/aspeed_scu.h
>> +++ qemu-aspeed.git/include/hw/misc/aspeed_scu.h
>> @@ -36,6 +36,7 @@ typedef struct AspeedSCUState {
>>  #define AST2500_A1_SILICON_REV   0x04010303U
>>  
>>  extern bool is_supported_silicon_rev(uint32_t silicon_rev);
>> +extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
>>  
>>  /*
>>   * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
>> Index: qemu-aspeed.git/include/hw/watchdog/wdt_aspeed.h
>> ===================================================================
>> --- qemu-aspeed.git.orig/include/hw/watchdog/wdt_aspeed.h
>> +++ qemu-aspeed.git/include/hw/watchdog/wdt_aspeed.h
>> @@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
>>      uint32_t reg_reload_value;
>>      uint32_t reg_restart;
>>      uint32_t reg_ctrl;
>> +
>> +    uint32_t pclk_freq;
>>  } AspeedWDTState;
>>  
>>  #endif  /* ASPEED_WDT_H */
>>
>>
> 
> I think we need a bit more magic in hw/arm/aspeed.c to create the SCU
> link, but other than that it seems reasonable to me. 

hmm, what are you thinking about ? I didn't need to do anything else. 

> A while back thiswas sent to the list:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2016-10/msg00867.html
> 
> But I don't think it ever got applied. Otherwise we could be
> implementing the above in terms of struct qemu_clk.

It looks like something the Aspeed SoC needs but the configuration 
would still come from SCU. 

So a first step could be to use a simple model to start with. 
It would give us a feeling of the needs and would prepare ground 
for the QemuClk model proposed by Xilinx.

We could create a set of AspeedClk objects (simple attributes and 
properties) and share them between the controller objects.

> Finally I think if we're going to do something like what you've got
> above we should fix the timer as well. 

ok. 

I have also done something similar to get the second watchdog to 
calculate the number of cs on the witherspoon. But that is purely
SCU related, no clocks involved.

hw strap1 from the scu object is needed in a lot of places so may 
be we could just introduce a helper to get it through qdev_get_machine() 
instead of using links ? 

> Should I add the timer work to my list? 

sure. It does not have to be a perfectly modeled clock but it is true 
that we have reach state now where we need to be more precise. 

> Do we want to gate this reboot fix on preparing timer patches?

That is a must have. I think you can push your patch on openbmc/qemu now.


C.
