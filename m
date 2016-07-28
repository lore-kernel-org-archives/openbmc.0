Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0DjQ19LlzDrKs
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=OqsLajUl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=BS2ro5n1; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DF901BF2;
 Wed, 27 Jul 2016 21:26:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 21:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=6ImBIqIlbqqHVm0jG8c1W6LC9ko
 =; b=OqsLajUlbVMrF414JC9si2ryKzWuoHygOrD6XfkXw/IxXkHBPk8maiF71Uu
 G4EPgD9RUobdl0jGel4enZBTdvnV0JTBMFwv50AY6tpc/l9rw0vb7WN7eRdC24HW
 erpf9VZ2V6SJefK0kRHE7XpIXTq4tO7ajZnZwAergRC/w+rA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=6ImB
 IqIlbqqHVm0jG8c1W6LC9ko=; b=BS2ro5n1h9/iogQIfAP5FomUxjxT336EUWoG
 rmByw7MANtjNVaWo73/3TfOsHeuOxtDHxvmmIjffcxHSe3VhGfPXOa6buXeBJJ96
 zwZwqAf6w6E57TD8U5I/FX7wGHCKC80kEhPZ9sYREMgJbVMvO53i2C28l5Fk671M
 vTT3oNo=
X-Sasl-enc: f6UA0+3anJNzGLjpDSBEIh2jV7E3OeELawoIfE3axSBR 1469669207
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 026AEF29FB;
 Wed, 27 Jul 2016 21:26:45 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] palmetto-bmc: Cleanup whitespace to make checkpatch happy
Date: Thu, 28 Jul 2016 10:55:33 +0930
Message-Id: <20160728012534.29447-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 28 Jul 2016 01:26:50 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/palmetto-bmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 71b9ca73d2d4..ec4aed306e7b 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -45,9 +45,9 @@ enum {
 };
 
 static const AspeedBoardConfig aspeed_boards[] = {
-    [ PALMETTO_BMC ] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
+    [PALMETTO_BMC] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
                          AST2400_SDRAM_BASE },
-    [ AST2500_EDK ]  = { 0x00000200, AST2500_A1_SILICON_REV,
+    [AST2500_EDK]  = { 0x00000200, AST2500_A1_SILICON_REV,
                          AST2500_SDRAM_BASE },
 };
 
-- 
2.9.2.597.g66765a4
