Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IWIbqapH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="poleahLJ"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bTb95G8XzDqws
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:57:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A8C271577;
 Thu, 10 Jan 2019 22:57:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OJwsjW1jGnvB/
 YwILPhuhN9+tOqnwx18zLBaBztRem4=; b=IWIbqapHptKUAPCN2JMT/VA+J727e
 ecq6pYMMoKZI1MRlHYHFKnBLBgpOYXhHl8DNi3EfNXC6hvn2h2UWVv0nB6Dv0ryx
 ZM8R/iI5+a02uImCqYZLRqFGf8PPaLLDUVSoLCHA7hDc9L6yoaztnsKuvZelYr9l
 nmvM0XHOg4Id2KKuq2NkDTXiJ2OQevGtmEhdgUqAC69eZCxtdwkDpXYwPvjDboVe
 2xbsO8fIXUsIQX8koQisucbdROcn8Dvnywljk5b0Lwnl8vF3NrCocVC2p0Ntv+bM
 66RSodeRsRlH2/fGflJidpz1Vri61oLxjlk9u9BgMPpUTc2BfJYVnOoRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OJwsjW1jGnvB/YwILPhuhN9+tOqnwx18zLBaBztRem4=; b=poleahLJ
 YbIBE2eUTmIx2uRl+bU51993kqObaYFviNuRPrMP+iBBxy4yYfV7wzhs/S9SE2BH
 dnt2ephWz9m7v09Cu5RdXuTq3jwLrULKEP8gGJeeKB3lbKnHITusis8UVl9bX9BO
 fI6DjkSrrYHVyqghVJcZZYjP/mIb9+9sInwrYLntVriLXib7brWYo+D3j5pLusGB
 bgZXC2uQdV/aUsPhQNApI3ITkSF/CV0c7pzwfbKEhbZ6GGFz298/yRSD+gUkfL0y
 ksn7dYCmNI5kP4YmCby7lXNfL1j+XYpja/ioKTDqPXjj5i30yi3Bk4oyQeBu7YPU
 dQVhQFZ5ojTpjw==
X-ME-Sender: <xms:IxQ4XEEzpC4zL0v5Yjrmx2Wq8HpGYnFRQDbniool3K-_ima6ivJyrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepte
 hnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhp
 pedvtddvrdekuddrudekrddvkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:IxQ4XFyTpUgin2VsiPfDdZA8ncWu4ENJPzKPRq4X_5kiO0owL9oDaA>
 <xmx:IxQ4XOnVoTXz9mFCfUk84Jo0HVk40kIVKkOzb3O1aO3M-YvumTqxmA>
 <xmx:IxQ4XGk5WeMlSMKUgVCuHpMwOpFapKH9Mj_uDGRw0hTVwq3E3HlyvA>
 <xmx:IxQ4XEr322QgPNcK9Lw7LG8JB0qmNEFbq9Kh_mkKYsYyEo4bOKBv3Q>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E9FB10106;
 Thu, 10 Jan 2019 22:57:19 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC qemu legoater/aspeed-3.1 2/4] timer: aspeed: Status register
 contains reload for stopped timer
Date: Fri, 11 Jan 2019 14:26:36 +1030
Message-Id: <20190111035638.19725-3-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Jan 2019 03:57:26 -0000

From the datasheet:

> This register stores the current status of counter #N. When timer
> enable bit TMC30[N * b] is disabled, the reload register will be
> loaded into this counter. When timer bit TMC30[N * b] is set, the
> counter will start to decrement. CPU can update this register value
> when enable bit is set.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/timer/aspeed_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 54c75bf4f322..6adc14d62034 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -182,7 +182,11 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
 
     switch (reg) {
     case TIMER_REG_STATUS:
-        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        if (timer_enabled(t)) {
+            value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        } else {
+            value = t->reload;
+        }
         break;
     case TIMER_REG_RELOAD:
         value = t->reload;
-- 
2.19.1
