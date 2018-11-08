Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.35.72; helo=18.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 17372 seconds by postgrey-1.36 at bilbo;
 Thu, 08 Nov 2018 23:01:47 AEDT
Received: from 18.mo1.mail-out.ovh.net (18.mo1.mail-out.ovh.net [46.105.35.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rMMb3m1PzF3Mx
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 23:01:45 +1100 (AEDT)
Received: from player789.ha.ovh.net (unknown [10.109.160.12])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2EDE013ECB6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 08:12:08 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id A83C12600AE;
 Thu,  8 Nov 2018 08:12:04 +0100 (CET)
Subject: Re: pull request to the u-boot-aspeed
To: Joel Stanley <joel@jms.id.au>, a.filippov@yadro.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <CACPK8Xdiyno=CMFBB3_bSR4bFwC3NCeCm9ccFCN7D+Yx=9YpHQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <58d860c1-3741-b1e8-8f83-f6580b8721f1@kaod.org>
Date: Thu, 8 Nov 2018 08:12:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdiyno=CMFBB3_bSR4bFwC3NCeCm9ccFCN7D+Yx=9YpHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16269253655087319810
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrkedtgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 08 Nov 2018 12:01:48 -0000

On 11/8/18 1:36 AM, Joel Stanley wrote:
> On Wed, 7 Nov 2018 at 18:03, Alexander A. Filippov <a.filippov@yadro.com> wrote:
>>
>> Hello everybody,
>>
>> I would like to publish for review and discussion our implementation of the aspeed i2c driver and the VPD parser for the u-boot-aspeed, but the gerrit said that it have no such repository.

i2c is already available from mainline U-Boot. But mainline does
not have ast2400 support (dram training is missing) only ast2500
was implemented. 

> I'd encourage you to submit the i2c driver for review to upstream
> u-boot. Cedric and I have spent some time recently in improving
> upstream u-boot support for the aspeed SoCs.

The ftgmac100 mac driver is now merged in -next, plus a couple of
other fixes, an updated DT for instance. 

I have implemented a SPI driver but it needs to be reworked to the 
latest best pratices using spi-mem.

You can use my Aspeed branch as a base 

	https://github.com/legoater/u-boot/

It boots an ast2500 evb.

Cheers,

C. 
