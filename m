Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjKBp1FbCzDqKp
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 16:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GHWL9jFA"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id y64so216480ywe.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UWO/ulZsjLW4gLKsM1jQ/VKPUM82iZhOsrHMREGhrTY=;
 b=GHWL9jFAtLUuro72I4PLqZI1QL5RDWlSUyMkNM3h0zXL+b58ypaTogv5bf8cJBCe1S
 WBwJC1ldKhgLJWOXYms/1w94D5fpCnmx9FHV/hB6J+TkB797EojNoQu9ds+9IjbZdKa/
 YG3hlBNHrZ743EQU4PIL+en9Cy++hKtoAInvfBv/RvRdr6vK58qYFGuTF18jYdoojeLK
 2ZvMyFYjoM3fYiCFxGNiDmQSfd5RXvCrB/kfc9B59GiE4Z+ErPRrExn/aGkHtM8VJp3D
 vJAsL5B3HT+B8pE6w26F01WEVaGAtnCgRhH7WbAKldfDjH9dw1+ep1DXdybDCW2PkeMk
 VKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UWO/ulZsjLW4gLKsM1jQ/VKPUM82iZhOsrHMREGhrTY=;
 b=ZAXmQfys1yS7piNOLyZsQombsLfsgDO2PiBlZBWoBr4mPNTMjSyr5Q584tf9WbzBbU
 oP6q2HRHR4FLSj/EhwobpxwLRqmZziGbnemOf/4SlHM8vJ0TwScUgS+orFuN2YCPOdAA
 GdLT0Bsne88ZpTbUp7ly4Yr7Z/SyghkYFbNVxSI+rIIHCgIvuteJbwpxrHq6i5N+NgDy
 T2XQlK4IQ0xjEolxnfGvKr+e9nU/EW9oQFrMfELHocovqJUDgY5osx/pLBWR7DtltceU
 H8G76hj5j1Ot9V0eQDwLQCRObjlhosFPe47xSeX3psS9bYFcBaTX7CK2wFxqHrVnIOg5
 s8yg==
X-Gm-Message-State: AODbwcCoIxTbbDeP0NlRm8CIQAaUuWx80foUUsjCnjnlwMashUEUcgcz
 rQATV6ShFRvC2kceNgumYZhksrI+2w==
X-Received: by 10.13.233.195 with SMTP id s186mr5553941ywe.329.1496818687114; 
 Tue, 06 Jun 2017 23:58:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 6 Jun 2017 23:57:46 -0700 (PDT)
In-Reply-To: <20170603012952.2192-6-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-6-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2017 16:27:46 +0930
X-Google-Sender-Auth: XY26QDJPKSOxFdMON5hnVbgqx-4
Message-ID: <CACPK8XeNqzc79KvBa1rZhMFrs2uwAVzpR05LZO48s3zHHS2J=A@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] i2c: aspeed: added slave support for Aspeed I2C
 driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 07 Jun 2017 06:58:11 -0000

On Sat, Jun 3, 2017 at 10:59 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added slave support for Aspeed I2C controller. Supports fourteen busses
> present in AST24XX and AST25XX BMC SoCs by Aspeed.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

I wired up the first and second buses on the ast2500evb, and performed
the following test:

echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new_device
echo 24c02 0x64 > /sys/bus/i2c/devices/i2c-0/new_device

echo "How about a nice game of chess? 0xDEADBEEF" >
/sys/bus/i2c/devices/1-1064/slave-eeprom

hexdump -C /sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a040.i2c-bus/i2c-0/0-0064/eeprom
00000000  48 6f 77 20 61 62 6f 75  74 20 61 20 6e 69 63 65  |How about a nice|
00000010  20 67 61 6d 65 20 6f 66  20 63 68 65 73 73 3f 20  | game of chess? |
00000020  30 78 44 45 41 44 42 45  45 46 0a 00 00 00 00 00  |0xDEADBEEF......|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100

I also tested the other direction:

# echo "hack the planet" >
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a040.i2c-bus/i2c-0/0-0064/eeprom
# hexdump -C /sys/bus/i2c/devices/1-1064/slave-eeprom
00000000  68 61 63 6b 20 74 68 65  20 70 6c 61 6e 65 74 0a  |hack the planet.|
00000010  20 67 61 6d 65 20 6f 66  20 63 68 65 73 73 3f 20  | game of chess? |
00000020  30 78 44 45 41 44 42 45  45 46 0a 00 00 00 00 00  |0xDEADBEEF......|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100

