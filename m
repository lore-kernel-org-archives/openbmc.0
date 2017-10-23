Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="fdvaqrXz"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VdoqfGT2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5484xMVzDqfw
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:16 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B060D20C8C
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:14 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zEYAHM
 txveUbL9+uQ3lLJx+rNGkbkI4Vcarv5qCsHe8=; b=fdvaqrXzlQoEURu8WuDL7C
 AQ7qYPKg6vUnGrp83vuzrZSh1V8SpGYURppzcoABcz0Vmby18rCBsNrpynK3KFRe
 08pr41d3/FwMGPsgxBFWcAI6Rk5eqk51hekHyh4dTJN6P2ENdzHdGAvFdG30XevV
 WRrddMbRF4DarBcJPjmzAUL5ZUmFpJjSiQk2W66NzZNajynvtL3ut184pPJdjptI
 1wZCkCk1HqOt4AmlGi+LaUtdmT/HJwTnxwkCfJOKsegPu50r6Wae3Tou0WGtKrgj
 DUxHYrnAok8ocOAYA4k+w5lOEdeAN98mqjJR/BWd1sd75El6VZYilexSp7er0fNA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zEYAHMtxveUbL9+uQ3lLJx+rNGkbkI4Vcarv5qCsHe8=; b=VdoqfGT2
 221nGV3YipkCzR3zath0DYeldo1iSsB0Dl1dZTYa7BQOtqI9ING7rAhZy5LQUkr2
 HXHVU640oNslwv0Q9wMduzVcE0eNr05SKtPI1U2QuY3vdNAnNaRzU7aVNlieX9m/
 Nta2ZMxq2gMQ0my+Ak2207QQdy4dUPtCsEGfs+wkLMhLjDR/K7QI/c4Y9yiiPfyV
 eqEZQ6kll082p5kMyRzIH5ZncdQVanCUA3KghcIleE4S2MUt82GHs1E3kxk+Nz0d
 HBWVJW94IQC0fd6uIxnGuYEYsramoe6Jtd+6WcHSI57P86GZ4GRWwknuWUDQ9OWp
 9qD9p3WOpUjkCg==
X-ME-Sender: <xms:JoLtWbv5Bp8jnJ9YZOxDMA1uaVQDOXFMxDVMqhcsB1yGFB2bsmkAlg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id C71147F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:13 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 7/7] net/ncsi: Fix length of GVI response packet
Date: Mon, 23 Oct 2017 16:45:57 +1100
Message-Id: <20171023054557.29013-8-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:17 -0000

From: Gavin Shan <gwshan@linux.vnet.ibm.com>

The length of GVI (GetVersionInfo) response packet should be 40 instead
of 36. This issue was found from /sys/kernel/debug/ncsi/eth0/stats.

 # ethtool --ncsi eth0 swstats
     :
 RESPONSE     OK       TIMEOUT  ERROR
 =======================================
 GVI          0        0        2

With this applied, no error reported on GVI response packets:

 # ethtool --ncsi eth0 swstats
     :
 RESPONSE     OK       TIMEOUT  ERROR
 =======================================
 GVI          2        0        0

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 0a90e251988ceedc528c8db98f25b051cf190f44)
---
 net/ncsi/ncsi-rsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 265b9a892d41..927dad4759d1 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -959,7 +959,7 @@ static struct ncsi_rsp_handler {
 	{ NCSI_PKT_RSP_EGMF,    4, ncsi_rsp_handler_egmf    },
 	{ NCSI_PKT_RSP_DGMF,    4, ncsi_rsp_handler_dgmf    },
 	{ NCSI_PKT_RSP_SNFC,    4, ncsi_rsp_handler_snfc    },
-	{ NCSI_PKT_RSP_GVI,    36, ncsi_rsp_handler_gvi     },
+	{ NCSI_PKT_RSP_GVI,    40, ncsi_rsp_handler_gvi     },
 	{ NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc      },
 	{ NCSI_PKT_RSP_GP,     -1, ncsi_rsp_handler_gp      },
 	{ NCSI_PKT_RSP_GCPS,  172, ncsi_rsp_handler_gcps    },
-- 
2.14.2
