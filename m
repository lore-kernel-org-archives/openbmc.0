Return-Path: <clg@kaod.org>
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syJjm08vmzDvHV
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 00:20:43 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8447B150A2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 15:20:39 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id ABAC22A0070;
 Mon, 17 Oct 2016 15:20:34 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 07/12] mtd: spi-nor: aspeed: make locking
 more explicit
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-8-git-send-email-clg@kaod.org>
 <CACPK8Xe-hSZu0b9AVhDYRAGAZXn=pnrp7qmP26dEMH3ZCtD1iw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5b8540d8-f3c1-3cb7-8fb9-dd299866464e@kaod.org>
Date: Mon, 17 Oct 2016 15:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe-hSZu0b9AVhDYRAGAZXn=pnrp7qmP26dEMH3ZCtD1iw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14998675610401147803
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedvgdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 17 Oct 2016 13:20:44 -0000

On 10/17/2016 07:10 AM, Joel Stanley wrote:
> On Fri, Oct 14, 2016 at 11:07 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> The routine aspeed_smc_stop_user() and aspeed_smc_start_user() hide
>> the fact that they lock an unlock the controller. Change that to make
>> it obvious in the code.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index a47eecfdfda2..b22e07d3ef32 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -276,8 +276,6 @@ static void aspeed_smc_start_user(struct spi_nor *nor)
>>         struct aspeed_smc_per_chip *chip = nor->priv;
>>         u32 ctl = chip->ctl_val[smc_base];
>>
>> -       mutex_lock(&chip->controller->mutex);
>> -
> 
> This removes all locking from start_user and stop_user. There are some
> accesses and register writes in both of these functions, is that okay?

ah. Indeed, I did half of the job in this patch. Probably when I tried 
to split the changes :/

Currently, the driver only support User mode, in which the parameters of 
an operation on the chip are passed by writing to the address where the 
flash is mapped. So start_user() is always called to start a read or a 
write transaction, if it is to access a flash register or if it is to 
access its data. 

It is completed by calling stop_user(). The flash then goes back to 
a Command mode where operations are driven differently. 

The current flow is not correct from the spi-nor API perspective. I think 
we should be using the prepare() and unprepare() ops instead. I might give 
that a try before mainline. I am pretty sure it will be spotted.

> What is the lock (supposed to be) protecting?

read/write ops which change the controller configuration. The nor has
its own locking so we might not need this lock if we use the prepare() 
and unprepare() ops.
 
> (I note that you effectively add it back in patch 9 where you
> introduce DMA, by putting locks in aspeed_smc_read_user and write_user
> that then calls start_user.)

I made one big patch with all the changes for mainline. We should be 
fine now.

Thanks,

C. 


> 
>>         ctl |= CONTROL_SPI_COMMAND_MODE_USER |
>>                 CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
>>         writel(ctl, chip->ctl);
>> @@ -296,19 +294,21 @@ static void aspeed_smc_stop_user(struct spi_nor *nor)
>>
>>         writel(ctl2, chip->ctl);        /* stop user CE control */
>>         writel(ctl, chip->ctl);         /* default to fread or read */
>> -
>> -       mutex_unlock(&chip->controller->mutex);
>>  }
>>
>>  static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>>  {
>>         struct aspeed_smc_per_chip *chip = nor->priv;
>>
>> +       mutex_lock(&chip->controller->mutex);
>> +
>>         aspeed_smc_start_user(nor);
>>         aspeed_smc_to_fifo(chip->base, &opcode, 1);
>>         aspeed_smc_from_fifo(buf, chip->base, len);
>>         aspeed_smc_stop_user(nor);
>>
>> +       mutex_unlock(&chip->controller->mutex);
>> +
>>         return 0;
>>  }
>>
>> @@ -317,11 +317,15 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>>  {
>>         struct aspeed_smc_per_chip *chip = nor->priv;
>>
>> +       mutex_lock(&chip->controller->mutex);
>> +
>>         aspeed_smc_start_user(nor);
>>         aspeed_smc_to_fifo(chip->base, &opcode, 1);
>>         aspeed_smc_to_fifo(chip->base, buf, len);
>>         aspeed_smc_stop_user(nor);
>>
>> +       mutex_unlock(&chip->controller->mutex);
>> +
>>         return 0;
>>  }
>>
>> --
>> 2.7.4
>>
