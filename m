Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.72.238; helo=9.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 149282 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Oct 2017 18:27:04 AEDT
Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net
 [46.105.72.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBlt069vNzDr5S
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 18:27:04 +1100 (AEDT)
Received: from player792.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 90BFF85EED
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 09:21:30 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 1BF1AA007F;
 Wed, 11 Oct 2017 09:21:28 +0200 (CEST)
Subject: Re: [PATCH u-boot] Revert "ast-g5: deactivate vbar (for qemu)"
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20171010122749.9124-1-clg@kaod.org>
 <1507700318.5452.177.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <568e2a71-b067-75e2-6019-190e04a1e53c@kaod.org>
Date: Wed, 11 Oct 2017 09:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507700318.5452.177.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14301743569410689794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 07:27:05 -0000

On 10/11/2017 07:38 AM, Andrew Jeffery wrote:
> On Tue, 2017-10-10 at 14:27 +0200, Cédric Le Goater wrote:
>> This reverts commit a0ca4ecbeae4ae9632ebc67bf5318dd2ea09c94f.
>>  
>> Support was added to QEMU in :
>>  
>> commit 91db4642f868 ("target-arm: Add VBAR support to ARM1176 CPUs")
>>  
>> The work around happens to crash the guest when the vector relocation
>> is done, with ignore_memory_transaction_failures=false which is
>> now the default in QEMU.
> 
> You need a Signed-off-by here. Can you reply with one? Hopefully patchwork will
> pick it up.

Ah I missed that doing the revert.


Signed-off-by: Cédric Le Goater <clg@kaod.org>

C. 


> Cheers,
> 
> Andrew
> 
>> ---
>>  arch/arm/lib/relocate.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  
>> diff --git a/arch/arm/lib/relocate.S b/arch/arm/lib/relocate.S
>> index 33bcff41ac30..475d503dd9df 100644
>> --- a/arch/arm/lib/relocate.S
>> +++ b/arch/arm/lib/relocate.S
>> @@ -35,7 +35,7 @@ ENTRY(relocate_vectors)
>>  	ldr	r1, =V7M_SCB_BASE
>>  	str	r0, [r1, V7M_SCB_VTOR]
>>  #else
>> -#if defined(CONFIG_HAS_VBAR) && !defined(CONFIG_ARCH_AST2500)
>> +#ifdef CONFIG_HAS_VBAR
>>  	/*
>>  	 * If the ARM processor has the security extensions,
>>  	 * use VBAR to relocate the exception vectors.
