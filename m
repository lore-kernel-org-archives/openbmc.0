Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQW5p1rmSzDrp1
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 17:31:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=N3jHRauq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=B9gBMWQV; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3854B206A3;
 Fri,  2 Sep 2016 03:31:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Fri, 02 Sep 2016 03:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=F+kJDBRovGu+OS7dcdd7m6b+j2I
 =; b=N3jHRauqhPaiGzO5cenTBuWv7i0+F41PcSOvd7LTfoK3hPGNdw3kANE2aFm
 7fjqgs1bUhBCWr+j9weRmAOScaBrXYE2wNJ8/bapBjyhPGtQPSrbBXlrfNc6QAQD
 nHuqtwvzxWXfZvcNxM+pxTx7gr9PzZNnW7EE+7LqXR6qBJX8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=F+kJ
 DBRovGu+OS7dcdd7m6b+j2I=; b=B9gBMWQVdunf3uhlZq/LbjEqcHS8Dz1AGGGn
 iLgERmnu9QOov0y5htWYEhrQR64DXay0qhohgPuDLoDONA1qhJ7LucMCKkevJzkz
 rXf+v/IkabN3jPljgyyN8Hy1pamq9dzHf8NjVzB3FkgnKl6y6C5Oor7LvR1bQUtk
 IZRr0+I=
X-Sasl-enc: uP4HSn9mbiKduhIGfEolNJAg15gK3MCsMugdfFLDgfvr 1472801499
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB82FF2D2D;
 Fri,  2 Sep 2016 03:31:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 3/3] pinctrl-aspeed: "Not enabled" is a significant mux
 state
Date: Fri,  2 Sep 2016 17:00:51 +0930
Message-Id: <20160902073051.31492-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3.1.g0db844e
In-Reply-To: <20160902073051.31492-1-andrew@aj.id.au>
References: <20160902073051.31492-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Sep 2016 07:31:42 -0000

Consider a scenario with one pin P that has two signals A and B, where A
is defined to be higher priority than B: That is, if the mux IP is in a
state that would consider both A and B to be active on P, then A will be
the active signal.

To instead configure B as the active signal we must configure the mux so
that A is inactive. The mux state for signals can be described by
logical operations on one or more bits from one or more registers (a
"signal expression"), which in some cases leads to aliased mux states for
a particular signal. Further, signals described by multi-bit bitfields
often do not only need to record the states that would make them active
(the "enable" expressions), but also the states that makes them inactive
(the "disable" expressions). All of this combined leads to four possible
states for a signal:

         1. A signal is active with respect to an "enable" expression
         2. A signal is not active with respect to an "enable" expression
         3. A signal is inactive with respect to a "disable" expression
         4. A signal is not inactive with respect to a "disable" expression

In the case of P, if we are looking to activate B without explicitly
having configured A it's enough to consider A inactive if all of A's
"enable" signal expressions evaluate to "not active". If any evaluate to
"active" then the corresponding "disable" states must be applied so it
becomes inactive.

For example, the pins composing GPIO bank H provide signals ROMD8
through ROMD15 (high priority) and those for UART6 (low priority). The
mux states for ROMD8 through ROMD15 are aliased, i.e. there are two mux
states that result in the respective signals being configured:

         A. SCU90[6]=1
         B. Strap[4,1:0]=100

Further, the second mux state is a 3-bit bitfield that explicitly
defines the enabled state but the disabled state is implicit, i.e. if
Strap[4,1:0] is not exactly "100" then ROMD8 through ROMD15 are not
considered active. This requires the mux function evaluation logic to
use approach 2. above, however the existing code was using approach 3.
The problem was brought to light on the Palmetto machines where the
strap register value is 0x120ce416, and prevented GPIO requests in bank
H from succeeding despite the hardware being in a position to allow
them.

Fixes: 318398c09a8d ("pinctrl: Add core pinctrl support for Aspeed SoCs")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 07d09e04a6ed..07bbeda7f53e 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -130,11 +130,6 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		bool enable, struct regmap *map)
 {
 	int i;
-	bool ret;
-
-	ret = aspeed_sig_expr_eval(expr, enable, map);
-	if (ret)
-		return ret;
 
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
@@ -167,12 +162,24 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 static bool aspeed_sig_expr_enable(const struct aspeed_sig_expr *expr,
 		struct regmap *map)
 {
+	bool ret;
+
+	ret = aspeed_sig_expr_eval(expr, true, map);
+	if (ret)
+		return true;
+
 	return aspeed_sig_expr_set(expr, true, map);
 }
 
 static bool aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
 		struct regmap *map)
 {
+	bool ret;
+
+	ret = aspeed_sig_expr_eval(expr, true, map);
+	if (!ret)
+		return true;
+
 	return aspeed_sig_expr_set(expr, false, map);
 }
 
-- 
2.9.3.1.g0db844e
