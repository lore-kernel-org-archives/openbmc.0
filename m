Return-Path: <cyrille.pitchen@wedev4u.fr>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wedev4u.fr
 (client-ip=188.165.45.168; helo=20.mo1.mail-out.ovh.net;
 envelope-from=cyrille.pitchen@wedev4u.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wedev4u.fr
X-Greylist: delayed 1155 seconds by postgrey-1.36 at bilbo;
 Fri, 31 Aug 2018 00:35:43 AEST
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421Q5W1mr3zF35l
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 00:35:40 +1000 (AEST)
Received: from player796.ha.ovh.net (unknown [10.109.146.163])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C49BD1263FA
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 16:16:14 +0200 (CEST)
Received: from [127.0.0.1] (cor13-1-82-232-94-13.fbx.proxad.net [82.232.94.13])
 (Authenticated sender: cyrille.pitchen@wedev4u.fr)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 916FE5C00A8;
 Thu, 30 Aug 2018 16:16:03 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marek Vasut <marek.vasut@gmail.com>, Alexander Amelkin
 <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: leroi.lists@gmail.com, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
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
 <c8b2b68f-b5fe-00ce-df53-f1d32400460b@kaod.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Openpgp: preference=signencrypt
Message-ID: <4c99e942-6641-97ca-bbac-040b05a308cb@wedev4u.fr>
Date: Thu, 30 Aug 2018 16:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c8b2b68f-b5fe-00ce-df53-f1d32400460b@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18171461547678980051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrgeekgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Fri, 31 Aug 2018 08:45:00 +1000
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
X-List-Received-Date: Thu, 30 Aug 2018 14:35:44 -0000

Hi all,

Le 29/08/2018 à 14:12, Cédric Le Goater a écrit :
> [ ... ] 
> 
>> Ah, so the whole problem is, the ASpeed 2400 SPI NOR controller does
>> memory-mapped read from the flash and that has some limitations when the
>> flash is over 16 MiB in size -- it sends 3 byte standard opcodes with 4
>> byte address ?
> 
> yes.
> 
> [ ... ]
> 
>> To simplify the situation, if the ASpeed 2400 SPI NOR controller tried
>> reading the SPI flash past 16 MiB, it would also require that the flash
>> is in EN4B mode, yes ?
> 
> yes.
> 
> [ ... ]
> 
>>> I start thinking about maybe adding an option to "jedec,spi-nor" DTS
>>> binding like "enable-4byte-mode", so that we could get rid of our
>>> local patch and just specify that option in the devicetree. The
>>> option would force EN4B on the chip if it supports that mode. What do
>>> you think? How do I do it if you approve? Send patches separately in
>>> here and in the devicetree mailing list or cross-post both patches to
>>> both lists?
>>
>> That's an option. But what I think this is really about is a fact that
>> we completely lack any way to negotiate limitations between the SPI NOR
>> and the controller.
> 
> what about the hwcaps in spi_nor_scan() ? 
>

Maybe only a matter of taste but I agree with Cedric: a new hwcaps sounds
better than a new DT property. There are already different "compatible"
strings to make the difference between AST2400 and AST2500, so we can
add the new hwcap only to AST2400 entries. Then no need to update any
existing device trees, at least in this case.

Best regards,

Cyille
 
> Thanks,
> 
> C.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
