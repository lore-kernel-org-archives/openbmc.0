Return-Path: <clg@kaod.org>
Received: from 18.mo4.mail-out.ovh.net (18.mo4.mail-out.ovh.net
 [188.165.54.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS2QT6PSJzDvWm
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 21:06:41 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 145571F9B0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 10:58:58 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id DB09F1800A2;
 Mon, 28 Nov 2016 10:58:53 +0100 (CET)
Subject: Re: [PATCH qemu 30/38] wdt: Add Aspeed watchdog device model
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-31-git-send-email-clg@kaod.org>
 <4c0ef35c-ac85-4163-f874-1201460bcd80@kaod.org>
 <1480299083.2503.74.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <00c90d83-167b-4868-2c1c-fd855d657ed5@kaod.org>
Date: Mon, 28 Nov 2016 10:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480299083.2503.74.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18438018352602713043
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 10:06:42 -0000

On 11/28/2016 03:11 AM, Andrew Jeffery wrote:
> On Mon, 2016-11-21 at 14:03 +0100, Cédric Le Goater wrote:
>> On 11/18/2016 03:22 PM, Cédric Le Goater wrote:
>>> From: Joel Stanley <joel@jms.id.au>
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> [clg: fixed compile breakage
>>>       fixed io region size
>>>       added  watchdog_perform_action() on timer expiry ]
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/watchdog/Makefile.objs        |   1 +
>>>  hw/watchdog/wdt_aspeed.c         | 194
>>> +++++++++++++++++++++++++++++++++++++++
>>>  include/hw/watchdog/wdt_aspeed.h |  41 +++++++++
>>>  3 files changed, 236 insertions(+)
>>>  create mode 100644 hw/watchdog/wdt_aspeed.c
>>>  create mode 100644 include/hw/watchdog/wdt_aspeed.h
>>>
>>> diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
>>> index 72e3ffd93c59..9589bed63a3d 100644
>>> --- a/hw/watchdog/Makefile.objs
>>> +++ b/hw/watchdog/Makefile.objs
>>> @@ -2,3 +2,4 @@ common-obj-y += watchdog.o
>>>  common-obj-$(CONFIG_WDT_IB6300ESB) += wdt_i6300esb.o
>>>  common-obj-$(CONFIG_WDT_IB700) += wdt_ib700.o
>>>  common-obj-$(CONFIG_WDT_DIAG288) += wdt_diag288.o
>>> +common-obj-$(CONFIG_ASPEED_SOC) += wdt_aspeed.o
>>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
>>> new file mode 100644
>>> index 000000000000..29d9d7f91463
>>> --- /dev/null
>>> +++ b/hw/watchdog/wdt_aspeed.c
>>> @@ -0,0 +1,194 @@
>>> +/*
>>> + * Copyright 2016 IBM Corporation
>>> + *
>>> + * This code is licensed under the GPL version 2 or later.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/log.h"
>>> +#include "sysemu/watchdog.h"
>>> +#include "hw/sysbus.h"
>>> +#include "qemu/timer.h"
>>> +#include "hw/watchdog/wdt_aspeed.h"
>>> +
>>> +#define WDT_IO_REGION_SIZE      0x1000
>>> +
>>> +#define WDT_STATUS              0x00
>>> +#define WDT_RELOAD_VALUE        0x04
>>> +#define WDT_RESTART             0x08
>>> +#define WDT_CTRL                0x0C
>>> +#define WDT_TIMEOUT_STATUS      0x10
>>> +#define WDT_TIMEOUT_CLEAR       0x14
>>> +#define WDT_RESET_WDITH         0x18
>>
>>
>> May be we should reduce the size of WDT_IO_REGION_SIZE to 0x20
>> to instantiate the three watchdog of the Aspeed AST2500 with 
>> one class ? 
>>
>> Here is the layout :
>>
>> WDT00: WDT1 Counter Status Register
>> WDT04: WDT1 Counter Reload Value Register
>> WDT08: WDT1 Counter Restart Register
>> WDT0C: WDT1 Control Register
>> WDT10: WDT1 Timeout Status Register
>> WDT14: WDT1 Clear Timeout Status Register
>> WDT18: WDT1 Reset Width Register
>> WDT1C: WDT1 Reset Mask Register (AST2500)
>>
>> WDT20: WDT2 Counter Status Register
>> WDT24: WDT2 Counter Reload Value Register
>> WDT28: WDT2 Counter Restart Register
>> WDT2C: WDT2 Control Register
>> WDT30: WDT2 Timeout Status Register
>> WDT34: WDT2 Clear Timeout Status Register
>> WDT38: WDT2 Reset Width Register
>> WDT3C: WDT2 Reset Mask Register  (AST2500)
>>
>> WDT40: WDT3 Counter Status Register  (AST2500)
>> WDT44: WDT3 Counter Reload Value Register  (AST2500)
>> WDT48: WDT3 Counter Restart Register  (AST2500)
>> WDT4C: WDT3 Control Register  (AST2500)
>> WDT50: WDT3 Timeout Status Register  (AST2500)
>> WDT54: WDT3 Clear Timeout Status Register  (AST2500)
>> WDT5C: WDT3 Reset Mask Register  (AST2500)
>>
> 
> If we're hacking it, can we squash the timer fixups and clock rate
> derivation into the initial commit? I don't like the idea of sending it
> broken.

sure. I will fold your fixes in the initial patch and add your SoB.

C.


> Andrew
> 
>> C.
>>
>>
>>
>>
>>> +#define WDT_RESTART_MAGIC       0x4755
>>> +
>>> +static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset,
>>> unsigned size)
>>> +{
>>> +    AspeedWDTState *s = ASPEED_WDT(opaque);
>>> +
>>> +    switch (offset) {
>>> +    case WDT_STATUS:
>>> +        return s->reg_status;
>>> +    case WDT_RELOAD_VALUE:
>>> +        return s->reg_reload_value;
>>> +    case WDT_RESTART:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: read from write-only reg at offset 0x%"
>>> +                      HWADDR_PRIx "\n", __func__, offset);
>>> +        return 0;
>>> +    case WDT_CTRL:
>>> +        return s->reg_ctrl;
>>> +    case WDT_TIMEOUT_STATUS:
>>> +    case WDT_TIMEOUT_CLEAR:
>>> +    case WDT_RESET_WDITH:
>>> +        qemu_log_mask(LOG_UNIMP,
>>> +                      "%s: uninmplemented read at offset 0x%"
>>> HWADDR_PRIx "\n",
>>> +                      __func__, offset);
>>> +        return 0;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: Out-of-bounds read at offset 0x%"
>>> HWADDR_PRIx "\n",
>>> +                      __func__, offset);
>>> +        return 0;
>>> +    }
>>> +
>>> +}
>>> +
>>> +static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t
>>> data,
>>> +                             unsigned size)
>>> +{
>>> +    AspeedWDTState *s = ASPEED_WDT(opaque);
>>> +    bool en = data & BIT(0);
>>> +
>>> +    switch (offset) {
>>> +    case WDT_STATUS:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: write to read-only reg at offset 0x%"
>>> +                      HWADDR_PRIx "\n", __func__, offset);
>>> +        break;
>>> +    case WDT_RELOAD_VALUE:
>>> +        s->reg_reload_value = data;
>>> +        break;
>>> +    case WDT_RESTART:
>>> +        if ((data & 0xFFFF) == 0x4755) {
>>> +            s->reg_status = s->reg_reload_value;
>>> +
>>> +            if (s->enabled) {
>>> +                timer_mod(s->timer,
>>> +                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>>> +                          s->reg_reload_value *
>>> NANOSECONDS_PER_SECOND);
>>> +            }
>>> +        }
>>> +        break;
>>> +    case WDT_CTRL:
>>> +        if (en && !s->enabled) {
>>> +            s->enabled = true;
>>> +            timer_mod(s->timer,
>>> +                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>>> +                      s->reg_reload_value *
>>> NANOSECONDS_PER_SECOND);
>>> +        } else if (!en && s->enabled) {
>>> +            s->enabled = false;
>>> +            timer_del(s->timer);
>>> +        }
>>> +        break;
>>> +    case WDT_TIMEOUT_STATUS:
>>> +    case WDT_TIMEOUT_CLEAR:
>>> +    case WDT_RESET_WDITH:
>>> +        qemu_log_mask(LOG_UNIMP,
>>> +                      "%s: uninmplemented write at offset 0x%"
>>> HWADDR_PRIx "\n",
>>> +                      __func__, offset);
>>> +        break;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "%s: Out-of-bounds write at offset 0x%"
>>> HWADDR_PRIx "\n",
>>> +                      __func__, offset);
>>> +    }
>>> +    return;
>>> +}
>>> +
>>> +static WatchdogTimerModel model = {
>>> +    .wdt_name = TYPE_ASPEED_WDT,
>>> +    .wdt_description = "aspeed watchdog device",
>>> +};
>>> +
>>> +static const VMStateDescription vmstate_aspeed_wdt = {
>>> +    .name = "vmstate_aspeed_wdt",
>>> +    .version_id = 0,
>>> +    .minimum_version_id = 0,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_TIMER_PTR(timer, AspeedWDTState),
>>> +        VMSTATE_BOOL(enabled, AspeedWDTState),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>> +static const MemoryRegionOps aspeed_wdt_ops = {
>>> +    .read = aspeed_wdt_read,
>>> +    .write = aspeed_wdt_write,
>>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>> +    .valid.min_access_size = 4,
>>> +    .valid.max_access_size = 4,
>>> +    .valid.unaligned = false,
>>> +};
>>> +
>>> +static void aspeed_wdt_reset(DeviceState *dev)
>>> +{
>>> +    AspeedWDTState *s = ASPEED_WDT(dev);
>>> +
>>> +    s->reg_status = 0x3EF1480;
>>> +    s->reg_reload_value = 0x03EF1480;
>>> +    s->reg_restart = 0;
>>> +    s->reg_ctrl = 0;
>>> +
>>> +    s->enabled = false;
>>> +    timer_del(s->timer);
>>> +}
>>> +
>>> +static void aspeed_wdt_timer_expired(void *dev)
>>> +{
>>> +    AspeedWDTState *s = ASPEED_WDT(dev);
>>> +
>>> +    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
>>> +    watchdog_perform_action();
>>> +    timer_del(s->timer);
>>> +}
>>> +
>>> +static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +    AspeedWDTState *s = ASPEED_WDT(dev);
>>> +
>>> +    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>>> aspeed_wdt_timer_expired,
>>> +                            dev);
>>> +
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops,
>>> s,
>>> +                          TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
>>> +    sysbus_init_mmio(sbd, &s->iomem);
>>> +}
>>> +
>>> +static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +
>>> +    dc->realize = aspeed_wdt_realize;
>>> +    dc->reset = aspeed_wdt_reset;
>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>> +    dc->vmsd = &vmstate_aspeed_wdt;
>>> +}
>>> +
>>> +static const TypeInfo aspeed_wdt_info = {
>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>> +    .name  = TYPE_ASPEED_WDT,
>>> +    .instance_size  = sizeof(AspeedWDTState),
>>> +    .class_init = aspeed_wdt_class_init,
>>> +};
>>> +
>>> +static void wdt_aspeed_register_types(void)
>>> +{
>>> +    watchdog_add_model(&model);
>>> +    type_register_static(&aspeed_wdt_info);
>>> +}
>>> +
>>> +type_init(wdt_aspeed_register_types)
>>> diff --git a/include/hw/watchdog/wdt_aspeed.h
>>> b/include/hw/watchdog/wdt_aspeed.h
>>> new file mode 100644
>>> index 000000000000..dbf45ae968db
>>> --- /dev/null
>>> +++ b/include/hw/watchdog/wdt_aspeed.h
>>> @@ -0,0 +1,41 @@
>>> +/*
>>> + * ASPEED Watchdog Controller
>>> + *
>>> + * Copyright (C) 2016 IBM Corp.
>>> + *
>>> + * This code is licensed under the GPL version 2 or later. See the
>>> + * COPYING file in the top-level directory.
>>> + */
>>> +#ifndef ASPEED_WDT_H
>>> +#define ASPEED_WDT_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +
>>> +#define TYPE_ASPEED_WDT "aspeed.wdt"
>>> +#define ASPEED_WDT(obj) \
>>> +    OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
>>> +#define ASPEED_WDT_CLASS(klass) \
>>> +    OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
>>> +#define ASPEED_WDT_GET_CLASS(obj) \
>>> +    OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
>>> +
>>> +#define WDT_ASPEED_INIT      0
>>> +#define WDT_ASPEED_CHANGE    1
>>> +#define WDT_ASPEED_CANCEL    2
>>> +
>>> +typedef struct AspeedWDTState {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +    QEMUTimer *timer;
>>> +    bool enabled;
>>> +
>>> +    /*< public >*/
>>> +    MemoryRegion iomem;
>>> +
>>> +    uint32_t reg_status;
>>> +    uint32_t reg_reload_value;
>>> +    uint32_t reg_restart;
>>> +    uint32_t reg_ctrl;
>>> +} AspeedWDTState;
>>> +
>>> +#endif  /* ASPEED_WDT_H */
>>>
>>
