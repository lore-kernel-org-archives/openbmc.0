Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="jXqkQg19"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JrItuUt6"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5462PwYzDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:14 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AC5D20BFE
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DOqLCW
 naNJSklvqvQU9189k6nm28YahgBWDt3M1Bbg8=; b=jXqkQg19VqOcNgCVj3Sm6S
 qB6cqS/V4p1+F9rMnUw1GiaE5jLue5mcgv7XwreGB79Zm2gNoV301ID7h64wvy92
 vPo1dG8J+b4CkTdvRIvi+dXvq8CjPfzsIe+NHtqX5V3CvtJ459TlOdUXMIcRYaJX
 3GBjff3O8i8kjMmEaFZaHTmqVQEk/Ifg4j4l7nj9qOU+di6Z15r2CjWj6v+8pl8K
 +KeaIIUmcbVwbp8jro8NB2Bhm1JAakHX+YtIZRbLGcMdPrihb6k1YiE9PVOE637f
 mtlOfbtizQpoz+FVdW2Zc4TERD18vMhuhqDf6esNrRtSVBHnXpuM/nEnlN8ezMWQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DOqLCWnaNJSklvqvQU9189k6nm28YahgBWDt3M1Bbg8=; b=JrItuUt6
 Ku9/fP/sqKnOfhgz6SPPMeQe5H96iSmhRvrRuYdMNhvc43LtfI1R9QS6TPHRz+pz
 u7did7LqC5J2sIM5Rfr9RJAZLavWgJzRK/5wLBWgOFDpgMvER/vZrh0l6ViIE7BS
 eAUuezcMBSyCpk9vc/lwzhVSOeaff9nLawtcAtyGG9+/ImK06gVq/0bEp0+bBkfw
 AvNnFJTKPt9gyhh/YW4ggVDvT3VWK8g+IK9PcHtOBGz5xrz3z5SogajdFZvipGVL
 yG7ZAsShYR8H10rOTlPXM8brNfcRK27/iOcYKV4gHnnC7sSL1aKq3+fQEc2BxXsX
 p7A6+VenVFYlbQ==
X-ME-Sender: <xms:JILtWYmtD0PAspMPpO0J4__uyEOlvmAhWxQU0WBDWylmCv1kfYr-YA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 769AA7F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:11 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 5/7] net/ncsi: Disable HWA mode when no channels are found
Date: Mon, 23 Oct 2017 16:45:55 +1100
Message-Id: <20171023054557.29013-6-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:14 -0000

From: Gavin Shan <gwshan@linux.vnet.ibm.com>

When there are no NCSI channels probed, HWA (Hardware Arbitration)
mode is enabled. It's not correct because HWA depends on the fact:
NCSI channels exist and all of them support HWA mode. This disables
HWA when no channels are probed.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 100ef01f3ea4badbee6479290a41f74abd0e523f)
---
 net/ncsi/ncsi-manage.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 5bef2cb5a825..8a589e611225 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -991,12 +991,15 @@ static bool ncsi_check_hwa(struct ncsi_dev_priv *ndp)
 	struct ncsi_package *np;
 	struct ncsi_channel *nc;
 	unsigned int cap;
+	bool has_channel = false;
 
 	/* The hardware arbitration is disabled if any one channel
 	 * doesn't support explicitly.
 	 */
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			has_channel = true;
+
 			cap = nc->caps[NCSI_CAP_GENERIC].cap;
 			if (!(cap & NCSI_CAP_GENERIC_HWA) ||
 			    (cap & NCSI_CAP_GENERIC_HWA_MASK) !=
@@ -1007,8 +1010,13 @@ static bool ncsi_check_hwa(struct ncsi_dev_priv *ndp)
 		}
 	}
 
-	ndp->flags |= NCSI_DEV_HWA;
-	return true;
+	if (has_channel) {
+		ndp->flags |= NCSI_DEV_HWA;
+		return true;
+	}
+
+	ndp->flags &= ~NCSI_DEV_HWA;
+	return false;
 }
 
 static int ncsi_enable_hwa(struct ncsi_dev_priv *ndp)
-- 
2.14.2
