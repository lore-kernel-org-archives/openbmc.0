Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.35.78; helo=19.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 33594 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Aug 2018 09:57:17 AEST
Received: from 19.mo5.mail-out.ovh.net (19.mo5.mail-out.ovh.net [46.105.35.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wkx94FhfzF0gv
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 09:57:15 +1000 (AEST)
Received: from player773.ha.ovh.net (unknown [10.109.146.82])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id AAC831DA285
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 14:10:27 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-62-88.w90-32.abo.wanadoo.fr
 [90.32.249.88]) (Authenticated sender: postmaster@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id CD72060008C;
 Wed, 22 Aug 2018 14:10:15 +0200 (CEST)
Subject: Re: Linux kernel: Moving to 4.18
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames.ibm@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
References: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e62f7437-102e-c493-6b12-a72af7f0c244@kaod.org>
Date: Wed, 22 Aug 2018 14:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5958825257704000348
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrfedugdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 22 Aug 2018 23:57:18 -0000

> Assuming everything that was in linux-next gets merged for 4.19, this
> will leave us with about 36 out of tree patches. I've appended the
> list of commits below. If you are the author it would be great to hear
> your plans as a reply to this email.

See below.

> Cédric Le Goater (6):
>       mtd: spi-nor: aspeed: use command mode for reads
>       mtd: spi-nor: aspeed: add support for SPI dual IO read mode
>       mtd: spi-nor: aspeed: link controller with the ahb clock
>       mtd: spi-nor: aspeed: optimize read mode

I will rework the read timing algo a little to match the U-Boot driver 
I am working on and include the typo fix from Alexander. After some 
tests in OpenBMC, I will send a v2 to mainline.  

Cheers,

C. 

>       mtd: spi-nor: aspeed: limit the maximum SPI frequency
>       ARM: dts: aspeed: Add "spi-max-frequency" property
