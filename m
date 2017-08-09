Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS1ZL19wJzDqjB
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 16:29:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Z3fGJ84X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iJsVEs2r"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 207D021D8A;
 Wed,  9 Aug 2017 02:29:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uzkJPq
 WJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=; b=Z3fGJ84XiHQ9ztY+/5eKGK
 HLjluhtRR6G0dIyhaGPmqRz2fzHlAGtuH2ywgUZTftnSJvI3TLOFWhHAvbDEdRQ1
 C7u1RUPXid4BL9qf+/0OAlEvSBJ34Hx4EKwpQQ1Cghkk6wXrM0UWupJeaxkbiyOM
 HIrK5x2ia5Dgb9UzOLlN4oPEVSiIdxxvAS9fhLbNiLpka/xQNkt7BPIYx8TRpcEh
 ECUF0Et91oXRIBouzxf+2nw+kD03vUToBA7446/ccHE7wixhrfITqdEXj5zr9Prm
 svQCuxYxz2fSHtZJEeeDXsAgoaYeJ60/HKiPrhVM9p1bESnyZwYCmIpGUP6op/Aw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2
 Eg=; b=iJsVEs2rNkve9hzB53n83/540vLaOjuIIUJpievNU+ogWoVFnz2nrcZb6
 pLSrhkKTgwt1ninRqinv/EocardHS9JkXyTkXoqlJQzZw1eZc2/D5RnYzcd6ngvv
 xwg7Yh/H21ZSDg1h7T2ksNLKOzTUJerkSsD8o32/Z0Mvo63dwJua1ZPkntnzsiIV
 WJPojo3cfjuQgE+bm5yWWLtohFfdbZqM1AyzpFQ7nSCk6OOIsdq5UbE3uaFz6dt4
 ZTiND/XpehKk+/cqIWyuKYZjYR6TS0JPp/ptRTTRnEG+puPf2cT/sD/O6Xrch/Rl
 sWoS/68Tu/Z27DBm8/RfUwZ/F3e6A==
X-ME-Sender: <xms:uKuKWY55tpb9ojl5zO6sFXAYH6HDHsWW3s8HwQNnXPk4IXSaWODRtw>
X-Sasl-enc: tTMzAZynhKDKbaPvkMIe+Qk0KQeNohPjhIulxVqiyMr+ 1502260150
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A4BF7E4EA;
 Wed,  9 Aug 2017 02:29:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, joel@jms.id.au, ryan_chen@aspeedtech.com,
 f4bug@amsat.org, openbmc@lists.ozlabs.org
Subject: [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate silicon-rev to
 watchdog
Date: Wed,  9 Aug 2017 15:58:27 +0930
Message-Id: <20170809062828.3673-3-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 09 Aug 2017 06:29:15 -0000

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
