Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="BiSCifnh"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nWw7Dfi0"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42fnDc3vcFzF37V
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 08:52:32 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E9FE21D2E;
 Tue, 23 Oct 2018 17:52:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 23 Oct 2018 17:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm1; bh=7W0VcgALKhYXIlM256CF/0000ncfHR1JakXeDbUtSLw=; b=BiSCi
 fnhTk5yyeqSFICiEMa4drhB/qZ9Qla5X7O5HWaCJ2yT0CHmgo911QhR+7aFRc8Lu
 wOegKJbpGroSlbpkQeGJTpUgs20TPFx+pAfw60mHzn03PdPWMvWA64QA70U26c6K
 0se+m/HZzQsV5/tHGJgbgm0mCuuFdId9ff/9jY5ozbUPIw+9N8JPvJoTRnB/UiQi
 c0rM3n/r9b7/b8/Uja8nc3ZjmTN7bbrdKPU3qjyMil5VzNutmT9myMbdVTGAxjb5
 nSgT3n6qa9blV5L6s0DAs9Nzii/3qciagDQpnmpEBwwl2UtSmIQkpemMrZIefd5o
 mw5oBHzldXIYOcrxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7W0VcgALKhYXIlM256CF/0000ncfHR1JakXeDbUtSLw=; b=nWw7Dfi0
 4R2kIr32JrzR9wLRS/NkJ3ybhpmau99IJymrfEGDOju/p4HPtT/ydsPA0+rQl/Kt
 HFK1Qauihtd0AyKh4w9vppwV25NlwyJ0wCAXMG/OuIOLXFy0fiTlxg9CwxZJY5gv
 98kuMrSlemCxgatgXu5K4dPK7aBzQGwSOR9/0VePdfcw2tdzcd+wcES0W6Rzt3Ek
 myoKP5Si24PjFOp7vhZKbkP4sjQkgn+zrqKGL0DARwtpwMSiV1Sx8tJAvYDdoyKL
 a294NVPeiWURfWmoox/+/+ESAajU+PhZekvuk3amOdcxzuLtT/y/vl5l44baWHXh
 Cujc0Ike0Lzs5A==
X-ME-Sender: <xms:HZjPW7gE9V5WXxeItsvRY_kBo_Vk1V8_uERQfdH6jOWxFwdEPkqsIA>
X-ME-Proxy: <xmx:HZjPWynqf8hWfsXK7k5xp4x39WUEOPFb8174zDrIsgbIbpAzljTZ_Q>
 <xmx:HZjPWyqXXTVQWkeaGan_knXJ5yUflpuA4287NIHkjPklaXFKzGQhDg>
 <xmx:HZjPWx_KMjNIM_dfQZAsvW1nuqKJ5dq15PisC8DeA2O54CPZu38eJQ>
 <xmx:HZjPW73t-j8jZmEAobnqnQCJ8YQgaDcKC_Phx7LGrLhwJzoAIM7Hnw>
 <xmx:HZjPW0mvZmqq_NxusnLyXHbFWVUKAbiB1GSlR-9_RK4huBTdmKyY0Q>
 <xmx:HpjPWxHrgIyfmlhtoStLis86iIpA-QmyYYj3ScUdJS90r1yPwIG-xQ>
