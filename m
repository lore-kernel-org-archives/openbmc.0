Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="fAzOWcB0"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IDXWJBk5"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVd1b6RCxzDrJm
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 14:13:39 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A478120BB7;
 Sun,  5 Nov 2017 22:13:37 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 05 Nov 2017 22:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EfyGZKLp2Fa2omkQV6+2u5TkvfZv/IotrpK2p0P03bU=; b=fAzOWcB0
 yKorxJZGRQUjKGfYdvvaM/tIpAOn100FQtKfQMmhyFQxdfY5Owz+IyOJtoCu6lcX
 218u0bGydrzv0zr1DRWu3Q1LZaAHIkaY9PWbQ6LxhDdmILJyTyp6HLlT8ZAnR4PI
 0alyFbUjh/ox2pCCl3WKZ1acoBGH2WWvjuWSS6hVUxgwodlHQgoMMfsuyY8Omzcc
 eWod3G98jIj9g+AGJ4o71nDX+rEMP1bUWXTeb65HZrhs01f9zOo8M8hGUwnytTPR
 Oly7gTeSXlV6C7YsmTUqTUM5rfjPuK4AnRX+6wulA4o4Mop/vR6MYWqm1RV6SjrS
 +P5ZlqCs7bnBBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EfyGZKLp2Fa2omkQV6+2u5TkvfZv/IotrpK2p0P03bU=; b=IDXWJBk5
 0aAxfsoqUBkJcONsU+thWwaPRi/dh7s6ABj5T3qJvnSh1H+yC78rXE/7dbzh6GEA
 fTov9buWGvBU2uHTguzPPoldV2kkMLStlT3daYGrq/9mP1cxDbqYeJ80fD0nkmDA
 ahiZuMJOu9hYVVbvz8Wsx6RWdo5HtrjGfIfgH1Dw00jryWz73fZh6Wu6asBHQZu/
 ywqrEY9/FoOXaigw8aWE19Ne4e+CKETtGxmCkFEnDisxIK9Oqe/+Y0CAN3fxzLhJ
 7GqkWtH7uyTwb96PYq21JClnU21ezuVyrC0kv35KusYPIsU0BYUa5jL6l1dvmdLx
 sbJsknDXRWnrjQ==
X-ME-Sender: <xms:YdP_WXYn9qCx_4nbB9WO66baTuVlz57FrAFkA4d86msLj4vUDAmv6Q>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94B097F8DD;
 Sun,  5 Nov 2017 22:13:36 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH 2/2] net/ncsi: Query channel parameters during configuration
Date: Mon,  6 Nov 2017 14:13:23 +1100
Message-Id: <20171106031323.21519-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171106031323.21519-1-sam@mendozajonas.com>
References: <20171106031323.21519-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 03:13:41 -0000

Send a Get-Parameters command during configuration to ensure the remote
channel configuration reflects what we expect.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c |  4 ++++
 net/ncsi/ncsi-rsp.c    | 21 +++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index d30f7bd741d0..d2ccc9a6ced1 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -248,6 +248,7 @@ enum {
 	ncsi_dev_state_config_ec,
 	ncsi_dev_state_config_ae,
 	ncsi_dev_state_config_gls,
+	ncsi_dev_state_config_gp,
 	ncsi_dev_state_config_done,
 	ncsi_dev_state_suspend_select	= 0x0401,
 	ncsi_dev_state_suspend_gls,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 6fd90415b2a2..2b8e3a102c45 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -809,6 +809,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_config_ec:
 	case ncsi_dev_state_config_ae:
 	case ncsi_dev_state_config_gls:
+	case ncsi_dev_state_config_gp:
 		ndp->pending_req_num = 1;
 
 		nca.package = np->id;
@@ -886,6 +887,9 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			nd->state = ncsi_dev_state_config_gls;
 		} else if (nd->state == ncsi_dev_state_config_gls) {
 			nca.type = NCSI_PKT_CMD_GLS;
+			nd->state = ncsi_dev_state_config_gp;
+		} else if (nd->state == ncsi_dev_state_config_gp) {
+			nca.type = NCSI_PKT_CMD_GP;
 			nd->state = ncsi_dev_state_config_done;
 		}
 
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 58186c4102f0..b5446441b195 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -724,6 +724,16 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	if (!nc)
 		return -ENODEV;
 
+	netdev_info(ndp->ndev.dev, "NCSI: Channel %u Parameters:\n", nc->id);
+	netdev_info(ndp->ndev.dev, "NCSI: Channel %s\n",
+		    ntohl(rsp->valid_modes) & 0x2 ? "enabled" : "disabled");
+	netdev_info(ndp->ndev.dev, "NCSI: BPF %s\n",
+		    ntohl(rsp->valid_modes) & 0x1 ? "enabled" : "disabled");
+	netdev_info(ndp->ndev.dev, "NCSI: TX %s\n",
+		    ntohl(rsp->valid_modes) & 0x4 ? "enabled" : "disabled");
+	netdev_info(ndp->ndev.dev, "NCSI: MPF %s\n",
+		    ntohl(rsp->valid_modes) & 0x8 ? "enabled" : "disabled");
+
 	/* Modes with explicit enabled indications */
 	if (ntohl(rsp->valid_modes) & 0x1) {	/* BC filter mode */
 		nc->modes[NCSI_MODE_BC].enable = 1;
@@ -746,6 +756,17 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	nc->modes[NCSI_MODE_AEN].enable = 1;
 	nc->modes[NCSI_MODE_AEN].data[0] = ntohl(rsp->aen_mode);
 
+	netdev_info(ndp->ndev.dev, "NCSI: link settings %08x\n",
+		    ntohl(rsp->link_mode));
+	netdev_info(ndp->ndev.dev, "NCSI: MAC address count %08x\n",
+		    rsp->mac_cnt);
+	netdev_info(ndp->ndev.dev, "NCSI: MAC address 1 %s\n",
+		    rsp->mac_enable & 0x1 ? "enabled" : "disabled");
+	netdev_info(ndp->ndev.dev,
+		    "NCSI: MAC address 1 %02x:%02x:%02x:%02x:%02x:%02x\n",
+		    rsp->mac[0], rsp->mac[1], rsp->mac[2],
+		    rsp->mac[3], rsp->mac[4], rsp->mac[5]);
+
 	/* MAC addresses filter table */
 	pdata = (unsigned char *)rsp + 48;
 	enable = rsp->mac_enable;
-- 
2.14.3
