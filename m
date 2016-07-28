Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0DjS3P7YzDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ABxCKAT0; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=RwNuGoFl; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 624551C38;
 Wed, 27 Jul 2016 21:26:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 21:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/uxtcmR5eaiuUo7f33S8RCJBIyM
 =; b=ABxCKAT0x6KEOlWwKRTqyr1Hv6bdAJ1O+3S0piyzXmZajo7bkvNQVmwa2Si
 /ZRTIDkFuWgZxjBXL3OX41VaO0iy3cQurZ1EiF1Z2qxEGQzq+n9wnvKFXB4DsGDG
 NFAdUady35CwuYa06dVBAjQ0aISu1L//MYWyAXjlBkO9YeZM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=/uxt
 cmR5eaiuUo7f33S8RCJBIyM=; b=RwNuGoFla2O7C+EuokBpM7rv5VMNTiQduTaY
 Isj9+Qkvx9YLWIGiTTeK2TYrUasX+4BVEJqzLf3zufEdhZ+DuhnB9zNHZK5ijE/h
 OJ1bolo8KoXTy9FM/Eh0MIFXK+4wVtH+WPFkrQn7M2sh8ickLUtTE5u8O4XKok5h
 t/tU3ow=
X-Sasl-enc: +lt2qZ8bGnQc14bi/k7S80xC4WUQNobqNrE2s1Ws4fJl 1469669209
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B14CF29E1;
 Wed, 27 Jul 2016 21:26:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ast2500-edk: Configure HW strap register
Date: Thu, 28 Jul 2016 10:55:34 +0930
Message-Id: <20160728012534.29447-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.2.597.g66765a4
In-Reply-To: <20160728012534.29447-1-andrew@aj.id.au>
References: <20160728012534.29447-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 28 Jul 2016 01:26:52 -0000

Strap register value was read off the hardware after boot.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/palmetto-bmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index ec4aed306e7b..9e9c7e403133 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -47,7 +47,7 @@ enum {
 static const AspeedBoardConfig aspeed_boards[] = {
     [PALMETTO_BMC] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
                          AST2400_SDRAM_BASE },
-    [AST2500_EDK]  = { 0x00000200, AST2500_A1_SILICON_REV,
+    [AST2500_EDK]  = { 0x7100c2e6, AST2500_A1_SILICON_REV,
                          AST2500_SDRAM_BASE },
 };
 
-- 
2.9.2.597.g66765a4
