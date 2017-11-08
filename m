Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="YqzkA0Av"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EgrcAh2a"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWnQY0PBDzDr62
 for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2017 11:35:48 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C5F7520E47;
 Tue,  7 Nov 2017 19:35:46 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Tue, 07 Nov 2017 19:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KGGSniI+xDrOYT+qpOV79xB1qr90yzAoDlhcnAt0EBs=; b=YqzkA0Av
 3wl3ooA8Y3G7LywBxGJqfbPAbfoJQqM5t8oRR02AILWsL9sOixRxqtkqTfiMimEY
 W4YlKVMivMCCCgA9Aw7x6XKovgdlcrTYqZ7/UH12/SJ0rJTKsTTiEru3BXcXTHz4
 QqOvwGlw07zI2uG6CRoc8UgJdACN+cCilAIDMFgHam/6i7FRp4ttOxIKRkj4k81Y
 SFe0FJtgS3WQY5i1ZeSTNUPoFrRFmpZR8GBgVDc0ty/5K6n6CHbsHJtbBIuUTdJN
 Lb4rhJpuqU/Jn6MIWNI77bBfipgqTUUvDqDgE+hEdEQwjH8k9jaMRDEGXX4DGijA
 Wh1hJyQaRbzkzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KGGSniI+xDrOYT+qpOV79xB1qr90yzAoDlhcnAt0EBs=; b=EgrcAh2a
 OxmJJAOsditRbmRgarKXLdmd8nRzGC77ZuMTIP1XxYnTsRgQ9G8Vop81NaNDPZKG
 W6GcCcMotzoD6/YhkNtQifCb6HeYSWtFkBzrrfvmLmjxBG61LDhCgGVAzH5GPCIz
 zpTgwXYIyAFJptIBalROSnibiwVVKjn2XkeZrdBXms+DGljt+eiGY6NpAZffoYnx
 hn7Jc+SXVfjqLc7YIH579USNP2kKXE4fANqoEMpknCG6AipZDCYpR+MKlX/vvZ6N
 v2VvjNGK15j+jwMFwC3buw32fqvhDynC6XprRYXEC2BhNxNANtXJneEc+03B66l5
 s5+4BZoy6KYlWA==
X-ME-Sender: <xms:YlECWmMMRV4_xhtWBxLkknAxFm5l_EK40Y58l98x8vY8mVc8kdyADw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id B08A2242CF;
 Tue,  7 Nov 2017 19:35:45 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 2/2] net/ncsi: Query channel parameters during configuration
Date: Wed,  8 Nov 2017 11:35:33 +1100
Message-Id: <20171108003533.13248-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171108003533.13248-1-sam@mendozajonas.com>
References: <20171108003533.13248-1-sam@mendozajonas.com>
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
X-List-Received-Date: Wed, 08 Nov 2017 00:35:49 -0000

Send a Get-Parameters command during configuration to ensure the remote
channel configuration reflects what we expect.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c |  4 ++++
 net/ncsi/ncsi-rsp.c    | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+)

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
index 97b76f26bde7..faab04625ccb 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -807,6 +807,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_config_ec:
 	case ncsi_dev_state_config_ae:
 	case ncsi_dev_state_config_gls:
+	case ncsi_dev_state_config_gp:
 		ndp->pending_req_num = 1;
 
 		nca.package = np->id;
@@ -884,6 +885,9 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			nd->state = ncsi_dev_state_config_gls;
 		} else if (nd->state == ncsi_dev_state_config_gls) {
 			nca.type = NCSI_PKT_CMD_GLS;
+			nd->state = ncsi_dev_state_config_gp;
+		} else if (nd->state == ncsi_dev_state_config_gp) {
+			nca.type = NCSI_PKT_CMD_GP;
 			nd->state = ncsi_dev_state_config_done;
 		}
 
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 58186c4102f0..a7289c2d3870 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -724,6 +724,17 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	if (!nc)
 		return -ENODEV;
 
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: Channel %u Parameters:\n", nc->id);
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: Channel %s\n",
+		      ntohl(rsp->valid_modes) & 0x2 ? "enabled" : "disabled");
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: BPF %s\n",
+		      ntohl(rsp->valid_modes) & 0x1 ? "enabled" : "disabled");
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: TX %s\n",
+		      ntohl(rsp->valid_modes) & 0x4 ? "enabled" : "disabled");
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: MPF %s\n",
+		      ntohl(rsp->valid_modes) & 0x8 ? "enabled" : "disabled");
+
 	/* Modes with explicit enabled indications */
 	if (ntohl(rsp->valid_modes) & 0x1) {	/* BC filter mode */
 		nc->modes[NCSI_MODE_BC].enable = 1;
@@ -746,6 +757,18 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	nc->modes[NCSI_MODE_AEN].enable = 1;
 	nc->modes[NCSI_MODE_AEN].data[0] = ntohl(rsp->aen_mode);
 
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: link settings %08x\n",
+		      ntohl(rsp->link_mode));
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: MAC address count %08x\n",
+		      rsp->mac_cnt);
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: MAC address 1 %s\n",
+		      rsp->mac_enable & 0x1 ? "enabled" : "disabled");
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: MAC address 1 %02x:%02x:%02x:%02x:%02x:%02x\n",
+		      rsp->mac[0], rsp->mac[1], rsp->mac[2],
+		      rsp->mac[3], rsp->mac[4], rsp->mac[5]);
+
 	/* MAC addresses filter table */
 	pdata = (unsigned char *)rsp + 48;
 	enable = rsp->mac_enable;
-- 
2.14.3
