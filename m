Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTFCW5wTvzDr4K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 16:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="GAN//HQN"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MIys9f2c"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9A0165701;
 Fri, 11 Aug 2017 02:17:09 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Fri, 11 Aug 2017 02:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=tnONTJHKZZdUCRZMZBVqUSWrxW7QYaM6sjNWz6C9T
 JY=; b=GAN//HQN/PT5byRwGyejHln9azNeB494zXM0EIJLtRJWeqHkW8PSnACSZ
 z45IzxRKnM43L0cIZxehQBLdVGpk8IFVYfEsnp4YbdMI4OeRnp7cDEB+YFiFgWhl
 7tLqKYP0WMIhauacMXfxWjwtkeg/jusvEP1sl3kvPY90VR+fUz3xGUj4hopvzi0n
 2xnXazmPTLQeLgGApzetM9JiGXd4G5ZQAD2mNfyxNivKbrdOCSQy/AhSLrP+eJUk
 8fGSl3g6MO5vtdua9ahY6Yuj1x6RrAj62B8EKUQGFVcNgzNdpeS3feGMT30MAkjn
 iu2Kr5XpKQUt0IF+pG7W0M072eOuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=tnONTJHKZZdUCRZMZBVqUSWrxW7QYaM6sjNWz6C9T
 JY=; b=MIys9f2c7WDOqVT+o4GrbWVFS2RwgLTDDKcLAZjMwG7XwMHl70OMV8N/M
 /1V7zEZNgykttg05lOemcgYV0x8BhnRaV/DZ2LBitf+ZaMKt6kYJM4kVgoJz9AHL
 lrykZr7yLMQYRVoVRAJqvKa6a6XwOeF6/Ef6MIyJ9a/6aDP9hwkRLydBTtwpA73P
 5cI9OtgvaX1SXto54lCbtpO3lfGPUQKTzcm2KTKjb836ev2aHZhcevf8r8kq6mNh
 zrQtXF/TEevJGnxZai/OSfVVH07QaYtmEvEiWZrxhBJiwY6g+COyqG70Bytui0Da
 agQ/j4mNj9VHIuoPOyX2w6OcprO/w==
X-ME-Sender: <xms:5UuNWYlClmu3TM6mfZ0ax_kyR3uyBzzUUiRoj6X42V724nL2vOG7jA>
X-Sasl-enc: q2vy8fgqJAkm9G5VP3fWpWPveuKLhYJC1hPHmrD+osmQ 1502432228
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D3742478C;
 Fri, 11 Aug 2017 02:17:06 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH 2/3] net/ncsi: Fix several packet definitions
Date: Fri, 11 Aug 2017 16:16:47 +1000
Message-Id: <20170811061648.19661-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170811061648.19661-1-sam@mendozajonas.com>
References: <20170811061648.19661-1-sam@mendozajonas.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 06:17:12 -0000

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-cmd.c | 10 +++++-----
 net/ncsi/ncsi-pkt.h |  2 +-
 net/ncsi/ncsi-rsp.c |  3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index db7083bfd476..1fec9fda7f60 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -146,9 +146,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
 
 	cmd = (struct ncsi_cmd_svf_pkt *)skb_put(skb, sizeof(*cmd));
 	memset(cmd, 0, sizeof(*cmd));
-	cmd->vlan = htons(nca->words[0]);
-	cmd->index = nca->bytes[2];
-	cmd->enable = nca->bytes[3];
+	cmd->vlan = htons(nca->words[1]);
+	cmd->index = nca->bytes[6];
+	cmd->enable = nca->bytes[7];
 	ncsi_cmd_build_header(&cmd->cmd.common, nca);
 
 	return 0;
@@ -161,7 +161,7 @@ static int ncsi_cmd_handler_ev(struct sk_buff *skb,
 
 	cmd = (struct ncsi_cmd_ev_pkt *)skb_put(skb, sizeof(*cmd));
 	memset(cmd, 0, sizeof(*cmd));
-	cmd->mode = nca->bytes[0];
+	cmd->mode = nca->bytes[3];
 	ncsi_cmd_build_header(&cmd->cmd.common, nca);
 
 	return 0;
@@ -240,7 +240,7 @@ static struct ncsi_cmd_handler {
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
