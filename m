Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wN89L2S79zDqKy
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 18:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jVn1zIA2"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id d72so886718ybh.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AyqUHuYLPhU4baWFmgS+m6LIiESM4orxHPYFWqCVaEY=;
 b=jVn1zIA2n6z8jj2+q9kaBtPyDakqZchCBZ9R6m8l8LRksqWvERRH1RT0JB0hixkNem
 1QIqdlvOYUba5ltQMU0labdEyo9+EZgUo1e/P1GI50S77nA2VDMnMtLjdCfD07vbKoGK
 5qMbma9BJu02afjfmjyVNfA6QxijljThJ7dbDnfvTmWA8QA6YtMKRYD5095lU4oTIyQa
 x/KIw6qV0pYYbhhaxpaR7YicC5yv9ONdtHBFYcfTiueQUgtBE3IU1w8R3cP345XdlVhl
 m5osz6UsaXxiq0iGpRVSop5JiYYMyMaYqXz0CZ4/PuOV8pXQCsfdgUUdQYMLwdIJXJFQ
 UUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AyqUHuYLPhU4baWFmgS+m6LIiESM4orxHPYFWqCVaEY=;
 b=jPfPXk6sawTsVxTQlfbUM92FR3yu8lMoNR1jsWn2a6bpZHX3Ps5SFzIpK/hXEFPenZ
 EVq1Edxml3cSSMVSN503Ceth0BF1Ku+ljeX6Bc2GAt20G3VjZxo1+fKIbZ0QDWsBoEp5
 gRSCRGdCWms47w3HXqcaaF5xgqG4PIA35p4QZPWr1JJsOAvul7GWLFwUgVvQRDtaywMz
 49WPPkL7xrmAJWTIvGXTm7EG0drQQ9/wdtbyp/15TEU3nRN84olKWooaB+wCk9LEMM6G
 gVjHAedIofoSPHfCHErsVC9Ab2P7UczU/uZqnTeK9l9ovr91eYf4cJ4UXqsyCQ8DNKHi
 tjYg==
X-Gm-Message-State: AODbwcDenFBUUQ0YwMK2zRDs1awTCwjzJHD7f9XCVNEANMftP1cmsGFj
 Y6RC9yRziv1XU1DFF/PFYTMyVo1mdA==
X-Received: by 10.37.31.195 with SMTP id f186mr3822075ybf.25.1494403939818;
 Wed, 10 May 2017 01:12:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 10 May 2017 01:11:59 -0700 (PDT)
In-Reply-To: <1493928505-30816-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1493928505-30816-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 May 2017 17:41:59 +0930
X-Google-Sender-Auth: JVGex0469eRQf3v0zQrWAyCHZ5I
Message-ID: <CACPK8XcE+veBqNPLJRY4Amjc5h0NC-8Q1yCOqjxmyLHTH=JCzw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/6] drivers: i2c: Add FSI-attached I2C
 master algorithm
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 10 May 2017 08:12:23 -0000

