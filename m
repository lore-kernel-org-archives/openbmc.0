Return-Path: <clg@kaod.org>
Received: from 8.mo1.mail-out.ovh.net (8.mo1.mail-out.ovh.net [178.33.110.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1pk3CJyzDt1t
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:54:06 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 426F917223
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:54:02 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 18C973C006C;
 Mon,  7 Nov 2016 06:54:01 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 6/8] mtd: spi-nor: aspeed: prepare for fast
 read
To: Joel Stanley <joel@jms.id.au>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-7-git-send-email-clg@kaod.org>
 <CACPK8Xcba+bD866RjZ_q81pdU=H8Wwp6Hk1jG+MjAY6Mtw9mFw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <74312760-cfff-729b-bc17-809c56a545df@kaod.org>
Date: Mon, 7 Nov 2016 06:54:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcba+bD866RjZ_q81pdU=H8Wwp6Hk1jG+MjAY6Mtw9mFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1655635814341643010
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
X-List-Received-Date: Mon, 07 Nov 2016 05:54:06 -0000

On 11/07/2016 03:29 AM, Joel Stanley wrote:
> On Sat, Nov 5, 2016 at 3:30 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> Include dummy cycle in the control register value which will be
>> required for fast read.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 41 +++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 36 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 73adf409ac34..444af3aff8b5 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> 
>> @@ -304,6 +304,10 @@ struct aspeed_smc_controller {
>>                                        CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
>>  #define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI | \
>>                                           CONTROL_SPI_IO_DUMMY_CYCLES_LO)
>> +#define CONTROL_SPI_IO_DUMMY_CYCLES_SET(dummy)                         \
>> +       (((((dummy) >> 2) & 0x1) << CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT) | \
>> +       (((dummy) & 0x3) << CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT))
>> +
> 
> This is a bit hairy.

yeah. The SoC does a lot of bit recycling : 1 bit there, 2 bits 
there. it is error prone for drivers ...

Thanks,

C. 

> 
> Aside from that,
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Cheers,
> 
> Joel
> 
