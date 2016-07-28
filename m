Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0CWV3ZttzDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:33:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=f5fwwGMD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Hkt1ZuX2; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56D0EA86;
 Wed, 27 Jul 2016 20:33:08 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 20:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=3WC
 P/bEeFWXDHBGQLqYDmZybH6Q=; b=f5fwwGMDNmzs0VAnZS5OD0i7qICE8Jk97do
 KBTAS+17PoPv/TnNE3e+wG3yIvt48Mbms7JgFTXRL6cRiw6CqXAnQjH2QCyZ3Xq5
 DNEcNUU8/i3jUnLjtcBWD4c0u8BwiZU8K9cVm5kVFgBuvdtDfWIc+vmcMZvPA2vv
 f3LvCp2U=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=3WCP/bEeFWXDHBGQLqYDmZybH6Q=; b=Hkt1Z
 uX2Lyig8kuu1eQaNldRqTvy2Iim0ZLk+kBZE8dFWemtkreBrDBw5T3PlDKO2X9X7
 iQd+Z05sduNsPs6lW7logHcT6ICuR+qXHbFOsB+2mZWVQf9f8g0KGe4WCyn2BIE+
 VQUUsHv9zhTZN0oNXlmzkE2DCImtIzFwYLAsq8=
X-Sasl-enc: MSrvzNe95jhuPldV38/HozyhPcJhFiFK3aJ8b14JErp4 1469665987
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CC17CCDB8;
 Wed, 27 Jul 2016 20:33:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] ast2400: use the 'aspeed' model for the ftgmac100 nic
Date: Thu, 28 Jul 2016 10:02:27 +0930
Message-Id: <20160728003227.20666-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.2.597.g66765a4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 00:33:10 -0000

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index e8ca5a9e26e3..72dd6a29d4e6 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -239,7 +239,10 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
 
     /* Net */
     qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
-    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized", &err);
+    object_property_set_bool(OBJECT(&s->ftgmac100), true, "aspeed", &err);
+    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized",
+                             &local_err);
+    error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.9.2.597.g66765a4
