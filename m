Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0CK973DvzDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:24:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=XAIXs/2Y; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=W0anrcUz; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id DBD8A11D5;
 Wed, 27 Jul 2016 20:24:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 20:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
 mesmtp; bh=UExtldkK3yuk8WwkmES8O68GSO8=; b=XAIXs/2YqPRMffvn5j6FJ
 itTlkt651VLWHqA1glrUVaDEvmB8inJSp6hf7joJx7xttUtk9j6g4rc1nAzj4M5G
 tguqTRXVWyqJZh+kJDXAFz/VKUTXU77UMODvI2yPxnzQks8bTpZv1H25U4Crne1e
 c3VFOG/VPMBOCT4vNBrEOs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-sasl-enc:x-sasl-enc; s=smtpout; bh=UExtldkK3yuk8WwkmES8O68GSO
 8=; b=W0anrcUzHu/qnVvha5A85CdlWTGElE8PIndR3KDYCTjzTvR5w5j91RLvWp
 sWOVvs5PmTYtOFLw07qCG7e/+SmtRq2AoIG6fGkogVR5Fu86mlPu+kRvz5/K/Qs6
 5JkabriojrOQ0Va7kqtqmhyYUBXeKx3jSXfm3sMnnO1weSQlE=
X-Sasl-enc: Lz1FxVjVKhsB6+0HsrJU4HdqB+o0Gw18w/ywXWlGoa1r 1469665450
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D6A4CC021;
 Wed, 27 Jul 2016 20:24:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ast2500-edk: Configure HW strap register
Date: Thu, 28 Jul 2016 09:53:55 +0930
Message-Id: <20160728002355.14307-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.2.597.g66765a4
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
X-List-Received-Date: Thu, 28 Jul 2016 00:24:14 -0000

Strap register value was read off the hardware after boot.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/ast2500-edk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/ast2500-edk.c b/hw/arm/ast2500-edk.c
index aaaed3f83757..1bda6e96b041 100644
--- a/hw/arm/ast2500-edk.c
+++ b/hw/arm/ast2500-edk.c
@@ -43,7 +43,7 @@ static void ast2500_edk_init(MachineState *machine)
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x00000200U, "hw-strap1",
+    object_property_set_int(OBJECT(&bmc->soc), 0x7100c2e6U, "hw-strap1",
                             &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
-- 
2.9.2.597.g66765a4
