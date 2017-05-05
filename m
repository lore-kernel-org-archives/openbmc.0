Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJx5p13J9zDq5W
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 12:43:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="J8E+M+DH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LRCIbTuS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0794220ACF;
 Thu,  4 May 2017 22:43:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 04 May 2017 22:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TNwesf
 n7Q/oKfi2841mZANGUhwAy6newSNCk7869Nss=; b=J8E+M+DHLPg7cbGr39RzJz
 riiYUxb51t+tk+Eco7bxVbDx6C82bIs1MY3dX2eGUsOKYDvzodnA2ysdHEm4hpRQ
 G6+fpCnMNMZraZV7LC3jazqvMYFKcnomOyIJQG+bBTm7UOyT8M8dt34AASvZl/+f
 kcgUZ3LBdS+VbNwzoqg7wqnJJPVMpj6ARyOyQ31NVdTGyAGoZe4zUwWRMeOrEPK7
 j8ptlxvRbrhbVgxcSVcp2ftTcSca4yml62BdRUj+TUwnz0cRI7gVT9eQy7DlD2ud
 MhKIKB94Q6eyYPRVZiIXTuJtdpfhqF7HpYgughDJ9Mm9gCLtErprF1C1/UIUy68w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TNwesfn7Q/oKfi2841mZANGUhwAy6newSNCk7869N
 ss=; b=LRCIbTuSlh+p2fvH+uO0bSGFzeKAd72X3akxZZS3yFxx0+B3GyGsNFhLD
 MiBa+1tW1uHqwomBckuodYaPlm8l0CEjpia6YrWcEIA9reA4nw7yuo4vmYq1/zyA
 PktZUp5WwErwKSkZeAdrQL5ccVkKQEposFQD8+/097LFdWvdouZuZ5VntLd4VSvR
 l5ZY18zG6Dgtxat8+nCWCUJmkmtiwWmZTi1ItxMNwBz0SYYKfw+wPe6XlbYeReXf
 lf4ioEihno+iyrOFuGS/iMwskjTRzLYvi8xPc+Kffjz6HBtI2Ns1AG+ZJdNEQT4n
 vUsKPAPLHtu9eqF9oqnHM3mAdM2lQ==
X-ME-Sender: <xms:u-YLWX3oiy5ZBRREuGOQbsWJDTBtExU1BaCXAs5h90ABTgpH2m1B9A>
X-Sasl-enc: QLEa6A03094TPpGvsSydam3uO4MEWe61DwyZNJ8lo3w+ 1493952187
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E4E37E266;
 Thu,  4 May 2017 22:43:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com, ken.th.liu@foxconn.com,
 john.hc.wang@foxconn.com
Subject: [PATCH linux dev-4.10 v3 2/3] aspeed: barreleye: Passthrough debounce
 isn't required
Date: Fri,  5 May 2017 12:12:25 +0930
Message-Id: <20170505024227.30962-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170505024227.30962-1-andrew@aj.id.au>
References: <20170505024227.30962-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 05 May 2017 02:43:10 -0000

Passthrough debouncing concerns GPIO passthrough mode, but both GPIOE0
and GPIOE1 are independently exported by userspace. Therefore barreleye
is not using passthrough mode and we can drop this configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 88d0a59d043d..31b0e69f62b8 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -64,9 +64,6 @@ static void __init do_barreleye_setup(void)
 	writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
 	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
 
-	/* To enable GPIOE0 pass through function debounce mode */
-	writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
-
 	/*
 	 * Do read/modify/write on power gpio to prevent resetting power on
 	 * reboot
-- 
2.9.3
