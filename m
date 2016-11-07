Return-Path: <clg@kaod.org>
Received: from 16.mo1.mail-out.ovh.net (16.mo1.mail-out.ovh.net
 [178.33.104.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1yh4C4TzDt2L
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 17:00:59 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id F10B116D37
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:51:56 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id C92593C006C;
 Mon,  7 Nov 2016 06:51:55 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 2/8] mtd: spi-nor: aspeed: improve 4 bytes
 mode
To: Joel Stanley <joel@jms.id.au>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-3-git-send-email-clg@kaod.org>
 <CACPK8Xc8eMnZBpqzn9JC2u2boMj6o2=aVxaf53RfY+9ATAQ_UQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <870ade93-c626-7d6c-0776-ae947d4ff7c9@kaod.org>
Date: Mon, 7 Nov 2016 06:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc8eMnZBpqzn9JC2u2boMj6o2=aVxaf53RfY+9ATAQ_UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1620169969533946626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleefgddvheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 07 Nov 2016 06:01:01 -0000

On 11/07/2016 03:24 AM, Joel Stanley wrote:
> On Sat, Nov 5, 2016 at 3:30 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The AST2400 SPI flash uses the CE0 control register to set 4Byte mode
>> and the AST2500 FMC and AST2400 FMC flash controllers use the CE
>> Control register for this purpose or they are strapped by hardware.
>>
>> Currently, the setting of the CE0 control register is done for all,
>> which is incorrect, so fix that to keep only the AST2400 SPI. Luckily,
>> the bogus setting has no impact on operations as bit 13 defines a SPI
>> clock divisor.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 51 +++++++++++++++++++++++-----------------
>>  1 file changed, 29 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 75ba73ef0660..763f3c604140 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -751,6 +751,33 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
>>         writel(reg, controller->regs + CONFIG_REG);
>>  }
>>
>> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
>> +{
>> +       struct aspeed_smc_controller *controller = chip->controller;
>> +       u32 reg;
>> +
>> +       /*
>> +        * The AST2400 SPI flash controller does not have a CE Control
>> +        * register. It uses the CE0 control register to set 4Byte
>> +        * mode at the controller level.
>> +        */
>> +       if (chip->controller->info == &smc_2400_info) {
> 
> Should we add a callback that calls either a ast2400 or ast2500
> version of aspeed_smc_chip_set_4b instead of this method?

I think you are rightn that would clarify the code which is hard to
follow. The driver still needs to make progress on how the controller 
differences are taken into account. 

Thanks,

C. 


> Cheers,
> 
> Joel
> 
>> +               chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
>> +               chip->ctl_val[smc_read] |= CONTROL_SPI_IO_ADDRESS_4B;
>> +       }
>> +
>> +       /*
>> +        * The AST2500 FMC and AST2400 FMC flash controllers should be
>> +        * strapped by hardware, or autodetected, but the AST2500 SPI
>> +        * flash needs to be set.
>> +        */
>> +       if (chip->controller->info == &smc_2500_info) {
>> +               reg = readl(controller->regs + CE_CONTROL_REG);
>> +               reg |= 1 << chip->cs;
>> +               writel(reg, controller->regs + CE_CONTROL_REG);
>> +       }
>> +}
>> +
>>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>                                       struct resource *r)
>>  {
>> @@ -814,28 +841,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>
>>  static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>  {
>> -       struct aspeed_smc_controller *controller = chip->controller;
>> -       u32 reg;
>> -
>> -       /*
>> -        * Set 4 byte mode in the chip controller register and also in
>> -        * controller config register. The BMC flash controller is
>> -        * strapped by hardware, or autodetected, but the SPI flash
>> -        * controller of the AST2500 still needs to be set.
>> -        */
>> -       if (chip->nor.mtd.size > SZ_16M) {
>> -               chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
>> -
>> -               /*
>> -                * The SPI flash controller of the AST2400 does not
>> -                * have such a setting.
>> -                */
>> -               if (chip->controller->info == &smc_2500_info) {
>> -                       reg = readl(controller->regs + CE_CONTROL_REG);
>> -                       reg |= 1 << chip->cs;
>> -                       writel(reg, controller->regs + CE_CONTROL_REG);
>> -               }
>> -       }
>> +       if (chip->nor.mtd.size > SZ_16M)
>> +               aspeed_smc_chip_set_4b(chip);
>>
>>         chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
>>                 spi_control_fill_opcode(chip->nor.program_opcode) |
>> --
>> 2.7.4
>>
