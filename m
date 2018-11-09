Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.157.236; helo=10.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 16201 seconds by postgrey-1.36 at bilbo;
 Sat, 10 Nov 2018 00:11:57 AEDT
Received: from 10.mo6.mail-out.ovh.net (10.mo6.mail-out.ovh.net
 [87.98.157.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42s0t53ZZ2zF3bH
 for <openbmc@lists.ozlabs.org>; Sat, 10 Nov 2018 00:11:55 +1100 (AEDT)
Received: from player699.ha.ovh.net (unknown [10.109.143.209])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id B4A7119759D
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 09:24:56 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 46D8A2400A9;
 Fri,  9 Nov 2018 09:24:53 +0100 (CET)
Subject: Re: pull request to the u-boot-aspeed
To: Joel Stanley <joel@jms.id.au>, a.filippov@yadro.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
 <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
 <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
 <c59de915-9608-4c44-adc3-82d83d6e279a@fb.com>
 <20181108123011.GA8718@bbwork.lan>
 <CACPK8Xcbv9UZSr=6N+UUyWnVggve7GrzO9FGdQ8jA9ZUVbQ8Jw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dc74b4d4-3062-2a40-200e-5140387bede8@kaod.org>
Date: Fri, 9 Nov 2018 09:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcbv9UZSr=6N+UUyWnVggve7GrzO9FGdQ8jA9ZUVbQ8Jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4924686192615787266
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrkedvgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 09 Nov 2018 13:11:58 -0000

Hello,

[ ... ]

>> Is it the reason why the OpenBMC still use v2016.07?
> 
> We haven't found time to work on upstreaming u-boot.
> 
> If you were to add support for the ast2400 we could move all platforms
> to the upstream tree instead. This would be preferable to maintaining
> our own fork.
> 

One (quick) way to move forward with the support of the Aspeed 
AST2400 SoC in mainline would be to use the lowlevel init routine 
of Aspeed. 

It would give us the DRAM init which is rather complex to rewrite 
and we could use and/or extend the other drivers which are already
merged in mainline. The SPI driver is still in my branch and NC-SI 
support is missing.

Cheers, 

C. 
