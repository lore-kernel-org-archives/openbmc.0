Return-Path: <clg@kaod.org>
Received: from 3.mo1.mail-out.ovh.net (3.mo1.mail-out.ovh.net [46.105.60.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Rb656dfzDvWr
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 03:08:33 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B985418E09
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 17:08:29 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 73F0C3C0073;
 Fri,  4 Nov 2016 17:08:25 +0100 (CET)
Subject: Re: U-Boot upstreaming
To: Joel Stanley <joel@jms.id.au>, Maxim Sloyko <maxims@google.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Teddy Reed <teddy.reed@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bacea3c2-98a3-65d1-018f-e28797dae181@kaod.org>
Date: Fri, 4 Nov 2016 17:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12861436113675979647
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 04 Nov 2016 16:08:35 -0000

On 11/04/2016 01:09 AM, Joel Stanley wrote:
> Hi Maxim,
> 
> On Fri, Nov 4, 2016 at 7:14 AM, Maxim Sloyko <maxims@google.com> wrote:
>> Hi Cedric,
>>
>> My manager (Rick Alther) mentioned that you were working on some minimal
>> "upstreamable" commit for Aspeed in U-Boot. How far were you able to get?
>>
>> This is also what I was thinking of doing, so we should be able to join
>> forces on this.
>>
>> I talked to Simon Glass recently (he's an active contributor to mainline
>> U-Boot) and basically that's the path that he also recommended -- just
>> getting minimal amount of code in, that can just boot to a prompt. He also
>> said that DRAM driver would have to be part of it.
> 
> I agree. The downside here is Cedric has done a lot of work in
> cleaning up the Aspeed SDK code already, so we don't want to throw
> away the good stuff he's done.

half of that work is yours, Joel.
 
>> So, the way I see it, there are two big chunks of work here:
>>  1. Setting up the whole structure. This would include actually adding a
>> board, minimum amount of supporting code, debug serial console init,
> 
> I have a tree where I've started pulling the build scaffolding -
> kconfig, makefiles, etc - out of the patch we have.
> 
> The second part of it is writing a clean serial driver. The hardware a
> pretty standard layout, so I imagine we don't need to do much here.
> Perhaps doing some calculations based on the clock speed to set a baud
> rate.
> 
>>  2. DDR3/DDR4 driver. This is the biggest part of what we have in platform.S
>> now. A lot of work, but relatively straightforward, just rewrite ~1.5k lines
>> of assembly in C.
> 
> Our concern with rewriting this is future maintainability. If we
> rewrite it, it becomes harder to incorporate fixes and new hardware
> support from Aspeed SDKs.

Yes that is one big concern I think. The platform*.s files are 
exactly the one shipped by Aspeed.

> On the other hand, there's no way we can upstream it as-is. So lets
> re-write it in C, and where we can document parts of the
> reimplementation with reference to the assembly so making updates is
> possible.
> 
>>
>> Personally, I don't have preference on who does what, as long as we don't
>> step on each other's toes. It would probably be easier for me to take (1),
>> because I can easily talk to two people who are in our time zone and have a
>> lot of mainline U-Boot experience.

sure. 

> I think we've got a good handle on (1), however I'll let Cedric
> comment as to what he would prefer to work on.

My main concern is keeping a full patchset working with the HW 
we have. I don't think there is much value in pushing mainline 
some code we don't use because it is too far away from our 
current need. So whatever we send should be used in our openbmc
tree, but not in the stable branch of course.

As said in the other email, I think we are at point where we 
should dismantle lowlevel_init in little parts. 

Maxim, may be you could take a look at the SDRAM calibration ? 

This is the biggest part when this is done, the rest should 
flow. 

Cheers,

C.

> Note that this work is continuing on from some work done by Teddy
> several months ago. He has a tree here:
> 
>  https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r3
> 
> Cheers,
> 
> Joel