On Fri, May 5, 2017 at 5:38 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Initial startup code for the I2C algorithm to drive the I2C master
> located on POWER CPUs over FSI bus.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/Makefile             |   2 +-
>  drivers/i2c/busses/Kconfig   |  11 ++
>  drivers/i2c/busses/Makefile  |   1 +
>  drivers/i2c/busses/i2c-fsi.c | 275 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 288 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/i2c/busses/i2c-fsi.c
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 67ce51d..278f109 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -105,6 +105,7 @@ obj-$(CONFIG_SERIO)         += input/serio/
>  obj-$(CONFIG_GAMEPORT)         += input/gameport/
>  obj-$(CONFIG_INPUT)            += input/
>  obj-$(CONFIG_RTC_LIB)          += rtc/
> +obj-$(CONFIG_FSI)              += fsi/
>  obj-y                          += i2c/ media/
>  obj-$(CONFIG_PPS)              += pps/
>  obj-y                          += ptp/
> @@ -173,4 +174,3 @@ obj-$(CONFIG_STM)           += hwtracing/stm/
>  obj-$(CONFIG_ANDROID)          += android/
>  obj-$(CONFIG_NVMEM)            += nvmem/
>  obj-$(CONFIG_FPGA)             += fpga/
> -obj-$(CONFIG_FSI)              += fsi/
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 7e34901d..0c714e0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1245,4 +1245,15 @@ config I2C_OPAL
>           This driver can also be built as a module. If so, the module will be
>           called as i2c-opal.
>
> +config I2C_FSI
> +       tristate "FSI I2C driver"
> +       depends on FSI
> +       help
> +         Driver for FSI bus attached I2C masters. These are I2C masters that
> +         are connected to the system over a FSI bus, instead of the more
> +         common PCI or MMIO interface.
> +
> +         This driver can also be built as a module. If so, the module will be
> +         called as i2c-fsi.
> +
>  endmenu
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 5798b4e..547773b 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -124,5 +124,6 @@ obj-$(CONFIG_I2C_PCA_ISA)   += i2c-pca-isa.o
>  obj-$(CONFIG_I2C_SIBYTE)       += i2c-sibyte.o
>  obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
>  obj-$(CONFIG_SCx200_ACB)       += scx200_acb.o
> +obj-$(CONFIG_I2C_FSI)          += i2c-fsi.o
>
>  ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> new file mode 100644
> index 0000000..bb12fa9
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -0,0 +1,275 @@
> +/*
> + * Copyright 2017 IBM Corporation
> + *
> + * Eddie James <eajames@us.ibm.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/fsi.h>
> +#include <linux/i2c.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/sched.h>
> +#include <linux/semaphore.h>
> +#include <linux/wait.h>
> +
> +#define FSI_ENGID_I2C_FSI      0x7

Is the engine ID something that is part of the FSI spec? If so, we
should put the IDs in the FSI headers.

> +
> +/* Find left shift from first set bit in m */
> +#define MASK_TO_LSH(m)         (__builtin_ffsll(m) - 1ULL)
> +
> +/* Extract field m from v */
> +#define GETFIELD(m, v)         (((v) & (m)) >> MASK_TO_LSH(m))
> +
> +/* Set field m of v to val */
> +#define SETFIELD(m, v, val)    \
> +       (((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))

My eyes :)

Are these going to be used by all of our FSI drivers? Perhaps we could
get Chris to put them in the common FSI header.

