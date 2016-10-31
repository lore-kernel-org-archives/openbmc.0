Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lPz089wzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:51:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=LsXPnAA7; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=sf3WT6HK; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 060EA207AC;
 Mon, 31 Oct 2016 02:51:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 31 Oct 2016 02:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:from:to:cc:subject:date:message-id
 :mime-version:content-type:content-transfer-encoding; s=mesmtp;
 bh=PV273fYX+OdQVocll79d9rKWHWQ=; b=LsXPnAA7LaPESr35Xiwg6q6KPWsw
 wPjVCL9B3CXtRQa+rkU5vqeMinAhu0iukZ2XZlEnZ6PKJWr85HDZinohC6DE14t/
 p8kMgmxq7ygr1rWwvL8rrHAyMXzKe7YwjmxKr0awv0PCmMVCbNZm3lrkYozePsGN
 KWdbzjlh0eMNH7Q=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:cc:subject
 :date:message-id:mime-version:content-type
 :content-transfer-encoding; s=smtpout; bh=PV273fYX+OdQVocll79d9r
 KWHWQ=; b=sf3WT6HK8VewHC1Pin1lZo8s7Jqc3AI3atW+JTZllly+/AdfxtE8Eg
 Kh7cULl2dsu8JznpnjpkUUWL9soihddLQIcV7nClk7wcYD1PAZ2Uf1fQR1ib63hR
 0negYY3aqiWs0PUoavVD27O2Az+bC077x0OgRtkW5/rzy0fyFpP0Q=
X-ME-Sender: <xms:5OkWWHdKGN__0ensYnrcQGp9rvQbRlvJRssqSmA69sgJoxmsd30h2Q>
X-Sasl-enc: dVuAa3UzLOiPE4g9vZI7VVayPfsQx78tfhjbkDAI/8RD 1477896676
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F745F29CB;
 Mon, 31 Oct 2016 02:51:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux v2] pinctrl-aspeed-g5: Never set SCU90[6]
Date: Mon, 31 Oct 2016 17:20:35 +1030
Message-Id: <1477896635-13194-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 31 Oct 2016 06:51:19 -0000

If a pin depending on bit 6 in SCU90 is requested for GPIO, the export
will succeed but changes to the GPIO's value will not be accepted by the
hardware. This is because the pinmux driver has misconfigured the SCU by
writing 1 to the reserved bit.

The description of SCU90[6] from the datasheet is 'Reserved, must keep
at value ”0”'. The fix is to switch pinmux from the bit-flipping macro
to explicitly configuring the .enable and .disable values to zero.

The patch has been tested on an AST2500 EVB.

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
