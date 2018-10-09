Return-Path: <prvs=3820f8e5cb=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3820f8e5cb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ClSRW/Fk"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V4Ty2PgFzF3NB
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 04:48:49 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w99Hgq8Y004371
 for <openbmc@lists.ozlabs.org>; Tue, 9 Oct 2018 10:48:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=dWtv9JNUEA+fA/q/CFIa2NUKt+2ezutNPscmdRHkfOs=;
 b=ClSRW/FkETuurKAaJ2EhX0WN5UNy4dJDK9I97s2AwBPrgFVKTUW26Suq8uN4ADyYjUDj
 k96RwmigogTFxFxSIfkUhPXyzrXtzcHOxyRhq8s+ALMsbP2sv82i3D8MeYeAmzyONrug
 pxBiDXblofNpW23v9VAYdInxubGmqOZGzfg= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n10v081xh-6
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 10:48:47 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.14) with Microsoft SMTP Server (TLS) id 14.3.361.1; Tue, 9 Oct
 2018 10:48:46 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 9CA9C253530B; Tue,  9 Oct 2018 10:48:45 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <vijaykhemka@fb.com>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>, <Justin.Lee1@Dell.com>, <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2 1/2] net/ncsi: Add NCSI Broadcom OEM command
Date: Tue, 9 Oct 2018 10:48:05 -0700
Message-ID: <20181009174806.404791-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-09_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Tue, 09 Oct 2018 17:48:55 -0000

This patch adds OEM Broadcom commands and response handling. It also
defines OEM Get MAC Address handler to get and configure the device.

ncsi_oem_gma_handler_bcm: This handler send NCSI broadcom command for
getting mac address.
ncsi_rsp_handler_oem_bcm: This handles response received for all
broadcom OEM commands.
ncsi_rsp_handler_oem_bcm_gma: This handles get mac address response and
set it to device.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/Kconfig       |  6 ++++
 net/ncsi/internal.h    |  8 +++++
 net/ncsi/ncsi-manage.c | 70 +++++++++++++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-pkt.h    |  8 +++++
 net/ncsi/ncsi-rsp.c    | 40 +++++++++++++++++++++++-
 5 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
index 08a8a6031fd7..7f2b46108a24 100644
--- a/net/ncsi/Kconfig
+++ b/net/ncsi/Kconfig
@@ -10,3 +10,9 @@ config NET_NCSI
 	  support. Enable this only if your system connects to a network
 	  device via NCSI and the ethernet driver you're using supports
 	  the protocol explicitly.
