Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hwQKoC6g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Vp21QdEB"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxpHr2KnkzDqR8;
 Wed, 20 Sep 2017 15:31:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3487420E58;
 Wed, 20 Sep 2017 01:31:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 20 Sep 2017 01:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=K98oC7
 DWHC5jGygAgCN3aK6hh4NjNPoubgdTIxY6lx4=; b=hwQKoC6gX60KUPXZKMk/yy
 +8ySkeu3q/irBDumPlynBC+SZ6OVI/6AkaJgI2m8SBPSxjU/BFRW1b5HLkNjdNgM
 wmJeVIAsqTYjRRWxYRk4A7Ory5NYjEocFX0NFhS7s0qXS1IGjPVA8zYTgfsMzNAe
 mwCkgxZnlmur3KiwP+Q1ik5oZRxpGyDXHsVFqyvYCz1l4znuVDGX/aYKLefk6h7A
 NnHJKEzouo9TpnXF8Oht3om1fOdYvMOZ0Qk6HsCy+7pZEaIzSoewFbtwHFc3zYXL
 IJPNIWiQjHJMO9DYU8nITn5uO5gafVYH6UtV9k1abiJkBkmCy8FxG2Fol++yBUjg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=K98oC7DWHC5jGygAgCN3aK6hh4NjNPoubgdTIxY6l
 x4=; b=Vp21QdEBMmcryH71QKcadNFxnKrVBryb1Pau3EWNyid1aV1gSURXQVfbB
 SlfXZ9upe3bY05TTKTCu+7gdbezRYrMDrZ2G1tEZuuvYR9W1hfIk9vvPTn+rEaCU
 jZJJeKGJwcqZto013BMDSwIFCL4CONYC2VdfPUAF2sVt0fqmsy+Uuvrv/5FdMWCS
 EK5AZBJaGs9qo+kothOHQBc89j5EeO9t6cePCvI86ByUji79ZpLRwJvSihcO36MT
 WkhZ1XWwsEtTkZosDia6WpLAwuUnGWq9cFc1N773vYd06QEUnpIZF/S/0dDcqlFN
 rwbpXmxzo8aSfy5SNzr8XSIuMAG8A==
X-ME-Sender: <xms:Fv3BWZw-Z7Frzck1SyBQPM8z9GuNeTF8jDHD4H3ZGtESTm--lDhXtw>
X-Sasl-enc: E/Zf9WOZjEiRmXjUw/FbJzMVtrlv4Xb6jIcDWBfYCoka 1505885461
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1BD67E5EE;
 Wed, 20 Sep 2017 01:30:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH v2 2/4] watchdog: aspeed: Fix 'Apseed' typo in Kconfig
Date: Wed, 20 Sep 2017 15:00:18 +0930
Message-Id: <20170920053020.6860-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170920053020.6860-1-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 05:31:04 -0000

Apseed sounds like a good name for a web/mobile start-up incubator, but
isn't a reflection of Aspeed themselves.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c722cbfdc7e6..b562d2e03eb9 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -746,7 +746,7 @@ config ASPEED_WATCHDOG
 	select WATCHDOG_CORE
 	help
 	  Say Y here to include support for the watchdog timer
-	  in Apseed BMC SoCs.
+	  in Aspeed BMC SoCs.
 
 	  This driver is required to reboot the SoC.
 
-- 
2.11.0
