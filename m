Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oCOjsxZy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="awM0rrGs"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hGS938qCzF2SK
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 11:52:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F9F821C07;
 Wed,  9 May 2018 21:52:05 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 21:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=d9f73JGNdVEVRyVsCh4c7HiuQ2hGI
 t4U3T/E/oqSigA=; b=oCOjsxZyUArElLW43nqBBDzdFVJqnXYWgnOHwYGsM4HRu
 jAY0rYR/nWlwc/pGAvXi4vBtcHGJbVbUcUiwO8f37BIoa26zvvU84z/1DDmwv4DO
 PpWscozQtqvmP2/WziTGb3mcyr8NRWFNu3C0rYNF7NxbtOPiu6dJiu+gP3qxn488
 o4rhxLghF3FwoOkAX4N2w6tGz9a8WJMAaN+Pf17yvtHB2j847ytmgg9iEdUetJX1
 6B2hlDFoVK9Tf+R8dKQs+FVK8T7tI88xCEFjeW1k7m31XlkMcfAZs326bbTwoo61
 iX7P176ehgwjVXEsPyLoFDpza8hAEJ/xnrdgX6aTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=d9f73J
 GNdVEVRyVsCh4c7HiuQ2hGIt4U3T/E/oqSigA=; b=awM0rrGsbqpbPcVlQLgYLJ
 KP+tyK8yGkpHzYJjdsvTRZW5qNFBXggdZ7aLCJ9z47NuH2xq8C/imO7JUkc50aHV
 awiwOQ+lZB57asmHgcSGZx+deZWiovI8Wu7bY3kpxwV8nVcH6yvGapAL6eH7ZjFT
 ZGvcB7UySS1qNTxdIvhkj3GNCRFXS0nISz8NdhXX4z0Y93agtBFfp+5NiJVSv/Gc
 attXnPvV4Q8S7XXLYUUZWpLd2lbF2hTW12id8qi2Ag0ND2lsnUXkZmUAIVQhBKYJ
 vIg894PVoMtHbrz687L7ZNa+paBmdJmhViRKk5tGuaKTYOZKEDivaZHeaf1gBnOQ
 ==
X-ME-Sender: <xms:xKXzWpr1kfUL1QM2uJ_9n14Kv0X6Jh3LbJIwHR3mshWAaKxhil_Qsw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id DD55D41AF; Wed,  9 May 2018 21:52:04 -0400 (EDT)
Message-Id: <1525917124.2417085.1366924696.1ADBC6F3@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eugene.Cho@dell.com, joel@jms.id.au, benh@kernel.crashing.org
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-2-andrew@aj.id.au>
 <CACPK8Xco1vLEFtxTmfp_roN0khOfdYMQAjN+R4mgo6DScwRZWA@mail.gmail.com>
 <1524109954.2421916.1343180600.297713A4@webmail.messagingengine.com>
 <d0d76c65aa504f63a4105207941ec24c@AUSX13MPC105.AMER.DELL.COM>
In-Reply-To: <d0d76c65aa504f63a4105207941ec24c@AUSX13MPC105.AMER.DELL.COM>
Subject: Re: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Date: Thu, 10 May 2018 11:22:04 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 01:52:11 -0000

Hi Eugene,

On Wed, 2 May 2018, at 02:51, Eugene.Cho@dell.com wrote:
> 
> >> An observation: It's the only thing inside this file that is aspeed 
> >> specific. If not for the name, it could be generic code.
> 
> >I agree, hence some of the bullet points in the cover letter. But it's name and location was also partly driven by Arnd's suggestion that we stick the junk in drivers/soc, and it felt a bit weird not to use aspeed in the name >given the convention there.
> 
> Just FYI - We've got the same exact problem on Nuvoton (just odds and 
> ends in misc registers). Does this imply we will need a soc/npcm750 
> which also does the exact same thing?

I don't think so, if anything it's an argument for moving it out of soc/aspeed

> 
> I'm guessing making it too generic - will make it harder to get upstream?
> 

Probably, but the more evidence we have for requiring it the harder it is to argue against, and so the fact that this could help the NPCM as well might even make it easier to upstream.

Have you played with the implementation at all? Would be good to get some consensus on it being a decent approach here before we go upstream with it. I also need to add devicetree bindings and ABI documentation...

Cheers,

Andrew
