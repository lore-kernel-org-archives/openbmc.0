Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5mww6134zDqBn
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 23:57:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BDiXycO6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GMKWIObG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C73542016D;
 Mon, 10 Jul 2017 09:57:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 10 Jul 2017 09:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=fdrmSg
 2uQp1L8yj+UKB2UNuM0zxlfJRU3+4PJkHy/SI=; b=BDiXycO6KHxhN6oAa31P80
 RhBsdCx9Zbh2/Pw0oqSg9bR3+mKHwjbUpsP8oZr19PuyxO/cOYuHOihiXK+siZvj
 xcIax2hXj0byYDgQFI+Xxjp+316bnKkdHwhy/PHNJk1Nl4zkqYxT22+jXrDIB7X4
 w3iA58Cw2QB/iGpI0hpIS0qYIDmzXsgFCrW91NNx/Wq/I0EW4pXHev3e2zY7LVDG
 hV3ZkhF7yGFZuQ4bmgRbWR6dx6DWcug6Ub81AKfVGIN2LyXiH7xXhNDKYGkrNwnH
 GQ2pNZiZZ0aTXtDvpTpue4RanELwh+xe1vlVoG1ShijaGUXqaa+hKEjwsiDUvIEA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=fdrmSg2uQp1L8yj+UKB2UNuM0zxlfJRU3+4PJkHy/
 SI=; b=GMKWIObG03H+6mMdXcc1iv45qyuKzTZFNxHUgfPSsF01FuXmbOP0NP0x+
 79HObuGXC2PvdXYePOz8vwcfGb+VhvkJPDWvARcCbhlcnN06gBxw3r+oUvBa1DPt
 bdfDXAVd4frIiHHl/LLgTmYSyy9xjmv52KQiu12HST261nw1rgkzgQ1eJams0VKQ
 4J0WptJpOKHUEV2X5/yzqj15uWtRGuyyqXEzUTT8X5lLPYkx0fc1LbA8QE2PGUPz
 r5pUZA+pEY+0o6En0PXM8ybE8oGuA/N7DytXnLT8mDKKcW+6qoVeQhVkL/vb6TXk
 c66djsruoPnCoy14dvS7h+pB5qsjQ==
X-ME-Sender: <xms:rodjWRSVhTY22fxWfN0ln6U_BSEDI9Su8574eQPtCN9ocl1LGrdVpQ>
X-Sasl-enc: FIe70ccp2yy9oD0PZEbAO86g2ycSnBd8D2/6qGQ7ilPT 1499695022
Received: from keelia.aj.id.au (220-253-43-190.dyn.iinet.net.au
 [220.253.43.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 83CBD7E51B;
 Mon, 10 Jul 2017 09:56:59 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 1/4] hwmon: pmbus: Disable build of non-max31785 drivers
Date: Mon, 10 Jul 2017 23:26:15 +0930
Message-Id: <20170710135618.13661-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170710135618.13661-1-andrew@aj.id.au>
References: <20170710135618.13661-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 10 Jul 2017 13:57:05 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Later patches make incompatible changes to struct pmbus_driver_info, so this
serves to keep the following patches buildable under otherwise incompatible
configurations. It is a junk patch that won't be present in a non-RFC series.

 drivers/hwmon/pmbus/Makefile | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 562132054aaf..24ff7ee7f8bb 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -4,15 +4,15 @@
 
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
-obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
-obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
-obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
-obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
-obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
-obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
-obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
-obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
-obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
-obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
-obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
-obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
+# obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+# obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
+# obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
+# obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
+# obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
+# obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
+# obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
+# obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+# obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
+# obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
+# obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
+# obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
-- 
2.11.0
