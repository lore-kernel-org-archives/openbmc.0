Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.45.168; helo=20.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Aug 2018 23:40:52 AEST
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420mwh2s3pzF09c
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 23:40:51 +1000 (AEST)
Received: from player714.ha.ovh.net (unknown [10.109.143.223])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E79DD12508A
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 15:31:45 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 5895B3C00BD;
 Wed, 29 Aug 2018 15:31:44 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
 <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>
 <77d81bad-1c01-b953-efea-f8e93e3591f2@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bf29b5dc-dcd2-abe7-2f9e-93e520e274b7@kaod.org>
Date: Wed, 29 Aug 2018 15:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <77d81bad-1c01-b953-efea-f8e93e3591f2@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11547510922650487554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrgeeigdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 13:40:53 -0000

[ ... ]

> Not exactly. Currently, spi-nor driver for devices over 16MB in size checks
> whether or not the SPI_NOR_4B_OPCODES is set. If it is not, it simply issues
> an EN4B command to set legacy opcodes to 4-byte mode. If the option is there,
> the driver replaces pointers to legacy-3-byte-command-based functions with pointers
> to modern-4-byte-comand-based functions.

yes

> My proposal is to add an option that would force EN4B always, leaving the 
> rest as is.

ok. so you want to force the call to set_4byte() in spi_nor_init(). 

There :
	...

	if ((nor->addr_width == 4) &&
	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
		set_4byte(nor, nor->info, 1);


It should be possible initiate a SPI transfer from the driver also but
I am sure this is acceptable.

> That is, the driver will still use 4-byte commands if they are supported, 
> but the default mode of the chip will be switched to 4-byte as well.

ok.

>> I think it would be better to introduce the property in the aspeed-smc
>> driver because this is very specific usage of the Aspeed SoC done 
>> by a platform.
> The aspeed-smc driver configures the Aspeed SMC controller, not the flash chip.

Not exactly, yes, but it does configure the controller registers for a 
specific flash chip: timings, opcodes, hclk, dummies. 
 
>> and/or, maybe, introduce a new SNOR_HWCAPS to inform spi_nor_scan() 
>> that some driver we doesn't want the SPI_NOR_4B_OPCODES ? 
>
> If I understand correctly, SNOR_HWCAPS are defined as per JEDEC standard 
> and are set according to chip's SFDP table.

and according to the SPI controller. The driver performs a scan with its 
capabilities. So we could extend the hwcaps struct for this purpose.

> Where do you propose the information that "we don't want SPI_NOR_4B_OPCODES" 
> to come from?

The DT.

> My proposal is to put the option into DTS where it quite naturally belongs 
> because it's a platform-specific configuration.

yes  but I don't think we can ask the common SPI-NOR layer to handle a 
platform specific property. We need a way to provide that information. 
 
>>> How do I do it if you approve? Send patches separately in here and in 
>>> the devicetree mailing list or cross-post both patches to both lists?
>> You need to send a patch to both mailing lists, openbmc@ and linux-mtd@
> Sorry, I wasn't asking about openbmc@. I was asking about devicetree@ and @linux-mtd.

ok but I think we can keep openbmc@ in the loop too.

Thanks,

C. 
