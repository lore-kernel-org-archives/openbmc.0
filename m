Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OYCrJR6K"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AyA31Oov"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Frz15JJ0zF257
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2159C21A42;
 Tue,  3 Apr 2018 10:27:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yOs7947oKMmeupRJ9
 P4A3adbXnzS2ROp7gS27xqx8WQ=; b=OYCrJR6KJTtceI2Jnb4PMj1KiVOm8wVpA
 7Q9K9+XXuHTFN/0hA1zxg1tfZ449ugKM3grCg22VP+sBzROiIu+tJUWTzd8s5EFs
 h8FMXBQB3pGBIrTQ7neQdWp/S+f0qmC/lesfNGLGTfsHLMt5cHUp2WYFlWrbOCU/
 bR+XAYSfU0Ki3SFfWoUvZb4HKH1ZlHorQJaIKnBPQqLdttBJ3CJW4jqe0zx8mS4r
 8mT+w8g5sbOUCzUYNpQC9ujCira2MlPhcBXkNPxTanviA9ofwNUWdP0Jnvy4WLqd
 3uMCxHX9BTsyP8FeKOSG8zoH/p7a39+dpzXR32Iqt+3ikbQAfEapw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yOs7947oKMmeupRJ9P4A3adbXnzS2ROp7gS27xqx8WQ=; b=AyA31Oov
 +EcbCBSzoqHQIlhdVvqQH2upvDp9NnJJLS3VlGs2iFYkFwo8bDHMxW3PnlYLbq8/
 6kifSsojdfSdI9aAsdm5YSRWPYmUXBPy5nZRCdfKry1lKrWN7pQxLF6HObSOAHHm
 G3cF4624FkGuKkjl7QxBZedJy/ZYadlzwXDV8I+SXURrzpt5F1D1vZs2xzO1eFv9
 SEs1GJ3fOz5awGMOD6GeeGViEezB3KUXX9Z3pmVy65mTfz3c24L3y+nzFETe1eem
 tQ9uPZ09GNT/vIZk56YkUz4MxwOjNTHenFlyKZ4KEyF1UkfQqbZkSjOsJ1dD6P3t
 fXSLPozS8BQT4g==
X-ME-Sender: <xms:W4_DWnduDDvro2f9Kj_CaEYytpuSaV1OtHNDPs32HQrwa29VvKYfUQ>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDEBA10269;
 Tue,  3 Apr 2018 10:27:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.vnet.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 3/5] pmbus (core): One-shot retries for failure
 to set page
Date: Tue,  3 Apr 2018 23:56:53 +0930
Message-Id: <20180403142655.16681-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180403142655.16681-1-andrew@aj.id.au>
References: <20180403142655.16681-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 03 Apr 2018 14:27:42 -0000

Work around the shonky behaviour seen with the MAX31785 where we fail
to set the page register in some circumstances.

There's no real elegant way to do this. We can propagate the error up,
but that forces us to retry the operation way up the call tree in any
number of places. It also forces callers to split out pmbus_set_page()
from the pmbus_{read,write}_{byte,word}_data() functions in order to
differentiate between a failure to set the page and a failure to read a
register (that might not exist, in which case an error is anticiptated).

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ee7e0684c29f..ee1bf11c7fc6 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -167,9 +167,17 @@ int pmbus_set_page(struct i2c_client *client, int page)
 		return 0;
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
+		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
+			data->currpage);
+
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		if (rv < 0)
-			return rv;
+		if (rv) {
+			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+						       page);
+			dev_dbg(&client->dev,
+				"Failed to set page %u, performed one-shot retry %s: %d\n",
+				page, rv ? "and failed" : "with success", rv);
+		}
 
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (rv < 0)
-- 
2.14.1
