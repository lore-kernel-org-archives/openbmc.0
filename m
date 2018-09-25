Return-Path: <prvs=2806881923=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2806881923=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="i62cF+ay"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42K1dW6SMTzF3Hw
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 10:08:59 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8P08EA1011255
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 17:08:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=00Qac88hoLJVtprDV5eE5p7mEDuOcvqN6q5s4wJSFXk=;
 b=i62cF+ayWKcdFSBGjJBrYvKh8hoSzEuEDPCqawVFlnOqrpBkZQ0b9hPefBhqanR+wyPE
 a8n+OpHoemdjc0RL9jKEVzESVfG/895gNbv/+XwNJ5Hb4t1l/zTcmn5bGPYA/mqlxVZZ
 N8JF9th1ynNVU4vjHEIi0T3iof8lIyo78S4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mq8690ddt-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 17:08:57 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.19) with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 24 Sep
 2018 17:08:55 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 83E271A13CA1; Mon, 24 Sep 2018 17:08:51 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: "linux-aspeed @ lists . ozlabs . org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, Amithash Prasad <amithash@fb.com>
CC: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Date: Mon, 24 Sep 2018 17:08:40 -0700
Message-ID: <20180925000840.4111212-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-24_15:, , signatures=0
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
X-List-Received-Date: Tue, 25 Sep 2018 00:09:04 -0000

This patch adds OEM command to get mac address from NCSI device and and
configure the same to the network card.

ncsi_cmd_arg - Modified this structure to include bigger payload data.
ncsi_cmd_handler_oem: This function handles oem command request
ncsi_rsp_handler_oem: This function handles response for OEM command.
get_mac_address_oem_mlx: This function will send OEM command to get
mac address for Mellanox card
set_mac_affinity_mlx: This will send OEM command to set Mac affinity
for Mellanox card

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/Kconfig       |  3 ++
 net/ncsi/internal.h    | 11 +++++--
 net/ncsi/ncsi-cmd.c    | 24 +++++++++++++--
 net/ncsi/ncsi-manage.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 net/ncsi/ncsi-pkt.h    | 16 ++++++++++
 net/ncsi/ncsi-rsp.c    | 33 +++++++++++++++++++-
 6 files changed, 149 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
index 08a8a6031fd7..b8bf89fea7c8 100644
--- a/net/ncsi/Kconfig
+++ b/net/ncsi/Kconfig
@@ -10,3 +10,6 @@ config NET_NCSI
 	  support. Enable this only if your system connects to a network
 	  device via NCSI and the ethernet driver you're using supports
 	  the protocol explicitly.
+config NCSI_OEM_CMD_GET_MAC
+	bool "Get NCSI OEM MAC Address"
+	depends on NET_NCSI
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 8055e3965cef..da17958e6a4b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -68,6 +68,10 @@ enum {
 	NCSI_MODE_MAX
 };
 