Received: from v4.ibm.com (unknown [158.140.225.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 391C6102F8;
 Tue, 23 Oct 2018 17:52:26 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v2 2/6] net/ncsi: Probe single packages to avoid
 conflict
Date: Wed, 24 Oct 2018 10:51:57 +1300
Message-Id: <20181023215201.27315-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181023215201.27315-1-sam@mendozajonas.com>
References: <20181023215201.27315-1-sam@mendozajonas.com>
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
X-List-Received-Date: Tue, 23 Oct 2018 21:52:35 -0000

Currently the NCSI driver sends a select-package command to all possible
packages simultaneously to discover what packages are available. However
at this stage in the probe process the driver does not know if
hardware arbitration is available: if it isn't then this process could
cause collisions on the RMII bus when packages try to respond.

Update the probe loop to probe each package one by one, and once
complete check if HWA is universally supported.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 88 ++++++++++++++----------------------------
 2 files changed, 31 insertions(+), 58 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 1dae77c54009..ec65778c41f3 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -292,6 +292,7 @@ struct ncsi_dev_priv {
 #if IS_ENABLED(CONFIG_IPV6)
 	unsigned int        inet6_addr_num;  /* Number of IPv6 addresses   */
 #endif
+	unsigned int        package_probe_id;/* Current ID during probe    */
 	unsigned int        package_num;     /* Number of packages         */
 	struct list_head    packages;        /* List of packages           */
 	struct ncsi_channel *hot_channel;    /* Channel was ever active    */
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 4da051f90974..6c62aae10205 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1079,70 +1079,28 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		nd->state = ncsi_dev_state_probe_package;
 		break;
 	case ncsi_dev_state_probe_package:
-		ndp->pending_req_num = 16;
+		ndp->pending_req_num = 1;
 
-		/* Select all possible packages */
 		nca.type = NCSI_PKT_CMD_SP;
 		nca.bytes[0] = 1;
+		nca.package = ndp->package_probe_id;
 		nca.channel = NCSI_RESERVED_CHANNEL;
-		for (index = 0; index < 8; index++) {
-			nca.package = index;
-			ret = ncsi_xmit_cmd(&nca);
-			if (ret)
-				goto error;
-		}
-
-		/* Disable all possible packages */
-		nca.type = NCSI_PKT_CMD_DP;
-		for (index = 0; index < 8; index++) {
-			nca.package = index;
-			ret = ncsi_xmit_cmd(&nca);
-			if (ret)
-				goto error;
-		}
-
+		ret = ncsi_xmit_cmd(&nca);
+		if (ret)
+			goto error;
 		nd->state = ncsi_dev_state_probe_channel;
 		break;
 	case ncsi_dev_state_probe_channel:
-		if (!ndp->active_package)
-			ndp->active_package = list_first_or_null_rcu(
-				&ndp->packages, struct ncsi_package, node);
-		else if (list_is_last(&ndp->active_package->node,
-				      &ndp->packages))
-			ndp->active_package = NULL;
-		else
-			ndp->active_package = list_next_entry(
-				ndp->active_package, node);
-
-		/* All available packages and channels are enumerated. The
-		 * enumeration happens for once when the NCSI interface is
-		 * started. So we need continue to start the interface after
-		 * the enumeration.
-		 *
-		 * We have to choose an active channel before configuring it.
-		 * Note that we possibly don't have active channel in extreme
-		 * situation.
-		 */
+		ndp->active_package = ncsi_find_package(ndp,
+							ndp->package_probe_id);
 		if (!ndp->active_package) {
-			ndp->flags |= NCSI_DEV_PROBED;
-			if (ncsi_check_hwa(ndp))
-				ncsi_enable_hwa(ndp);
-			else
-				ncsi_choose_active_channel(ndp);
-			return;
+			/* No response */
+			nd->state = ncsi_dev_state_probe_dp;
+			schedule_work(&ndp->work);
+			break;
 		}
-
-		/* Select the active package */
-		ndp->pending_req_num = 1;
-		nca.type = NCSI_PKT_CMD_SP;
-		nca.bytes[0] = 1;
-		nca.package = ndp->active_package->id;
-		nca.channel = NCSI_RESERVED_CHANNEL;
-		ret = ncsi_xmit_cmd(&nca);
-		if (ret)
-			goto error;
-
 		nd->state = ncsi_dev_state_probe_cis;
+		schedule_work(&ndp->work);
 		break;
 	case ncsi_dev_state_probe_cis:
 		ndp->pending_req_num = NCSI_RESERVED_CHANNEL;
@@ -1191,22 +1149,35 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_probe_dp:
 		ndp->pending_req_num = 1;
 
-		/* Deselect the active package */
+		/* Deselect the current package */
 		nca.type = NCSI_PKT_CMD_DP;
-		nca.package = ndp->active_package->id;
+		nca.package = ndp->package_probe_id;
 		nca.channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
 		if (ret)
 			goto error;
 
-		/* Scan channels in next package */
-		nd->state = ncsi_dev_state_probe_channel;
+		/* Probe next package */
+		ndp->package_probe_id++;
+		if (ndp->package_probe_id >= 8) {
+			/* Probe finished */
+			ndp->flags |= NCSI_DEV_PROBED;
+			break;
+		}
+		nd->state = ncsi_dev_state_probe_package;
+		ndp->active_package = NULL;
 		break;
 	default:
 		netdev_warn(nd->dev, "Wrong NCSI state 0x%0x in enumeration\n",
 			    nd->state);
 	}
 
+	if (ndp->flags & NCSI_DEV_PROBED) {
+		/* Check if all packages have HWA support */
+		ncsi_check_hwa(ndp);
+		ncsi_choose_active_channel(ndp);
+	}
+
 	return;
 error:
 	netdev_err(ndp->ndev.dev,
@@ -1567,6 +1538,7 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return -ENOTTY;
 
 	if (!(ndp->flags & NCSI_DEV_PROBED)) {
+		ndp->package_probe_id = 0;
 		nd->state = ncsi_dev_state_probe;
 		schedule_work(&ndp->work);
 		return 0;
-- 
2.19.1