+config NCSI_OEM_CMD_GET_MAC
+	bool "Get NCSI OEM MAC Address"
+	depends on NET_NCSI
+	---help---
+	  This allows to get MAC address from NCSI firmware and set them back to
+		controller.
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 3d0a33b874f5..45883b32790e 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -71,6 +71,13 @@ enum {
 /* OEM Vendor Manufacture ID */
 #define NCSI_OEM_MFR_MLX_ID             0x8119
 #define NCSI_OEM_MFR_BCM_ID             0x113d
+/* Broadcom specific OEM Command */
+#define NCSI_OEM_BCM_CMD_GMA            0x01   /* CMD ID for Get MAC */
+/* OEM Command payload lengths*/
+#define NCSI_OEM_BCM_CMD_GMA_LEN        12
+/* Mac address offset in OEM response */
+#define BCM_MAC_ADDR_OFFSET             28
+
 
 struct ncsi_channel_version {
 	u32 version;		/* Supported BCD encoded NCSI version */
@@ -240,6 +247,7 @@ enum {
 	ncsi_dev_state_probe_dp,
 	ncsi_dev_state_config_sp	= 0x0301,
 	ncsi_dev_state_config_cis,
+	ncsi_dev_state_config_oem_gma,
 	ncsi_dev_state_config_clear_vids,
 	ncsi_dev_state_config_svf,
 	ncsi_dev_state_config_ev,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 091284760d21..e5bfd9245b5d 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -635,6 +635,39 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+
+/* NCSI OEM Command APIs */
+static void ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
+{
+	int ret = 0;
+	unsigned char data[NCSI_OEM_BCM_CMD_GMA_LEN];
+
+	nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
+
+	memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
+	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
+	data[5] = NCSI_OEM_BCM_CMD_GMA;
+
+	nca->data = data;
+
+	ret = ncsi_xmit_cmd(nca);
+	if (ret)
+		netdev_err(nca->ndp->ndev.dev,
+			   "NCSI: Failed to transmit cmd 0x%x during configure\n",
+			   nca->type);
+}
+
+/* OEM Command handlers initialization */
+static struct ncsi_oem_gma_handler {
+	unsigned int	mfr_id;
+	void		(*handler)(struct ncsi_cmd_arg *nca);
+} ncsi_oem_gma_handlers[] = {
+	{ NCSI_OEM_MFR_BCM_ID, ncsi_oem_gma_handler_bcm }
+};
+
+#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
+
 static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
@@ -643,9 +676,10 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	struct ncsi_channel *nc = ndp->active_channel;
 	struct ncsi_channel *hot_nc = NULL;
 	struct ncsi_cmd_arg nca;
+	struct ncsi_oem_gma_handler *nch = NULL;
 	unsigned char index;
 	unsigned long flags;
-	int ret;
+	int ret, i;
 
 	nca.ndp = ndp;
 	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
@@ -685,6 +719,40 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		}
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+		nd->state = ncsi_dev_state_config_oem_gma;
+		break;
+	case ncsi_dev_state_config_oem_gma:
+		nca.type = NCSI_PKT_CMD_OEM;
+		nca.package = np->id;
+		nca.channel = nc->id;
+		ndp->pending_req_num = 1;
+
+		/* Check for manufacturer id and Find the handler */
+		for (i = 0; i < ARRAY_SIZE(ncsi_oem_gma_handlers); i++) {
+			if (ncsi_oem_gma_handlers[i].mfr_id ==
+					nc->version.mf_id) {
+				if (ncsi_oem_gma_handlers[i].handler)
+					nch = &ncsi_oem_gma_handlers[i];
+				else
+					nch = NULL;
+
+				break;
+			}
+		}
+
+		if (!nch) {
+			netdev_err(ndp->ndev.dev, "No handler available for GMA with MFR-ID (0x%x)\n",
+				   nc->version.mf_id);
+			nd->state = ncsi_dev_state_config_clear_vids;
+			schedule_work(&ndp->work);
+			break;
+		}
+
+		/* Get Mac address from NCSI device */
+		nch->handler(&nca);
+#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
+
 		nd->state = ncsi_dev_state_config_clear_vids;
 		break;
 	case ncsi_dev_state_config_clear_vids:
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index 0f2087c8d42a..4d3f06be38bd 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -165,6 +165,14 @@ struct ncsi_rsp_oem_pkt {
 	unsigned char           data[];      /* Payload data      */
 };
 
+/* Broadcom Response Data */
+struct ncsi_rsp_oem_bcm_pkt {
+	unsigned char           ver;         /* Payload Version   */
+	unsigned char           type;        /* OEM Command type  */
+	__be16                  len;         /* Payload Length    */
+	unsigned char           data[];      /* Cmd specific Data */
+};
+
 /* Get Link Status */
 struct ncsi_rsp_gls_pkt {
 	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index d66b34749027..31672e967db2 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -596,12 +596,50 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
 	return 0;
 }
 
+/* Response handler for Broadcom command Get Mac Address */
+static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
+{
+	struct ncsi_rsp_oem_pkt *rsp;
+	struct ncsi_dev_priv *ndp = nr->ndp;
+	struct net_device *ndev = ndp->ndev.dev;
+	int ret = 0;
+	const struct net_device_ops *ops = ndev->netdev_ops;
+	struct sockaddr saddr;
+
+	/* Get the response header */
+	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
+
+	saddr.sa_family = ndev->type;
+	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
+	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
+	ret = ops->ndo_set_mac_address(ndev, &saddr);
+	if (ret < 0)
+		netdev_warn(ndev, "NCSI: Writing mac address to device failed\n");
+
+	return ret;
+}
+
+/* Response handler for Broadcom card */
+static int ncsi_rsp_handler_oem_bcm(struct ncsi_request *nr)
+{
+	struct ncsi_rsp_oem_pkt *rsp;
+	struct ncsi_rsp_oem_bcm_pkt *bcm;
+
+	/* Get the response header */
+	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
+	bcm = (struct ncsi_rsp_oem_bcm_pkt *)(rsp->data);
+
+	if (bcm->type == NCSI_OEM_BCM_CMD_GMA)
+		return ncsi_rsp_handler_oem_bcm_gma(nr);
+	return 0;
+}
+
 static struct ncsi_rsp_oem_handler {
 	unsigned int	mfr_id;
 	int		(*handler)(struct ncsi_request *nr);
 } ncsi_rsp_oem_handlers[] = {
 	{ NCSI_OEM_MFR_MLX_ID, NULL },
-	{ NCSI_OEM_MFR_BCM_ID, NULL }
+	{ NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
 };
 
 /* Response handler for OEM command */
-- 
2.17.1
