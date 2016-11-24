Return-Path: <clg@kaod.org>
Received: from 20.mo7.mail-out.ovh.net (20.mo7.mail-out.ovh.net
 [46.105.49.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPTrZ217PzDvs4
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 17:31:58 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1EF6E1EDC7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:31:53 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 28651480078;
 Thu, 24 Nov 2016 07:31:51 +0100 (CET)
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
 <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
 <1479784251.2503.18.camel@aj.id.au>
 <b6082460-d8a0-9dfb-9b84-9f98a660e6aa@kaod.org>
 <1479864143.2503.44.camel@aj.id.au>
 <0187082e-64b6-4b84-61bc-bc3014c24d0c@kaod.org>
 <33a36155-627e-1b51-2e60-6e1cd39b60a5@kaod.org>
 <1479949200.2503.50.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b974b731-8eb4-655c-7e36-c7e011901971@kaod.org>
Date: Thu, 24 Nov 2016 07:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479949200.2503.50.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9896941657777605378
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdekgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 24 Nov 2016 06:31:58 -0000


> Hmm. I don't know how I feel about mixing the pinmux with the SoC code.
>  If you've seen the kernel pinmux driver this is going to get large, so
> I'd prefer to isolate it a separate file so we can ignore it for the
> most part. It's hard to do that if it's in the SoC code.
> 
> But!
> 
> On the basis of your patch below I'm reconsidering the pinmux idea. The
> problem patch 11/38 was solving was knowing how many flash slaves we
> have. Previously we thought that was completely described by the second
> watchdog bit in the SCU, 
>
> but now I can't think why we aren't simply describing this as a property 
> of the board (say in AspeedBoardConfig) and avoiding pinmux contortions. 
> Is there a problem with that? 

No problem at all. It does not kill puppies.

I was trying to find a way to detect the presence of a second flash module
from the HW configuration. It is still currently a mystery to me because
enabling a function does not mean there is something behind the pins.

> It is yet another property to configure, but it's a board level problem 
> at the end of the day and will be *much* less code.
> 
> Thoughts?

Let's go that way. It should be simple as there is already a "num-cs"
property.

Thanks,

C. 
