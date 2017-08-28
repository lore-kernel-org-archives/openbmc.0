Return-Path: <sam@mendozajonas.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xghRp0l0fzDq5m
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 16:19:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="DbNIJZSU"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f0EoIR9z"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CCF4120D7A;
 Mon, 28 Aug 2017 02:18:59 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 28 Aug 2017 02:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hD3fJANsQ6JKbuDu8M2wjyaLPLMzwDRi8SOeZxzuM
 20=; b=DbNIJZSUNRm/R6Ov1D7s2CZ20weLYPJ5tNJ7QbgMK739/hZOfo/fteUbL
 H3LH7322FE/wxgsUoZqwr5Q9s/Oi2EjuHdtOtI0Gj9fx+IxvA6j783gP0Yy3IrIw
 rFewz2lwElKkBiQN9+fg9FctS7HVxgiRXTJjN3ELY7T6OH6gF55Jjv/Nw0TSyyLM
 jHKJyr6tuBJXdADazZ9Lsi++CsjI2RxHkmxllKgb9aDwBGS9wm9drjHNsusZbK8M
 9PXTBzPXgpN4BKwVLVVDrpB3Dohs55X7vQOB6OubezcmVOoAqKmJT8/uwEG3Rff5
 iuVvYsuBlQq0Zd6m5E9p6T3EvRseg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hD3fJANsQ6JKbuDu8M2wjyaLPLMzwDRi8SOeZxzuM
 20=; b=f0EoIR9zypmEFUkKGvSy6wfQLMmVGeOxaGGbvK3U66VLLS/6fSsOGE554
 kKmP+LZXigBg2+hkeWIJkmVqzbqLl7Ncv3lzTWJVbuWJJ9mPnqhLwuakJo/+6cnr
 5xuU76OkbAQ9ZXZalcWFAXnOviaXivHUo5W4FfzWsCjtbNQ68El/4e7ucZ8n6r/k
 smXYa8oV2aTU8S/s1NH6q8Uhh3FLKC6UB4HJvfkfaDLNzDk9GxgN+/W++zBz5kHw
 NjjPsfaIgU+17E3KeHIEoCyb4m8xgVSKtXq5fWYW9jRnNgMDF/YWk5Wp4TWzOlpz
 gbGSZY6rrpe6JUl/5nA1GMz2KEiug==
X-ME-Sender: <xms:07WjWf5sIuymwH8hM0DmWUSvC1gF5JdUNH2DOGxNPMtjrSmzbJ7Nnw>
X-Sasl-enc: XclAxYspnVAYFcMwUAB80FSV0flgAX1UDGN4y+O9jSBp 1503901139
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0AFDF7E271;
 Mon, 28 Aug 2017 02:18:56 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v3 1/3] net/ncsi: Fix several packet definitions
Date: Mon, 28 Aug 2017 16:18:41 +1000
Message-Id: <20170828061843.24349-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170828061843.24349-1-sam@mendozajonas.com>
References: <20170828061843.24349-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 28 Aug 2017 06:19:02 -0000

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
v2: Rebased on latest net-next

 net/ncsi/ncsi-cmd.c | 10 +++++-----
 net/ncsi/ncsi-pkt.h |  2 +-
 net/ncsi/ncsi-rsp.c |  3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 5e03ed190e18..7567ca63aae2 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -139,9 +139,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
 	struct ncsi_cmd_svf_pkt *cmd;
 
 	cmd = skb_put_zero(skb, sizeof(*cmd));
-	cmd->vlan = htons(nca->words[0]);
-	cmd->index = nca->bytes[2];
-	cmd->enable = nca->bytes[3];
+	cmd->vlan = htons(nca->words[1]);
+	cmd->index = nca->bytes[6];
+	cmd->enable = nca->bytes[7];
 	ncsi_cmd_build_header(&cmd->cmd.common, nca);
 
 	return 0;
@@ -153,7 +153,7 @@ static int ncsi_cmd_handler_ev(struct sk_buff *skb,
 	struct ncsi_cmd_ev_pkt *cmd;
 
 	cmd = skb_put_zero(skb, sizeof(*cmd));
-	cmd->mode = nca->bytes[0];
+	cmd->mode = nca->bytes[3];
 	ncsi_cmd_build_header(&cmd->cmd.common, nca);
 
 	return 0;
@@ -228,7 +228,7 @@ static struct ncsi_cmd_handler {
 	{ NCSI_PKT_CMD_AE,     8, ncsi_cmd_handler_ae      },
 	{ NCSI_PKT_CMD_SL,     8, ncsi_cmd_handler_sl      },
 	{ NCSI_PKT_CMD_GLS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_SVF,    4, ncsi_cmd_handler_svf     },
+	{ NCSI_PKT_CMD_SVF,    8, ncsi_cmd_handler_svf     },
 	{ NCSI_PKT_CMD_EV,     4, ncsi_cmd_handler_ev      },
 	{ NCSI_PKT_CMD_DV,     0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_SMA,    8, ncsi_cmd_handler_sma     },
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index 3ea49ed0a935..91b4b66438df 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -104,7 +104,7 @@ struct ncsi_cmd_svf_pkt {
 	unsigned char           index;     /* VLAN table index  */
 	unsigned char           enable;    /* Enable or disable */
 	__be32                  checksum;  /* Checksum          */
-	unsigned char           pad[14];
+	unsigned char           pad[18];
 };
 
 /* Enable VLAN */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 087db775b3dc..c1a191d790e2 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -354,7 +354,8 @@ static int ncsi_rsp_handler_svf(struct ncsi_request *nr)
 
 	/* Add or remove the VLAN filter */
 	if (!(cmd->enable & 0x1)) {
-		ret = ncsi_remove_filter(nc, NCSI_FILTER_VLAN, cmd->index);
+		/* HW indexes from 1 */
+		ret = ncsi_remove_filter(nc, NCSI_FILTER_VLAN, cmd->index - 1);
 	} else {
 		vlan = ntohs(cmd->vlan);
 		ret = ncsi_add_filter(nc, NCSI_FILTER_VLAN, &vlan);
-- 
2.14.0
