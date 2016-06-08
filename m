Return-Path: <clg@kaod.org>
Received: from mo178.mail-out.ovh.net (mo178.mail-out.ovh.net [178.32.228.178])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPnmL4047zDqXs
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 22:28:50 +1000 (AEST)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 47DB7100C966
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 13:53:11 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id DF65A520072;
 Wed,  8 Jun 2016 13:53:08 +0200 (CEST)
Subject: Re: [PATCH qemu 01/12] ast2400: add SMC controllers (FMC and SPI)
To: andrew@aj.id.au, openbmc@lists.ozlabs.org
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-2-git-send-email-clg@kaod.org>
 <1465265326.16048.50.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57580724.8080106@kaod.org>
Date: Wed, 8 Jun 2016 13:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465265326.16048.50.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 515380684492016595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeefgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 08 Jun 2016 12:28:51 -0000

On 06/07/2016 04:08 AM, Andrew Jeffery wrote:
> On Sun, 2016-05-29 at 23:19 +0200, Cédric Le Goater wrote:
>> This patch provides a simple device model for the SMC controllers
>> available on the Aspeed AST2400 soc. Support is limited to the FMC and
>> the SPI controllers, and to SPI flash slaves.
>>
>> Below is the initial framework : the sysbus object, MMIO for registers
>> configuration and controls. Each controller has a SPI bus and a
>> configurable number of CS lines for SPI flash slaves.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/ast2400.c            |  33 ++++++
>>  hw/ssi/Makefile.objs        |   1 +
>>  hw/ssi/aspeed_smc.c         | 260 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/ast2400.h    |   3 +
>>  include/hw/ssi/aspeed_smc.h |  68 ++++++++++++
>>  5 files changed, 365 insertions(+)
>>  create mode 100644 hw/ssi/aspeed_smc.c
>>  create mode 100644 include/hw/ssi/aspeed_smc.h
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index 23d52bffcaa7..8f678983cee5 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -23,6 +23,9 @@
>>  #define AST2400_UART_5_BASE      0x00184000
>>  #define AST2400_IOMEM_SIZE       0x00200000
>>  #define AST2400_IOMEM_BASE       0x1E600000
>> +#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
>> +#define AST2400_FMC_BASE         0X1E620000
>> +#define AST2400_SPI_BASE         0X1E630000
>>  #define AST2400_VIC_BASE         0x1E6C0000
>>  #define AST2400_SCU_BASE         0x1E6E2000
>>  #define AST2400_TIMER_BASE       0x1E782000
>> @@ -77,6 +80,14 @@ static void ast2400_init(Object *obj)
>>      object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
>>      object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
>> +
>> +    object_initialize(&s->smc, sizeof(s->smc), TYPE_ASPEED_SMC);
>> +    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
>> +
>> +    object_initialize(&s->spi, sizeof(s->spi), TYPE_ASPEED_SMC);
>> +    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
>>  }
>>  
>>  static void ast2400_realize(DeviceState *dev, Error **errp)
>> @@ -171,6 +182,28 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
>>      /* The palmetto platform expects a ds3231 RTC but a ds1338 is
>>       * enough to provide basic RTC features. Alarms will be missing */
>>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0x68);
>> +
>> +    /* SMC */
>> +    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
>> +    object_property_set_int(OBJECT(&s->spi), AspeedSMCFMC, "smc-type", &err);
>> +    object_property_set_bool(OBJECT(&s->smc), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
>> +
>> +    /* SPI */
>> +    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
>> +    object_property_set_int(OBJECT(&s->spi), AspeedSMCSPI, "smc-type", &err);
>> +    object_property_set_bool(OBJECT(&s->spi), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>>  }
>>  
>>  static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
>> index 9555825acad1..6b32bf22ce3b 100644
>> --- a/hw/ssi/Makefile.objs
>> +++ b/hw/ssi/Makefile.objs
>> @@ -2,5 +2,6 @@ common-obj-$(CONFIG_PL022) += pl022.o
>>  common-obj-$(CONFIG_SSI) += ssi.o
>>  common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
>>  common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
>> +common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
>>  
>>  obj-$(CONFIG_OMAP) += omap_spi.o
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> new file mode 100644
>> index 000000000000..780fcbbc9e55
>> --- /dev/null
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -0,0 +1,260 @@
>> +/*
>> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +#include "include/qemu/error-report.h"
>> +#include "exec/address-spaces.h"
>> +
>> +#include "hw/ssi/aspeed_smc.h"
>> +
>> +/* CE Type Setting Register */
>> +#define R_CONF            (0x00 / 4)
>> +#define   CONF_LEGACY_DISABLE  (1 << 31)
>> +#define   CONF_ENABLE_W4       20
>> +#define   CONF_ENABLE_W3       19
>> +#define   CONF_ENABLE_W2       18
>> +#define   CONF_ENABLE_W1       17
>> +#define   CONF_ENABLE_W0       16
>> +#define   CONF_FLASH_TYPE4     9
>> +#define   CONF_FLASH_TYPE3     7
>> +#define   CONF_FLASH_TYPE2     5
>> +#define   CONF_FLASH_TYPE1     3
>> +#define   CONF_FLASH_TYPE0     1
>> +
>> +/* CE Control Register */
>> +#define R_CTRL            (0x04 / 4)
>> +#define   CRTL_EXTENDED4       4  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED3       3  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED2       2  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED1       1  /* 32 bit addressing for SPI */
>> +#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
>> +
>> +/* Interrupt Control and Status Register */
>> +#define R_INTR_CTRL       (0x08 / 4)
>> +
>> +/* CEx Control Register */
>> +#define R_CTRL0           (0x10 / 4)
>> +#define   CTRL_CE_STOP_ACTIVE      (1 << 2)
>> +#define   CTRL_USERMODE            0x3
>> +#define R_CTRL1           (0x14 / 4)
>> +#define R_CTRL2           (0x18 / 4)
>> +#define R_CTRL3           (0x1C / 4)
>> +#define R_CTRL4           (0x20 / 4)
>> +
>> +/* CEx Segment Address Register */
>> +#define R_SEG_ADDR0       (0x30 / 4)
>> +#define   SEG_SIZE_SHIFT       24   /* 8MB units */
>> +#define   SEG_SIZE_MASK        0x7f
>> +#define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
>> +#define   SEG_START_MASK       0x7f
>> +#define R_SEG_ADDR1       (0x34 / 4)
>> +#define R_SEG_ADDR2       (0x38 / 4)
>> +#define R_SEG_ADDR3       (0x3C / 4)
>> +#define R_SEG_ADDR4       (0x40 / 4)
>> +
>> +/* Misc Control Register #1 */
>> +#define R_MISC_CRTL1      (0x50 / 4)
>> +
>> +/* Misc Control Register #2 */
>> +#define R_MISC_CRTL2      (0x54 / 4)
>> +
>> +
>> +/* SPI controller registers and bits (that we care about) */
>> +#define R_SPI_CONF        (0x00 / 4)
>> +#define   SPI_CONF_ENABLE_W0   0
>> +#define R_SPI_CTRL0       (0x4 / 4)
>> +#define R_SPI_MISC_CRTL   (0x10 / 4)
>> +#define R_SPI_TIMINGS     (0x14 / 4)
>> +
>> +static const int aspeed_smc_r_ctrl0[]   = { R_CTRL0, R_CTRL0, R_SPI_CTRL0 };
>> +static const int aspeed_smc_r_conf[]    = { R_CONF,  R_CONF,  R_SPI_CONF  };
>> +static const int aspeed_smc_conf_enable_w0[] = {
>> +    CONF_ENABLE_W0, CONF_ENABLE_W0, SPI_CONF_ENABLE_W0 };
>> +
>> +
>> +static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
>> +}
>> +
>> +static void aspeed_smc_update_cs(AspeedSMCState *s)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        if (aspeed_smc_is_ce_stop_active(s, i)) {
>> +            /* should reset command byte in control reg */
> 
> Can you expand on why this hasn't been implemented? I assume there are
> no side-effects?

This comes from an initial implementation in which the command in bits [23:16] 
of the control register were used to generate SPI transfers when the flash was 
accessed in command mode. But it was not efficient.

I would like to keep it around for the sake of the model. I will see what
I can do even it is not really useful. 

>> +        }
>> +
>> +        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i));
>> +    }
>> +}
>> +
>> +static void aspeed_smc_reset(DeviceState *d)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(d);
>> +    int i;
>> +
>> +    memset(s->regs, 0, sizeof s->regs);
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
>> +    }
>> +
>> +    aspeed_smc_update_cs(s);
>> +}
>> +
>> +static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(opaque);
>> +    uint32_t r = 0;
>> +
>> +    addr >>= 2;
>> +    switch (addr) {
>> +    default:
>> +        if (addr < ARRAY_SIZE(s->regs)) {
>> +            r = s->regs[addr];
>> +        }
>> +        break;
>> +    }
> 
> Is there a good reason to use the switch here if there's only a default
> case?

