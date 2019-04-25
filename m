Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oWSz2Yng"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BTMFFlhv"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qlLs4DgMzDqdP
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 03:59:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6FBCE20EB0;
 Thu, 25 Apr 2019 13:59:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 25 Apr 2019 13:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=EZ7a/4hDAK/f4DZneSgZSN/lga/OrHE
 8kZe501yT0eM=; b=oWSz2Yngp8i2z+9yr0+91cregm4QIm/LFbNChl1gQTevO90
 iay2+UOpGCqqq7KzbmzXTvZnmhZ4wCJB9Er5xBN/N6kSnPVQU6GUGZVBI7NuNQtg
 VBD0NB90v/Ho82dbFE9j2z+b/xnFrOf/HyIMk8m5E6keNDT3juzvqvYTWvmNTfoJ
 zXRauwOQBIVSCMmiFLMDQhRDYliuNNeAwAKk1VNsRegNMGKHV3Kz3j00TUdB0RkM
 WQxiOmgAnkC825GvSPXlnDBL7DWEZBTs9bcx7ufoQBfQDDTRa0k6y8eH4T2nGewY
 1zYwZudiB4666BiItzXMDoyaaZGhgQpNT305yqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EZ7a/4
 hDAK/f4DZneSgZSN/lga/OrHE8kZe501yT0eM=; b=BTMFFlhvDDsFfz3totvB1O
 ibQl6o/7GyXgl8PAYXLfrCpR9YhJniSWxkgriJ2s+l99ybF8nna8q6hh+MI+SIKK
 8D3Subxj9t5jXZbO/ujjdilYNwxVkQEPFWd5dyhQPCFfYTivf/kYVMDM6JBSPaxn
 O8ITKDmanTm8GzA9qspbCuhtF5jRZT4L8faYyybTsPzGPu/clqQBKoRbKv70cwz1
 idzoYCQfVmceMDNzLyfADYIG2eZ1DoDrH7h00j/hcUwyWdt/FuT1TzVcXfYKCNEl
 jhiaypJz/ezd/RXra+obd4YVZsR4VHennkaqHV5d8QJizWfsK+VU29sa7rHtgfLg
 ==
X-ME-Sender: <xms:f_XBXOxZtyWWxtVc-SkrGorcOggeFeRnDm4_tEd8vkq8LjQBCruX4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrheeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:f_XBXAEujtvIMqYHlQDBGZlOlz3cmuZNfa-ZNxg5093y1dzao9treA>
 <xmx:f_XBXFaP34F2qF1iHiYH2j_jziur9ikp7onCxrmikHG-dJ6HOBLrpA>
 <xmx:f_XBXDhS3AsQiUCIkuVpwIao8p2OowI4pBo-VWA1ibgkv3nv163pNg>
 <xmx:gPXBXKTHGBuIPwKEWZ45cpy3fQNgYOSvlY0bdxAcQtotGFNJ7GUx2w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3BFCE7C199; Thu, 25 Apr 2019 13:59:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-444-g755619f-fmstable-20190423v1
Mime-Version: 1.0
Message-Id: <c5373614-4965-4cba-b68c-c114389a315e@www.fastmail.com>
In-Reply-To: <CAO=notxWQFgmgJUUVXDZun1FR9jZ1+hhD-5mdWjNttcxKiwwcg@mail.gmail.com>
References: <CAO=notxWQFgmgJUUVXDZun1FR9jZ1+hhD-5mdWjNttcxKiwwcg@mail.gmail.com>
Date: Thu, 25 Apr 2019 13:59:26 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: Requesting Patchset to linux
Content-Type: text/plain
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
X-List-Received-Date: Thu, 25 Apr 2019 17:59:37 -0000

On Thu, 25 Apr 2019, at 10:54, Patrick Venture wrote:
> Hi,
> 
> I was curious, when sending a patchset to openbmc/linux that is
> already staged elsewhere in a maintainer's repo -- should we just send
> an email with a link to the patchset or the full patch email?
> 
> I've done the patch email for this in the past, but wanted to ask.

It's easiest if you send us the backported patches based on top of whatever
the latest OpenBMC dev branch is (dev-5.0 right now), that way if there are
any conflicts it's the subject matter expert dealing with cleaning them up.

When you backport your patches, please use `git cherry-pick -x $SHA`, as
this will embed the commit ID of the upstream change in the footer of
the commit message of the cherry-picked change. This allows us to easily
track the origin of your patch back upstream if necessary (handy for
Fixes: lines).

Cheers,

Andrew
