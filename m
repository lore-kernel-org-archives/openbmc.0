Return-Path: <clg@kaod.org>
X-Greylist: delayed 25640 seconds by postgrey-1.35 at bilbo;
 Wed, 22 Jun 2016 01:56:17 AEST
Received: from 14.mo1.mail-out.ovh.net (14.mo1.mail-out.ovh.net
 [178.32.97.215])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYslj5YvczDqFM
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 01:56:17 +1000 (AEST)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4B183FF9E3F
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 17:56:13 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id BCD4D3C0082;
 Tue, 21 Jun 2016 17:56:09 +0200 (CEST)
Subject: Re: [u-boot 0/3] Add minimal ast2400 support
To: Joel Stanley <joel@jms.id.au>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
 <47db0c5d-907c-4622-0659-2cef581a467c@kaod.org>
 <CACPK8XdXSeaa8_CopXjz2JdxYRE5eDs7-z=LtmwfzxSMU-MZhg@mail.gmail.com>
Cc: Teddy Reed V <teddy.reed@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <71b0d0d9-54d9-9aad-d034-4356a318ee8b@kaod.org>
Date: Tue, 21 Jun 2016 17:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdXSeaa8_CopXjz2JdxYRE5eDs7-z=LtmwfzxSMU-MZhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7177893383730268930
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtddtgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 15:56:18 -0000

On 06/21/2016 01:39 PM, Joel Stanley wrote:
> On Tue, Jun 21, 2016 at 5:41 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 06/21/2016 09:29 AM, Joel Stanley wrote:
>>> Hello OpenBMC u-boot hackers!
>>>
>>> This series adds minimal ast2400 support to the v2016.05 tag of u-boot. It
>>> applies on top of the v2016.05-ast2500 tree that Cedric created for the
>>> ast2500-evb.
>>>
>>> It is a copy of the code from the Aspeed SDK with minimal changes to get it to
>>> compile in a modern u-boot tree.
>>>
>>> Pending review, I will add this to a branch called v2016.05-aspeed-openbmc in
>>> the openbmc u-boot repository and point all of our 2400 and 2500 systems at
>>> this branch.
>>
>> Looks good to me.
> 
> Great. I pushed it along with some other cleanups to my tree:
> 
>  https://github.com/shenki/u-boot/tree/v2016.05-aspeed-openbmc

Thanks for doing this. It was important to have a common branch for both
ast2400 and ast2500 to start cleaning up.

> I'll boot test it on a palmetto, ast2500evb, and witherspoon tomorrow
> and then move openbmc to use this branch.

Tested on palmetto and ast2500evb. It boots fine the OpenBmc image and 
network is ok after boot on both. However network does not work on the
ast2400 in uboot. This needs digging.

>>
>>> Joel Stanley (3):
>>>   ast-g5: Simplify config and board file
>>
>> The configuration system has changed and a lot more can be configured
>> through Kconfig now. I think the aspeed code relies a bit too much on
>> #define still.
> 
> Yeah, the config files are still very messy. Before we add any more
> platforms we should move our existing ones to Kconfig.
> 
>>
>>>   ARM: AST2400: add support
>>>   arm: aspeed: Remove cpu directory
>>
>> We could to the same for G5.
> 
> Done.
> 
>>
>> G5 also has this hunk which needs investigation :
> 
> Eww. Can you please open a bug on openbmc/u-boot?

done.

	https://github.com/openbmc/u-boot/issues/8

Thanks,

C.

>> --- a/arch/arm/cpu/arm1176/start.S
>> +++ b/arch/arm/cpu/arm1176/start.S
>> @@ -35,7 +35,6 @@
>>   */
>>
>>         .globl reset
>> -
>>  reset:
>>         /*
>>          * set the cpu to SVC32 mode
>> @@ -82,8 +81,9 @@ cpu_init_crit:
>>         orr     r0, r0, #0x00001000     @ set bit 12 (I) I-Cache
>>
>>         /* Prepare to disable the MMU */
>> -       adr     r2, mmu_disable_phys
>> -       sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BASE)
>> +       /* Ryan TODO ....*/
>> +#      adr     r2, mmu_disable_phys
>> +#      sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BASE)
>>         b       mmu_disable
>>
>>         .align 5
>> @@ -92,7 +92,7 @@ mmu_disable:
>>         mcr     p15, 0, r0, c1, c0, 0
>>         nop
>>         nop
>> -       mov     pc, r2
>> +#      mov     pc, r2
>>  mmu_disable_phys:
>>
>>  #endif
