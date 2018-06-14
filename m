Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.49; helo=2.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415yGq6m3ZzDrnp
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 18:59:13 +1000 (AEST)
Received: from player739.ha.ovh.net (unknown [10.109.105.96])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 053A1C2141
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 07:22:45 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id 511584A0088;
 Thu, 14 Jun 2018 07:22:41 +0200 (CEST)
Subject: Re: [PATCH 0/2] mtd: spi-nor: aspeed: introduce a "spi-max-frequency"
 property
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20180608130000.22627-1-clg@kaod.org>
 <CACPK8XfM3B6FbukwTMtbi4FVU8SGxpFF-ox3MiDkMS8f3CASQQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <134b1525-1d3b-dc57-71b0-e298a3d9fa24@kaod.org>
Date: Thu, 14 Jun 2018 07:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XfM3B6FbukwTMtbi4FVU8SGxpFF-ox3MiDkMS8f3CASQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18132899476037667755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrledvgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 14 Jun 2018 08:59:16 -0000

On 06/13/2018 05:00 PM, Joel Stanley wrote:
> Hi Cedric,
> 
> On 8 June 2018 at 22:29, Cédric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> The property protects some optimistic settings of optimize read algo
>> on certain chips (old ones). It also makes the read access to the
>> alternate FMC chip 3 times faster.
> 
> The changes look okay to me. Do you plan to submit them for upstream inclusion?

yes. I would like to have some testing first and also make sure
it fits OpenBMC needs.

Thanks,

C.
 
> 
> I'd feel happier if we had some review on them before merging device
> tree changes.
> 
> Cheers,
> 
> Joel
> 
>>
>> Thanks,
>>
>> C.
>>
>> Cédric Le Goater (2):
>>   ARM: dts: aspeed: Add "spi-max-frequency" property
>>   mtd: spi-nor: aspeed: limit the maximum SPI frequency
>>
>>  drivers/mtd/spi-nor/aspeed-smc.c                 | 18 ++++++++++++++----
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    |  2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  3 +++
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  2 ++
>>  arch/arm/boot/dts/aspeed-g4.dtsi                 |  2 ++
>>  arch/arm/boot/dts/aspeed-g5.dtsi                 |  7 +++++++
>>  8 files changed, 34 insertions(+), 4 deletions(-)
>>
>> --
>> 2.13.6
>>
