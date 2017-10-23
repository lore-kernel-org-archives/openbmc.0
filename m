Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="MLMVsstO"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YnFrvnDq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5440lvMzDqYv
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:12 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 08D6120C9B
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PU10SR
 S18y/2WFNNso6qHntgP8NXPq3BtSqumyD5n3w=; b=MLMVsstOA9SE7baDyrBb7D
 QW1ZKaKMLrapywrfEZHWjYWHBtR6AfbFNE8SDyabzOGPbk2xSrOAF85ZKA1lsFA3
 aTuL+qahiBxDT3NYXLulAjwGHwxEnBMqkS/QSRMmCJi3x02gf+3ebomsgxy1Q9J5
 Wu221L+WX14umBj56FCBpyS40C2R0faL7Nit3lE1EoySxU7IqlyTgh688TYsCT93
 8aWyLHc2QL7iODYoPX4mWs8fu24MVreJqOUIQjyMnzshUOrtniUX8PnWg+yjfZRl
 mPvybeOUdZLhrOCL5NmQC2ctdUrpE8lbNdvO2QD2lk6Vm30V4rF/UXj0O6YffcfQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PU10SRS18y/2WFNNso6qHntgP8NXPq3BtSqumyD5n3w=; b=YnFrvnDq
 8Qs/FE2XItCGzH+o5OFa3Qrf4hs5IwZ9/JzJtJhQBeQ771Yi3IyFxLexdUczLVXx
 PeesoSkIyzduJaVJmpvqxxqXQgMAUFmTgEgT1UGrvqDCYMqj4vHkJXlPiXDLsp2l
 tgMEACn37w4xpbzoP8dZXhifG1Vs/Byf1IJxeNCJF6VBCgbGGXRUc5zMN6IUCI/h
 e/AqNfacjDomhW7RYi+0EVckGcdPwRpMq9Krl9ciMDK7xgI16w4/6pVwUzvA4+vi
 z55SzQvTgluCN6/GqdOhFE21+HUnwL02tTxJISRgjcVYWEdgN4A9yQY80LII5DQw
 gBCWVpfNnlhwFw==
X-ME-Sender: <xms:IYLtWY4NaTVUy8VCgfVupENCEYIQH-qt6AYAOz5xtb_K2yMeTf5uEQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25D507F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:08 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/7] net/ncsi: Fix AEN HNCDSC packet length
Date: Mon, 23 Oct 2017 16:45:53 +1100
Message-Id: <20171023054557.29013-4-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:12 -0000

Correct the value of the HNCDSC AEN packet.
Fixes: 7a82ecf4cfb85 "net/ncsi: NCSI AEN packet handler"

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 6850d0f8b2542112629061808ed950b35eb982e4)
---
 net/ncsi/ncsi-aen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 6898e7229285..f135938bf781 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -187,7 +187,7 @@ static struct ncsi_aen_handler {
 } ncsi_aen_handlers[] = {
 	{ NCSI_PKT_AEN_LSC,    12, ncsi_aen_handler_lsc    },
 	{ NCSI_PKT_AEN_CR,      4, ncsi_aen_handler_cr     },
-	{ NCSI_PKT_AEN_HNCDSC,  4, ncsi_aen_handler_hncdsc }
+	{ NCSI_PKT_AEN_HNCDSC,  8, ncsi_aen_handler_hncdsc }
 };
 
 int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
-- 
2.14.2