+#define NCSI_OEM_MFR_MLX_ID             0x8119
+#define NCSI_OEM_MLX_CMD_GET_MAC        0x1b00
+#define NCSI_OEM_MLX_CMD_SET_AFFINITY   0x010700
+
 struct ncsi_channel_version {
 	u32 version;		/* Supported BCD encoded NCSI version */
 	u32 alpha2;		/* Supported BCD encoded NCSI version */
@@ -236,6 +240,7 @@ enum {
 	ncsi_dev_state_probe_dp,
 	ncsi_dev_state_config_sp	= 0x0301,
 	ncsi_dev_state_config_cis,
+	ncsi_dev_state_config_oem_gma,
 	ncsi_dev_state_config_clear_vids,
 	ncsi_dev_state_config_svf,
 	ncsi_dev_state_config_ev,
@@ -301,9 +306,9 @@ struct ncsi_cmd_arg {
 	unsigned short       payload;     /* Command packet payload length */
 	unsigned int         req_flags;   /* NCSI request properties       */
 	union {
-		unsigned char  bytes[16]; /* Command packet specific data  */
-		unsigned short words[8];
-		unsigned int   dwords[4];
+		unsigned char  bytes[64]; /* Command packet specific data  */
+		unsigned short words[32];
+		unsigned int   dwords[16];
 	};
 };
 
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 7567ca63aae2..3205e22c1734 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -211,6 +211,25 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
 	return 0;
 }
 
+static int ncsi_cmd_handler_oem(struct sk_buff *skb,
+				struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_oem_pkt *cmd;
+	unsigned int len;
+
+	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
+	if (nca->payload < 26)
+		len += 26;
+	else
+		len += nca->payload;
+
+	cmd = skb_put_zero(skb, len);
+	memcpy(cmd->data, nca->bytes, nca->payload);
+	ncsi_cmd_build_header(&cmd->cmd.common, nca);
+
+	return 0;
+}
+
 static struct ncsi_cmd_handler {
 	unsigned char type;
 	int           payload;
@@ -244,7 +263,7 @@ static struct ncsi_cmd_handler {
 	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
+	{ NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
 	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
 	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
 };
@@ -317,7 +336,8 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	}
 
 	/* Get packet payload length and allocate the request */
-	nca->payload = nch->payload;
+	if (nch->payload >= 0)
+		nca->payload = nch->payload;
 	nr = ncsi_alloc_command(nca);
 	if (!nr)
 		return -ENOMEM;
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 091284760d21..3b2b86560cc8 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -635,6 +635,58 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+/* NCSI Facebook OEM APIs */
+static void get_mac_address_oem_mlx(struct ncsi_dev_priv *ndp)
+{
+	struct ncsi_cmd_arg nca;
+	int ret = 0;
+
+	memset(&nca, 0, sizeof(struct ncsi_cmd_arg));
+	nca.ndp = ndp;
+	nca.channel = ndp->active_channel->id;
+	nca.package = ndp->active_package->id;
+	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
+	nca.type = NCSI_PKT_CMD_OEM;
+	nca.payload = 8;
+
+	nca.dwords[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
+	nca.dwords[1] = ntohl(NCSI_OEM_MLX_CMD_GET_MAC);
+
+	ret = ncsi_xmit_cmd(&nca);
+	if (ret)
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: Failed to transmit cmd 0x%x during probe\n",
+			   nca.type);
+}
+
+static void set_mac_affinity_mlx(struct ncsi_dev_priv *ndp)
+{
+	struct ncsi_cmd_arg nca;
+	int ret = 0;
+
+	memset(&nca, 0, sizeof(struct ncsi_cmd_arg));
+	nca.ndp = ndp;
+	nca.channel = ndp->active_channel->id;
+	nca.package = ndp->active_package->id;
+	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
+	nca.type = NCSI_PKT_CMD_OEM;
+	nca.payload = 60;
+
+	nca.dwords[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
+	nca.dwords[1] = ntohl(NCSI_OEM_MLX_CMD_SET_AFFINITY);
+
+	memcpy(&(nca.bytes[8]), ndp->ndev.dev->dev_addr, ETH_ALEN);
+	nca.bytes[14] = 0x09;
+
+	ret = ncsi_xmit_cmd(&nca);
+	if (ret)
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: Failed to transmit cmd 0x%x during probe\n",
+				   nca.type);
+}
+#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
+
 static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
@@ -685,6 +737,22 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		}
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+		/* Check Manufacture id if it is Mellanox then
+		 * get and set mac address. To Do: Add code for
+		 * other types of card if required
+		 */
+		if (nc->version.mf_id == NCSI_OEM_MFR_MLX_ID)
+			nd->state = ncsi_dev_state_config_oem_gma;
+		else
+			nd->state = ncsi_dev_state_config_clear_vids;
+		break;
+	case ncsi_dev_state_config_oem_gma:
+		ndp->pending_req_num = 2;
+		get_mac_address_oem_mlx(ndp);
+		msleep(500);
+		set_mac_affinity_mlx(ndp);
+#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
 		nd->state = ncsi_dev_state_config_clear_vids;
 		break;
 	case ncsi_dev_state_config_clear_vids:
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index 91b4b66438df..0653a893eb12 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -151,6 +151,22 @@ struct ncsi_cmd_snfc_pkt {
 	unsigned char           pad[22];
 };
 
+/* Oem Request Command */
+struct ncsi_cmd_oem_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
+	unsigned char           data[64];    /* OEM Payload Data  */
+	__be32                  checksum;    /* Checksum          */
+};
+
+/* Oem Response Packet */
+struct ncsi_rsp_oem_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;         /* Command header    */
+	__be32                  mfr_id;      /* Manufacture ID    */
+	__be32                  oem_cmd;     /* oem command       */
+	unsigned char           data[32];    /* Payload data      */
+	__be32                  checksum;    /* Checksum          */
+};
+
 /* Get Link Status */
 struct ncsi_rsp_gls_pkt {
 	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 930c1d3796f0..3b94c96b9c7f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -596,6 +596,37 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
 	return 0;
 }
 
+static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
+{
+	struct ncsi_rsp_oem_pkt *rsp;
+	struct ncsi_dev_priv *ndp = nr->ndp;
+	struct net_device *ndev = ndp->ndev.dev;
+	int ret = 0;
+	unsigned int oem_cmd, mfr_id;
+	const struct net_device_ops *ops = ndev->netdev_ops;
+	struct sockaddr saddr;
+
+	/* Get the response header */
+	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
+
+	oem_cmd = ntohl(rsp->oem_cmd);
+	mfr_id = ntohl(rsp->mfr_id);
+
+	/* Check for Mellanox manufacturer id */
+	if (mfr_id != NCSI_OEM_MFR_MLX_ID)
+		return 0;
+
+	if (oem_cmd == NCSI_OEM_MLX_CMD_GET_MAC) {
+		saddr.sa_family = ndev->type;
+		ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
+		memcpy(saddr.sa_data, &(rsp->data[4]), ETH_ALEN);
+		ret = ops->ndo_set_mac_address(ndev, &saddr);
+		if (ret < 0)
+			netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
+	}
+	return ret;
+}
+
 static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)
 {
 	struct ncsi_rsp_gvi_pkt *rsp;
@@ -932,7 +963,7 @@ static struct ncsi_rsp_handler {
 	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
 	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
 	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
-	{ NCSI_PKT_RSP_OEM,     0, NULL                     },
+	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
 	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
 	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
 };
-- 
2.17.1
