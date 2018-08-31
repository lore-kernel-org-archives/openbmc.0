Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.172.162; helo=18.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 156751 seconds by postgrey-1.36 at bilbo;
 Fri, 31 Aug 2018 18:04:38 AEST
Received: from 18.mo3.mail-out.ovh.net (18.mo3.mail-out.ovh.net
 [87.98.172.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421sMp1C3YzF37Q
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 18:04:35 +1000 (AEST)
Received: from player697.ha.ovh.net (unknown [10.109.143.220])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7FBC41CF025
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 10:04:31 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 857224800B8;
 Fri, 31 Aug 2018 10:04:21 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Roman Yeryomin <leroi.lists@gmail.com>, marek.vasut@gmail.com
Cc: a.amelkin@yadro.com, linux-mtd <linux-mtd@lists.infradead.org>,
 openbmc@lists.ozlabs.org, joel@jms.id.au,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <CACiydb+3DJabMS9zQ9mc0i+BdSEG0zMDvT66bauCwJ4WZan9Kg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cd10d5c6-1983-1725-a559-1b1f00c08aa0@kaod.org>
Date: Fri, 31 Aug 2018 10:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACiydb+3DJabMS9zQ9mc0i+BdSEG0zMDvT66bauCwJ4WZan9Kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17766137582392413015
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrgeelgdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 31 Aug 2018 08:04:39 -0000

[ ... ] 

>> I CCed him, so maybe he can clarify.
>>
>> But this is weird. If you reboot the system, isn't the SPI NOR
>> power-cycled and reset into defined default state ? If not, your
>> hardware is severely broken and you should fix your reset routing.
> 
> I guess it was clarified below already but will say it again: EN4B is
> not reset on soft reboot, there is no power cycle. So the system won't
> boot.

I am working on an Aspeed SoC SPI driver for U-Boot and I am seeing the 
exact same problem with a W25Q256 when Linux reboots. These chips are 
even more perfidious because they have a non-volatile bit making the 
chip operate in 4Byte address mode at power-up. 

> There was a quirk for shutdown, which would EX4B. But it was clumsy
> and probably never sent upstream. 

But the problem is supporting older Linux versions not using the  
4B_OPCODES. So adding an initial EX4B in the U-Boot SPI layer seems 
quite safe and not that ugly. Or add 4Byte support. 

This is a discussion for U-Boot.

> SPI_NOR_4B_OPCODES is much more elegant.
I agree that the SPI_NOR_4B_OPCODES are a good practice because they 
don't alter the chip state and let software do the appropriate 
configuration. 

Is removing EN4B/EX4B part of the long-term plan for the Linux SPI-NOR 
layer ? 

> Sorry for not clarifying this in commit message.

Thanks,

C.
