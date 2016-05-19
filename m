Return-Path: <clg@kaod.org>
X-Greylist: delayed 2334 seconds by postgrey-1.35 at bilbo;
 Fri, 20 May 2016 03:33:54 AEST
Received: from 1.mo178.mail-out.ovh.net (1.mo178.mail-out.ovh.net
 [178.33.251.53])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9dTZ4VvXzDqFC
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 03:33:53 +1000 (AEST)
Received: from player791.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id C13F9100C752
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 18:57:03 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 0DD9D42006C;
 Thu, 19 May 2016 18:57:00 +0200 (CEST)
Subject: Re: [PATCH qemu 1/3] i2c: add aspeed i2c crontroller
To: Joel Stanley <joel@jms.id.au>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-2-git-send-email-clg@kaod.org>
 <CACPK8XfyU5iSe6s7hLYx3hb2on=3zp=BPoJhnJS8KKEBbZOA1g@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <573DF050.2060409@kaod.org>
Date: Thu, 19 May 2016 18:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfyU5iSe6s7hLYx3hb2on=3zp=BPoJhnJS8KKEBbZOA1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17320562693481073579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrfedvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 19 May 2016 17:33:55 -0000

Hello Joel,

On 05/18/2016 03:26 PM, Joel Stanley wrote:
> Hey Cedric,
> 
> On Wed, May 18, 2016 at 4:55 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The Aspeed AST2400 integrates a set of 14 I2C/SMBus bus controllers
>> directly connected to APB bus which can be programmed as a master or
>> slave.
> 
> Nice work!
> 
>>
>> This patch offers a device model for the master mode only, slave mode
>> is not supported.
> 
> Cool. That's good enough for us to emulate a barreleye or palemtto.
> 
> We should look to extend it to support this as well as multi-byte
> transfers using the pool buffer soon; both the model and the driver.

Yes. That will help for the transfers with the OCC, which are quite
heavy.

Thanks,

C.