I can not even say laziness :) I will add some cases.

>> +
>> +    return r;
>> +}
>> +
>> +static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>> +                             unsigned int size)
>> +{
>> +    AspeedSMCState *s = ASPEED_SMC(opaque);
>> +    uint32_t value = data;
>> +
>> +    addr >>= 2;
>> +    switch (addr) {
>> +    default:
>> +        if (addr < ARRAY_SIZE(s->regs)) {
>> +            s->regs[addr] = value;
>> +        }
>> +        break;
>> +    }
> 
> Similar to above, though with ranges maybe we could accommodate the
> condition below?

yes. some enforcement on which registers can be handled is better.

>> +
>> +    if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
>> +        aspeed_smc_update_cs(s);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_ops = {
>> +    .read = aspeed_smc_read,
>> +    .write = aspeed_smc_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
> 
> I think I asked about this previously - should it be DEVICE_LITTLE_ENDIAN? 

yes.

>> +    .valid.unaligned = true,
>> +};
>> +
>> +static const char * const aspeed_smc_types[] = { "smc", "fmc", "spi" };
>> +static const int aspeed_smc_max_slaves[] = { 5, 5, 1 };
>> +
>> +static int aspeed_smc_init(SysBusDevice *sbd)
>> +{
>> +    DeviceState *dev = DEVICE(sbd);
>> +    AspeedSMCState *s = ASPEED_SMC(dev);
>> +    int i;
>> +    char name[16];
>> +
>> +    s->spi = ssi_create_bus(dev, "spi");
>> +
>> +    /* Enforce some real HW limits */
>> +    if (s->num_cs > aspeed_smc_max_slaves[s->smc_type]) {
>> +        s->num_cs = aspeed_smc_max_slaves[s->smc_type];
>> +    }
>> +
>> +    /* Setup cs_lines for slaves */
>> +    sysbus_init_irq(sbd, &s->irq);
>> +    s->cs_lines = g_new0(qemu_irq, s->num_cs);
>> +    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        sysbus_init_irq(sbd, &s->cs_lines[i]);
>> +    }
>> +
>> +    /* There are some differences in the register numbers and bits
>> +     * between the FMC and SPI controller. Let's abstract these.
>> +     */
>> +    s->r_ctrl0 = aspeed_smc_r_ctrl0[s->smc_type];
>> +    s->r_conf = aspeed_smc_r_conf[s->smc_type];
>> +    s->conf_enable_w0 = aspeed_smc_conf_enable_w0[s->smc_type];
> 
> A little hairy, but understandable in that we avoid two mostly similar
> implementations.

yeah. Well, that seem the best approach for the rest of the code. See 
below :
	s->regs[s->r_ctrl0 + i] 

I like an array of registers values: 

	s->regs[s->regs_value[CRTL0] + 1] 

or some macro : 

	#define REG_CRTL0(s) aspeed_smc_r_ctrl0[(s)->smc_type];

	s->regs[RET_CRTL0(s) + i]

I am open to any suggestions.

>> +
>> +    /* Unselect all slaves */
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
>> +    }
>> +
>> +    snprintf(name, sizeof(name), "aspeed.%s", aspeed_smc_types[s->smc_type]);
>> +    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>> +                          name, ASPEED_SMC_R_MAX * 4);
>> +    sysbus_init_mmio(sbd, &s->mmio);
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_aspeed_smc = {
>> +    .name = "aspeed.smc",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static Property aspeed_smc_properties[] = {
>> +    DEFINE_PROP_UINT8("num-cs", AspeedSMCState, num_cs, 1),
>> +    DEFINE_PROP_UINT8("smc-type", AspeedSMCState, smc_type, AspeedSMCFMC),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void aspeed_smc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>> +
>> +    k->init = aspeed_smc_init;
>> +    dc->reset = aspeed_smc_reset;
>> +    dc->props = aspeed_smc_properties;
>> +    dc->vmsd = &vmstate_aspeed_smc;
>> +}
>> +
>> +static const TypeInfo aspeed_smc_info = {
>> +    .name           = TYPE_ASPEED_SMC,
>> +    .parent         = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size  = sizeof(AspeedSMCState),
>> +    .class_init     = aspeed_smc_class_init,
>> +};
>> +
>> +static void aspeed_smc_register_types(void)
>> +{
>> +    type_register_static(&aspeed_smc_info);
>> +}
>> +
>> +type_init(aspeed_smc_register_types)
>> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
>> index e96e3db3fbea..9ba4245619c1 100644
>> --- a/include/hw/arm/ast2400.h
>> +++ b/include/hw/arm/ast2400.h
>> @@ -17,6 +17,7 @@
>>  #include "hw/misc/aspeed_scu.h"
>>  #include "hw/timer/aspeed_timer.h"
>>  #include "hw/i2c/aspeed_i2c.h"
>> +#include "hw/ssi/aspeed_smc.h"
>>  
>>  typedef struct AST2400State {
>>      /*< private >*/
>> @@ -30,6 +31,8 @@ typedef struct AST2400State {
>>      AspeedTimerCtrlState timerctrl;
>>      AspeedSCUState scu;
>>      AspeedI2CState i2c;
>> +    AspeedSMCState smc;
>> +    AspeedSMCState spi;
>>  } AST2400State;
>>  
>>  #define TYPE_AST2400 "ast2400"
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> new file mode 100644
>> index 000000000000..9b95fcee5da7
>> --- /dev/null
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -0,0 +1,68 @@
>> +/*
>> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef ASPEED_SMC_H
>> +#define ASPEED_SMC_H
>> +
>> +#include "hw/ssi/ssi.h"
>> +
>> +enum AspeedSMCType {
>> +    AspeedSMCLegacy,
>> +    AspeedSMCFMC,
>> +    AspeedSMCSPI,
>> +};
>> +
>> +#define TYPE_ASPEED_SMC "aspeed.smc"
>> +#define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_SMC)
>> +
>> +#define ASPEED_SMC_R_MAX        (0x100 / 4)
>> +
>> +typedef struct AspeedSMCState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +
>> +    qemu_irq irq;
>> +    int irqline;
>> +
>> +    uint8_t num_cs;
>> +    qemu_irq *cs_lines;
>> +
>> +    SSIBus *spi;
>> +
>> +    uint32_t regs[ASPEED_SMC_R_MAX];
>> +
>> +    uint8_t smc_type;
>> +
>> +    /* depends on the controller type */
>> +    uint8_t r_conf;
>> +    uint8_t r_ctrl0;
>> +    uint8_t conf_enable_w0;
>> +} AspeedSMCState;
>> +
>> +#define TYPE_ASPEED_SPI "aspeed.spi"
>> +#define ASPEED_SPI(obj) OBJECT_CHECK(AspeedSPIState, (obj), TYPE_ASPEED_SPI)
>> +
>> +
>> +#endif /* ASPEED_SMC_H */
> 
> Otherwise, looks good to me.
> 
> Andrew
> 
