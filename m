Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.108.172; helo=9.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3593 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Apr 2019 19:25:53 AEST
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lrDx0BPlzDqV6
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 19:25:50 +1000 (AEST)
Received: from player762.ha.ovh.net (unknown [10.109.146.211])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 706E316B676
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 10:09:21 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 562984EFFE53;
 Fri, 19 Apr 2019 08:09:17 +0000 (UTC)
Subject: Re: [PATCH dev-5.0 3/4] mtd: spi-nor: aspeed: use memcpy_fromio() to
 capture the optimization buffer
To: Andrew Jeffery <andrew@aj.id.au>, Milton Miller II <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
 <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
 <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
Date: Fri, 19 Apr 2019 10:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9381279499045210882
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 19 Apr 2019 09:25:54 -0000

On 4/19/19 9:23 AM, Andrew Jeffery wrote:
> Hi Cédric
> 
> On Fri, 19 Apr 2019, at 15:32, Cédric Le Goater wrote:
>> On 4/19/19 3:03 AM, Andrew Jeffery wrote:
>>>
>>>
>>> On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
>>>> About 04/17/2019 09:20AM in some timezone, Cédric Le Goater wrote:
>>>>
>>>>
>>>>> aspeed_smc_read_from_ahb() only reads the first word which is not
>>>>> what
>>>>> we want. We want to capture a CALIBRATE_BUF_SIZE size window of the
>>>>> flash contents to optimize the read.
>>>>>
>>>>
>>>> NACK
>>>>
>>>> This justifcation is false.  The routine reads the whole buffer
>>>> because it calls the _rep routine and takes the size.
>>
>> It doesn't AFAICT looking at other drivers and also from my test.
>>
>>>> In addition, the comment just before aspeed_smc_read_from_ahb
>>>> tells why memcpy_fromio and memcpy_toio are broken on 32 bit
>>
>> That might have been the case on Linux 4.7. It doesn't seem to be 
>> the case anymore. See below.
>>
>>>> arm, and this is still the case judging from the recent bug
>>>> reportfrom a Nuvaton user [1].
>>>>
>>>> [1] https://github.com/openbmc/openbmc/issues/3521
>>>>
>>>> Andrew, Please revert this patch.
>>
>> I don't think you have enough convincing arguments for that.
> 
> That may be the case, but having seen the pain of the original corruption
> problems that drove the ioreadX_rep() implementation above, Milton's
> protest combined with my initial, briefly nagging concern was enough for
> me to revert. Two things here:
> 
> 1. We've run without this patch for quite some time. Despite oddities,
> the existing implementation has been stable
> 2. With patch 4/4, you've resolved the 4B corruption problem. This was
> the immediate concern, as it was impacting teams developing and
> testing OpenBMC master. I appreciate the effort you put into hunting
> that down, the root cause was certainly not obvious.
> 
> From *my* testing we appear to be stable both with and without this
> change, however my concern is that *my* testing is not complete enough
> to be confident that we're not going to hit the subtle corruption problems
> that drove the introduction of the existing code.

QEMU would have caught this regression if SFDP was modeled. It does today
if 4B opcodes are forced on the mx25l25635e. Given the time the team spent
on this, I would say 1 or 2PM overall, QEMU is a good investment. 
                                                  ^
                                                  |
Managers are you reading this ? ------------------+ 

> For some additional context, I'm now on leave until the 30th, and Joel to
> the 29th. These patches have been through a process that has proceeded
> much more hastily than I would have liked, and that's lead to where we
> are now.
> 
> With that in mind, less change is better, and so I have decided to back
> this patch out. It's a risk-based decision, not a reflection of the effort,
> desires or technicalities involved.

Back to where we were before, it's fine as it works. 

The optimize reads are just reading the first 4 bytes :

[   14.130480] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
[   14.136664] aspeed-smc 1e630000.spi: write control register: 00122302
[   14.143326] aspeed-smc 1e630000.spi: read control register: 203c2341
[   14.149750] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
[   14.181561] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.188894] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.196230] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.203558] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.210751] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.218067] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.225397] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.232722] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.239912] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART
[   14.247232] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPARTPARTPART

