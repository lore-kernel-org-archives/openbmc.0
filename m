Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVyjJ3z6HzDqb3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="ZeFOcQHz"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GZIsf+ow"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 606122E22;
 Sun, 13 Aug 2017 21:30:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 13 Aug 2017 21:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hD3fJANsQ6JKbuDu8M2wjyaLPLMzwDRi8SOeZxzuM
 20=; b=ZeFOcQHzFFsDuNmC0H9gM5uBM449H5mVNXxK76UyaldkJ5t46euq180Ey
 CvIcaqaEhlNLYcI0YbA4vEdwWpa0KKyBXlSbIqK4KRxLs0tS0XkwXVHnjGOe68GI
 UnnE5OMzcW9oAYaIT0lwvu/GW4NJxPQL5nGlvPYkpIi6Fl4mp+FQZ/6dvLL88fXR
 1wUl0McyYIv5k9DBOMIduM3X14irK0S6m2lAjRQc4njDrplEOhEJrgLVWlAtD37e
 HZI2L4u5IPCQPj9QZv8gI1M+4LveFTRoIJyz/D02klbIPwjeM6vdD2Sg+CxGJj6d
 XqNG4ikdbkkQLZKgjY7IIFDZ5QEYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hD3fJANsQ6JKbuDu8M2wjyaLPLMzwDRi8SOeZxzuM
 20=; b=GZIsf+owBJ8BlOxG+2ZagdZ/2LyNvSRylhJKFgA4lBnchnfd7aWnMCGs8
 kl9bZdECQEGzkl1ecE3+3r5CgkXE1pBaSn9fE+Zxv7X6Q5+y/5jcJYK+2Tf+ynnT
 wYezt2FV02Z+Sa0NuszXMsC8ShJ6F1pw2qrfRBx5cRKf+Q0E2HMrYmBg8LNsBL6f
 lUge5KwN0PAlDeBiGOpqpidQlosQxu1WElwQdthFv4QL9KRZ//czF0UbolslkxNM
 dpdnIgc9nqL1SNadaRyZjLVdEMyP3aKMMw5SehzeloIuzP2klPIQ8EyCpqEChZvZ
 Phq+BK1hRpoccgd5WLj9v6vnA/W3w==
X-ME-Sender: <xms:Mv2QWeIhQRJh002_8yYKbVNc2f0hKHMraCysD8AE4Rr0wllttL_urg>
X-Sasl-enc: 9oC87GwltPq8y1Z0VPv/MmzBsAj5GYL8AbpI8b2hY8fD 1502674225
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 764507E317;
 Sun, 13 Aug 2017 21:30:23 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v2 1/3] net/ncsi: Fix several packet definitions
Date: Mon, 14 Aug 2017 11:29:50 +1000
Message-Id: <20170814012952.13740-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170814012952.13740-1-sam@mendozajonas.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 01:30:29 -0000

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
