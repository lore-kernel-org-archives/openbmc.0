Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG3G3gVNzDqmp
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:26 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANatb141878
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:24 -0400
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23uwt8nrnb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:24 -0400
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 15:58:16 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 15:58:14 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id B1E093940066
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:13 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UAS5NC59572476
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:05 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASA3a030601
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:11 +0530
Received: from gwshan ([9.192.205.20])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u5UAS7Ue030485; Thu, 30 Jun 2016 15:58:08 +0530
Received: by gwshan (Postfix, from userid 1000)
 id 533AB943484; Thu, 30 Jun 2016 20:27:56 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 02/10] net/ncsi: NCSI command packet handler
Date: Thu, 30 Jun 2016 20:27:43 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0052-0000-0000-0000028C586A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0053-0000-0000-00000D2902F5
Message-Id: <1467282471-16560-3-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300099
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 10:28:26 -0000

The NCSI command packets are sent from MC (Management Controller)
to remote end. They are used for multiple purposes: probe existing
NCSI package/channel, retrieve NCSI channel's capability, configure
NCSI channel etc.

This defines struct to represent NCSI command packets and introduces
function ncsi_xmit_cmd(), which will be used to transmit NCSI command
packet according to the request. The request is represented by struct
ncsi_cmd_arg.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 include/uapi/linux/if_ether.h |   1 +
 net/ncsi/Makefile             |   2 +-
 net/ncsi/internal.h           |  18 ++
 net/ncsi/ncsi-cmd.c           | 372 ++++++++++++++++++++++++++++++++++++++++++
 net/ncsi/ncsi-pkt.h           | 168 +++++++++++++++++++
 5 files changed, 560 insertions(+), 1 deletion(-)
 create mode 100644 net/ncsi/ncsi-cmd.c
 create mode 100644 net/ncsi/ncsi-pkt.h

diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index cec849a..7300b2d 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -87,6 +87,7 @@
 #define ETH_P_8021AH	0x88E7          /* 802.1ah Backbone Service Tag */
 #define ETH_P_MVRP	0x88F5          /* 802.1Q MVRP                  */
 #define ETH_P_1588	0x88F7		/* IEEE 1588 Timesync */
+#define ETH_P_NCSI	0x88F8		/* NCSI protocol                */
 #define ETH_P_PRP	0x88FB		/* IEC 62439-3 PRP/HSRv0	*/
 #define ETH_P_FCOE	0x8906		/* Fibre Channel over Ethernet  */
 #define ETH_P_TDLS	0x890D          /* TDLS */
diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
index 07b5625..abc4046 100644
--- a/net/ncsi/Makefile
+++ b/net/ncsi/Makefile
@@ -1,4 +1,4 @@
 #
 # Makefile for NCSI API
 #
-obj-$(CONFIG_NET_NCSI) += ncsi-manage.o
+obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-manage.o
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 4a8bd76..0c51c89 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -217,6 +217,21 @@ struct ncsi_dev_priv {
 	struct list_head    ndp_node;
 };
 
+struct ncsi_cmd_arg {
+	struct ncsi_dev_priv   *nca_ndp;
+	unsigned char          nca_type;
+	unsigned char          nca_id;
+	unsigned char          nca_package;
+	unsigned char          nca_channel;
+	unsigned short         nca_payload;
+	unsigned int           nca_portid;
+	union {
+		unsigned char  nca_bytes[16];
+		unsigned short nca_words[8];
+		unsigned int   nca_dwords[4];
+	};
+};
+
 extern struct list_head ncsi_dev_list;
 extern spinlock_t ncsi_dev_lock;
 
@@ -250,4 +265,7 @@ struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp);
 void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout);
 struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
 
