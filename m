Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.76.26; helo=4.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420lFl3bsVzF31N
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 22:25:31 +1000 (AEST)
Received: from player750.ha.ovh.net (unknown [10.109.159.224])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 36DC31235E4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 14:05:55 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 0A2451800C0;
 Wed, 29 Aug 2018 14:05:47 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0f42821c-4608-6122-9d5d-1f1b3867adec@kaod.org>
Date: Wed, 29 Aug 2018 14:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10097633318452693935
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrgeeigdegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Aug 2018 12:25:31 -0000

> The flash chip in question is the one used to boot the host (OpenPOWER P8), 
> not the BMC (ASpeed AST2400). U-boot on AST2400 has nothing to do with 
> the chip. 

yes. The Aspeed SoCs has multiple SMC Controllers. 

On the AST2400, the first SMC controller (called FMC) is for the 
BMC Firmware and supports SPI, NOR, NAND flash devices. The second 
is a SPI only controller for the host Firmware. In the OpenBMC 
terminology, the flash device holding the host Firmware is referred 
as the "PNOR" ... 

On the AST2500, the FMC controller supports SPI and NOR flash devices. 
There are two other controllers supporting only SPI, the first is used
for the host Firmware.


OpenPOWER platforms using the AST2500 don't have the problem because
the flash content is accessed differently from the host.

[ ... ]

> I start thinking about maybe adding an option to "jedec,spi-nor" DTS 
> binding like "enable-4byte-mode", so that we could get rid of our local
> patch and just specify that option in the devicetree. The option would
> force EN4B on the chip if it supports that mode. What do you think? 

Are you proposing to add an extra property  that would be handled at
the spi-nor level to choose which set of SPI commands should be the 
default read_opcode ? either the ones requiring EN4B (SPINOR_OP_READ*)  
or the others which would not (SPINOR_OP_READ*_4B) ? 

I think it would be better to introduce the property in the aspeed-smc
driver because this is very specific usage of the Aspeed SoC done 
by a platform.

and/or, maybe, introduce a new SNOR_HWCAPS to inform spi_nor_scan() 
that some driver we doesn't want the SPI_NOR_4B_OPCODES ? 

> How do I do it if you approve? Send patches separately in here and in  > the devicetree mailing list or cross-post both patches to both lists?

You need to send a patch to both mailing lists, openbmc@ and linux-mtd@

Thanks,

C.
