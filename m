Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKpvz4gKMzDvsy
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 18:07:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MTHi8YA0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SwzWMBXV"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F2826203C4;
 Fri, 18 Nov 2016 02:07:07 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 18 Nov 2016 02:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=9y5la18i0oBodbn4aVHdi/QZ8Ok=; b=MTHi8Y
 A0kgErJnGiS7BKSRTOFfWKlG5BtGpn5x6UwzFUpmTWcGe+Jx0I/llLK6u9nie+Ni
 7+AV2qgSQl3YFCUSqKwmXlVm5SnECuNdISu1c8juhbk8W+aIhmpkq3cYVGckITSN
 x0bQ0rvPQ6Pv1FQyoc5Cj9kHuyqaYvxt/rUCs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=9y5la18i0oBodb
 n4aVHdi/QZ8Ok=; b=SwzWMBXV9e20J5mifvOVQiLvIkL0HsgnWVVkggwQFF9P7Z
 X/jiqS2HwQllK276swAr+viUxz3lMjLeundA2lLVFoiZbXR3MYkBsxAM7HURthYm
 /xBkSo558nEIBOKVUvhD08WeJAz4dKtnfOMaSH2BvZsTsbfmyz969KPCEus3Y=
X-ME-Sender: <xms:m6guWHs_Gyg5ADhFXOQzPcW_jPuGKwFKGvDnod4HsTSUmHxHXg-QGA>
X-Sasl-enc: 2XdUzwWhYQeZHJwQw+TVCRydU+R3mxJDQBWtlaal3xC6 1479452827
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F5687E057;
 Fri, 18 Nov 2016 02:07:06 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Add parentheses to HW_STRAP test
Date: Fri, 18 Nov 2016 17:36:35 +1030
Message-Id: <20161118070635.17708-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 18 Nov 2016 07:07:13 -0000

Squashes a warning:

drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function ‘aspeed_sig_expr_set’:
drivers/pinctrl/aspeed/pinctrl-aspeed.c:210:24: warning: suggest parentheses around ‘&&’ within ‘||’ [-Wparentheses]
    offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
    ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index ce1399dd8b68..387b75aebc25 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -207,7 +207,7 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		 * all descriptor bits.
 		 */
 		if (is_scu && (offset == HW_STRAP2 ||
-			offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
+			(offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK))))
 			continue;
 
 		/*
-- 
2.9.3
