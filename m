Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.165.232; helo=10.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1805 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Aug 2018 22:52:11 AEST
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
 [87.98.165.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420lrW39VrzF31P
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 22:52:09 +1000 (AEST)
Received: from player718.ha.ovh.net (unknown [10.109.159.132])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 89C881CB1CD
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 14:12:38 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 0C6AC4E00AB;
 Wed, 29 Aug 2018 14:12:32 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
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
 <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c8b2b68f-b5fe-00ce-df53-f1d32400460b@kaod.org>
Date: Wed, 29 Aug 2018 14:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10211349206547598255
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrgeeigdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Aug 2018 12:52:11 -0000

[ ... ] 

> Ah, so the whole problem is, the ASpeed 2400 SPI NOR controller does
> memory-mapped read from the flash and that has some limitations when the
> flash is over 16 MiB in size -- it sends 3 byte standard opcodes with 4
> byte address ?

yes.

[ ... ]

> To simplify the situation, if the ASpeed 2400 SPI NOR controller tried
> reading the SPI flash past 16 MiB, it would also require that the flash
> is in EN4B mode, yes ?

yes.

[ ... ]

>> I start thinking about maybe adding an option to "jedec,spi-nor" DTS
>> binding like "enable-4byte-mode", so that we could get rid of our
>> local patch and just specify that option in the devicetree. The
>> option would force EN4B on the chip if it supports that mode. What do
>> you think? How do I do it if you approve? Send patches separately in
>> here and in the devicetree mailing list or cross-post both patches to
>> both lists?
> 
> That's an option. But what I think this is really about is a fact that
> we completely lack any way to negotiate limitations between the SPI NOR
> and the controller.

what about the hwcaps in spi_nor_scan() ? 

Thanks,

C.
