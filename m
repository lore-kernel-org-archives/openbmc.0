Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.253.26; helo=3.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 3.mo6.mail-out.ovh.net (3.mo6.mail-out.ovh.net [178.33.253.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lmZV0tNxzDqSn
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 16:40:45 +1000 (AEST)
Received: from player793.ha.ovh.net (unknown [10.109.146.53])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D7DBC1BE4B1
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 08:02:30 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id E117650239E1;
 Fri, 19 Apr 2019 06:02:23 +0000 (UTC)
Subject: Re: [PATCH dev-5.0 3/4] mtd: spi-nor: aspeed: use memcpy_fromio() to
 capture the optimization buffer
To: Andrew Jeffery <andrew@aj.id.au>, Milton Miller II <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
Date: Fri, 19 Apr 2019 08:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7238973453420432130
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2019 06:40:51 -0000

On 4/19/19 3:03 AM, Andrew Jeffery wrote:
> 
> 
> On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
>> About 04/17/2019 09:20AM in some timezone, Cédric Le Goater wrote:
>>
>>
>>> aspeed_smc_read_from_ahb() only reads the first word which is not
>>> what
>>> we want. We want to capture a CALIBRATE_BUF_SIZE size window of the
>>> flash contents to optimize the read.
>>>
>>
>> NACK
>>
>> This justifcation is false.  The routine reads the whole buffer
>> because it calls the _rep routine and takes the size.

It doesn't AFAICT looking at other drivers and also from my test.

>> In addition, the comment just before aspeed_smc_read_from_ahb
>> tells why memcpy_fromio and memcpy_toio are broken on 32 bit

That might have been the case on Linux 4.7. It doesn't seem to be 
the case anymore. See below.

>> arm, and this is still the case judging from the recent bug
>> reportfrom a Nuvaton user [1].
>>
>> [1] https://github.com/openbmc/openbmc/issues/3521
>>
>> Andrew, Please revert this patch.

I don't think you have enough convincing arguments for that. 

> Yeah, I had a briefly nagging thought about this when I applied it. I
> should have gone with that gut instinct and inspected it in more
> depth.
> 
> Thanks for calling it out.

I think this needs more thinking and tests. Witherspoon and palmetto
are fine. What's the problem.

> Reverting for dev-5.0, this is an isolated issue (arguably should have
> been separated from the current series).

We have been using memcpy_fromio for reads for a very long time 
since 4.13 in the Aspeed SMC driver on *all* platforms*. 

See aspeed_smc_read() for the "Command mode".

C.




> 
> Andrew
> 
>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>> drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
>>> 1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
>>> b/drivers/mtd/spi-nor/aspeed-smc.c
>>> index 1437732fdea1..7e289ecb1c99 100644
>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> @@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct
>>> aspeed_smc_chip *chip,
>>> 	int i;
>>>
>>> 	for (i = 0; i < 10; i++) {
>>> -		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
>>> -					 CALIBRATE_BUF_SIZE);
>>> +		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>>> 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) != 0)
>>> 			return false;
>>> 	}
>>> @@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct
>>> aspeed_smc_chip *chip,
>>>
>>> 	writel(chip->ctl_val[smc_read], chip->ctl);
>>>
>>> -	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
>>> -				 CALIBRATE_BUF_SIZE);
>>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>>>
>>> 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
>>> 	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
>>> -- 
>>> 2.20.1
>>>
>>>
>>
>>
