Return-Path: <clg@kaod.org>
Received: from 12.mo5.mail-out.ovh.net (12.mo5.mail-out.ovh.net [46.105.39.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNwMM2pY2zDvqt
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 19:23:10 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id EFE764BCDE
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 09:17:16 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 1AE13600089;
 Wed, 23 Nov 2016 09:17:11 +0100 (CET)
Subject: Re: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20161118081221.19651-1-andrew@aj.id.au>
 <16ff25a6-dabf-0075-684b-37799ed5abab@kaod.org>
 <1479864451.2503.46.camel@aj.id.au>
Cc: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92b08f38-3a4e-9349-d60f-c84cdc4dc56e@kaod.org>
Date: Wed, 23 Nov 2016 09:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479864451.2503.46.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5804014023323454210
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdeigdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 23 Nov 2016 08:23:11 -0000

On 11/23/2016 02:27 AM, Andrew Jeffery wrote:
> On Tue, 2016-11-22 at 17:45 +0100, Cédric Le Goater wrote:
>> The palmetto I use runs v1.99.0-275 and I could not boot the system. Unfortunately,
>> pdbg does not see the P8 chip so I really don't know what it is up to.
> 
> These were the symptoms I was seeing with the tip of master on Monday.
> I haven't looked into whether or not -275 is ahead of that, but have
> you tried fetching/building/booting again today? Some fixes were
> applied, but I think Joel said there was still some flaky behaviour.

ok I will give it a try. 

If I netboot with OpenBMC v1, the host fully starts. This is somewhat 
frustrating ! :) 
 
> I don't (yet) think it's directly related to the hogs patch.

yeah, we will find it.

Thanks,

C.
