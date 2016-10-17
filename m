Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy7yc203tzDt8w
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 17:46:16 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D09C514B8C
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:46:05 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id A54052A007B;
 Mon, 17 Oct 2016 08:46:03 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 00/12] aspeed-smc: add support for AST2500
 and DMA transfers
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <CACPK8Xf45-cxbmeX68bY1fCK-Fy0++vW2JkE1_Oo-E7uE5au9A@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <192dcd12-a25b-bf6b-d124-f7804b146f74@kaod.org>
Date: Mon, 17 Oct 2016 08:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf45-cxbmeX68bY1fCK-Fy0++vW2JkE1_Oo-E7uE5au9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8335318485477133211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedugdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 17 Oct 2016 06:46:18 -0000

On 10/17/2016 07:14 AM, Joel Stanley wrote:
> On Fri, Oct 14, 2016 at 11:07 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> This patchset adds to the current aspeed SMC driver the register
>> settings enabling support for the AST2500. Some initial work is done
>> on the segment registers to provide a better configuration of the
>> mapping windows on the flash modules but this area clearly needs more
>> work to be solid.
> 
> Thanks for sending these out. I have a few comments that I'll give you
> a chance to respond to, but then we will apply this to dev-4.7 so
> teams who require flash support have it ready to go.
>
> At that point, I suggest we send it upstream for comment in it's current state.

As a big one patch I suppose ? 

I would like to cleanup the probe function first before. This is just 
code shuffling so I will send something soon making sure that the 
result passes checkpatch --strict at least. 

Thanks,

C. 
 
> Cheers,
> 
> Joel
> 
>>
>> Also, a first version of DMA read/write is provided. But the speed
>> results are not very satisfying so they are disabled by default. You
>>
>> Thanks,
>>
>> C.
>>
>> Cédric Le Goater (7):
>>   ARM: dts: aspeed-g5: update ast2500 evb with new spi-nor binding
>>   mtd: spi-nor: aspeed: make locking more explicit
>>   mtd: spi-nor: aspeed: introduce a device under aspeed_smc_controller
>>   mtd: spi-nor: aspeed: add DMA support to smc controller
>>   ARM: dts: aspeed: update SMC controller nodes supporting DMAs
>>   mtd: spi-nor: aspeed: use property "aspeed,fmc-has-dma"
>>   mtd: spi-nor: aspeed: use fast read when doing DMAs
>>
>> Milton Miller (5):
>>   mtd: spi-nor: support for Aspeed AST2500 SoC
>>   mtd: spi-nor: aspeed: Manage the segment address registers
>>   mtd: spi-nor: Add Micronix mx66l1g45g spi flash
>>   ARM: dts: aspeed-g5: update for new spi-nor binding
>>   ARM: dts: aspeed-g5: update witherspoon for new spi-nor binding
>>
>>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  32 +-
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  28 +-
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   2 +
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  28 +-
>>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  65 +++
>>  drivers/mtd/spi-nor/aspeed-smc.c                   | 449 +++++++++++++++++----
>>  drivers/mtd/spi-nor/spi-nor.c                      |   1 +
>>  7 files changed, 499 insertions(+), 106 deletions(-)
>>
>> --
>> 2.7.4
>>
