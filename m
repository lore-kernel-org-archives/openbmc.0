Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6kXx15v4zDvR7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=N+Fiux/c; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=nVaaqix2; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 09515204CE;
 Mon, 31 Oct 2016 02:12:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 31 Oct 2016 02:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:from:to:cc:subject:date:message-id
 :mime-version:content-type:content-transfer-encoding; s=mesmtp;
 bh=MHrGU5EvuryuQAt4Ov6dipXoFEQ=; b=N+Fiux/cLW3y6YNKs+GOHm/k5N/K
 USC6fhlT4ISfWxdWCM7otxcTodcXsxzJI0QQ+EvVC0BnlV7IkuZeuRs72cYq+Itx
 foqBxnNspqO/vyPoNNEHiJZzKgTtTJpiQcVO/GuViuoDy+YlWa5V0B39bxgajJic
 xODTsOIShOE/1QA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:cc:subject
 :date:message-id:mime-version:content-type
 :content-transfer-encoding; s=smtpout; bh=MHrGU5EvuryuQAt4Ov6dip
 XoFEQ=; b=nVaaqix2TKjSFSw7LhUJi3owUevVIp5GFdSQSL1jdxoEE9SY1X6lpV
 jXL1Jp5yx7lGS9/7d2pWk3gfMgRmK1Br4v03zK5GvagliNcEnV9OHMN8FCBMsKPw
 iMK+tiPKmRSPVfM3t0n5dk1z6uCnYuW6pMMwXq6Fh+gSEVSdLfxQo=
X-ME-Sender: <xms:vuAWWJlGts2fgqaRRmsU4b_yERYT2UU2G5n9hdS7njfJf3DvKGQNxw>
X-Sasl-enc: VnsG1pb/Zs6LZR4Yeiu3IvkrL8CK/zJYvFCD5XvaSEeo 1477894334
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3607CC026;
 Mon, 31 Oct 2016 02:12:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux] pinctrl-aspeed-g5: Never set SCU90[6]
Date: Mon, 31 Oct 2016 16:41:37 +1030
Message-Id: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Mon, 31 Oct 2016 06:12:18 -0000

The description of SCU90[6] from the datasheet: 'Reserved, must keep at
value ”0”'.

Switch from the bit-flipping macro to explicitly configuring
.enable = .disable = 0.

If a pin depending on SCU90[6] is requested for GPIO, the export will
succeed but changes to the GPIO's value fail to stick. With the fix the
value can be toggled as expected. The patch has been tested on an
AST2500 EVB.

Reported-by: Uma Yadlapati <yadlapat@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 481e836d12e5..9a3139c13ffc 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -26,7 +26,7 @@
 
 #define ASPEED_G5_NR_PINS 232
 
-#define COND1		SIG_DESC_BIT(SCU90, 6, 0)
+#define COND1		{ SCU90, BIT(6), 0, 0 }
 #define COND2		{ SCU94, GENMASK(1, 0), 0, 0 }
 
 #define LHCR0		SIG_DESC_TO_REG(ASPEED_IP_LPC, 0xA0)
-- 
2.7.4
