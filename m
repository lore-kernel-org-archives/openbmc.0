Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS4xb5rqyzDqyx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="mUKYWUMm"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gne386iR"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id F23D49FF;
 Wed,  9 Aug 2017 04:55:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 09 Aug 2017 04:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ptBuXqCiHcIYlfyCZuf7E2rWVXQGBugwavrAXvTCE
 10=; b=mUKYWUMm/OU9NPdNxEDfRngJflv+qhc2kqBsTtwPPJURtwB/qEmAUA7Rk
 Jinh+cxgv8jEQ6+lYSDdUHgexkfzWBolplVkWLYp1fOLyJbBqNIq114AzPSj+fyv
 wwCO6j368/dHa3odZIniDYN8TIMTV0LhrQkYoive9klAFk1vyWP0sHY82pjXmccG
 mdYgpP0hQOqBMrfSS1Og13SjJmY2Mar57SpccuwVEdM/gtnfB4qxyV7y14gczrQR
 6IrSglDnxl8L3ljS2TQAIarPY/YONqQtZwr1OjmI2D/5rJbT5Um0T/y6k4Jd2AtF
 v6Z9Q0nN3bkoDZsHOiZVE1/RcjCwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ptBuXqCiHcIYlfyCZuf7E2rWVXQGBugwavrAXvTCE
 10=; b=gne386iRph7JWWzC0elVd0Rva9pOFDUQzvU0WLshyUzBV880XH5FcyWTE
 jNsxyB4i8SrfawWJ7zi3n1Hn+C/J1oYcUH8yK4B3WuLMXbdP+MOdAo0vPp5uwNR9
 73+4oSavYrvjV2JLGNDh3lTLKP8Kky53xzV/LoRDRHaTI4gfOUeGxdVdBv07Ddmk
 dNy+DSAxDoV7UaMbc60aG2iJNWxd6ukFcs/poMpmpwf7vz2kv665Q/J1FSRXtYB9
 i6M0c25OcymSD3a8Rn3HYw6dKBfBgih+yTI5zQghG3bCBWKraDEf5GdUtarYnuoC
 AAdbmBMkH2pTYrdWzFHE7+QossIrg==
X-ME-Sender: <xms:-M2KWbNa7R9STJTosNWc5Y7h42jFx6uLVKSfISnLkYpHLMkMXCHyLg>
X-Sasl-enc: JUeUW+MTcUxZVpsVCELNtqUkG6HdzgXNOAgrHg2gmr/8 1502268920
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 736C1240A4;
 Wed,  9 Aug 2017 04:55:18 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, Leonard Low <leolow@au1.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Subject: [RFC PATCH 2/3] net/ncsi: Fix several packet definitions
Date: Wed,  9 Aug 2017 18:54:42 +1000
Message-Id: <20170809085443.13148-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170809085443.13148-1-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
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
X-List-Received-Date: Wed, 09 Aug 2017 09:01:08 -0000

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-cmd.c | 10 +++++-----
 net/ncsi/ncsi-pkt.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

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
-- 
2.13.3
