Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e8x/jC55"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NHhizLww"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z4Py1DPFzDqmj
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 00:59:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A0A1721B31;
 Mon, 23 Jul 2018 10:58:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Jul 2018 10:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Azv8XTNXyxGiTlBfJ
 XdrMWOX1ECnPE9bjWKCUM17NHM=; b=e8x/jC55rstLOWnxVdEuGq9HAiGXiWjiY
 bWkheARCUPYSYH7gKG+aGn8ZFjrpqkIo51O4CsYp9EyLIe1MKjCK1O5CYDT/JJoX
 nwC0c8GGxPlFObSP0RkmMHdDPCCwO8iaGY6JbLvdLcKjypdXMScmjUo6E3cLPDnx
 5ud+SBmYsUDdBmaT5TvmlbZH2tkgKFWmMikMAtj5kPq3PjsVHIbFt91C9kjxe0Ti
 NF9QdKJRngDLUun9S1BgKFr/dK7agQzEnxK/UyC/pXQ8LuPqY/A2B99nUSbZn+AE
 6rb1faVJSiov6APrz+X+cNU/ymL1a66TGSIppZVfDnraMB3DcuIXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Azv8XTNXyxGiTlBfJXdrMWOX1ECnPE9bjWKCUM17NHM=; b=NHhizLww
 g35HITpuiDCHRJuy9+z5jWPbEKE2DCv1mlqCcRzD4lN4x+Y2onOxCfiaue/xIAUJ
 HnFuQISC3+Rjgyi6Rgxh6s23hdAKDsrr9mxu66OJOLd0sBQH3fyK+CEJLG+2XYn/
 3JcdZNSN3xnSDPpNGtRIm6rUW42a3DGm6hUqf0LNW3rcnouKgkzhgsdarGVE25o3
 MpCYYehh57NX6jCa9enKUjCxPFHQpQahhCJHTSA9f2/zHpPZdpNS3DyafLGxQgRm
 sZk7n753RE1b5ruxCcSQDxrvyRGvLWRgz1FxGXljPjGlKNUc2QXIhWtzLBr6qgoh
 RFBFcMlZtu7V3w==
X-ME-Proxy: <xmx:M-1VW1tACXZpNkWjS6p42LBSmOzSQtTRVS_5bzor60HMWx9DkjVx3Q>
 <xmx:M-1VWz6-PqDysup7oR7XcYQOlPD3_KBdtzf65qaRzOktcPAYDSpvgg>
 <xmx:M-1VW9jT0ZEhu7RFeiUpInOby6TjRS4O8MAwH81JFLRsKtj4AeD0Yw>
 <xmx:M-1VW9KrPnpGKZygUPDbRDJSE2vMJXAe7CtPYfTZxWujFzV1PCIFag>
 <xmx:M-1VWzd7U28W3K3KxSkJVACWWak9cAZmxIlVKjTrqGQLVOAAApJYcg>
 <xmx:M-1VW6AISLGWYTkjBtWtgkV5DpdTpmuz7fYs_H24v4wLj1kcbx-cHA>
X-ME-Sender: <xms:M-1VW5zEySTVK_mF5angmb6esP-ogL2Tbe5OM2SX_ryFD9uvhkvl_A>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB146E435C;
 Mon, 23 Jul 2018 10:58:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 3/4] arch-aspeed: Make AHBC and SDMC header guards
 unique
Date: Tue, 24 Jul 2018 00:28:39 +0930
Message-Id: <20180723145840.17856-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723145840.17856-1-andrew@aj.id.au>
References: <20180723145840.17856-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2018 14:59:02 -0000

Otherwise we get mysterious missing symbols if we include both those and
the ast-{ahbc,sdmc}.h files.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h | 4 ++--
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
index 66e29839e8f1..4f403c45d3a5 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
@@ -10,8 +10,8 @@
  *    1. 2012/12/29 Ryan Chen Create
  *
  ******************************************************************************/
-#ifndef __AST_AHBC_H
-#define __AST_AHBC_H
+#ifndef __AST_REGS_AHBC_H
+#define __AST_REGS_AHBC_H
 
 #include <asm/arch/aspeed.h>
 
diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
index 2861f3b2c947..2cc26d29aa9e 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
@@ -10,8 +10,8 @@
  *    1. 2012/12/29 Ryan Chen Create
  *
  ******************************************************************************/
-#ifndef __AST_SDMC_H
-#define __AST_SDMC_H
+#ifndef __AST_REGS_SDMC_H
+#define __AST_REGS_SDMC_H
 
 /*
  *  Register for SDMC
-- 
2.17.1