# md5sum /sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a040.i2c-bus
/i2c-0/0-0064/eeprom
0ae09da1dcbeb410cd311579fb6bd3b4
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a040.i2c-bus/i2c-0/0-0064/eeprom
# md5sum /sys/bus/i2c/devices/1-1064/slave-eeprom
0ae09da1dcbeb410cd311579fb6bd3b4  /sys/bus/i2c/devices/1-1064/slave-eeprom

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
> Added in v6:
>   - Pulled slave support out of initial driver commit into its own commit.
>   - No longer arbitrarily restrict bus to be slave xor master.
> Changes for v7:
>   - Added hardware reset function
>   - Marked functions that need to be called with the lock held as "unlocked"
>   - Did some cleanup
> Changes for v8:
>   - None
> Changes for v9:
>   - None
> Changes for v10:
>   - None
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 202 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index a04021e3b3ab..6516addf5bb8 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -49,6 +49,7 @@
>  #define ASPEED_I2CD_SDA_DRIVE_1T_EN                    BIT(8)
>  #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN                  BIT(7)
>  #define ASPEED_I2CD_M_HIGH_SPEED_EN                    BIT(6)
> +#define ASPEED_I2CD_SLAVE_EN                           BIT(1)
>  #define ASPEED_I2CD_MASTER_EN                          BIT(0)
>
>  /* 0x04 : I2CD Clock and AC Timing Control Register #1 */
> @@ -69,6 +70,7 @@
>   */
>  #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT                        BIT(14)
>  #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE              BIT(13)
> +#define ASPEED_I2CD_INTR_SLAVE_MATCH                   BIT(7)
>  #define ASPEED_I2CD_INTR_SCL_TIMEOUT                   BIT(6)
>  #define ASPEED_I2CD_INTR_ABNORMAL                      BIT(5)
>  #define ASPEED_I2CD_INTR_NORMAL_STOP                   BIT(4)
> @@ -106,6 +108,9 @@
>  #define ASPEED_I2CD_M_TX_CMD                           BIT(1)
>  #define ASPEED_I2CD_M_START_CMD                                BIT(0)
>
> +/* 0x18 : I2CD Slave Device Address Register   */
> +#define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
> +
>  enum aspeed_i2c_master_state {
>         ASPEED_I2C_MASTER_START,
>         ASPEED_I2C_MASTER_TX_FIRST,
> @@ -116,6 +121,15 @@ enum aspeed_i2c_master_state {
>         ASPEED_I2C_MASTER_INACTIVE,
>  };
>
> +enum aspeed_i2c_slave_state {
> +       ASPEED_I2C_SLAVE_START,
> +       ASPEED_I2C_SLAVE_READ_REQUESTED,
> +       ASPEED_I2C_SLAVE_READ_PROCESSED,
> +       ASPEED_I2C_SLAVE_WRITE_REQUESTED,
> +       ASPEED_I2C_SLAVE_WRITE_RECEIVED,
> +       ASPEED_I2C_SLAVE_STOP,
> +};
> +
>  struct aspeed_i2c_bus {
>         struct i2c_adapter              adap;
>         struct device                   *dev;
> @@ -136,6 +150,10 @@ struct aspeed_i2c_bus {
>         int                             cmd_err;
>         /* Protected only by i2c_lock_bus */
>         int                             master_xfer_result;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       struct i2c_client               *slave;
> +       enum aspeed_i2c_slave_state     slave_state;
> +#endif /* CONFIG_I2C_SLAVE */
>  };
>
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> @@ -207,6 +225,110 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>         return aspeed_i2c_reset(bus);
>  }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
> +{
> +       u32 command, irq_status, status_ack = 0;
> +       struct i2c_client *slave = bus->slave;
> +       bool irq_handled = true;
> +       u8 value;
> +
> +       spin_lock(&bus->lock);
> +       if (!slave) {
> +               irq_handled = false;
> +               goto out;
> +       }
> +
> +       command = readl(bus->base + ASPEED_I2C_CMD_REG);
> +       irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +       /* Slave was requested, restart state machine. */
> +       if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> +               status_ack |= ASPEED_I2CD_INTR_SLAVE_MATCH;
> +               bus->slave_state = ASPEED_I2C_SLAVE_START;
> +       }
> +
> +       /* Slave is not currently active, irq was for someone else. */
> +       if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
> +               irq_handled = false;
> +               goto out;
> +       }
> +
> +       dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
> +               irq_status, command);
> +
> +       /* Slave was sent something. */
> +       if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
> +               value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
> +               /* Handle address frame. */
> +               if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
> +                       if (value & 0x1)
> +                               bus->slave_state =
> +                                               ASPEED_I2C_SLAVE_READ_REQUESTED;
> +                       else
> +                               bus->slave_state =
> +                                               ASPEED_I2C_SLAVE_WRITE_REQUESTED;
> +               }
> +               status_ack |= ASPEED_I2CD_INTR_RX_DONE;
> +       }
> +
> +       /* Slave was asked to stop. */
> +       if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> +               status_ack |= ASPEED_I2CD_INTR_NORMAL_STOP;
> +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +       }
> +       if (irq_status & ASPEED_I2CD_INTR_TX_NAK) {
> +               status_ack |= ASPEED_I2CD_INTR_TX_NAK;
> +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +       }
> +
> +       switch (bus->slave_state) {
> +       case ASPEED_I2C_SLAVE_READ_REQUESTED:
> +               if (irq_status & ASPEED_I2CD_INTR_TX_ACK)
> +                       dev_err(bus->dev, "Unexpected ACK on read request.\n");
> +               bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
> +
> +               i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
> +               writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> +               writel(ASPEED_I2CD_S_TX_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +               break;
> +       case ASPEED_I2C_SLAVE_READ_PROCESSED:
> +               status_ack |= ASPEED_I2CD_INTR_TX_ACK;
> +               if (!(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> +                       dev_err(bus->dev,
> +                               "Expected ACK after processed read.\n");
> +               i2c_slave_event(slave, I2C_SLAVE_READ_PROCESSED, &value);
> +               writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> +               writel(ASPEED_I2CD_S_TX_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +               break;
> +       case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
> +               bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
> +               i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +               break;
> +       case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
> +               i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +               break;
> +       case ASPEED_I2C_SLAVE_STOP:
> +               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +               break;
> +       default:
> +               dev_err(bus->dev, "unhandled slave_state: %d\n",
> +                       bus->slave_state);
> +               break;
> +       }
> +
> +       if (status_ack != irq_status)
> +               dev_err(bus->dev,
> +                       "irq handled != irq. expected %x, but was %x\n",
> +                       irq_status, status_ack);
> +       writel(status_ack, bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +out:
> +       spin_unlock(&bus->lock);
> +       return irq_handled;
> +}
> +#endif /* CONFIG_I2C_SLAVE */
> +
>  /* precondition: bus.lock has been acquired. */
>  static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>  {
> @@ -415,6 +537,13 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  {
>         struct aspeed_i2c_bus *bus = dev_id;
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       if (aspeed_i2c_slave_irq(bus)) {
> +               dev_dbg(bus->dev, "irq handled by slave.\n");
> +               return IRQ_HANDLED;
> +       }
> +#endif /* CONFIG_I2C_SLAVE */
> +
>         if (aspeed_i2c_master_irq(bus))
>                 return IRQ_HANDLED;
>         else
> @@ -465,9 +594,76 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
>         return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +/* precondition: bus.lock has been acquired. */
> +static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
> +{
> +       u32 addr_reg_val, func_ctrl_reg_val;
> +
> +       /* Set slave addr. */
> +       addr_reg_val = readl(bus->base + ASPEED_I2C_DEV_ADDR_REG);
> +       addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR_MASK;
> +       addr_reg_val |= slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
> +       writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);
> +
> +       /* Turn on slave mode. */
> +       func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
> +       writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +}
> +
> +static int aspeed_i2c_reg_slave(struct i2c_client *client)
> +{
> +       struct aspeed_i2c_bus *bus;
> +       unsigned long flags;
> +
> +       bus = client->adapter->algo_data;
> +       spin_lock_irqsave(&bus->lock, flags);
> +       if (bus->slave) {
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       __aspeed_i2c_reg_slave(bus, client->addr);
> +
> +       bus->slave = client;
> +       bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int aspeed_i2c_unreg_slave(struct i2c_client *client)
> +{
> +       struct aspeed_i2c_bus *bus = client->adapter->algo_data;
> +       u32 func_ctrl_reg_val;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       if (!bus->slave) {
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       /* Turn off slave mode. */
> +       func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~ASPEED_I2CD_SLAVE_EN;
> +       writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       bus->slave = NULL;
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       return 0;
> +}
> +#endif /* CONFIG_I2C_SLAVE */
> +
>  static const struct i2c_algorithm aspeed_i2c_algo = {
>         .master_xfer    = aspeed_i2c_master_xfer,
>         .functionality  = aspeed_i2c_functionality,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       .reg_slave      = aspeed_i2c_reg_slave,
> +       .unreg_slave    = aspeed_i2c_unreg_slave,
> +#endif /* CONFIG_I2C_SLAVE */
>  };
>
>  static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
> @@ -542,6 +738,12 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>         writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) | fun_ctrl_reg,
>                bus->base + ASPEED_I2C_FUN_CTRL_REG);
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       /* If slave has already been registered, re-enable it. */
> +       if (bus->slave)
> +               __aspeed_i2c_reg_slave(bus, bus->slave->addr);
> +#endif /* CONFIG_I2C_SLAVE */
> +
>         /* Set interrupt generation of I2C controller */
>         writel(ASPEED_I2CD_INTR_ALL, bus->base + ASPEED_I2C_INTR_CTRL_REG);
>
> --
> 2.13.0.506.g27d5fe0cd-goog
>
