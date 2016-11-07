Return-Path: <clg@kaod.org>
X-Greylist: delayed 2160 seconds by postgrey-1.36 at bilbo;
 Mon, 07 Nov 2016 16:54:44 AEDT
Received: from mo1.mail-out.ovh.net (mo1.mail-out.ovh.net [178.32.228.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1qS1qG5zDqHb
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:54:44 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id EC1A41720B
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:54:40 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id C89743C006C;
 Mon,  7 Nov 2016 06:54:39 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 8/8] mtd: spi-nor: aspeed: use command mode
 for reads
To: Joel Stanley <joel@jms.id.au>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-9-git-send-email-clg@kaod.org>
 <CACPK8Xd=NBoaXpUxxv5ym-sTOW4W1KHmQX46LE6RpPOyTdWNPA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8ed63a20-374b-ffa5-d19b-0566b9df006a@kaod.org>
Date: Mon, 7 Nov 2016 06:54:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd=NBoaXpUxxv5ym-sTOW4W1KHmQX46LE6RpPOyTdWNPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1666331865714494210
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
X-List-Received-Date: Mon, 07 Nov 2016 05:54:44 -0000

On 11/07/2016 03:32 AM, Joel Stanley wrote:
> On Sat, Nov 5, 2016 at 3:30 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> When accessing flash contents, let use the "command mode" for read.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 88cbfe7c4340..89085d84b4b5 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -522,8 +522,8 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>>         }
>>  }
>>
>> -static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>> -                               size_t *retlen, u_char *read_buf)
>> +static int aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
>> +                          size_t *retlen, u_char *read_buf)
>>  {
>>         struct aspeed_smc_chip *chip = nor->priv;
>>         int ret;
>> @@ -542,10 +542,10 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>>                 dev_err(chip->nor.dev, "DMA read failed: %d", ret);
>>         }
>>
>> -       aspeed_smc_start_user(nor);
>> -       aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>> -       aspeed_smc_from_ahb(read_buf, chip->base, len);
>> -       aspeed_smc_stop_user(nor);
>> +       /*
>> +        * we are in read or fread mode by default
>> +        */
>> +       aspeed_smc_from_ahb(read_buf, chip->base + from, len);
> 
> Even though I just acked the previous patch, when reading this it's
> not clear that we're doing a read. Perhaps
> smc_{read_from,write_to}_ahb?

yes. I agree.

Thanks,

C. 


> Cheers,
> 
> Joel
> 
>>
>>  out:
>>         mutex_unlock(&chip->controller->mutex);
>> @@ -861,6 +861,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>         }
>>
>>         chip->ctl_val[smc_read] |= cmd |
>> +               spi_control_fill_opcode(chip->nor.read_opcode) |
>>                 CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
>>
>>         dev_dbg(controller->dev, "base control register: %08x\n",
>> @@ -956,7 +957,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
>>                 chip->nor.priv = chip;
>>                 spi_nor_set_flash_node(&chip->nor, child);
>>                 chip->nor.mtd.name = of_get_property(child, "label", NULL);
>> -               chip->nor.read = aspeed_smc_read_user;
>> +               chip->nor.read = aspeed_smc_read;
>>                 chip->nor.write = aspeed_smc_write_user;
>>                 chip->nor.read_reg = aspeed_smc_read_reg;
>>                 chip->nor.write_reg = aspeed_smc_write_reg;
>> --
>> 2.7.4
>>