> 
> I had a read of the code and it looks good to me for a first pass.
> I'll let Andrew comment further and merge it into our staging tree.
> 
>> On the TODO list, we also have :
>>
>>  - improve and harden the state machine. This is really a first
>>    version.
>>  - bus recovery support (used by the Linux driver).
>>  - transfer mode state machine bits. this is not strictly necessary as
>>    it is mostly used for debug. The bus busy bit is deducted from the
>>    I2C core engine of qemu.
>>  - support of the pool buffer: 2048 bytes of internal SRAM (not used
>>    by the Linux driver).
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Acked-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  hw/arm/ast2400.c            |  16 ++
>>  hw/i2c/Makefile.objs        |   1 +
>>  hw/i2c/aspeed_i2c.c         | 448 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/ast2400.h    |   2 +
>>  include/hw/i2c/aspeed_i2c.h |  62 ++++++
>>  5 files changed, 529 insertions(+)
>>  create mode 100644 hw/i2c/aspeed_i2c.c
>>  create mode 100644 include/hw/i2c/aspeed_i2c.h
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index cf9f37e6a301..4576e67cd483 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -18,6 +18,7 @@
>>  #include "hw/arm/ast2400.h"
>>  #include "hw/char/serial.h"
>>  #include "hw/boards.h"
>> +#include "hw/i2c/aspeed_i2c.h"
>>
>>  #define AST2400_UART_5_BASE      0x00184000
>>  #define AST2400_IOMEM_SIZE       0x00200000
>> @@ -25,6 +26,7 @@
>>  #define AST2400_VIC_BASE         0x1E6C0000
>>  #define AST2400_SCU_BASE         0x1E6E2000
>>  #define AST2400_TIMER_BASE       0x1E782000
>> +#define AST2400_I2C_BASE         0x1E78A000
>>
>>  static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
>>  static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
>> @@ -71,6 +73,10 @@ static void ast2400_init(Object *obj)
>>      object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
>>      object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
>> +
>> +    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
>> +    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
>>  }
>>
>>  static void ast2400_realize(DeviceState *dev, Error **errp)
>> @@ -143,6 +149,16 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
>>          serial_mm_init(&s->iomem, AST2400_UART_5_BASE, 2,
>>                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
>>      }
>> +
>> +    /* I2C */
>> +    object_property_set_bool(OBJECT(&s->i2c), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->vic), 12));
>>  }
>>
>>  static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
>> index aeb8f38d70f1..1fd54edf4c23 100644
>> --- a/hw/i2c/Makefile.objs
>> +++ b/hw/i2c/Makefile.objs
>> @@ -5,4 +5,5 @@ common-obj-$(CONFIG_APM) += pm_smbus.o
>>  common-obj-$(CONFIG_BITBANG_I2C) += bitbang_i2c.o
>>  common-obj-$(CONFIG_EXYNOS4) += exynos4210_i2c.o
>>  common-obj-$(CONFIG_IMX_I2C) += imx_i2c.o
>> +common-obj-$(CONFIG_ASPEED_SOC) += aspeed_i2c.o
>>  obj-$(CONFIG_OMAP) += omap_i2c.o
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> new file mode 100644
>> index 000000000000..f512e64d827a
>> --- /dev/null
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -0,0 +1,448 @@
>> +/*
>> + * ARM Aspeed I2C controller
>> + *
>> + * Copyright (C) 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version 2
>> + * of the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/i2c/aspeed_i2c.h"
>> +
>> +/* I2C Global Register */
>> +
>> +#define I2C_CTRL_STATUS         0x00        /* Device Interrupt Status */
>> +#define I2C_CTRL_ASSIGN         0x08        /* Device Interrupt Target
>> +                                               Assignment */
>> +
>> +/* I2C Device (Bus) Register */
>> +
>> +#define I2CD_FUN_CTRL_REG       0x00       /* I2CD Function Control  */
>> +#define   I2CD_BUFF_SEL_MASK               (0x7 << 20)
>> +#define   I2CD_BUFF_SEL(x)                 (x << 20)
>> +#define   I2CD_M_SDA_LOCK_EN               (0x1 << 16)
>> +#define   I2CD_MULTI_MASTER_DIS            (0x1 << 15)
>> +#define   I2CD_M_SCL_DRIVE_EN              (0x1 << 14)
>> +#define   I2CD_MSB_STS                     (0x1 << 9)
>> +#define   I2CD_SDA_DRIVE_1T_EN             (0x1 << 8)
>> +#define   I2CD_M_SDA_DRIVE_1T_EN           (0x1 << 7)
>> +#define   I2CD_M_HIGH_SPEED_EN             (0x1 << 6)
>> +#define   I2CD_DEF_ADDR_EN                 (0x1 << 5)
>> +#define   I2CD_DEF_ALERT_EN                (0x1 << 4)
>> +#define   I2CD_DEF_ARP_EN                  (0x1 << 3)
>> +#define   I2CD_DEF_GCALL_EN                (0x1 << 2)
>> +#define   I2CD_SLAVE_EN                    (0x1 << 1)
>> +#define   I2CD_MASTER_EN                   (0x1)
>> +
>> +#define I2CD_AC_TIMING_REG1     0x04       /* Clock and AC Timing Control #1 */
>> +#define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Control #1 */
>> +#define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control */
>> +#define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status */
>> +#define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
>> +#define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
>> +#define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] only */
>> +#define   I2CD_INTR_SMBUS_ARP_ADDR         (0x1 << 11) /* Removed */
>> +#define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
>> +#define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
>> +#define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
>> +#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DONE */
>> +#define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
>> +#define   I2CD_INTR_ABNORMAL               (0x1 << 5)
>> +#define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
>> +#define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
>> +#define   I2CD_INTR_RX_DONE                (0x1 << 2)
>> +#define   I2CD_INTR_TX_NAK                 (0x1 << 1)
>> +#define   I2CD_INTR_TX_ACK                 (0x1 << 0)
>> +
>> +#define I2CD_CMD_REG            0x14       /* I2CD Command/Status */
>> +#define   I2CD_SDA_OE                      (0x1 << 28)
>> +#define   I2CD_SDA_O                       (0x1 << 27)
>> +#define   I2CD_SCL_OE                      (0x1 << 26)
>> +#define   I2CD_SCL_O                       (0x1 << 25)
>> +#define   I2CD_TX_TIMING                   (0x1 << 24)
>> +#define   I2CD_TX_STATUS                   (0x1 << 23)
>> +
>> +#define   I2CD_TX_STATE_SHIFT              19 /* Tx State Machine */
>> +#define   I2CD_TX_STATE_MASK                  0xf
>> +#define     I2CD_IDLE                         0x0
>> +#define     I2CD_MACTIVE                      0x8
>> +#define     I2CD_MSTART                       0x9
>> +#define     I2CD_MSTARTR                      0xa
>> +#define     I2CD_MSTOP                        0xb
>> +#define     I2CD_MTXD                         0xc
>> +#define     I2CD_MRXACK                       0xd
>> +#define     I2CD_MRXD                         0xe
>> +#define     I2CD_MTXACK                       0xf
>> +#define     I2CD_SWAIT                        0x1
>> +#define     I2CD_SRXD                         0x4
>> +#define     I2CD_STXACK                       0x5
>> +#define     I2CD_STXD                         0x6
>> +#define     I2CD_SRXACK                       0x7
>> +#define     I2CD_RECOVER                      0x3
>> +
>> +#define   I2CD_SCL_LINE_STS                (0x1 << 18)
>> +#define   I2CD_SDA_LINE_STS                (0x1 << 17)
>> +#define   I2CD_BUS_BUSY_STS                (0x1 << 16)
>> +#define   I2CD_SDA_OE_OUT_DIR              (0x1 << 15)
>> +#define   I2CD_SDA_O_OUT_DIR               (0x1 << 14)
>> +#define   I2CD_SCL_OE_OUT_DIR              (0x1 << 13)
>> +#define   I2CD_SCL_O_OUT_DIR               (0x1 << 12)
>> +#define   I2CD_BUS_RECOVER_CMD_EN          (0x1 << 11)
>> +#define   I2CD_S_ALT_EN                    (0x1 << 10)
>> +#define   I2CD_RX_DMA_ENABLE               (0x1 << 9)
>> +#define   I2CD_TX_DMA_ENABLE               (0x1 << 8)
>> +
>> +/* Command Bit */
>> +#define   I2CD_M_STOP_CMD                  (0x1 << 5)
>> +#define   I2CD_M_S_RX_CMD_LAST             (0x1 << 4)
>> +#define   I2CD_M_RX_CMD                    (0x1 << 3)
>> +#define   I2CD_S_TX_CMD                    (0x1 << 2)
>> +#define   I2CD_M_TX_CMD                    (0x1 << 1)
>> +#define   I2CD_M_START_CMD                 (0x1)
>> +
>> +#define I2CD_DEV_ADDR_REG       0x18       /* Slave Device Address */
>> +#define I2CD_BUF_CTRL_REG       0x1c       /* Pool Buffer Control */
>> +#define I2CD_BYTE_BUF_REG       0x20       /* Transmit/Receive Byte Buffer */
>> +#define   I2CD_BYTE_BUF_TX_SHIFT           0
>> +#define   I2CD_BYTE_BUF_TX_MASK            0xff
>> +#define   I2CD_BYTE_BUF_RX_SHIFT           8
>> +#define   I2CD_BYTE_BUF_RX_MASK            0xff
>> +
>> +
>> +static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
>> +{
>> +    return bus->ctrl & I2CD_MASTER_EN;
>> +}
>> +
>> +static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
>> +{
>> +    return bus->ctrl & (I2CD_MASTER_EN | I2CD_SLAVE_EN);
>> +}
>> +
>> +static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>> +{
>> +    bus->intr_status &= bus->intr_ctrl;
>> +    if (bus->intr_status) {
>> +        bus->controller->intr_status |= 1 << bus->id;
>> +        qemu_irq_raise(bus->controller->irq);
>> +    }
>> +}
>> +
>> +static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
>> +                                    unsigned size)
>> +{
>> +    AspeedI2CBus *bus = (AspeedI2CBus *) opaque;
>> +
>> +    switch (offset) {
>> +    case I2CD_FUN_CTRL_REG:
>> +        return bus->ctrl;
>> +    case I2CD_AC_TIMING_REG1:
>> +        return bus->timing[0];
>> +    case I2CD_AC_TIMING_REG2:
>> +        return bus->timing[1];
>> +    case I2CD_INTR_CTRL_REG:
>> +        return bus->intr_ctrl;
>> +    case I2CD_INTR_STS_REG:
>> +        return bus->intr_status;
>> +    case I2CD_BYTE_BUF_REG:
>> +        return bus->buf;
>> +    case I2CD_CMD_REG:
>> +        return bus->cmd | (i2c_bus_busy(bus->bus) << 16);
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
>> +        return -1;
>> +    }
>> +}
>> +
>> +static inline uint64_t aspeed_i2c_bus_get_state(AspeedI2CBus *bus)
>> +{
>> +    return bus->cmd >> 19 & 0xF;
>> +}
>> +
>> +static inline void aspeed_i2c_bus_set_state(AspeedI2CBus *bus, uint64_t value)
>> +{
>> +    bus->cmd |= (value & 0xF) << 19;
>> +}
>> +
>> +static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>> +{
>> +    bus->cmd |= value & 0xFFFF;
>> +    bus->intr_status = 0;
>> +
>> +    if (bus->cmd & I2CD_M_START_CMD) {
>> +        if (i2c_start_transfer(bus->bus, extract32(bus->buf, 1, 7),
>> +                               extract32(bus->buf, 0, 1))) {
>> +            bus->intr_status |= I2CD_INTR_TX_NAK;
>> +        } else {
>> +            bus->intr_status |= I2CD_INTR_TX_ACK;
>> +        }
>> +
>> +    } else if (bus->cmd & I2CD_M_TX_CMD) {
>> +        if (i2c_send(bus->bus, bus->buf)) {
>> +            bus->intr_status |= (I2CD_INTR_TX_NAK | I2CD_INTR_ABNORMAL);
>> +            i2c_end_transfer(bus->bus);
>> +        } else {
>> +            bus->intr_status |= I2CD_INTR_TX_ACK;
>> +        }
>> +
>> +    } else if (bus->cmd & I2CD_M_RX_CMD) {
>> +        int ret = i2c_recv(bus->bus);
>> +        if (ret < 0) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: read failed\n", __func__);
>> +            ret = 0xff;
>> +        } else {
>> +            bus->intr_status |= I2CD_INTR_RX_DONE;
>> +        }
>> +        bus->buf = (ret & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
>> +    }
>> +
>> +    if (bus->cmd & (I2CD_M_STOP_CMD | I2CD_M_S_RX_CMD_LAST)) {
>> +        if (!i2c_bus_busy(bus->bus)) {
>> +            bus->intr_status |= I2CD_INTR_ABNORMAL;
>> +        } else {
>> +            i2c_end_transfer(bus->bus);
>> +            bus->intr_status |= I2CD_INTR_NORMAL_STOP;
>> +        }
>> +    }
>> +
>> +    /* command is handled, reset it and check for interrupts  */
>> +    bus->cmd &= ~0xFFFF;
>> +    aspeed_i2c_bus_raise_interrupt(bus);
>> +}
>> +
>> +static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>> +                                 uint64_t value, unsigned size)
>> +{
>> +    AspeedI2CBus *bus = (AspeedI2CBus *) opaque;
>> +
>> +    switch (offset) {
>> +    case I2CD_FUN_CTRL_REG:
>> +        if (value & I2CD_SLAVE_EN) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>> +                          __func__);
>> +            break;
>> +        }
>> +        bus->ctrl = value & 0x0071C3FF;
>> +        break;
>> +    case I2CD_AC_TIMING_REG1:
>> +        bus->timing[0] = value & 0xFFFFF0F;
>> +        break;
>> +    case I2CD_AC_TIMING_REG2:
>> +        bus->timing[1] = value & 0x7;
>> +        break;
>> +    case I2CD_INTR_CTRL_REG:
>> +        bus->intr_ctrl = value & 0x7FFF;
>> +        break;
>> +    case I2CD_INTR_STS_REG:
>> +        bus->intr_status &= ~(value & 0x7FFF);
>> +        bus->controller->intr_status &= ~(1 << bus->id);
>> +        qemu_irq_lower(bus->controller->irq);
>> +        break;
>> +    case I2CD_DEV_ADDR_REG:
>> +        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>> +                      __func__);
>> +        break;
>> +    case I2CD_BYTE_BUF_REG:
>> +        bus->buf = (value & I2CD_BYTE_BUF_TX_MASK) << I2CD_BYTE_BUF_TX_SHIFT;
>> +        break;
>> +    case I2CD_CMD_REG:
>> +        if (!aspeed_i2c_bus_is_enabled(bus)) {
>> +            break;
>> +        }
>> +
>> +        if (!aspeed_i2c_bus_is_master(bus)) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>> +                          __func__);
>> +            break;
>> +        }
>> +
>> +        aspeed_i2c_bus_handle_cmd(bus, value);
>> +        break;
>> +
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>> +                      __func__, offset);
>> +    }
>> +}
>> +
>> +static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
>> +                                   unsigned size)
>> +{
>> +    AspeedI2CState *s = (AspeedI2CState *)opaque;
>> +
>> +    switch (offset) {
>> +    case I2C_CTRL_STATUS:
>> +        return s->intr_status;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>> +                      __func__, offset);
>> +        break;
>> +    }
>> +
>> +    return -1;
>> +}
>> +
>> +static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
>> +                                  uint64_t value, unsigned size)
>> +{
>> +    switch (offset) {
>> +    case I2C_CTRL_STATUS:
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>> +                      __func__, offset);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_i2c_bus_ops = {
>> +    .read = aspeed_i2c_bus_read,
>> +    .write = aspeed_i2c_bus_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static const MemoryRegionOps aspeed_i2c_ctrl_ops = {
>> +    .read = aspeed_i2c_ctrl_read,
>> +    .write = aspeed_i2c_ctrl_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static const VMStateDescription aspeed_i2c_bus_vmstate = {
>> +    .name = TYPE_ASPEED_I2C,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(id, AspeedI2CBus),
>> +        VMSTATE_UINT32(ctrl, AspeedI2CBus),
>> +        VMSTATE_UINT32_ARRAY(timing, AspeedI2CBus, 2),
>> +        VMSTATE_UINT32(intr_ctrl, AspeedI2CBus),
>> +        VMSTATE_UINT32(intr_status, AspeedI2CBus),
>> +        VMSTATE_UINT32(cmd, AspeedI2CBus),
>> +        VMSTATE_UINT32(buf, AspeedI2CBus),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static const VMStateDescription aspeed_i2c_vmstate = {
>> +    .name = TYPE_ASPEED_I2C,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(intr_status, AspeedI2CState),
>> +        VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
>> +                             ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
>> +                             AspeedI2CBus),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void aspeed_i2c_reset(DeviceState *dev)
>> +{
>> +    int i;
>> +    AspeedI2CState *s = ASPEED_I2C(dev);
>> +
>> +    s->intr_status = 0;
>> +
>> +    for (i = 0; i < ASPEED_I2C_NR_BUSSES; i++) {
>> +        s->busses[i].intr_status = 0;
>> +        s->busses[i].cmd = 0;
>> +        s->busses[i].buf = 0;
>> +        i2c_end_transfer(s->busses[i].bus);
>> +    }
>> +}
>> +
>> +/*
>> + * Address Definitions
>> + *
>> + *   0x000 ... 0x03F: Global Register
>> + *   0x040 ... 0x07F: Device 1
>> + *   0x080 ... 0x0BF: Device 2
>> + *   0x0C0 ... 0x0FF: Device 3
>> + *   0x100 ... 0x13F: Device 4
>> + *   0x140 ... 0x17F: Device 5
>> + *   0x180 ... 0x1BF: Device 6
>> + *   0x1C0 ... 0x1FF: Device 7
>> + *   0x200 ... 0x2FF: Buffer Pool  (unused in linux driver)
>> + *   0x300 ... 0x33F: Device 8
>> + *   0x340 ... 0x37F: Device 9
>> + *   0x380 ... 0x3BF: Device 10
>> + *   0x3C0 ... 0x3FF: Device 11
>> + *   0x400 ... 0x43F: Device 12
>> + *   0x440 ... 0x47F: Device 13
>> + *   0x480 ... 0x4BF: Device 14
>> + *   0x800 ... 0xFFF: Buffer Pool  (unused in linux driver)
>> + */
>> +static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>> +{
>> +    int i;
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +    AspeedI2CState *s = ASPEED_I2C(dev);
>> +
>> +    sysbus_init_irq(sbd, &s->irq);
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
>> +                          "aspeed.i2c", 0x1000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    for (i = 0; i < ASPEED_I2C_NR_BUSSES; i++) {
>> +        char name[16];
>> +        int offset = i < 7 ? 1 : 5;
>> +        snprintf(name, sizeof(name), "aspeed.i2c.%d", i);
>> +        s->busses[i].controller = s;
>> +        s->busses[i].id = i;
>> +        s->busses[i].bus = i2c_init_bus(dev, name);
>> +        memory_region_init_io(&s->busses[i].mr, OBJECT(dev),
>> +                              &aspeed_i2c_bus_ops, &s->busses[i], name, 0x40);
>> +        memory_region_add_subregion(&s->iomem, 0x40 * (i + offset),
>> +                                    &s->busses[i].mr);
>> +    }
>> +}
>> +
>> +static void aspeed_i2c_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd = &aspeed_i2c_vmstate;
>> +    dc->reset = aspeed_i2c_reset;
>> +    dc->realize = aspeed_i2c_realize;
>> +    dc->desc = "Aspeed I2C Controller";
>> +}
>> +
>> +static const TypeInfo aspeed_i2c_info = {
>> +    .name          = TYPE_ASPEED_I2C,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(AspeedI2CState),
>> +    .class_init    = aspeed_i2c_class_init,
>> +};
>> +
>> +static void aspeed_i2c_register_types(void)
>> +{
>> +    type_register_static(&aspeed_i2c_info);
>> +}
>> +
>> +type_init(aspeed_i2c_register_types)
>> +
>> +
>> +I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr)
>> +{
>> +    AspeedI2CState *s = ASPEED_I2C(dev);
>> +    I2CBus *bus = NULL;
>> +
>> +    if (busnr >= 0 && busnr < ASPEED_I2C_NR_BUSSES) {
>> +        bus = s->busses[busnr].bus;
>> +    }
>> +
>> +    return bus;
>> +}
>> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
>> index cf7102145355..e96e3db3fbea 100644
>> --- a/include/hw/arm/ast2400.h
>> +++ b/include/hw/arm/ast2400.h
>> @@ -16,6 +16,7 @@
>>  #include "hw/intc/aspeed_vic.h"
>>  #include "hw/misc/aspeed_scu.h"
>>  #include "hw/timer/aspeed_timer.h"
>> +#include "hw/i2c/aspeed_i2c.h"
>>
>>  typedef struct AST2400State {
>>      /*< private >*/
>> @@ -28,6 +29,7 @@ typedef struct AST2400State {
>>      AspeedVICState vic;
>>      AspeedTimerCtrlState timerctrl;
>>      AspeedSCUState scu;
>> +    AspeedI2CState i2c;
>>  } AST2400State;
>>
>>  #define TYPE_AST2400 "ast2400"
>> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
>> new file mode 100644
>> index 000000000000..f9020acdef30
>> --- /dev/null
>> +++ b/include/hw/i2c/aspeed_i2c.h
>> @@ -0,0 +1,62 @@
>> +/*
>> + *  ASPEED AST2400 I2C Controller
>> + *
>> + *  Copyright (C) 2016 IBM Corp.
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License as published by
>> + *  the Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful,
>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *  GNU General Public License for more details.
>> + *
>> + *  You should have received a copy of the GNU General Public License along
>> + *  with this program; if not, write to the Free Software Foundation, Inc.,
>> + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> + */
>> +#ifndef ASPEED_I2C_H
>> +#define ASPEED_I2C_H
>> +
>> +#include "hw/i2c/i2c.h"
>> +
>> +#define TYPE_ASPEED_I2C "aspeed.i2c"
>> +#define ASPEED_I2C(obj) \
>> +    OBJECT_CHECK(AspeedI2CState, (obj), TYPE_ASPEED_I2C)
>> +
>> +#define ASPEED_I2C_NR_BUSSES 14
>> +
>> +struct AspeedI2CState;
>> +
>> +typedef struct AspeedI2CBus {
>> +    struct AspeedI2CState *controller;
>> +
>> +    MemoryRegion mr;
>> +
>> +    I2CBus *bus;
>> +    uint8_t id;
>> +
>> +    uint32_t ctrl;
>> +    uint32_t timing[2];
>> +    uint32_t intr_ctrl;
>> +    uint32_t intr_status;
>> +    uint32_t cmd;
>> +    uint32_t buf;
>> +} AspeedI2CBus;
>> +
>> +typedef struct AspeedI2CState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +    qemu_irq irq;
>> +
>> +    uint32_t intr_status;
>> +
>> +    AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
>> +} AspeedI2CState;
>> +
>> +I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr);
>> +
>> +#endif /* ASPEED_I2C_H */
>> --
>> 2.1.4
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
