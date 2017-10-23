Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="Lacu0sx9"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UDnVsKgx"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5415J4yzDqYv
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:09 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A85E920BFE
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=c24tp/
 aX9ZnS1oGEmcBedrf6tsvLULdi1S+DNHtnvOY=; b=Lacu0sx9Z3Y0j40On9UUO/
 T301y1mm1PPour5P/sNvUMSl+L8VlNgGPbphrfEK9hzfC9KCaPO6/kCL333SHB5t
 IYXBP3tqzsl/UJS4qO7Qo2VhzbCtAyn/A94qefE2XIOuZsqNenGiEZplgaWMZjsz
 l3mVy8sVHe4rl2DHH9+08hn7ngD4jBpwuphOluyvGKK3ScbMCyfCYruT27gx67ic
 JVWRRTi+2KG4BGDWX8R04+xHbUYIz0vN0UEVrEzvaxlB3jF611/ACuin+CNKx4Nz
 1L95yMqfe2oUtHj+5YushUbJUzDsp+LenI6P32vcSxrBjSKFGQaepZQGDgZ03HvQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=c24tp/aX9ZnS1oGEmcBedrf6tsvLULdi1S+DNHtnvOY=; b=UDnVsKgx
 xc2z9u5LRAWW8yNRbNwg0DnIfRVJkUFXulTbf4DteMIrSSPGhaEq5p7HrrNmJukT
 PsuZNL/AcONY9JMUPMcRforrtlzKiiVXqNv9AV80ArbdD4aMKC/6dEM/ZPgeMxxL
 vFI7NLb42gsmHwkRi52EaBLWMEw1Kmj1PfIEPOcbgPtHyyG8+Bc+yBIN4bDmdQPm
 cqbdFvBHLEY0bsVL01vk0/RC3Lv35AE99WRZ/4YHhnNf5wHQSNeXTA5sAgatLBK7
 rdNuIChEltwKDZQozaTjIn/C7Ttc6b84WyHh83/Ti3mPCDGtT337OoxnYsDycW+S
 XXx7fKeG92efOw==
X-ME-Sender: <xms:H4LtWaZ3hTZV_-4ZgxXX2OXInPmK4MLzt-Ajm-y-F5fKFtLGI0EkqA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id C282D7F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:06 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/7] Revert "net/ncsi: Don't assume last available channel
 exists"
Date: Mon, 23 Oct 2017 16:45:51 +1100
Message-Id: <20171023054557.29013-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171023054557.29013-1-sam@mendozajonas.com>
References: <20171023054557.29013-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:10 -0000

This reverts commit 7fd4e7d3b4fc52cdb965e2bbd9bbb3d57cb803fc.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-manage.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 75a97d48da8a..3cbd4328f142 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1407,10 +1407,7 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 	}
 
 	ndp = TO_NCSI_DEV_PRIV(nd);
-	if (!ndp) {
-		netdev_warn(dev, "ncsi: No ncsi_dev_priv?\n");
-		return 0;
-	}
+	ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
 
 	/* Add the VLAN id to our internal list */
 	list_for_each_entry_rcu(vlan, &ndp->vlan_vids, list) {
@@ -1422,17 +1419,11 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 		}
 	}
 
-	if (!ndp->hot_channel) {
-		netdev_warn(dev,
-			    "ncsi: no available filter to check maximum\n");
-	} else {
-		ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
-		if (n_vids >= ncf->total) {
-			netdev_info(dev,
-				    "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
-				    ncf->total, n_vids);
-			return -EINVAL;
-		}
+	if (n_vids >= ncf->total) {
+		netdev_info(dev,
+			    "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
+			    ncf->total, n_vids);
+		return -EINVAL;
 	}
 
 	vlan = kzalloc(sizeof(*vlan), GFP_KERNEL);
-- 
2.14.2
