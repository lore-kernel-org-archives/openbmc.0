Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N/WVvqFw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fw3KakZt"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PSZ91FVVzDr0X
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 00:36:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F9DE21D06;
 Mon,  9 Jul 2018 10:36:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 09 Jul 2018 10:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=EBCn/hJk+WmfZ76FjsmOieyb7LhkQdRZ5d/hcjM+R
 a8=; b=N/WVvqFw7ohFX2XkfYSBeodmCQNaTi44B6uwbJIVOjwof7igKykSElk3s
 IgD1MGssXONSKFDnIPYX8GVZhGiNlk6f+I3guEA39W1tRp0LzAE3E6B1R7E2nZwf
 lPOueisNgZyLUB8z4odI2W8odnI1LX5FznsyMQtWvWRyY/tUBGE3mnFw6bO5o9ZF
 7c2kRkEJ2NY9YhFP++sKEG97pd0x0frWZEE3Gmuyt3mMWlnj7KhDe+5fVFwvHFJv
 pYG4sTeft9tA6t5yiH1IAcTgbVavNt8AKYTcP8FfxnTQnG4ynXAzUjVO0AaFx/+y
 26nj9fl8upZxO359nAxv4K1/1zCHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EBCn/hJk+WmfZ76Fj
 smOieyb7LhkQdRZ5d/hcjM+Ra8=; b=fw3KakZt16haJREGbiLjTULPs70rRBYAo
 gMiMHwzOP/Vf30gTDjNMXDCv0e6STKAarwxiPw1HpXW7/0qjl/lAehtbhxmHmMf2
 /FQcfhQT5YKDUttpVZhuaYNZob0Eb7ZtdbqmBaiuIZvb+DDHNvbaEWYj2ttcSCXE
 8lF1y/+jpslIHg2eFGftZ1W9q6xOVngYClRQRTKI5wRLo8Oo9+DRreUwEGUCJsRP
 CSYx8MAk4mgKmASpigl02VBpntO1csaHGxVNaGFQY7k1++XACvKFj0EnX4Tp2GLj
 Lym9cOSLuanSB2PeGmwvfr08VZu8cRAZN+n/w4ORpDzU+xJ3iuKhQ==
X-ME-Proxy: <xmx:23JDW22WiEXT8TSx0Zbc2cxSHO2qJKa8FbWUZiYgkeVpRdHtQeEHjQ>
 <xmx:23JDW3aeEeGD7f_J9Zu43U4PYpnADJ2v1laFpRs-9G189vHIK-s8Kw>
 <xmx:23JDW1J-TOj6VXtVEwmSwRosbDRC6TX_kW3mxV9CoPhoBZl8oev4xw>
 <xmx:23JDW8It-qEt_vPUvy5DMs3QeyWQLF_zQdUMb6VMeEIPt7QMS8qJ0g>
 <xmx:23JDWyJdPSnGIxYkz-yl6YfPfxzjJTO3EJvTOB4VN6k8lSoA6ybRlg>
 <xmx:3HJDW9f_W79FM-_MWze_vxTOlr9Scc-vCIoc5KGg-rkviXylS5qihg>
X-ME-Sender: <xms:23JDW1EWmd_Jz9fpeC1OfQ4qoSm6iwIE9woKR2h2QnLXWLCUtzpHfw>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id F38D71029E;
 Mon,  9 Jul 2018 10:36:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: joel@jms.id.au, clg@kaod.org, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] aspeed: Implement write-1-{set,clear} for AST2500 strapping
Date: Tue, 10 Jul 2018 00:05:24 +0930
Message-Id: <20180709143524.17480-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Mon, 09 Jul 2018 14:36:20 -0000

The AST2500 SoC family changes the runtime behaviour of the hardware
strapping register (SCU70) to write-1-set/write-1-clear, with
write-1-clear implemented on the "read-only" SoC revision register
(SCU7C). For the the AST2400, the hardware strapping is
runtime-configured with read-modify-write semantics.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/aspeed_scu.c         | 19 +++++++++++++++++--
 include/hw/misc/aspeed_scu.h |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..9051767cbbcd 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -202,11 +202,26 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     case PROT_KEY:
         s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
         return;
-
+    case HW_STRAP1:
+        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
+            s->regs[HW_STRAP1] |= data;
+            return;
+        }
+        /* Jump to assignment below */
+        break;
+    case SILICON_REV:
+        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
+            s->regs[HW_STRAP1] &= ~data;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
+        }
+        /* Avoid assignment below, we've handled everything */
+        return;
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
     case RNG_DATA:
-    case SILICON_REV:
     case FREE_CNTR4:
     case FREE_CNTR4_EXT:
         qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d70cc0aeca61..169611a211bb 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -37,6 +37,8 @@ typedef struct AspeedSCUState {
 #define AST2500_A0_SILICON_REV   0x04000303U
 #define AST2500_A1_SILICON_REV   0x04010303U
 
+#define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
+
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 
 #define ASPEED_SCU_PROT_KEY      0x1688A8A8
-- 
2.17.1