> +
> +#define I2C_DEFAULT_CLK_DIV    6
> +#define I2C_DEFAULT_CLK                333333
> +
> +/* i2c registers */
> +#define I2C_FSI_FIFO           0x00
> +#define I2C_FSI_CMD            0x04
> +#define I2C_FSI_MODE           0x08
> +#define I2C_FSI_WATER_MARK     0x0C
> +#define I2C_FSI_INT_MASK       0x10
> +#define I2C_FSI_INT_COND       0x14
> +#define I2C_FSI_OR_INT_MASK    0x14
> +#define I2C_FSI_INTS           0x18
> +#define I2C_FSI_AND_INT_MASK   0x18
> +#define I2C_FSI_STAT           0x1C
> +#define I2C_FSI_RESET_I2C      0x1C
> +#define I2C_FSI_ESTAT          0x20
> +#define I2C_FSI_RESET_ERR      0x20
> +#define I2C_FSI_RESID_LEN      0x24
> +#define I2C_FSI_SET_SCL                0x24
> +#define I2C_FSI_PORT_BUSY      0x28
> +#define I2C_FSI_RESET_SCL      0x2C
> +#define I2C_FSI_SET_SDA                0x30
> +#define I2C_FSI_RESET_SDA      0x34
> +
> +/* cmd register */
> +#define I2C_CMD_WITH_START     0x80000000
> +#define I2C_CMD_WITH_ADDR      0x40000000
> +#define I2C_CMD_RD_CONT                0x20000000
> +#define I2C_CMD_WITH_STOP      0x10000000
> +#define I2C_CMD_FORCELAUNCH    0x08000000
> +#define I2C_CMD_ADDR           0x00fe0000
> +#define I2C_CMD_READ           0x00010000
> +#define I2C_CMD_LEN            0x0000ffff
> +
> +/* mode register */
> +#define I2C_MODE_CLKDIV                0xffff0000
> +#define I2C_MODE_PORT          0x0000fc00
> +#define I2C_MODE_ENHANCED      0x00000008
> +#define I2C_MODE_DIAG          0x00000004
> +#define I2C_MODE_PACE_ALLOW    0x00000002
> +#define I2C_MODE_WRAP          0x00000001
> +
> +/* watermark register */
> +#define I2C_WATERMARK_HI       0x0000f000
> +#define I2C_WATERMARK_LO       0x000000f0
> +
> +#define I2C_FIFO_HI_LVL                4
> +#define I2C_FIFO_LO_LVL                4
> +
> +/* interrupt register */
> +#define I2C_INT_INV_CMD                0x00008000
> +#define I2C_INT_PARITY         0x00004000
> +#define I2C_INT_BE_OVERRUN     0x00002000
> +#define I2C_INT_BE_ACCESS      0x00001000
> +#define I2C_INT_LOST_ARB       0x00000800
> +#define I2C_INT_NACK           0x00000400
> +#define I2C_INT_DAT_REQ                0x00000200
> +#define I2C_INT_CMD_COMP       0x00000100
> +#define I2C_INT_STOP_ERR       0x00000080
> +#define I2C_INT_BUSY           0x00000040
> +#define I2C_INT_IDLE           0x00000020
> +
> +#define I2C_INT_ENABLE         0x0000ff80
> +#define I2C_INT_ERR            0x0000fcc0
> +
> +/* status register */
> +#define I2C_STAT_INV_CMD       0x80000000
> +#define I2C_STAT_PARITY                0x40000000
> +#define I2C_STAT_BE_OVERRUN    0x20000000
> +#define I2C_STAT_BE_ACCESS     0x10000000
> +#define I2C_STAT_LOST_ARB      0x08000000
> +#define I2C_STAT_NACK          0x04000000
> +#define I2C_STAT_DAT_REQ       0x02000000
> +#define I2C_STAT_CMD_COMP      0x01000000
> +#define I2C_STAT_STOP_ERR      0x00800000
> +#define I2C_STAT_MAX_PORT      0x000f0000
> +#define I2C_STAT_ANY_INT       0x00008000
> +#define I2C_STAT_SCL_IN                0x00000800
> +#define I2C_STAT_SDA_IN                0x00000400
> +#define I2C_STAT_PORT_BUSY     0x00000200
> +#define I2C_STAT_SELF_BUSY     0x00000100
> +#define I2C_STAT_FIFO_COUNT    0x000000ff
> +
> +#define I2C_STAT_ERR           0xfc800000
> +#define I2C_STAT_ANY_RESP      0xff800000
> +
> +/* extended status register */
> +#define I2C_ESTAT_FIFO_SZ      0xff000000
> +#define I2C_ESTAT_SCL_IN_SY    0x00008000
> +#define I2C_ESTAT_SDA_IN_SY    0x00004000
> +#define I2C_ESTAT_S_SCL                0x00002000
> +#define I2C_ESTAT_S_SDA                0x00001000
> +#define I2C_ESTAT_M_SCL                0x00000800
> +#define I2C_ESTAT_M_SDA                0x00000400
> +#define I2C_ESTAT_HI_WATER     0x00000200
> +#define I2C_ESTAT_LO_WATER     0x00000100
> +#define I2C_ESTAT_PORT_BUSY    0x00000080
> +#define I2C_ESTAT_SELF_BUSY    0x00000040
> +#define I2C_ESTAT_VERSION      0x0000001f
> +
> +struct fsi_i2c_master {
> +       struct fsi_device       *fsi;
> +       u8                      fifo_size;
> +       unsigned long           clk;
> +};
> +
> +static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
> +                           u32 *data)
> +{
> +       int rc;
> +       u32 _data;

Not a fan of the underscores. Perhaps raw_data?

> +
> +       rc = fsi_device_read(fsi, reg, &_data, sizeof(_data));
> +       if (rc)
> +               return rc;
> +
> +       *data = be32_to_cpu(_data);
> +
> +       return 0;
> +}
> +
> +static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
> +                            u32 *data)
> +{
> +       u32 _data = cpu_to_be32(*data);
> +
> +       return fsi_device_write(fsi, reg, &_data, sizeof(_data));

It would be nice if the FSI api checked that you were passing it data
in the correct endiannes.

> +}
> +
> +static unsigned long fsi_i2c_get_clk_div(struct fsi_i2c_master *i2c)
> +{
> +       unsigned long clk_div = I2C_DEFAULT_CLK_DIV;
> +
> +       return clk_div;
> +}

