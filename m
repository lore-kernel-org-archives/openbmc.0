Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqJ6Y6xv8zDqdv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 20:29:57 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 30E7848D4D
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 09:13:56 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id EDB371800A5;
 Fri, 24 Mar 2017 09:13:54 +0100 (CET)
Subject: Re: [PATCH linux dev-4.10 3/3] mtd: spi-nor: aspeed: configure chip
 window on AHB bus
To: Joel Stanley <joel@jms.id.au>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
 <1490258557-16803-4-git-send-email-clg@kaod.org>
 <CACPK8XfEzsUxo-QQJjuOwv-DaaqaXe2POLP-yRQDcFOz+8hfOg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fa99e8f5-3c00-ca65-9e59-261351e28614@kaod.org>
Date: Fri, 24 Mar 2017 09:13:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfEzsUxo-QQJjuOwv-DaaqaXe2POLP-yRQDcFOz+8hfOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15367407831564192514
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 24 Mar 2017 09:29:58 -0000

On 03/24/2017 06:11 AM, Joel Stanley wrote:
> On Thu, Mar 23, 2017 at 7:12 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> This tries to configure the segment registers of each chip depending
>> on the size of the flash device and depending on the previous segment
>> settings, in order to have a contiguous window across multiple
>> chip.
>>
>> Unfortunately, the AST2500 SPI controller has a bug and it is not
>> possible to configure a full 128MB window for a chip of the same
>> size. The window size needs to be restricted to 120MB. This issue only
>> applies to CE0.
> 
> Looks ok to me. Some questions below.
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 121 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 118 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index b3c8cfe29765..9807ebb05bde 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -104,6 +104,7 @@ struct aspeed_smc_chip {
>>         struct aspeed_smc_controller *controller;
>>         void __iomem *ctl;                      /* control register */
>>         void __iomem *ahb_base;                 /* base of chip window */
>> +       u32 ahb_window_size;                    /* chip window size */
>>         unsigned long phys_base;                /* physical address of window */
>>         u32 ctl_val[smc_max];                   /* control settings */
>>         enum aspeed_smc_flash_type type;        /* what type of flash */
>> @@ -218,6 +219,10 @@ struct aspeed_smc_controller {
>>  #define SEGMENT_ADDR_REG0              0x30
>>  #define SEGMENT_ADDR_START(_r)         ((((_r) >> 16) & 0xFF) << 23)
>>  #define SEGMENT_ADDR_END(_r)           ((((_r) >> 24) & 0xFF) << 23)
> 
> These two are getting the values, and the one below is for setting?

yes, these are helpers to manipulate the registers. the start and end 
address of the segment are encoded in 8MB unit. 

> 
>> +#define SEGMENT_ADDR_VALUE(start, end)                                 \
>> +       (((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
>> +#define SEGMENT_ADDR_REG(ctrl, cs)     \
>> +       ((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
>>
>>  /* DMA Registers */
>>  #define DMA_CONTROL_REG                        0x80
>> @@ -604,8 +609,7 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
>>         u32 reg;
>>
>>         if (controller->info->nce > 1) {
>> -               reg = readl(controller->regs + SEGMENT_ADDR_REG0 +
>> -                           chip->cs * 4);
>> +               reg = readl(SEGMENT_ADDR_REG(controller, chip->cs));
>>
>>                 if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
>>                         return NULL;
>> @@ -616,6 +620,108 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
>>         return controller->ahb_base + offset;
>>  }
>>
>> +static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
>> +                           u32 size)
>> +{
>> +       struct aspeed_smc_controller *controller = chip->controller;
>> +       void __iomem *seg_reg;
>> +       u32 oldval, newval, val0, start0, end;
>> +
>> +       val0 = readl(SEGMENT_ADDR_REG(controller, 0));
>> +       start0 = SEGMENT_ADDR_START(val0);
>> +
>> +       seg_reg = SEGMENT_ADDR_REG(controller, cs);
>> +       oldval = readl(seg_reg);
>> +
>> +       /* If the chip size is not specified, use the default segment
>> +        * size, but take into account the possible overlap with the
>> +        * previous segment
>> +        */
>> +       if (!size)
>> +               size = SEGMENT_ADDR_END(oldval) - start;
>> +
>> +       /* The segment cannot exceed the maximum window size of the
>> +        * controller.
>> +        */
>> +       if (start + size > start0 + controller->info->maxsize) {
>> +               size = start0 + controller->info->maxsize - start;
>> +               dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
>> +                        cs, size >> 20);
>> +       }
>> +
>> +       end = start + size;
>> +       newval = SEGMENT_ADDR_VALUE(start, end);
>> +       writel(newval, seg_reg);
>> +
>> +       /* Restore default value if something goes wrong. */
>> +       if (newval != readl(seg_reg)) {
> 
> The hardware will not accept an invalid value?

It would (and in some cases, it will also pick its own values) 
but the access to the chip would be broken. Restoring the previous 
values in case of error should bring us back to the initial 
default values which worked for User mode. If they didn't, 
we would not have detected the chip and we wouldn't be in that
part of the code.   

Cheers,

C. 
>> +               dev_err(chip->nor.dev, "CE%d window invalid", cs);
>> +               writel(oldval, seg_reg);
>> +               start = SEGMENT_ADDR_START(oldval);
>> +               end = SEGMENT_ADDR_END(oldval);
>> +               size = end - start;
>> +       }
>> +
>> +       dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
>> +                cs, start, end, size >> 20);
>> +
>> +       return size;
>> +}
>> +
>> +/*
>> + * This is expected to be called in increasing CE order
>> + */
>> +static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
>> +{
>> +       struct aspeed_smc_controller *controller = chip->controller;
>> +       u32  val0, start0, start;
>> +       u32 size = chip->nor.mtd.size;
>> +
>> +       /* The AST2500 SPI controller has a bug when the CE0 chip size
>> +        * exceeds 120MB.
>> +        */
>> +       if (chip->cs == 0 && controller->info == &spi_2500_info &&
>> +           size == (128 << 20)) {
>> +               size = 120 << 20;
>> +               dev_info(chip->nor.dev,
>> +                        "CE%d window resized to %dMB (AST2500 HW quirk)",
>> +                        chip->cs, size >> 20);
>> +       }
>> +
>> +       val0 = readl(SEGMENT_ADDR_REG(controller, 0));
>> +       start0 = SEGMENT_ADDR_START(val0);
>> +
>> +       /* As a start address for the current segment, use the default
>> +        * start address if we are handling CE0 or use the previous
>> +        * segment ending address
>> +        */
>> +       if (chip->cs) {
>> +               u32 prev = readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
>> +
>> +               start = SEGMENT_ADDR_END(prev);
>> +       } else
>> +               start = start0;
>> +
>> +       size = chip_set_segment(chip, chip->cs, start, size);
>> +
>> +       /* Update chip base address on the AHB bus */
>> +       chip->ahb_base = controller->ahb_base + (start - start0);
>> +
>> +       if (size < chip->nor.mtd.size)
>> +               dev_warn(chip->nor.dev,
>> +                        "CE%d window too small for chip %dMB",
>> +                        chip->cs, (u32) chip->nor.mtd.size >> 20);
>> +
>> +       /* Make sure the next segment does not overlap with the
>> +        * current one we just configured even if there is no
>> +        * available chip. That could break access in Command Mode.
>> +        */
>> +       if (chip->cs < controller->info->nce - 1)
>> +               chip_set_segment(chip, chip->cs + 1, start + size, 0);
>> +
>> +       return size;
>> +}
>> +
>>  static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
>>  {
>>         struct aspeed_smc_controller *controller = chip->controller;
>> @@ -689,7 +795,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>          */
>>         chip->ahb_base = aspeed_smc_chip_base(chip, res);
>>         if (!chip->ahb_base) {
>> -               dev_warn(chip->nor.dev, "CE segment window closed.\n");
>> +               dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
>>                 return -EINVAL;
>>         }
>>
>> @@ -738,6 +844,15 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>         if (chip->nor.addr_width == 4 && info->set_4b)
>>                 info->set_4b(chip);
>>
>> +       /* This is for direct AHB access when using Command Mode. For
>> +        * the AST2400 SPI controller which only handles one chip,
>> +        * let's use the full window.
>> +        */
>> +       if (controller->info->nce == 1)
>> +               chip->ahb_window_size = info->maxsize;
>> +       else
>> +               chip->ahb_window_size = aspeed_smc_chip_set_segment(chip);
>> +
>>         /*
>>          * base mode has not been optimized yet. use it for writes.
>>          */
>> --
>> 2.7.4
>>
