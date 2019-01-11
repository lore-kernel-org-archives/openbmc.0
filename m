Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BPUMwGNc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gtrq9T/e"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bTbJ4ypKzDr08
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:57:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EFF311577;
 Thu, 10 Jan 2019 22:57:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hQ+5sHfEJyqKf
 mDpByxA+YpipEDWn0nNyBAUC/hJGPE=; b=BPUMwGNcKI6CjW3kcgu9ud6TFaX8A
 7mQ8dXJOPjpNGZmT/Z51HEU0ej/T6Ug16jg45SZCk1Qr0CJfooz/grSzE3t00WCk
 3+5f0a79kqZXt9WrF7W0lOUDYpEHUgoI5mp6lcmmhvP5nkBtNl1fJEEAouVUq67L
 gfYGBIf5d4Ix12Y2vnbRhf6Pz6sX/H4+MyYki/81elmGvtRNjY4Nx/HID5fMquoj
 DdTIfYomsBctaZHtH2Pc3dIpg7XGJmHxEZZA6PtINmqEaUiEXBpoi8ipgXrQq5ef
 0MbY1BFOeuCnbqKIaywLbUH+1plgykku2lD4xbdopFdEn1ATCIHzmws0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hQ+5sHfEJyqKfmDpByxA+YpipEDWn0nNyBAUC/hJGPE=; b=gtrq9T/e
 XYryqJlpPahiRUYYCRO7lEOPvYF41UanRF9gGg5zI2N0gCzd1aECLLj0xExuKM51
 9LQ+5v5yd7OIkXB9yED8nXuqetnlc+V9iVczzY3mZQvthkvV2E6RmBxOptnP13Gw
 i1LEgZKHKoD/EjcDfEsVITXb12JJ/M7zCyYLZczAVqRViPJMhw8mVVEeXSoaLqDT
 v+Lq1ZaPP59ogYBPYxYwLNc8tror3SJBRJUWW9JH/kDhcwpRTx3+etYdhNwOS5tE
 Hh6s35Rd0skSMTsiGINosqYluqvY3XMJ0g7SG9CdRep9m7RR16l2hkMjuK4h1mWu
 iBqhI/RVst/t5g==
X-ME-Sender: <xms:KRQ4XHI-GShpzgHdXsEkcndtr2caSHZ8Pa5gZ2rWkofmnOwbD-ABMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepte
 hnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhp
 pedvtddvrdekuddrudekrddvkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:KRQ4XFagLeh7hXJAXf8HMHLi6Etao8T3LPWlI9uc78jhlpKFLMZVaw>
 <xmx:KRQ4XBdXxCmDtRozHViEvgXBkLJlFgYB__ZAcqplPxpYY1ZbFMfKpQ>
 <xmx:KRQ4XE8EMlXbPX10ahdR-nXSGrDtCN2jUt3f6YQkLm8-PnZWEAiqKg>
 <xmx:KRQ4XEkAYF0CG7C9aRRAXbmc50wuy3riok8EbWitspA0rWbfVCS6BA>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF1FF100BA;
 Thu, 10 Jan 2019 22:57:26 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC qemu legoater/aspeed-3.1 4/4] timer: aspeed: Provide
 back-pressure information for short periods
Date: Fri, 11 Jan 2019 14:26:38 +1030
Message-Id: <20190111035638.19725-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190111035638.19725-1-andrew@aj.id.au>
References: <20190111035638.19725-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2019 03:57:33 -0000

First up: This is not the way the hardware behaves.

However, it helps resolve real-world problems with short periods being
used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
Fix set_next_event handler") in Linux fixed the timer driver to
correctly schedule the next event for the Aspeed controller, and in
combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random number
device") Linux will now set a timer with a period as low as 1us.

Configuring a qemu timer with such a short period results in spending
time handling the interrupt in the model rather than executing guest
code, leading to noticeable "sticky" behaviour in the guest.

The behaviour of Linux is correct with respect to the hardware, so we
need to improve our handling under emulation. The approach chosen is to
provide back-pressure information by calculating an acceptable minimum
number of ticks to be set on the model. Under Linux an additional read
is added in the timer configuration path to detect back-pressure, which
will never occur on hardware. However if back-pressure is observed, the
driver alerts the clock event subsystem, which then performs its own
next event dilation via a config option - d1748302f70b ("clockevents:
Make minimum delay adjustments configurable")

A minimum period of 5us was experimentally determined on a Lenovo
T480s, which I've increased to 20us for "safety".

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/aspeed_scu.c            | 6 ++++++
 hw/timer/aspeed_timer.c         | 6 +++++-
 include/hw/timer/aspeed_timer.h | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 257f9a6c6b8a..0410776b456a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -432,6 +432,12 @@ static void aspeed_scu_realize(DeviceState *dev, Error **errp)
                           TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
 
     sysbus_init_mmio(sbd, &s->iomem);
+
+    /*
+     * Reset on realize to ensure the APB clock value is calculated in time for
+     * use by the timer model, which is reset before the SCU.
+     */
+    aspeed_scu_reset(dev);
 }
 
 static const VMStateDescription vmstate_aspeed_scu = {
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 35b40a7c4010..0f3501ac5a5c 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -254,7 +254,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     switch (reg) {
     case TIMER_REG_RELOAD:
         old_reload = t->reload;
-        t->reload = value;
+        t->reload = value < t->min_ticks ? t->min_ticks : value;
 
         /* If the reload value was not previously set, or zero, and
          * the current value is valid, try to start the timer if it is
@@ -306,7 +306,11 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
 
 static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
 {
+    AspeedTimerCtrlState *s = timer_to_ctrl(t);
+    uint32_t rate = enable ? TIMER_CLOCK_EXT_HZ : s->scu->apb_freq;
+
     trace_aspeed_timer_ctrl_external_clock(t->id, enable);
+    t->min_ticks = muldiv64(20 * SCALE_US, rate, NANOSECONDS_PER_SECOND);
 }
 
 static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 1fb949e16710..10c851ebb6d7 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -41,6 +41,7 @@ typedef struct AspeedTimer {
      * interrupts, signalling with both the rising and falling edge.
      */
     int32_t level;
+    uint32_t min_ticks;
     uint32_t reload;
     uint32_t match[2];
     uint64_t start;
-- 
2.19.1
