Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63J4Jh1zDqFy
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f6aJBITT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Fg6AgeHw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 73A8D2088A;
 Thu, 27 Apr 2017 02:09:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=7AduRc
 KDJygyiaWdkBnAHMFKT5G/s5gB5izp49AzGTY=; b=f6aJBITT3GbIuE53uSAAjy
 EuHSFceB8r20q+EIiIjuKmA1r9877jDM9ucur2mBZY8Ag3oDT8NozL1roijAWSlD
 lb5OQk0ASSXZCw4L3AlNoiiHQbxaJt7OxxY5pjEogVYU1uIBI2GJykPb811suGa0
 psXBCAei/5p+9VGjJfGOXgg74+fIo4gXLnPUrCJlwtR5O6F6mD4VDTRn93kiMl6n
 0ODx9lSuIIY1MSjP9EaIY92KP8FyevtJhwJ4vnGS7+ZAUWsngNqhE8HxWrOfIa1F
 RDawaesSpGrIQQ7NuengxDszE59TceKWlIPGyzuWuvIZZiaSUtFvhre0e4LVOtKA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=7AduRcKDJygyiaWdkBnAHMFKT5G/s5gB5izp49AzG
 TY=; b=Fg6AgeHwPOzO0FCL2QaRsJ78+NphsHLKibS1rLT47rOweNC8k4kDmNtII
 l/LQ0XTac8IyHUVocdLYbutu4anhtcKXNRe9D7cMkjphoAdbk7YlWL41mExbKLpb
 8qZiqIj5clJTkPnLV9XQD8QA9GOBWT/vWzAtOYwbejH9mP7xIQl/jw1uPrgHJgfP
 S6qT/OGWmoiSo2wHyNZu19LVNVGWaMMdoS5C3xXiKdTWHKzYB2vXUGxjExo9W1/w
 MzGmkQUBKhEI++OvdXBd0jq6PqrknNLQMaItzh6iLipcfiqTnN3juxixC7LE3MzR
 isQs9c43gUKc6XBQ9yW8f8aGRW2dQ==
X-ME-Sender: <xms:CosBWan96K4aTFRVc42PyPRFSGsaC6RCzCxDdZ1tX4Zfd24LH82AyA>
X-Sasl-enc: S+dojmdVLhrmNwXAzSCw8aMetMUDc544EDaEqOXv2QmS 1493273353
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FCAC24741;
 Thu, 27 Apr 2017 02:09:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 02/10] aspeed: barreleye: Passthrough debounce
 isn't required
Date: Thu, 27 Apr 2017 15:38:15 +0930
Message-Id: <20170427060823.32226-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:17 -0000

Passthrough debouncing concerns GPIO passthrough mode, but both GPIOE0
and GPIOE1 are independently exported by userspace. Therefore barreleye
is not using passthrough mode and we can drop this configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 6c6bac0c3e63..21084c72aee7 100644
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
