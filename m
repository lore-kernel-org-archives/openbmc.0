Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvKK5zY0zDrS6
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KAWdrEYe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AIh5fpwR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CBFC20AD8;
 Fri, 28 Jul 2017 12:23:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=I8VpXn
 5BWVhd0gSjYA+g2fajtX5jTLl3dGehqCDybFI=; b=KAWdrEYeDF+xAkoWcJ0yRg
 GitVfLU4X7ZpcWKVFIC0Sd1lI2IUPeeq2nPnS2wWD7jWis/GUIOvOt2il/DGHMoB
 N7bHBX9/GA3ACwIWgtcI41ulRVP9wGHcC3Jw/6+0zWHWzvWjcPMn5POYCCoLR1B1
 gtY/L4B5fmjGmNWydtWSgV0nKc5djKIfxHVZ3IaEwgWbUIVMmfnu0Yovh/1ySJA8
 4BXe/iTTqJsNYhVpSCpKII6dOc7fNbbwpiy2T3FWnFHb/hb4XY4iMrAG8TYie1TS
 x1YHJbE8ft4UYL8HOer8PmfFFQA/pieTLQsYkSKAY5VY7WB3n38VwIVmTji5FZvA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=I8VpXn5BWVhd0gSjYA+g2fajtX5jTLl3dGehqCDyb
 FI=; b=AIh5fpwRXI8LAPk5Cxvp/FIGxfnJoYy0a+FSN2fe4P8Ib5uyGl2j4PK9P
 MPDMfeYAzjbslZFHIPgeYg64Wvgg8iwnyk5a7LQ+tpgha0vru0mx4oBw8y8KLM7G
 heGRBj/ViBtq5Xb8aWh7DOcyEQsq4LITF+ECmqeNhxRDf6S+kUtSQgluES5CQzfO
 X0v7GUNbhHlmiHViDDjRTR9wcRVR69+SLdZY87Gr/l3VB7PkMhtiBYGeKcYmspvy
 3JhkTxXr2WjPltEIstq07IcbI9agDKK0ebbEMhx5YIaqOAojSm5P/LB11u7x3SgG
 j2K0QAgC9eFjmSraONFtQwJGxcUAw==
X-ME-Sender: <xms:8WR7WZrOJtKS-7vhbJVUPAH2Bcgbe39LfAs6cR3XObYwpzG-FZ_Zwg>
X-Sasl-enc: o6uNmSyVrJo9osziwdTRXS12zEWq9Vuq8t8mVF6WJNIp 1501258992
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6736A7E1FC;
 Fri, 28 Jul 2017 12:23:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 5/6] max31785: Support mark-fan-installed
 devicetree property
Date: Sat, 29 Jul 2017 01:52:48 +0930
Message-Id: <20170728162249.9145-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170728162249.9145-1-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:18 -0000

Allows fans to be marked as installed via the devicetree.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 1c2648ce5322..a86919bc7294 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -270,9 +270,14 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (pb_cfg < 0)
 		return pb_cfg;
 
-	if (!(pb_cfg & PB_FAN_1_INSTALLED)) {
-		dev_warn(dev, "Fan %d is configured but not installed\n", page);
-		return 0;
+	if (of_property_read_bool(child, "mark-fan-installed")) {
+		pb_cfg |= PB_FAN_1_INSTALLED;
+	} else {
+		if (!(pb_cfg & PB_FAN_1_INSTALLED)) {
+			dev_warn(dev, "Fan %d is configured but not installed\n",
+				 page);
+			return 0;
+		}
 	}
 
 	ret = of_property_read_string(child, "maxim,fan-rotor-input", &sval);
-- 
2.11.0
