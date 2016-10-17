Return-Path: <clg@kaod.org>
Received: from 14.mo1.mail-out.ovh.net (14.mo1.mail-out.ovh.net
 [178.32.97.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy93C1606zDvL6
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 18:35:19 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 12F80123E7
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 09:35:15 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 851192A0094;
 Mon, 17 Oct 2016 09:35:11 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 01/12] mtd: spi-nor: support for Aspeed
 AST2500 SoC
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-2-git-send-email-clg@kaod.org>
 <CACPK8Xc+0=Bgc6ZMEbcvS3e3CxB+aHzQ_m1czzFyu7FJyOanrg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7190bb78-8e56-54e4-4efc-a49c8725c004@kaod.org>
Date: Mon, 17 Oct 2016 09:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc+0=Bgc6ZMEbcvS3e3CxB+aHzQ_m1czzFyu7FJyOanrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9165388192215436187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 17 Oct 2016 07:35:19 -0000

On 10/17/2016 07:02 AM, Joel Stanley wrote:
> On Fri, Oct 14, 2016 at 11:07 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> From: Milton Miller <miltonm@us.ibm.com>
> 
> I realise that Milton wrote this, but as it's the first time I've had
> a chance to review it I'll comment as though you are the author.
> 
>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>> ones found on the AST2400. The differences are on the number of
>> supported flash modules and their default mappings in the SoC address
>> space.
>>
>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>> for the host firmware. All controllers have now the same set of
>> registers compatible with the AST2400 FMC controller and the legacy
>> 'SMC' controller is fully gone.
>>
>> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
>> [clg: couple of cleanups ]
> 
> You could probably have done these cleanups as a few different patches
> to make it easier to review. Not a big deal though. When we upstream
> this will all squash down. I've a few questions below, but nothing
> that will stop this going in the tree for now.
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  30 ++++--
>>  drivers/mtd/spi-nor/aspeed-smc.c                   | 112 ++++++++++++---------
>>  2 files changed, 87 insertions(+), 55 deletions(-)
>>
> 
>> @@ -140,37 +140,56 @@ struct aspeed_smc_info {
>>         u8 maxwidth;            /* max width of spi bus */
>>         bool hasdma;            /* has dma engine */
>>         bool hastype;           /* flash type field exists in cfg reg */
>> -       u8 we0;                 /* we shift for ce 0 in cfg reg */
>> +       u8 we0;                 /* shift for write enable bit for ce 0 */
>>         u8 ctl0;                /* offset in regs of ctl for ce 0 */
>> -       u8 cfg;                 /* offset in regs of cfg */
>>         u8 time;                /* offset in regs of timing */
>>         u8 misc;                /* offset in regs of misc settings */
>>  };
>>
>> -static struct aspeed_smc_info fmc_info = {
>> +static struct aspeed_smc_info fmc_2400_info = {
> 
> Can these be const?

They should.
> 
>>         .nce = 5,
>>         .maxwidth = 4,
>>         .hasdma = true,
>>         .hastype = true,
>>         .we0 = 16,
>>         .ctl0 = 0x10,
>> -       .cfg = 0x00,
>> -       .time = 0x54,
>> -       .misc = 0x50,
>> +       .time = 0x94,
>> +       .misc = 0x54,
>>  };
>>
>> -static struct aspeed_smc_info smc_info = {
>> +static struct aspeed_smc_info smc_2400_info = {
>>         .nce = 1,
>>         .maxwidth = 2,
>>         .hasdma = false,
>>         .hastype = false,
>>         .we0 = 0,
>>         .ctl0 = 0x04,
>> -       .cfg = 0x00,
>>         .time = 0x14,
>>         .misc = 0x10,
>>  };
>>
>> +static struct aspeed_smc_info fmc_2500_info = {
>> +       .nce = 3,
>> +       .maxwidth = 2,
>> +       .hasdma = true,
>> +       .hastype = true,
>> +       .we0 = 16,
>> +       .ctl0 = 0x10,
>> +       .time = 0x94,
>> +       .misc = 0x54,
>> +};
>> +
>> +static struct aspeed_smc_info smc_2500_info = {
>> +       .nce = 2,
>> +       .maxwidth = 2,
>> +       .hasdma = false,
>> +       .hastype = false,
>> +       .we0 = 16,
>> +       .ctl0 = 0x10,
>> +       .time = 0x94,
>> +       .misc = 0x54,
>> +};
>> +
>>  enum smc_ctl_reg_value {
>>         smc_base,               /* base value without mode for other commands */
>>         smc_read,               /* command reg for (maybe fast) reads */
>> @@ -180,7 +199,7 @@ enum smc_ctl_reg_value {
>>
>>  struct aspeed_smc_controller;
>>
>> -struct aspeed_smc_chip {
>> +struct aspeed_smc_per_chip {
> 
> Can you explain the rename here? I don't follow.

I don't think it is useful. I will change that.

> 
>>         struct aspeed_smc_controller *controller;
>>         __le32 __iomem *ctl;                    /* control register */
>>         void __iomem *base;                     /* base of chip window */
>> @@ -193,9 +212,11 @@ struct aspeed_smc_controller {
>>         struct mutex mutex;                     /* controller access mutex */
>>         const struct aspeed_smc_info *info;     /* type info of controller */
>>         void __iomem *regs;                     /* controller registers */
>> -       struct aspeed_smc_chip *chips[0];       /* pointers to attached chips */
>> +       struct aspeed_smc_per_chip *chips[0];   /* pointers to attached chips */
>>  };
> 
>> @@ -456,36 +478,36 @@ static int aspeed_smc_probe(struct platform_device *dev)
>>
>>                 r = platform_get_resource(dev, IORESOURCE_MEM, n + 1);
>>                 chip->base = devm_ioremap_resource(&dev->dev, r);
>> -
>>                 if (!chip->base)
>>                         continue;
>> +
>>                 chip->controller = controller;
>>                 chip->ctl = controller->regs + info->ctl0 + n * 4;
>>
>> -               /*
>> -                * The device tree said the chip is spi.
>> -                * XXX Need to set it in controller if has_type says the
>> -                * type is programmable.
>> -                */
>> +               /* The device tree said the chip is spi. */
>>                 chip->type = smc_type_spi;
>>
>>                 /*
>> -                * Always turn on the write enable bit in the config register
>> -                * to allow opcodes to be sent in user mode.
>> +                * Always turn on the write enable bit in the type and settings
>> +                * or flash configuration register to allow opcodes to be sent
>> +                * in user mode.  Set the attached chip type for this chip
>> +                * select if the bits exist.
>>                  */
>>                 mutex_lock(&controller->mutex);
> 
> Do we need to be taking locks in the drivers probe function?

nah.

> 
>> -               reg = readl(controller->regs + info->cfg);
>> -               dev_dbg(&dev->dev, "flash config was %08x\n", reg);
>> +               reg = readl(controller->regs + TYPE_SETTING_REG);
>> +               dev_dbg(&dev->dev, "flash type and setting was %08x\n", reg);
>>                 reg |= 1 << (info->we0 + n); /* WEn */
>> -               writel(reg, controller->regs + info->cfg);
>> +               if (info->hastype) {
>> +                       reg &= ~(3 << (n * 2));
>> +                       reg |= chip->type << (n * 2);
>> +               }
>> +               writel(reg, controller->regs + TYPE_SETTING_REG);
> 
> This is a bit hard to follow. Worked it out in the end though.

Yes. In a cleanup patch, I am introducing functions to differentiate the 
settings we are doing. Due to the extreme creativeness of the smc interface,
it is really easy to fall into a trap and use the wrong register/bit ...

The AST2500 SPI flash controller misses a setting for instance. I need
to send a fix for that.


C. 

> 
>>                 mutex_unlock(&controller->mutex);
>>
>>                 /*
>>                  * Read the existing control register to get basic values.
>>                  *
>>                  * XXX This register probably needs more sanitation.
>> -                * XXX Do we trust the bootloader or the device tree?
>> -                * spi-nor.c trusts jtag id over passed ids.
>>                  *
>>                  * Do we need support for mode 3 vs mode 0 clock phasing?
>>                  */
>> @@ -531,7 +553,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
>>                  * Adjust clocks if fast read and write are supported.
>>                  * Interpret spi-nor flags to adjust controller settings.
>>                  * Check if resource size big enough for detected chip and
>> -                * add support assisted (normal or fast-) read.
>> +                * add support assisted (normal or fast-) read and dma.
>>                  */
>>
>>                 err = mtd_device_register(&chip->nor.mtd, NULL, 0);
>> --
>> 2.7.4