+/* Packet handlers */
+int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca);
+
 #endif /* __NCSI_INTERNAL_H__ */
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
new file mode 100644
index 0000000..c64c437
--- /dev/null
+++ b/net/ncsi/ncsi-cmd.c
@@ -0,0 +1,372 @@
+/*
+ * Copyright Gavin Shan, IBM Corporation 2016.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/netdevice.h>
+#include <linux/skbuff.h>
+
+#include <net/ncsi.h>
+#include <net/net_namespace.h>
+#include <net/sock.h>
+
+#include "internal.h"
+#include "ncsi-pkt.h"
+
+/* This function should be called after the data area has been
+ * populated completely.
+ */
+static int ncsi_cmd_build_header(struct ncsi_pkt_hdr *h,
+				 struct ncsi_cmd_arg *nca)
+{
+	__be32 csum, *checksum;
+	__be32 low, high;
+	unsigned char *stream;
+	int i;
+
+	h->mc_id        = 0;
+	h->revision     = NCSI_PKT_REVISION;
+	h->reserved     = 0;
+	h->id           = nca->nca_id;
+	h->type         = nca->nca_type;
+	h->channel      = NCSI_TO_CHANNEL(nca->nca_package,
+					  nca->nca_channel);
+	h->length       = htons(nca->nca_payload);
+	h->reserved1[0] = 0;
+	h->reserved1[1] = 0;
+
+	/* Calculate the checksum */
+	csum = 0;
+	stream = (unsigned char *)h;
+	for (i = 0; i < sizeof(*h) + nca->nca_payload; i += 2) {
+		high = stream[i];
+		low = stream[i + 1];
+		csum += ((high << 8) | low);
+	}
+
+	/* Fill with the calculated checksum */
+	checksum = (__be32 *)((void *)(h + 1) + nca->nca_payload);
+	csum = (~csum + 1);
+	*checksum = htonl(csum);
+
+	return 0;
+}
+
+static int ncsi_cmd_handler_default(struct sk_buff *skb,
+				    struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_pkt *cmd;
+
+	if (!nca)
+		return 0;
+
+	cmd = (struct ncsi_cmd_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_sp(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_sp_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_sp_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->hw_arbitration = nca->nca_bytes[0];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_dc(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_dc_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_dc_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->ald = nca->nca_bytes[0];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_rc(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_rc_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_rc_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_ae(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_ae_pkt *cmd;
+
+	if (!nca)
+		return 8;
+
+	cmd = (struct ncsi_cmd_ae_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mc_id = nca->nca_bytes[0];
+	cmd->mode = htonl(nca->nca_dwords[1]);
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_sl(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_sl_pkt *cmd;
+
+	if (!nca)
+		return 8;
+
+	cmd = (struct ncsi_cmd_sl_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mode = htonl(nca->nca_dwords[0]);
+	cmd->oem_mode = htonl(nca->nca_dwords[1]);
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_svf(struct sk_buff *skb,
+				struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_svf_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_svf_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->vlan = htons(nca->nca_words[0]);
+	cmd->index = nca->nca_bytes[2];
+	cmd->enable = nca->nca_bytes[3];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_ev(struct sk_buff *skb,
+			       struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_ev_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_ev_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mode = nca->nca_bytes[0];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_sma(struct sk_buff *skb,
+				struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_sma_pkt *cmd;
+	int i;
+
+	if (!nca)
+		return 8;
+
+	cmd = (struct ncsi_cmd_sma_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	for (i = 0; i < 6; i++)
+		cmd->mac[i] = nca->nca_bytes[i];
+	cmd->index = nca->nca_bytes[6];
+	cmd->at_e = nca->nca_bytes[7];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_ebf(struct sk_buff *skb,
+				struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_ebf_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_ebf_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mode = htonl(nca->nca_dwords[0]);
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_egmf(struct sk_buff *skb,
+				 struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_egmf_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_egmf_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mode = htonl(nca->nca_dwords[0]);
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
+				 struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_snfc_pkt *cmd;
+
+	if (!nca)
+		return 4;
+
+	cmd = (struct ncsi_cmd_snfc_pkt *)skb_put(skb, sizeof(*cmd));
+	memset(cmd, 0, sizeof(*cmd));
+	cmd->mode = nca->nca_bytes[0];
+	return ncsi_cmd_build_header(&cmd->cmd.common, nca);
+}
+
+static struct ncsi_cmd_handler {
+	unsigned char	nch_type;
+	int		(*nch_handler)(struct sk_buff *skb,
+				       struct ncsi_cmd_arg *nca);
+} ncsi_cmd_handlers[] = {
+	{ NCSI_PKT_CMD_CIS,   ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SP,    ncsi_cmd_handler_sp	 },
+	{ NCSI_PKT_CMD_DP,    ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_EC,    ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_DC,    ncsi_cmd_handler_dc      },
+	{ NCSI_PKT_CMD_RC,    ncsi_cmd_handler_rc      },
+	{ NCSI_PKT_CMD_ECNT,  ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_DCNT,  ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_AE,    ncsi_cmd_handler_ae      },
+	{ NCSI_PKT_CMD_SL,    ncsi_cmd_handler_sl      },
+	{ NCSI_PKT_CMD_GLS,   ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SVF,   ncsi_cmd_handler_svf     },
+	{ NCSI_PKT_CMD_EV,    ncsi_cmd_handler_ev      },
+	{ NCSI_PKT_CMD_DV,    ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SMA,   ncsi_cmd_handler_sma     },
+	{ NCSI_PKT_CMD_EBF,   ncsi_cmd_handler_ebf     },
+	{ NCSI_PKT_CMD_DBF,   ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_EGMF,  ncsi_cmd_handler_egmf    },
+	{ NCSI_PKT_CMD_DGMF,  ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SNFC,  ncsi_cmd_handler_snfc    },
+	{ NCSI_PKT_CMD_GVI,   ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GC,    ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GP,    ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GCPS,  ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GNS,   ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GNPTS, ncsi_cmd_handler_default },
+	{ 0,                  NULL                     }
+};
+
+static struct ncsi_req *ncsi_alloc_cmd_req(struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_dev_priv *ndp = nca->nca_ndp;
+	struct ncsi_dev *nd = &ndp->ndp_ndev;
+	struct net_device *dev = nd->nd_dev;
+	int hlen = LL_RESERVED_SPACE(dev);
+	int tlen = dev->needed_tailroom;
+	int len = hlen + tlen;
+	struct sk_buff *skb;
+	struct ncsi_req *nr;
+
+	nr = ncsi_alloc_req(ndp);
+	if (!nr)
+		return NULL;
+
+	/* NCSI command packet has 16-bytes header, payload,
+	 * 4-bytes checksum and optional padding.
+	 */
+	len += sizeof(struct ncsi_cmd_pkt_hdr);
+	len += 4;
+	if (nca->nca_payload < 26)
+		len += 26;
+	else
+		len += nca->nca_payload;
+
+	/* Allocate skb */
+	skb = alloc_skb(len, GFP_ATOMIC);
+	if (!skb) {
+		ncsi_free_req(nr, false, false);
+		return NULL;
+	}
+
+	nr->nr_cmd = skb;
+	skb_reserve(skb, hlen);
+	skb_reset_network_header(skb);
+
+	skb->dev = dev;
+	skb->protocol = htons(ETH_P_NCSI);
+
+	return nr;
+}
+
+int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_req *nr;
+	struct ethhdr *eh;
+	struct ncsi_cmd_handler *nch;
+	int i, ret;
+
+	/* Search for the handler */
+	nch = ncsi_cmd_handlers;
+	while (nch->nch_handler) {
+		if (nch->nch_type == nca->nca_type)
+			break;
+		nch++;
+	}
+
+	if (!nch->nch_handler) {
+		pr_info("%s: Cannot send packet with type 0x%x\n",
+			__func__, nca->nca_type);
+		return -ENOENT;
+	}
+
+	/* Get packet payload length and allocate the request */
+	nca->nca_payload = nch->nch_handler(NULL, NULL);
+	nr = ncsi_alloc_cmd_req(nca);
+	if (!nr)
+		return -ENOMEM;
+
+	/* Prepare the packet */
+	nca->nca_id = nr->nr_id;
+	ret = nch->nch_handler(nr->nr_cmd, nca);
+	if (ret) {
+		ncsi_free_req(nr, true, false);
+		return ret;
+	}
+
+	/* Fill the ethernet header */
+	eh = (struct ethhdr *)skb_push(nr->nr_cmd, sizeof(*eh));
+	eh->h_proto = htons(ETH_P_NCSI);
+	for (i = 0; i < ETH_ALEN; i++) {
+		eh->h_dest[i] = 0xff;
+		eh->h_source[i] = 0xff;
+	}
+
+	/* Start the timer for the request that might not have
+	 * corresponding response. I'm not sure 1 second delay
+	 * here is enough. Anyway, NCSI is internal network, so
+	 * the responsiveness should be as fast as enough.
+	 */
+	nr->nr_timer_enabled = true;
+	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
+
+	/* Send NCSI packet */
+	skb_get(nr->nr_cmd);
+	ret = dev_queue_xmit(nr->nr_cmd);
+	if (ret < 0) {
+		ncsi_free_req(nr, true, false);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
new file mode 100644
index 0000000..7f030b5
--- /dev/null
+++ b/net/ncsi/ncsi-pkt.h
@@ -0,0 +1,168 @@
+/*
+ * Copyright Gavin Shan, IBM Corporation 2016.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __NCSI_PKT_H__
+#define __NCSI_PKT_H__
+
+struct ncsi_pkt_hdr {
+	unsigned char mc_id;        /* Management controller ID */
+	unsigned char revision;     /* NCSI version - 0x01      */
+	unsigned char reserved;     /* Reserved                 */
+	unsigned char id;           /* Packet sequence number   */
+	unsigned char type;         /* Packet type              */
+	unsigned char channel;      /* Network controller ID    */
+	__be16        length;       /* Payload length           */
+	__be32        reserved1[2]; /* Reserved                 */
+};
+
+struct ncsi_cmd_pkt_hdr {
+	struct ncsi_pkt_hdr common; /* Common NCSI packet header */
+};
+
+/* NCSI common command packet */
+struct ncsi_cmd_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[26];
+};
+
+/* Select Package */
+struct ncsi_cmd_sp_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+	unsigned char           reserved[3];    /* Reserved       */
+	unsigned char           hw_arbitration; /* HW arbitration */
+	__be32                  checksum;       /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Disable Channel */
+struct ncsi_cmd_dc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header  */
+	unsigned char           reserved[3]; /* Reserved        */
+	unsigned char           ald;         /* Allow link down */
+	__be32                  checksum;    /* Checksum        */
+	unsigned char           pad[22];
+};
+
+/* Reset Channel */
+struct ncsi_cmd_rc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  reserved; /* Reserved       */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* AEN Enable */
+struct ncsi_cmd_ae_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header   */
+	unsigned char           reserved[3]; /* Reserved         */
+	unsigned char           mc_id;       /* MC ID            */
+	__be32                  mode;        /* AEN working mode */
+	__be32                  checksum;    /* Checksum         */
+	unsigned char           pad[18];
+};
+
+/* Set Link */
+struct ncsi_cmd_sl_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header    */
+	__be32                  mode;     /* Link working mode */
+	__be32                  oem_mode; /* OEM link mode     */
+	__be32                  checksum; /* Checksum          */
+	unsigned char           pad[18];
+};
+
+/* Set VLAN Filter */
+struct ncsi_cmd_svf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;       /* Command header    */
+	__be16                  reserved;  /* Reserved          */
+	__be16                  vlan;      /* VLAN ID           */
+	__be16                  reserved1; /* Reserved          */
+	unsigned char           index;     /* VLAN table index  */
+	unsigned char           enable;    /* Enable or disable */
+	__be32                  checksum;  /* Checksum          */
+	unsigned char           pad[14];
+};
+
+/* Enable VLAN */
+struct ncsi_cmd_ev_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header   */
+	unsigned char           reserved[3]; /* Reserved         */
+	unsigned char           mode;        /* VLAN filter mode */
+	__be32                  checksum;    /* Checksum         */
+	unsigned char           pad[22];
+};
+
+/* Set MAC Address */
+struct ncsi_cmd_sma_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header          */
+	unsigned char           mac[6];   /* MAC address             */
+	unsigned char           index;    /* MAC table index         */
+	unsigned char           at_e;     /* Addr type and operation */
+	__be32                  checksum; /* Checksum                */
+	unsigned char           pad[18];
+};
+
+/* Enable Broadcast Filter */
+struct ncsi_cmd_ebf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  mode;     /* Filter mode    */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Enable Global Multicast Filter */
+struct ncsi_cmd_egmf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  mode;     /* Global MC mode */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Set NCSI Flow Control */
+struct ncsi_cmd_snfc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
+	unsigned char           reserved[3]; /* Reserved          */
+	unsigned char           mode;        /* Flow control mode */
+	__be32                  checksum;    /* Checksum          */
+	unsigned char           pad[22];
+};
+
+/* NCSI packet revision */
+#define NCSI_PKT_REVISION	0x01
+
+/* NCSI packet commands */
+#define NCSI_PKT_CMD_CIS	0x00	/* Clear Initial State              */
+#define NCSI_PKT_CMD_SP		0x01	/* Select Package                   */
+#define NCSI_PKT_CMD_DP		0x02	/* Deselect Package                 */
+#define NCSI_PKT_CMD_EC		0x03	/* Enable Channel                   */
+#define NCSI_PKT_CMD_DC		0x04	/* Disable Channel                  */
+#define NCSI_PKT_CMD_RC		0x05	/* Reset Channel                    */
+#define NCSI_PKT_CMD_ECNT	0x06	/* Enable Channel Network Tx        */
+#define NCSI_PKT_CMD_DCNT	0x07	/* Disable Channel Network Tx       */
+#define NCSI_PKT_CMD_AE		0x08	/* AEN Enable                       */
+#define NCSI_PKT_CMD_SL		0x09	/* Set Link                         */
+#define NCSI_PKT_CMD_GLS	0x0a	/* Get Link                         */
+#define NCSI_PKT_CMD_SVF	0x0b	/* Set VLAN Filter                  */
+#define NCSI_PKT_CMD_EV		0x0c	/* Enable VLAN                      */
+#define NCSI_PKT_CMD_DV		0x0d	/* Disable VLAN                     */
+#define NCSI_PKT_CMD_SMA	0x0e	/* Set MAC address                  */
+#define NCSI_PKT_CMD_EBF	0x10	/* Enable Broadcast Filter          */
+#define NCSI_PKT_CMD_DBF	0x11	/* Disable Broadcast Filter         */
+#define NCSI_PKT_CMD_EGMF	0x12	/* Enable Global Multicast Filter   */
+#define NCSI_PKT_CMD_DGMF	0x13	/* Disable Global Multicast Filter  */
+#define NCSI_PKT_CMD_SNFC	0x14	/* Set NCSI Flow Control            */
+#define NCSI_PKT_CMD_GVI	0x15	/* Get Version ID                   */
+#define NCSI_PKT_CMD_GC		0x16	/* Get Capabilities                 */
+#define NCSI_PKT_CMD_GP		0x17	/* Get Parameters                   */
+#define NCSI_PKT_CMD_GCPS	0x18	/* Get Controller Packet Statistics */
+#define NCSI_PKT_CMD_GNS	0x19	/* Get NCSI Statistics              */
+#define NCSI_PKT_CMD_GNPTS	0x1a	/* Get NCSI Pass-throu Statistics   */
+#define NCSI_PKT_CMD_OEM	0x50	/* OEM                              */
+
+#endif /* __NCSI_PKT_H__ */
-- 
2.1.0
