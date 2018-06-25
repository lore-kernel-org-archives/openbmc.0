Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.79.46; helo=10.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo179.mail-out.ovh.net (10.mo179.mail-out.ovh.net
 [46.105.79.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DcqV45GYzF18f
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 15:17:10 +1000 (AEST)
Received: from player762.ha.ovh.net (unknown [10.109.120.26])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6FE2FD4859
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 07:17:05 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 402D6E0085;
 Mon, 25 Jun 2018 07:17:00 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17 v2 1/2] ARM: dts: aspeed: Add
 "spi-max-frequency" property
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-2-clg@kaod.org>
 <CACPK8XenvZXcciV_sY-f4ZEjV+H1UtA1Ef5JYnvr2CKwM3NXtw@mail.gmail.com>
 <e4568bc9-1221-06e3-e988-dfe45f168710@kaod.org>
 <CACPK8XfXr2M-AAfDGQ6r_gJi2o-B=C6AZBs0CzS3_XuuG4EC4Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d8184cc6-1235-6bbd-6559-bbb262aa7954@kaod.org>
Date: Mon, 25 Jun 2018 07:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XfXr2M-AAfDGQ6r_gJi2o-B=C6AZBs0CzS3_XuuG4EC4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8849854745181850539
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedruddvgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 05:17:11 -0000

On 06/25/2018 07:01 AM, Joel Stanley wrote:
> On 25 June 2018 at 14:23, Cédric Le Goater <clg@kaod.org> wrote:
>> On 06/25/2018 05:40 AM, Joel Stanley wrote:
>>> Hi Cedric,
>>>
>>> On 22 June 2018 at 16:39, Cédric Le Goater <clg@kaod.org> wrote:
>>>> Keep the FMC controller chips at a safe 50 MHz rate and use 100 MHz
>>>> for the PNOR on the machines using a AST2500 SoC.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++
>>>
>>> The changes look good. I notice you've only modified the openpower
>>> platforms and the evb. Is there a reason we don't do this for all of
>>> the ast2500 boards?
>>
>> When I started working on this patchset, I am not sure these boards
>> existed yet. Should we just bump the max freq to 100MHz for all ?
> 
> Yes, I think that's a good option.
> 
> What are they symptoms when the speed is increased too much?
> 

The reads become unsafe and the result can be full of surprise at 
boot time. The flash won't be corrupted though and we have the 
'aspeed.optimize_read' chicken switch to boot in a slow mode. It 
should be used in the case a really too optimistic setting was 
flashed (DT) on the board. 

I think the freqs should be kept at 50MHz for the FMC controllers, 
unless we know that a board can safely do better. Tests to be done.
For the PNOR, it is less critical. So putting 100MHz should be 
fine in all cases and this is what we have been living with.

C.