A bit of overkill. You could just use the #define where you need it.

> +
> +static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
> +{
> +       int rc;
> +       unsigned long clk_div;
> +       u32 mode = I2C_MODE_ENHANCED, extended_status, watermark = 0;
> +       u32 interrupt = 0;
> +
> +       /* since we use polling, disable interrupts */
> +       rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, &interrupt);
> +       if (rc)
> +               return rc;
> +
> +       clk_div = fsi_i2c_get_clk_div(i2c);
> +       mode = SETFIELD(I2C_MODE_CLKDIV, mode, clk_div);
> +       rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +       if (rc)
> +               return rc;
> +
> +       rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_ESTAT, &extended_status);
> +       if (rc)
> +               return rc;
> +
> +       i2c->fifo_size = GETFIELD(I2C_ESTAT_FIFO_SZ, extended_status);
> +       watermark = SETFIELD(I2C_WATERMARK_HI, watermark,
> +                            i2c->fifo_size - I2C_FIFO_HI_LVL);
> +       watermark = SETFIELD(I2C_WATERMARK_LO, watermark,
> +                            I2C_FIFO_LO_LVL);
> +
> +       rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_WATER_MARK, &watermark);
> +
> +       return rc;
> +}
> +
> +static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +                       int num)
> +{
> +       return -ENOSYS;
> +}
> +
> +static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
> +}
> +
> +static const struct i2c_algorithm fsi_i2c_algorithm = {
> +       .master_xfer = fsi_i2c_xfer,
> +       .functionality = fsi_i2c_functionality,
> +};
> +
> +static int fsi_i2c_probe(struct device *dev)
> +{
> +       struct fsi_i2c_master *i2c;
> +       int rc;
> +       u32 clk;
> +
> +       i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +       if (!i2c)
> +               return -ENOMEM;
> +
> +       i2c->fsi = to_fsi_dev(dev);
> +       i2c->clk = I2C_DEFAULT_CLK;
> +
> +       if (dev->of_node) {
> +               if (!of_property_read_u32(dev->of_node, "clock-frequency",
> +                                         &clk))
> +                       i2c->clk = clk;
> +       }
> +
> +       rc = fsi_i2c_dev_init(i2c);
> +       if (rc)
> +               return rc;
> +
> +       dev_set_drvdata(dev, i2c);
> +
> +       return 0;
> +}
> +
> +static const struct fsi_device_id fsi_i2c_ids[] = {
> +       { FSI_ENGID_I2C_FSI, FSI_VERSION_ANY },
> +       { 0 }
> +};
> +
> +static struct fsi_driver fsi_i2c_driver = {
> +       .id_table = fsi_i2c_ids,
> +       .drv = {
> +               .name = "i2c_master_fsi",
> +               .bus = &fsi_bus_type,
> +               .probe = fsi_i2c_probe,
> +       },
> +};
> +
> +static int fsi_i2c_init(void)
> +{
> +       return fsi_driver_register(&fsi_i2c_driver);
> +}
> +
> +static void fsi_i2c_exit(void)
> +{
> +       fsi_driver_unregister(&fsi_i2c_driver);
> +}
> +
> +module_init(fsi_i2c_init);
> +module_exit(fsi_i2c_exit);

Please use module_fsi_driver() instead.


> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("FSI attached I2C master");
> +MODULE_LICENSE("GPL");
> --
> 1.8.3.1
>
