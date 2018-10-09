Return-Path: <prvs=3820f8e5cb=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3820f8e5cb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mbTFM3qJ"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V4Tz3cjVzF3ND
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 04:48:52 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w99HhdAT011961
 for <openbmc@lists.ozlabs.org>; Tue, 9 Oct 2018 10:48:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=IXl8b/pb5ZwLHCqDtKpx9KnNaGD49JpuxYOKDI5ELAg=;
 b=mbTFM3qJpfXqxvz3jkgzb+jlsRB/k8k+t+h7iNKH0vWiwfnOJt81V8Qnwzo7LQXH2E+B
 1PCsE1fH5+A07XjbSG5+cvhTkbf+cDNw4muVpZyz0H5SVEmRD0cjOb6l7QHEXE2JMhKK
 ps2EGyJt2yREjVcf9JUhf/zqx4pL5X3tZ4E= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n0xqj8mvh-12
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 10:48:49 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.11) with Microsoft SMTP Server (TLS) id 14.3.361.1; Tue, 9 Oct
 2018 10:48:46 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 07DEC253530D; Tue,  9 Oct 2018 10:48:46 -0700 (PDT)
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
Subject: [PATCH v2 2/2] net/ncsi: Add NCSI Mellanox OEM command
Date: Tue, 9 Oct 2018 10:48:06 -0700
Message-ID: <20181009174806.404791-2-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181009174806.404791-1-vijaykhemka@fb.com>
References: <20181009174806.404791-1-vijaykhemka@fb.com>
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
X-List-Received-Date: Tue, 09 Oct 2018 17:48:56 -0000

This patch adds OEM Mellanox commands and response handling. It also
defines OEM Get MAC Address handler to get and configure the device.

ncsi_oem_gma_handler_mlx: This handler send NCSI mellanox command for
getting mac address.
ncsi_rsp_handler_oem_mlx: This handles response received for all
mellanox OEM commands.
ncsi_rsp_handler_oem_mlx_gma: This handles get mac address response and
set it to device.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/internal.h    |  5 +++++
 net/ncsi/ncsi-manage.c | 24 +++++++++++++++++++++++-
 net/ncsi/ncsi-pkt.h    |  9 +++++++++
 net/ncsi/ncsi-rsp.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 45883b32790e..d4558628a991 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -73,10 +73,15 @@ enum {
 #define NCSI_OEM_MFR_BCM_ID             0x113d
 /* Broadcom specific OEM Command */
 #define NCSI_OEM_BCM_CMD_GMA            0x01   /* CMD ID for Get MAC */
+/* Mellanox specific OEM Command */
+#define NCSI_OEM_MLX_CMD_GMA            0x00   /* CMD ID for Get MAC */
+#define NCSI_OEM_MLX_CMD_GMA_PARAM      0x1b   /* Parameter for GMA  */
 /* OEM Command payload lengths*/
 #define NCSI_OEM_BCM_CMD_GMA_LEN        12
+#define NCSI_OEM_MLX_CMD_GMA_LEN        8
 /* Mac address offset in OEM response */
 #define BCM_MAC_ADDR_OFFSET             28
+#define MLX_MAC_ADDR_OFFSET             8
 
 
 struct ncsi_channel_version {
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index e5bfd9245b5d..38aef27d2e67 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -658,12 +658,34 @@ static void ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
 			   nca->type);
 }
 
+static void ncsi_oem_gma_handler_mlx(struct ncsi_cmd_arg *nca)
+{
+	int ret = 0;
+	unsigned char data[NCSI_OEM_MLX_CMD_GMA_LEN];
+
+	nca->payload = NCSI_OEM_MLX_CMD_GMA_LEN;
+
+	memset(data, 0, NCSI_OEM_MLX_CMD_GMA_LEN);
+	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_MLX_ID);
+	data[5] = NCSI_OEM_MLX_CMD_GMA;
+	data[6] = NCSI_OEM_MLX_CMD_GMA_PARAM;
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
 /* OEM Command handlers initialization */
 static struct ncsi_oem_gma_handler {
 	unsigned int	mfr_id;
 	void		(*handler)(struct ncsi_cmd_arg *nca);
 } ncsi_oem_gma_handlers[] = {
-	{ NCSI_OEM_MFR_BCM_ID, ncsi_oem_gma_handler_bcm }
+	{ NCSI_OEM_MFR_BCM_ID, ncsi_oem_gma_handler_bcm },
+	{ NCSI_OEM_MFR_MLX_ID, ncsi_oem_gma_handler_mlx }
 };
 
 #endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index 4d3f06be38bd..2a6d83a596c9 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -165,6 +165,15 @@ struct ncsi_rsp_oem_pkt {
 	unsigned char           data[];      /* Payload data      */
 };
 
+/* Mellanox Response Data */
+struct ncsi_rsp_oem_mlx_pkt {
+	unsigned char           cmd_rev;     /* Command Revision  */
+	unsigned char           cmd;         /* Command ID        */
+	unsigned char           param;       /* Parameter         */
+	unsigned char           optional;    /* Optional data     */
+	unsigned char           data[];      /* Data              */
+};
+
 /* Broadcom Response Data */
 struct ncsi_rsp_oem_bcm_pkt {
 	unsigned char           ver;         /* Payload Version   */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 31672e967db2..b18efa23faa2 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -596,6 +596,45 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
 	return 0;
 }
 
+/* Response handler for Mellanox command Get Mac Address */
+static int ncsi_rsp_handler_oem_mlx_gma(struct ncsi_request *nr)
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
+	memcpy(saddr.sa_data, &rsp->data[MLX_MAC_ADDR_OFFSET], ETH_ALEN);
+	ret = ops->ndo_set_mac_address(ndev, &saddr);
+	if (ret < 0)
+		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
+
+	return ret;
+}
+
+/* Response handler for Mellanox card */
+static int ncsi_rsp_handler_oem_mlx(struct ncsi_request *nr)
+{
+	struct ncsi_rsp_oem_pkt *rsp;
+	struct ncsi_rsp_oem_mlx_pkt *mlx;
+
+	/* Get the response header */
+	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
+	mlx = (struct ncsi_rsp_oem_mlx_pkt *)(rsp->data);
+
+	if (mlx->cmd == NCSI_OEM_MLX_CMD_GMA &&
+	    mlx->param == NCSI_OEM_MLX_CMD_GMA_PARAM)
+		return ncsi_rsp_handler_oem_mlx_gma(nr);
+	return 0;
+}
+
 /* Response handler for Broadcom command Get Mac Address */
 static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 {
@@ -638,7 +677,7 @@ static struct ncsi_rsp_oem_handler {
 	unsigned int	mfr_id;
 	int		(*handler)(struct ncsi_request *nr);
 } ncsi_rsp_oem_handlers[] = {
-	{ NCSI_OEM_MFR_MLX_ID, NULL },
+	{ NCSI_OEM_MFR_MLX_ID, ncsi_rsp_handler_oem_mlx },
 	{ NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
 };
 
-- 
2.17.1
