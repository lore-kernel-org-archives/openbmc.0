Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3bL4tKWzDqCp
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WVozOieF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bXeqDoYv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E32D20A83;
 Thu,  2 Feb 2017 23:21:32 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=OBb
 AiM4iN8Wi6fCMn/iMEgQSK58=; b=WVozOieFdL5Gw9ijoeE+Zjaj4YtOu1J7H1z
 ssSO4VwIjG0quERvKh694TygjWUTK2/VLaXeh3+NqHzj8jy1prXJ7vOSmqRUvF5y
 V0JG+w8IYSJoT7K4PkryMi+W1mznGbFiqf/ESp4CBwI4SinnpTGzfOrv6+TF8REB
 vmNA+mRM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=OBbAiM4iN8Wi6fCMn/iMEgQSK58=; b=bXeqD
 oYvfaw8c8U5f6B8dNT//RtL8C1xn7a+Z8vEBsPd6tEqc0YpzRdQPMFMWvguHh9I+
 oTAUAhPs6R0Qx74rKNn7AAFODwiD+02o7XxGAN5/fsEF5Nwy01qAvmUm+9rBxa3q
 I6wzaq+yrbzgkVPgrt1k7D6aJEXGdOscsoAyMM=
X-ME-Sender: <xms:TAWUWOvH86Cla7lkN0tZAHBJVepQD9ag01NiV-eS5jhUq9WINgtGwg>
X-Sasl-enc: ZcmSGw56/kziV6sB5exifQjCZQsdfIMIfFo81Z4o37Xf 1486095691
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 242BC24066;
 Thu,  2 Feb 2017 23:21:29 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 13/14] pinctrl: aspeed: Fix kerneldoc return
 descriptions
Date: Fri,  3 Feb 2017 14:50:12 +1030
Message-Id: <20170203042013.2719-14-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:35 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit b75dd8722e1779767a018009ab6550de33a9136e)
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 782c5c97f853..76f62bd45f02 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -97,7 +97,7 @@ static inline void aspeed_sig_desc_print_val(
  * @enabled: True to query the enabled state, false to query disabled state
  * @regmap: The IP block's regmap instance
  *
- * @return 1 if the descriptor's bitfield is configured to the state
+ * Return: 1 if the descriptor's bitfield is configured to the state
  * selected by @enabled, 0 if not, and less than zero if an unrecoverable
  * failure occurred
  *
@@ -134,7 +134,7 @@ static int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
  * @enabled: True to query the enabled state, false to query disabled state
  * @maps: The list of regmap instances
  *
- * @return 1 if the expression composed by @enabled evaluates true, 0 if not,
+ * Return: 1 if the expression composed by @enabled evaluates true, 0 if not,
  * and less than zero if an unrecoverable failure occurred.
  *
  * A mux function is enabled or disabled if the function's signal expression
@@ -175,7 +175,7 @@ static int aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
  *          expression, false to disable the function's signal
  * @maps: The list of regmap instances for pinmux register access.
  *
- * @return 0 if the expression is configured as requested and a negative error
+ * Return: 0 if the expression is configured as requested and a negative error
  * code otherwise
  */
 static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
@@ -256,7 +256,7 @@ static int aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
  * @exprs: The list of signal expressions (from a priority level on a pin)
  * @maps: The list of regmap instances for pinmux register access.
  *
- * @return 0 if all expressions are disabled, otherwise a negative error code
+ * Return: 0 if all expressions are disabled, otherwise a negative error code
  */
 static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
 			       struct regmap * const *maps)
@@ -281,8 +281,8 @@ static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
  * @exprs: List of signal expressions (haystack)
  * @name: The name of the requested function (needle)
  *
- * @return A pointer to the signal expression whose function tag matches the
- *         provided name, otherwise NULL.
+ * Return: A pointer to the signal expression whose function tag matches the
+ * provided name, otherwise NULL.
  *
  */
 static const struct aspeed_sig_expr *aspeed_find_expr_by_name(
-- 
2.9.3
