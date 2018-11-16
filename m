Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="OF44VP7E"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iK4omNfn"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42x5Sz70tKzF3c9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 15:52:51 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 66D4D21F37;
 Thu, 15 Nov 2018 23:52:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 15 Nov 2018 23:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm1; bh=7zGaLz7HQK8HBIwdkfhpaWhqIglc54Ism5j6RhMgnwA=; b=OF44V
 P7EQ9w/GP+TWN+ITypX13MdJs7V6HJFcjZgyoBpW6fr0RF4Z/+J0b2c1OSL2QA0P
 GH1K+4in+A5YY93biwKNDXpoH6KcKJ0ac0fa+Q/iJcOpxTNTWePIBAqW7TlhVopq
 FnzhkgUxTnlbO2B8n23umZJc96nlowm9ksl2p7/25cUrjfS/EALEXgdoYrm/OG50
 DVPYpeombD5Y/aIdU1Ee2pecAuARKLwKzoJiwxQ8BKA1e47azuH287cswxIAa5in
 UP82HTkfKqLdkj1G32HJipQQDOmNV7oSdPap3prxFHQb1limb2wYY83eCKz0ULvV
 h0CWf561Z7X6nbLbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7zGaLz7HQK8HBIwdkfhpaWhqIglc54Ism5j6RhMgnwA=; b=iK4omNfn
 Dfch/s04meLyzUFkXhfzgQN24GcJyxBDj7a4iQu2hYapPHew8SBOFme6hU8Km0gB
 brUmm/HSn8oHfqErJ5CG7N3WZX4sE2Ghx9dhhKW/IFoUWJrAYquhHXfoLhBf7X7O
 DnXPt8v5nYNAC2qa/gX9zjrZ9zhAtvENiNEnQgJmkX2SQy4O27983+XAfbc8wq1k
 +6jP8W6DVuTNAnJg9hJ+CB8Kh+NJhyfv7lL2M89bhmGZyP6253rh/DrOGwMB+SB0
 TlmZNDVUxtBrvb/PDnGnYGsuGvMNtxSVsIBT1sEtjaijns0v7KN4PpzHmDO+uN8d
 1rSzfuzKapr5Pg==
X-ME-Sender: <xms:IU3uW6_ozBl3Ify56HJVvLZReS5lW9AT-c4g0Zb29Tjy2YJl1YMWuQ>
X-ME-Proxy: <xmx:IU3uW7qJB-9LiKg7zduMg-hhROatAdwr6KALKjVZIKdtjzkL4VhO6A>
 <xmx:IU3uW7JW9RXr1Ki6FEXsUFq2yQZYMeBQPYumD1C0DIBSMna6Ubaejg>
 <xmx:IU3uW3SncDigmCHl8abj1VyniRGZTSGoHcebbeSXL-EMxGSuo3nWkQ>
 <xmx:IU3uWzOS8v5r9Nyx6KWwsph4c4oU-f99LxKUZvAeewmDtuSLY5zPww>
 <xmx:IU3uW0WQENA3g5xJNe-nYEGukzTP1Iqwdzv-AFdQv_50JarqP-gu2w>
 <xmx:IU3uW4rfc9UfZwlSRZ0ZHKnn_PZmmv4W-Ekce6hOKOl5YwayPcmDBA>
Received: from v4.ibm.com (unknown [1.144.189.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA76EE46B7;
 Thu, 15 Nov 2018 23:52:45 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v4 3/6] net/ncsi: Don't deselect package in suspend
 if active
Date: Fri, 16 Nov 2018 15:51:56 +1100
Message-Id: <20181116045159.4980-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181116045159.4980-1-sam@mendozajonas.com>
References: <20181116045159.4980-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 04:52:53 -0000

When a package is deselected all channels of that package cease
communication. If there are other channels active on the package of the
suspended channel this will disable them as well, so only send a
deselect-package command if no other channels are active.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-manage.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 02421d1a22c9..b8b4e765a04c 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -440,12 +440,14 @@ static void ncsi_request_timeout(struct timer_list *t)
 static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
-	struct ncsi_package *np = ndp->active_package;
-	struct ncsi_channel *nc = ndp->active_channel;
+	struct ncsi_package *np;
+	struct ncsi_channel *nc, *tmp;
 	struct ncsi_cmd_arg nca;
 	unsigned long flags;
 	int ret;
 
+	np = ndp->active_package;
+	nc = ndp->active_channel;
 	nca.ndp = ndp;
 	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
@@ -521,6 +523,15 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 		if (ret)
 			goto error;
 
+		NCSI_FOR_EACH_CHANNEL(np, tmp) {
+			/* If there is another channel active on this package
+			 * do not deselect the package.
+			 */
+			if (tmp != nc && tmp->state == NCSI_CHANNEL_ACTIVE) {
+				nd->state = ncsi_dev_state_suspend_done;
+				break;
+			}
+		}
 		break;
 	case ncsi_dev_state_suspend_deselect:
 		ndp->pending_req_num = 1;
-- 
2.19.1
