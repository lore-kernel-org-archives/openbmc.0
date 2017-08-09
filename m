Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS1ZQ2GC2zDqvc
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 16:29:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Xb6mpwXI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o+NmTlux"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 33E8021D94;
 Wed,  9 Aug 2017 02:29:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uzkJPq
 WJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=; b=Xb6mpwXIPKUtOUan33+fYL
 L/SDOpXbz/zkzMyv5CW17cRox7fvXWCGgw54ZF9BYcwiZmq+VVhp7Y0sK901pUDq
 DjNZfccf0n8N+EyR0rP1QxDd/B+iXd3DKpIbHSOQxWCK5EqtuIhLB9xbmRDE2fzz
 FI+s75/vFu0TH30ruJWXQcR8WKwH3Dl9KnWtxj+WcrS2qm72c1NxB9hm94F1TK2l
 vp6yJVYzyhUEYd+yyBAjtQNKUXhv6/LwO4pRLVrLUJm8vmXPDPcSJSglIqjSy74G
 aAp5QNmwsWC1QXKYhI+iZuG/yJHIryVRYjSeg8YC0F2RKAXe62sOYKX7PAgBGuLA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2
 Eg=; b=o+NmTluxJduFUK2GS50lpjwEg3qbwsvUd2YUCfeBFK49wZjo3kgmY0M6e
 y/zQocURtsJVYiDV/D1TbOiRGAhcQvOi6NXP72dXckEgxHyEsf/F3pSxk31PzLtp
 dJf681C8GrmVj7WqMh4vMOZpTYVpA7WcGWRKXWB1yZxvYuVPdGkL6N28zB2Vwfd4
 cNnfhZfbqH1BoybIphGp/qoGFxZdd4WR5nkqf6vwEUAryeO35hvAvxjp9WtMMERs
 SD0w9Af4f6Z9bDk7CMbzICWJLjYEkhVssCIxmXBeBolYdGyD4hoKicgx2YugzPhu
 +9HQYBPB2Kv9ewIKN3pzGTkxtbUTQ==
X-ME-Sender: <xms:vKuKWXOGSjow1uMPkMzE13VR68sYcDAfDYD-TxboXCNonYNDSAfkFA>
X-Sasl-enc: RVCtiwK1GOosjdI/Fu7vDvXKZ2dhAy+/pq7OHJNhdLpb 1502260155
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 87B997E4EA;
 Wed,  9 Aug 2017 02:29:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, joel@jms.id.au, f4bug@amsat.org,
 ryan_chen@aspeedtech.com, openbmc@lists.ozlabs.org
Subject: [PATCH for 2.11 v2 2/2] aspeed_soc: Propagate silicon-rev to watchdog
Date: Wed,  9 Aug 2017 15:58:28 +0930
Message-Id: <20170809062828.3673-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 09 Aug 2017 06:29:18 -0000

This is required to configure differences in behaviour between the
AST2400 and AST2500 watchdog IPs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3034849c80bf..79804e1ee652 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
         object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NULL);
         qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
+        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
+                                    sc->info->silicon_rev);
     }
 
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
-- 
2.11.0