with memcpy_fromio :

[   13.779087] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
[   13.785255] aspeed-smc 1e630000.spi: write control register: 00122302
[   13.791762] aspeed-smc 1e630000.spi: read control register: 203c2341
[   13.798326] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
[   13.815420] 50 41 52 54 00 00 00 01 00 00 00 01 00 00 00 80  PART............
[   13.822759] 00 00 00 1b 00 00 10 00 00 00 20 00 00 00 00 00  .......... .....
[   13.829946] 00 00 00 00 00 00 00 00 00 00 00 00 50 41 62 cf  ............PAb.
[   13.837266] 70 61 72 74 00 00 00 00 00 00 00 00 00 00 00 00  part............
[   13.844597] 00 00 00 00 00 00 00 01 ff ff ff ff 00 00 00 01  ................
[   13.851788] 00 00 00 03 00 00 00 01 00 00 10 00 00 00 00 00  ................
[   13.859105] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[   13.866433] 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00  .@..............
[   13.873759] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[   13.880951] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[   13.888267] 00 00 00 00 00 00 00 00 00 00 00 00 8f de 9d 89  ................
[   13.895591] 48 42 49 00 00 00 00 00 00 00 00 00 00 00 00 00  HBI.............
[   13.902917] 00 00 00 10 00 00 05 a0 ff ff ff ff 00 00 00 02  ................


I should have added these tests in the commit log. Sorry about that.
We will see later on. There are no hurries for this fix. Optimization
is still being done.

Thanks,

C.


> So there are lessons in this for me too as I've felt squeezed by the
> impact the 4B corruption bug has had on teams testing master, and
> my impending leave. With that reasoning and 20/20 hindsight I should
> probably have held off to begin with. Next time. Some reflection is in
> order.
> 
> Anyway, I hope that helps clarify. Time to resolve the disagreement here.
> 
> Milton: Given your protest, can you please verify whether there continue
> to be issues with memcpy_fromio() that prevent us from making use of it.
> As Cédric points out we do make heavy use of it anyway, and using a
> well-worn implementation rather than something bespoke for this particular
> case would improve maintainability.
> 
> Cheers,
> 
> Andrew
>  
>>
>>> Yeah, I had a briefly nagging thought about this when I applied it. I
>>> should have gone with that gut instinct and inspected it in more
>>> depth.
>>>
>>> Thanks for calling it out.
>>
>> I think this needs more thinking and tests. Witherspoon and palmetto
>> are fine. What's the problem.
>>
>>> Reverting for dev-5.0, this is an isolated issue (arguably should have
>>> been separated from the current series).
>>
>> We have been using memcpy_fromio for reads for a very long time 
>> since 4.13 in the Aspeed SMC driver on *all* platforms*. 
>>
>> See aspeed_smc_read() for the "Command mode".
>>
>> C.
>>
>>
>>
>>
>>>
>>> Andrew
>>>
>>>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>> drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
>>>>> 1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> index 1437732fdea1..7e289ecb1c99 100644
>>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> @@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct
>>>>> aspeed_smc_chip *chip,
>>>>> 	int i;
>>>>>
>>>>> 	for (i = 0; i < 10; i++) {
>>>>> -		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
>>>>> -					 CALIBRATE_BUF_SIZE);
>>>>> +		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>>>>> 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) != 0)
>>>>> 			return false;
>>>>> 	}
>>>>> @@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct
>>>>> aspeed_smc_chip *chip,
>>>>>
>>>>> 	writel(chip->ctl_val[smc_read], chip->ctl);
>>>>>
>>>>> -	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
>>>>> -				 CALIBRATE_BUF_SIZE);
>>>>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>>>>>
>>>>> 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
>>>>> 	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
>>>>> -- 
>>>>> 2.20.1
>>>>>
>>>>>
>>>>
>>>>
>>
>>
