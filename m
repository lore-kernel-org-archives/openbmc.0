Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLylx2f6KzDr2y
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 11:05:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NGbswFBk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KOdZRttc"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE88820774;
 Mon, 31 Jul 2017 21:04:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 31 Jul 2017 21:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=I1691WBr92xTPpnV9ROVgEHnl2VH5e
 pIO4BQtBbcP70=; b=NGbswFBkj4ktUx3msNwJAOb2SHNWiIIhPzF7026H1lQ1wx
 3TnaoN7+iEQ7431sNjF1UPZpjV3ds5ZtClNxkdn2AlheE5uekZsYuySllJLMfIgy
 NK1RCZUPB9TfV7s98RsorJcGQFQwOEwUqZsslXlKC+ojQ++UZHl6GVmjhnDq/dL0
 EcDbsazIyWLdIdCiQMemXP0g29PSv7bLsp4RYIWAKXwbZ5O5AWqQZvGVX0Zt/z61
 hfAiYQkUHzfvLtED29B2G59rwFOnqfAiMhcFwqhwUxbrDl2+TJ9jnlk1m8q9RN+f
 6LRyp1P3FgJlLs1dvuWLB4LWWBudCAg34tShD6cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=I1691W
 Br92xTPpnV9ROVgEHnl2VH5epIO4BQtBbcP70=; b=KOdZRttcgVuLi++CnMTJt4
 J5VjZL6l74kwKrFwadivTSGhZHPoGO8N1ut5lHrTGJLBG2WTZQAO4NsU22u5WxU7
 bfkY4zeUqbfzcSrpPCteOtZKtc5fdg078Mw9FwQLa/XM722TkRxCzE60zBFaRlsE
 Kel/5Hgd5P2QWBKDtFTQhR8GKQ3mUcMso3Nrs2DUj3WjX85xvZUJZW6iDBJ7BcbV
 Efltp2fwTPLy05yCv6OnwSCWnDkgrdgrMbCoYTh75MDh3r/hhhbg80X/3STWsJxK
 PieDekpdjr91MXWpM7GcesegsjGA2kSpLpBvnNLX/madboG3Cit0DpIHuo7vG82A
 ==
X-ME-Sender: <xms:utN_WdZoUuCYpZB2tvHDfmrvxUTNxhR_Szn6fSqltD3iYhEJ2WZdUg>
X-Sasl-enc: 1Jk5tillm/lewo4YH0LXbJShF+dYi0nccB97rrsx6Ay5 1501549498
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18F4624604;
 Mon, 31 Jul 2017 21:04:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH] watchdog: wdt_aspeed: Add support for the reset width register
Date: Tue,  1 Aug 2017 10:34:25 +0930
Message-Id: <20170801010425.25778-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Tue, 01 Aug 2017 01:05:02 -0000

The reset width register controls how the pulse on the SoC's WDTRST{1,2}
pins behaves. A pulse is emitted if the external reset bit is set in
WDT_CTRL. WDT_RESET_WIDTH requires magic bit patterns to configure both
push-pull/open-drain and active-high/active-low behaviours and thus
needs some special handling in the write path.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
I understand that we're in stabilisation mode, but I thought I'd send this out
to provoke any feedback. Happy to resend after the 2.10 release if required.

 hw/watchdog/wdt_aspeed.c | 47 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 8bbe579b6b66..4ef1412e99fc 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -14,10 +14,10 @@
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
 
-#define WDT_STATUS              (0x00 / 4)
-#define WDT_RELOAD_VALUE        (0x04 / 4)
-#define WDT_RESTART             (0x08 / 4)
-#define WDT_CTRL                (0x0C / 4)
+#define WDT_STATUS                      (0x00 / 4)
+#define WDT_RELOAD_VALUE                (0x04 / 4)
+#define WDT_RESTART                     (0x08 / 4)
+#define WDT_CTRL                        (0x0C / 4)
 #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
 #define   WDT_CTRL_1MHZ_CLK             BIT(4)
@@ -25,12 +25,21 @@
 #define   WDT_CTRL_WDT_INTR             BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
 #define   WDT_CTRL_ENABLE               BIT(0)
+#define WDT_RESET_WIDTH                 (0x18 / 4)
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
+#define     WDT_POLARITY_MASK           (0xFF << 24)
+#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
+#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
+#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
+#define   WDT_RESET_WIDTH_DURATION      0xFFF;
 
-#define WDT_TIMEOUT_STATUS      (0x10 / 4)
-#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
-#define WDT_RESET_WDITH         (0x18 / 4)
+#define WDT_TIMEOUT_STATUS              (0x10 / 4)
+#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
-#define WDT_RESTART_MAGIC       0x4755
+#define WDT_RESTART_MAGIC               0x4755
 
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
@@ -55,9 +64,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     case WDT_CTRL:
         return s->regs[WDT_CTRL];
+    case WDT_RESET_WIDTH:
+        return s->regs[WDT_RESET_WIDTH];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -119,9 +129,25 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
             timer_del(s->timer);
         }
         break;
+    case WDT_RESET_WIDTH:
+    {
+        uint32_t property = data & WDT_POLARITY_MASK;
+
+        if (property == WDT_ACTIVE_HIGH_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property == WDT_ACTIVE_LOW_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property == WDT_PUSH_PULL_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
+        } else if (property == WDT_OPEN_DRAIN_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
+        }
+        s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_DURATION;
+        s->regs[WDT_RESET_WIDTH] |= data & WDT_RESET_WIDTH_DURATION;
+        break;
+    }
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -167,6 +193,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
     s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_RESET_WIDTH] = 0XFF;
 
     timer_del(s->timer);
 }
-- 
2.11.0
