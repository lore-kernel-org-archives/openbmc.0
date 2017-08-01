Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM1m24X39zDsPN
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 13:20:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TiYBWEVL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pCHFuiX6"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D8ED207DA;
 Mon, 31 Jul 2017 23:20:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 31 Jul 2017 23:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=HGBVte
 GHe3D8kDCNe5kpxPj0bpZoNhDIJTDEd9NX5IE=; b=TiYBWEVLKWCsxHPMXPTvPb
 DAUFLTcI/G32P8uNhyyJgq8qorPRniPprZJsOTmYpRh0wcmCBphAaTYSgtqXp4DD
 50KljhjCg9OEfNR9xVkXC1NGJVmgsUHTczWXjio36rls5IRaH23aukec1DIZtFpF
 FzfgrlOjN0aR7wUzRoLZgZeBK991DRV+WhvabxFbQRULmyrh5VNdGqQD8DpsEABp
 6GFpqgbrO90HPsalTYD9HjQUAw55vC7hpMMjTQRPJSbXBfCiJVMWFGvTmKExRXVg
 YQrfsG6vAWVwl/3rDVQRQuAEnxT+LLVMB4+Mm+rlpbGYdYvMIrk09cgQJda1TKFQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=HGBVteGHe3D8kDCNe5kpxPj0bpZoNhDIJTDEd9NX5
 IE=; b=pCHFuiX6vjzlcGzNsf7bSOvEl3zPgYbbZtynJit9QWHRgcWggXamXSzdy
 FKif9QoaoUO0163agxyCNiOSXoW6c4YGSUB7WFxBQc7l2BDSuUox4XO1YdfDfZLi
 Z3XIiTDTvbpVvjvgnekwZts5XHqxnETEl0QKvdHpmqsoCNdTeagTZPw5uESFJ0Lq
 Igr8wHQPAsRvoO32p39O/Y1qB91PfoLwjRlSbfPUg/dQDYKYq0/8qgRgfasb3a1w
 Uw1HudWB7tabKqFY+jqxwOpRIGiyCTrMwt7MrQ54kmp7mMhS/buKwDCBmc3V/O/L
 EH8QQ0DhKV31lqCU7nfB/yW3m07NA==
X-ME-Sender: <xms:cPN_WbCwpwjqT2KAUQ8sFvIrghIbqulyS3pRTP_gTAXeALItTJLptg>
X-Sasl-enc: PVkjrfRWtW32D0IfCM/C1xkAE2p4F6lKXuTSMBkwtwIt 1501557615
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A7A67E1D9;
 Mon, 31 Jul 2017 23:20:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 2/3] max31785: Support use-stored-presence
 devicetree property
Date: Tue,  1 Aug 2017 12:49:31 +0930
Message-Id: <20170801031932.4328-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170801031932.4328-1-andrew@aj.id.au>
References: <20170801031932.4328-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 01 Aug 2017 03:20:19 -0000

Allows fans to be marked as installed to reflect the devicetree, or not.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 1c2648ce5322..c2b693badcea 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -270,9 +270,12 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (pb_cfg < 0)
 		return pb_cfg;
 
-	if (!(pb_cfg & PB_FAN_1_INSTALLED)) {
-		dev_warn(dev, "Fan %d is configured but not installed\n", page);
-		return 0;
+	if (of_property_read_bool(child->parent, "use-stored-presence")) {
+		if (!(pb_cfg & PB_FAN_1_INSTALLED))
+			dev_info(dev, "Fan %d is configured but not installed\n",
+				 page);
+	} else {
+		pb_cfg |= PB_FAN_1_INSTALLED;
 	}
 
 	ret = of_property_read_string(child, "maxim,fan-rotor-input", &sval);
-- 
2.11.0
