Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="kN1V4Nfh"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OkNuu1AR"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnCWD63kyzDrJ7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 15:56:07 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0FABD20D9F;
 Wed,  6 Sep 2017 01:56:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 06 Sep 2017 01:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=02erKn
 y1uA7Fa+ewAatvevOvVanEaPwUzTGN37wpSP0=; b=kN1V4NfhwuA+16llTxf32m
 jpA1IdM0xLw1nnfWFeyDlf4NnU8sPDJydGPB2zSUJpfRu3UchEmIAHAH3ubVv6ys
 Q+I+yhay2JceLEi7qleERv//uZl/aNsU4MLYyQ5L+1b3TjSjzI7vQUdFuc+kCxZg
 L8Ia9Rfdn72b2WZ5jR2ZHh6odn/CcWM0fFQH63zpNMUGf35k0hc/aQ8CcpbNsFJ7
 ZbfuYhQtJfSWt0NV7i5T8ItXfBHbEB7e2rNrJ9XRH0cQG8UeTQFKBK7d9kUwYPx+
 0Urb64MlerjTdgT5DMtof976ujiUtOqbdf6Qe/RJUJ97M5IEow+xost1EbNVtB7A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=02erKn
 y1uA7Fa+ewAatvevOvVanEaPwUzTGN37wpSP0=; b=OkNuu1AR/TxTKnD3xDMkIo
 9BgiN85hQwwIt7qBcRY5bu9/C3FMu4PjGHYSMYCMcHEDHno+aeQtVT84pigtJBct
 C20D+PlzprSJTLp+pkntrh/yQoKDGAWdRu0g6Pd4afmhLnb8bk64an1tzcbFJaPR
 okx24GSbwH1Uef9EFojRPtBemKmCCwp+2PYbc5Bn5Xk0QGknFemhvC/aArOuxcF+
 vxpwqzalCP2C/D8G6/McBCNg4G4JVpFLl8+P8R7e/ZvNjdwJVI/qtOlvRHlWspAD
 0BZJuRLsWay3fAuAGf9Bv2KpoBVREPiHG338rQJXD+jiv6oXHwK0FTxbc4eYomaw
 ==
X-ME-Sender: <xms:9I2vWedQnKM44arghWhfjKgjqVoNN_XZd8-a7EnyiZfows4eck17Kw>
X-Sasl-enc: hCM0qvKdWvGf3+Cz04AafAUHB9+vm63WMNA7lS/eV/HA 1504677364
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7B81243C8;
 Wed,  6 Sep 2017 01:56:03 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH] net/ncsi: Don't assume last available channel exists
Date: Wed,  6 Sep 2017 15:55:59 +1000
Message-Id: <20170906055559.14474-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Wed, 06 Sep 2017 05:56:10 -0000

When handling new VLAN tags in NCSI we check the maximum allowed number
of filters on the last active ("hot") channel. However if the 'add'
callback is called before NCSI has configured a channel, this causes a
NULL dereference.

Check that we actually have a hot channel, and warn if it is missing.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
Sending to the OpenBMC list for those who are particularly interested, will
send upstream once I've had more time to properly test on a booting machine.


 net/ncsi/ncsi-manage.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 3cbd4328f142..75a97d48da8a 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1407,7 +1407,10 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 	}
 
 	ndp = TO_NCSI_DEV_PRIV(nd);
-	ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
+	if (!ndp) {
+		netdev_warn(dev, "ncsi: No ncsi_dev_priv?\n");
+		return 0;
+	}
 
 	/* Add the VLAN id to our internal list */
 	list_for_each_entry_rcu(vlan, &ndp->vlan_vids, list) {
@@ -1419,11 +1422,17 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 		}
 	}
 
-	if (n_vids >= ncf->total) {
-		netdev_info(dev,
-			    "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
-			    ncf->total, n_vids);
-		return -EINVAL;
+	if (!ndp->hot_channel) {
+		netdev_warn(dev,
+			    "ncsi: no available filter to check maximum\n");
+	} else {
+		ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
+		if (n_vids >= ncf->total) {
+			netdev_info(dev,
+				    "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
+				    ncf->total, n_vids);
+			return -EINVAL;
+		}
 	}
 
 	vlan = kzalloc(sizeof(*vlan), GFP_KERNEL);
-- 
2.14.1
