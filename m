Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.54.31; helo=5.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4990 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Apr 2019 17:25:50 AEST
Received: from 5.mo6.mail-out.ovh.net (5.mo6.mail-out.ovh.net [46.105.54.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lnZQ5D2MzDqTh
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 17:25:46 +1000 (AEST)
Received: from player729.ha.ovh.net (unknown [10.109.146.1])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id BF1E51BE807
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 08:09:35 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 3D77C5156732;
 Fri, 19 Apr 2019 06:09:28 +0000 (UTC)
Subject: Re: [PATCH dev-5.0 2/4] mtd: spi-nor: aspeed: clarify 4BYTE address
 mode mask
To: Milton Miller II <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
References: <20190417133941.22962-3-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF6182D899.1A05425F-ON002583E0.0076364D-002583E0.007B584C@notes.na.collabserv.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92f87d93-f120-98c0-aa02-44f17c9f7a5b@kaod.org>
Date: Fri, 19 Apr 2019 08:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <OF6182D899.1A05425F-ON002583E0.0076364D-002583E0.007B584C@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7358600317302639531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 19 Apr 2019 07:25:51 -0000

On 4/19/19 12:27 AM, Milton Miller II wrote:
> About 04/17/2019 09:18AM in some timezone, Cédric Le Goater wrote:
> 
>>Subject: [PATCH dev-5.0 2/4] mtd: spi-nor: aspeed: clarify 4BYTE
>>address mode mask
>>
> 
> Missing  change log here.

This is a oneliner patch.

> 
>>Signed-off-by: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>>
>>---
>> drivers/mtd/spi-nor/aspeed-smc.c | 10 +++++++++-
>> 1 file changed, 9 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
>>b/drivers/mtd/spi-nor/aspeed-smc.c
>>index ee3059b27c07..1437732fdea1 100644
>>--- a/drivers/mtd/spi-nor/aspeed-smc.c
>>+++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>@@ -884,7 +884,15 @@ static const uint32_t aspeed_smc_hclk_divs[] = {
>>
>> static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>> {
>>- return (chip->ctl_val[smc_read] & 0x2000) |
>>+ /*
>>+ * Keep the 4Byte address mode on the AST2400 SPI controller.
>>+ * Other controllers set the 4Byte mode in the CE Control
>>+ * Register
>>+ */
>>+ u32 ctl_mask = chip->controller->info == &spi_2400_info ?
>>+ CONTROL_IO_ADDRESS_4B : 0;
>>+
> 
> I dislike this patch because it violates the data driven model of the types.
> 
> Either a dupicate method should be created or at least a member of the
> type structure should be used instead of a compare to a specific instance.

we could add a ops returning the bitmask. yes. I think this is a efficient
considering the patch is not in mainline and was not reviewed by the Linux
maintainers.

C.


> 
>>+ return (chip->ctl_val[smc_read] & ctl_mask) |
>> (0x00 << 28) | /* Single bit */
>> (0x00 << 24) | /* CE# max */
>> (0x03 << 16) | /* use normal reads */
>>--
>>2.20.1
>>
>>
