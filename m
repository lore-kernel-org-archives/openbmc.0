Return-Path: <clg@kaod.org>
X-Greylist: delayed 8399 seconds by postgrey-1.35 at bilbo;
 Wed, 27 Jul 2016 22:52:56 AEST
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rzvzX0qZ3zDrKG
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 22:52:55 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5A5F21010182
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 14:36:52 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 1BF1C5C006E;
 Wed, 27 Jul 2016 14:36:46 +0200 (CEST)
Subject: Re: openbmc qemu vs Cedric qemu is different
To: Andrew Jeffery <andrew@aj.id.au>, Chris Austen <austenc@us.ibm.com>
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au> <1468577985.954.22.camel@aj.id.au>
 <OF920CED31.64D6B88A-ON86257FF1.00579A2D-86257FF1.0057B9EA@notes.na.collabserv.com>
 <ce634cab-6594-3876-7517-d35bae40bb1d@kaod.org>
 <1469622628.5468.64.camel@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <63797755-a7e5-b146-dd66-893165a9eb32@kaod.org>
Date: Wed, 27 Jul 2016 14:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469622628.5468.64.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12313967284069698306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 27 Jul 2016 12:52:56 -0000

On 07/27/2016 02:30 PM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 12:26 +0200, Cédric Le Goater wrote:
>> On 07/15/2016 05:58 PM, Chris Austen wrote:
>>>
>>> Sounds like you have a workable plan. Thank you. The test team will run 
>>> off of https://github.com/legoater/qemu  (branch:aspeed) until the 
>>> openbmc/qemu gets the needed updates.
>>
>> FYI, I just updated this branch. Changes are :
>>
>>   - rebase on v2.7.0-rc0
>>   - end of n/w support for linux 4.4. the fgtmac100 now uses 
>>     the aspeed end of ring buffer bits to be in sync with 
>>     linux 4.6 
>>   - rework of ast2500 support to remove duplicated code. I should
>>     send to mainline shortly for review.
> 
> I've just merged Cedric's work above into openbmc/qemu master. Tested
> with a Palmetto flash image and kernel/rootfs from Witherspoon,
> everything looks good.

Thanks Andrew.

C.

> Chris: Any documentation you have can now point there. Let me know if
> there are any issues.
> 
> Cheers,
> 
> Andrew
> 
