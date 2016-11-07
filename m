Return-Path: <clg@kaod.org>
Received: from 18.mo1.mail-out.ovh.net (18.mo1.mail-out.ovh.net [46.105.35.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1gP2ZZpzDrBy
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:47:45 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 814A0179AB
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:47:40 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id E34213C006C;
 Mon,  7 Nov 2016 06:47:38 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 1/8] mtd: spi-nor: aspeed: fix setting of
 the register control value for writes
To: Joel Stanley <joel@jms.id.au>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-2-git-send-email-clg@kaod.org>
 <CACPK8XdrCx1r7OnMmAMBOELDwc3Afa7rzE6jsre+6ft7ae7YkQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f86f5e2b-36aa-7192-369b-d0033e3903cf@kaod.org>
Date: Mon, 7 Nov 2016 06:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdrCx1r7OnMmAMBOELDwc3Afa7rzE6jsre+6ft7ae7YkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1548112375896181506
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleefgddvgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 07 Nov 2016 05:47:45 -0000

On 11/07/2016 03:20 AM, Joel Stanley wrote:
> On Sat, Nov 5, 2016 at 3:30 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The setting of the register control value for writes depends on the
>> base value which was defined only if the mask applied to it changed
>> the register control value.
>>
>> Fix that.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index f65379bb2287..75ba73ef0660 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -756,7 +756,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>  {
>>         struct aspeed_smc_controller *controller = chip->controller;
>>         const struct aspeed_smc_info *info = controller->info;
>> -       u32 reg;
>> +       u32 reg, base_reg;
>>
>>         /*
>>          * Always turn on the write enable bit to allow opcodes to be
>> @@ -789,12 +789,13 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>         reg = readl(chip->ctl);
>>         dev_dbg(controller->dev, "control register: %08x\n", reg);
>>
>> -       if ((reg & CONTROL_SPI_KEEP_MASK) != reg) {
>> -               chip->ctl_val[smc_base] = reg & CONTROL_SPI_KEEP_MASK;
>> +       base_reg = reg & CONTROL_SPI_KEEP_MASK;
>> +       if (base_reg != reg) {
>>                 dev_info(controller->dev,
>>                          "control register changed to: %08x\n",
> 
> Is this the kind of message we would see if someone else (the host, or
> pflash) was changing the register while the kernel driver was loaded?
 
It's more to "warn" that the kernel is changing a value that was 
calculated by hw (strapping or other) or by uboot which does timing 
calibration using DMAs.

> If so, we might want to make this a dev_warn or even a WARN in order
> make it really clear that a bad thing has happened.

but yes, a warn might be better in this case.

Thanks,

C. 


> Cheers,
> 
> Joel
> 
>> -                        chip->ctl_val[smc_base]);
>> +                        base_reg);
>>         }
>> +       chip->ctl_val[smc_base] = base_reg;
>>
>>         /*
>>          * Retain the prior value of the control register as the
>> --
>> 2.7.4
>>
