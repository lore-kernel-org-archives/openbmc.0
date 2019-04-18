Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.59.196; helo=7.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 7.mo6.mail-out.ovh.net (7.mo6.mail-out.ovh.net [46.105.59.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l8cm6ZMzzDqPn
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:40:37 +1000 (AEST)
Received: from player789.ha.ovh.net (unknown [10.108.42.184])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0FA261BE4CF
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 08:23:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id AE3924D8ED27
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 06:23:31 +0000 (UTC)
Subject: Re: [PATCH dev-5.0 1/4] mtd: spi-nor: aspeed: introduce a
 aspeed_smc_default_read() helper
To: openbmc@lists.ozlabs.org
References: <20190417133941.22962-1-clg@kaod.org>
 <20190417133941.22962-2-clg@kaod.org>
 <c5b1bb17-87c2-ff06-91ab-4c5924661caa@yadro.com>
 <397cfc74-ec02-4aba-b3ea-f84bea664549@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <51b70fa8-6cb3-ec27-82e7-bbbadba0ba0c@kaod.org>
Date: Thu, 18 Apr 2019 08:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <397cfc74-ec02-4aba-b3ea-f84bea664549@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1721500960226052866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
X-List-Received-Date: Thu, 18 Apr 2019 06:40:41 -0000

On 4/18/19 8:07 AM, Andrew Jeffery wrote:
> 
> 
> On Thu, 18 Apr 2019, at 03:40, Alexander Amelkin wrote:
>> 17.04.2019 16:39, Cédric Le Goater wrote:
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  drivers/mtd/spi-nor/aspeed-smc.c | 19 ++++++++++++-------
>>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>> index ddf7ae78aa0a..ee3059b27c07 100644
>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> @@ -882,6 +882,17 @@ static const uint32_t aspeed_smc_hclk_divs[] = {
>>>  };
>>>  #define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
>>>  
>>> +static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>>> +{
>>> +	return (chip->ctl_val[smc_read] & 0x2000) |
>>
>> Cédric, isn't this a good time to get rid of these cached ctl_val values?
>>
>> Why not read/modify/store the actual register?
>>
>> What's the profit of this caching?

These values are computed when the controller is probed and when 
the chip devices are scanned (which takes a couple of seconds to 
do the training). They are the default values used when the flash 
contents is accessed through the flash MMIO window. 

When in User mode, for register operation, erase, write, other 
values are used, see read/write_reg operations, and we don't want 
to recompute the same values, it takes time and the HW has not 
changed anyhow.

It is also safer as some FW still hack the value in the back of 
the Linux driver so we should not trust how the HW has been 
configured. I believe HIOMAP is available for P8 also now ?

The state of chips is another problem. If the 4B enablement in 
the chip was dropped and if the controller is still configured 
to use 4B, then that's a problem. I agree. Using 4B opcodes only 
should help in the future.  

> Reasonable question, but I've merged the change as-is to dev-5.0 on the
> basis that it helps fix read corruption on AC-cycles.
> 
> We can address this in a follow-up patch if necessary.

spi-mem should be taken into account now, which requires a large 
rewrite of the driver. 

Cheers,

C.

> 
> Cheers,
> 
> Andrew
> 
>>
>> With best regards,
>> Alexander Amelkin,
>> Leading BMC Software Engineer, YADRO
>> https://yadro.com
>>
>>
>>
>> Attachments:
>> * signature.asc
