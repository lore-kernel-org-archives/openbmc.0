Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJx5j31XwzDq5W
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 12:43:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="smtw3A1a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qLvzXxRZ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EDCFC2097C;
 Thu,  4 May 2017 22:43:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 04 May 2017 22:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=cOHSrWFGAZad8QyQDxXsRFGFrw/ZRz
 B+az4r3/lEt1E=; b=smtw3A1a/bq8u+/jpeqI7Hs3kmh+to06L7AEXQ2HsMKSWW
 dFk0U24WzJMEzZylY9RPsNc3iQoV5B7tEovSgRrFKRyCEt4W2h6tEkqpqm3VEbwB
 usv7MikLzJQnj3GISWJX4R+9gt3wQF58xaj1c7rJCOvt3NpIII4GwY1hokbeW4HN
 IE1l8lm2X2FDVcCqnL4Nbxj4ALpJETaPzCVEQIadzIeKmDrl4rZWnDj+1cM3flRC
 E+C+MLQzcDvAddYw9rB2XyOkxTzzJiJYP0pTLdVY7qcMGCR5ndBtc2yHf+4TnK4Z
 wgsJgxm3aHtk50J+A/cFuwzcESvCxSRnrHoJVCKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=cOHSrW
 FGAZad8QyQDxXsRFGFrw/ZRzB+az4r3/lEt1E=; b=qLvzXxRZFjl/74rWtlkIqj
 zFNOBZvF87gjrEk5TbjcJFgqPPkKmH9mvqmnidWig1ZgoDv5PludhtYq31ye+nmK
 UWnG8SRrYLnN/OhFFJGqWw/Gr7Ygr/3vDFYEiupPNBV7PQSXV0dH/zMMxBx+1DPr
 dVl91y3XGW5+shikhrhCzPXteqyejCyd4azv4IfNaI/r/GHMEOUVCzty0VmgDVSp
 ZNafDKolzXmLTXv4yRV90DB4A+ofBfpAQVGkJXVEXMBkTL0Gt3qhQ3JlTsIvdqMQ
 L0q4IHOZjAbfC53lE6hbllYF9lggmNYCI7LWUARqvs1+/7jRG+k2xraHskEqjXKA
 ==
X-ME-Sender: <xms:teYLWfq3IYHISou6-VM70lX3PdKjf8F8ktST9knpo0lmwrXCCbxzjg>
X-Sasl-enc: AgEtQsQQJB8brfhElmfHrtlAzgQ+XNjUgfZKZE3lN3db 1493952181
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35A227E2E2;
 Thu,  4 May 2017 22:42:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com, ken.th.liu@foxconn.com,
 john.hc.wang@foxconn.com
Subject: [PATCH linux dev-4.10 v3 0/3] Clean up mach-aspeed/aspeed.c
Date: Fri,  5 May 2017 12:12:23 +0930
Message-Id: <20170505024227.30962-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 05 May 2017 02:43:07 -0000

Hi all,

Here's v3 of the series cleaning up the board file given functionality we now
have in the tree. Between patches acked and applied from v1 and v2, there's
only Barreleye left. I've dug into the archives and Cc'ed Ken and John so they
can provide feedback if they have availability.

A slip of the fingers meant that v2 didn't actually get Cc'ed to the list, so
apologies for that. Xo kindly Cc'ed his replies so the acks at least saw the
light of day.

Again, the controversial patch is the debounce patch for BMC_PWBTN_IN_N, which
changes how the GPIO is exposed to userspace (and so needs a corresponding
userspace update). I'm hoping Brad can give feedback or start the discussion to
coordinate the userspace change.

Cheers,

Andrew

Andrew Jeffery (3):
  aspeed: barreleye: Remove unnecessary GPIO configuration
  aspeed: barreleye: Passthrough debounce isn't required
  aspeed: barreleye: Debounce BMC_PWBTN_IN_N through devicetree

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 11 +++++++++++
 arch/arm/mach-aspeed/aspeed.c                  | 18 ------------------
 2 files changed, 11 insertions(+), 18 deletions(-)

-- 
2.9.3
