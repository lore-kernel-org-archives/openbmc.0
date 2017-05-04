Return-Path: <clg@kaod.org>
Received: from 8.mo173.mail-out.ovh.net (8.mo173.mail-out.ovh.net
 [46.105.46.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJYpn4J8jzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 22:13:52 +1000 (AEST)
Received: from player791.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5691F3D03D
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 14:13:49 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id EAA264200AB;
 Thu,  4 May 2017 14:13:40 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] spi-nor: aspeed-smc: Fix flash window size
 message
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
References: <20170504023416.25653-1-joel@jms.id.au>
 <1493898773.4433.23.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <316ff8db-35d4-7645-3ca2-17a24f227dd6@kaod.org>
Date: Thu, 4 May 2017 14:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493898773.4433.23.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1943866189459065602
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedriedvgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 04 May 2017 12:13:54 -0000

On 05/04/2017 01:52 PM, Andrew Jeffery wrote:
> On Thu, 2017-05-04 at 12:04 +0930, Joel Stanley wrote:
>> When booting we see something like this:
>>
>>  aspeed-smc 1e620000.flash-controller: Using IRQ 17
>>  aspeed-smc 1e620000.flash-controller: DMA support disabled.
>>  aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes)
>>  aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000- 0x22000000 ] 32MB
>>  aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000- 0x2a000000 ] 128MB
>>
>> The lack of space after the first hex number haunts me every time I
>> boot a BMC.
>>
>> With this fix we see the pleasingly symmetrical:
>>
>>  aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
>>  aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB
>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 875b029198fc..23622bf62b6b 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -709,7 +709,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
>>>  		size = end - start;
>>>  	}
>>  
>>> -	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
>>> +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
>>  		 cs, start, end, size >> 20);
> 
> NAK! I want *no* spaces!
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

ah ! as you wish, I have no strong feeling on the format :) 

Cheers,

C.
