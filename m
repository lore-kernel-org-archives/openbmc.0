Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FWRZn6+t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IlkTQMwh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z4Pw1yHSzDqnM
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 00:59:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AD1B121BD5;
 Mon, 23 Jul 2018 10:58:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Jul 2018 10:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/Rlx6+ZloAwi8DsSR
 Fg665BVeVIjXQotFc9ZLOzBeRI=; b=FWRZn6+txmDpCp0gvyfZl44wbhHaLvQae
 sej8ifGZtGuP63pTuHZZgciTh8s2B7PnBaDzDM+bNOKY77Th83KU/Z/9rz44k/uz
 0YBhVuHaLaIvpNHHg6rUCYM6RszmAmA/aZlq4NTLHgOrl+FCD36wZOgxRgqouXbw
 npSTPXzYGQ0umRuX9qrmXivZAbQAZKHA/fXeXhHO3MqATnZXtzk1yWONEkoO5+Am
 j2xv6Zv57ryvS6mWKhig0mEUr1fV2j8q0Gv80ue9rFvYvvJINAvtlQ9zV9hMQh+m
 /iQenT6+gZG3/4VT4GFRpDResba48OVv1PRGJ9WpnRHyneVhsJc7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/Rlx6+ZloAwi8DsSRFg665BVeVIjXQotFc9ZLOzBeRI=; b=IlkTQMwh
 peEk6GZ8NJQj6AcQb/+FSTlftMqf49b5JwjiKp27pN2S7gFA6FaNEbUg4sfVmtqY
 EbABBGZruCYOg/WjP4NM+IHBBWT20isJ7JQxkBTA7oowIcPV/36JqB7maXqS59Rn
 7u+G+I5LPf4Nb0sIch5wlk3yugPZxM3eleG0D5DagEKkp6JzCwydaY7v/FcmG1sH
 pNlVYR+XP6eqr1uK+nE8sMFmQUW4oZoezMHEV2LHhU26CCtgNIMuXu+sSN8PmttQ
 BJ8qIWNIPyM95WqrA8Wu/XwLmAh+OYLQLUY0jljyN2UqdfU52iat6H/TRSt1OnP7
 0ANPnJyqHjCjqA==
X-ME-Proxy: <xmx:Me1VWz1Zo2j8CX0J4vMpXz966XB0IBh3wu1RQ6N1LuB7rnbTee0a-w>
 <xmx:Me1VW_yFYfUlnkzD0dKYmxHqPMePgCB7mEeU8b-oQRRlyuuBaKS6Hg>
 <xmx:Me1VW-UKkuXnYNaSQtH5EXzbDC8Kejea87928s_DHQTecLwdZcEICQ>
 <xmx:Me1VWxCD3p934O-gKLx4NAF7sRC-SbnOmic2ZEy9k9Gny7AiUu0fcQ>
 <xmx:Me1VW_7hTHi8H2lF6YyBzZZM7pASrXpTrsmmfS-BvlIkLNgrb_9S9g>
 <xmx:Me1VW45TbK78N7d-LpNgotNXIiiCMMctGomYOEuDRjbX9HYoaxjfFQ>
X-ME-Sender: <xms:Me1VW14bSJZLUd-SX-5msW2Ul_7_LfM_cEKTqic0jCw16n4AS5I5Zw>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0143E435C;
 Mon, 23 Jul 2018 10:58:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 2/4] ast-g4: Fix typo in board_init() comment
Date: Tue, 24 Jul 2018 00:28:38 +0930
Message-Id: <20180723145840.17856-3-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 23 Jul 2018 14:59:01 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 board/aspeed/ast-g4/ast-g4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index cc26a78529bc..656495307b03 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -19,7 +19,7 @@ DECLARE_GLOBAL_DATA_PTR;
 
 int board_init(void)
 {
-	/* adress of boot parameters */
+	/* address of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 	gd->flags = 0;
 	return 0;
-- 
2.17.1
