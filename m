Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG324ykQzDqmt
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:14 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANa0F105659
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:12 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23v09qqn9a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:11 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:08 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:28:07 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 167362BB0055
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:07 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UAS7PO3866894
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:07 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UAS6Rw013362
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:06 +1000
Received: from gwshan ([9.192.205.20])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UAS674013358; Thu, 30 Jun 2016 20:28:06 +1000
Received: by gwshan (Postfix, from userid 1000)
 id C889D94348E; Thu, 30 Jun 2016 20:27:59 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 05/10] net/ncsi: NCSI AEN packet handler
Date: Thu, 30 Jun 2016 20:27:46 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-1617-0000-0000-00000134452F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-1618-0000-0000-0000462EC19E
Message-Id: <1467282471-16560-6-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:15 -0000

This introduces NCSI AEN packet handlers that result in (A) the
currently active channel is reconfigured; (B) Currently active
channel is deconfigured and disabled, another channel is chosen
as active one and configured.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/ncsi/Makefile   |   2 +-
 net/ncsi/internal.h |   1 +
 net/ncsi/ncsi-aen.c | 190 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 net/ncsi/ncsi-pkt.h |  36 ++++++++++
 net/ncsi/ncsi-rsp.c |   6 +-
 5 files changed, 233 insertions(+), 2 deletions(-)
 create mode 100644 net/ncsi/ncsi-aen.c

diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
index 4751819..dd12b56 100644
--- a/net/ncsi/Makefile
+++ b/net/ncsi/Makefile
@@ -1,4 +1,4 @@
 #
 # Makefile for NCSI API
 #
-obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-manage.o
+obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index eeb092a..d284821 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -303,5 +303,6 @@ int ncsi_suspend_dev(struct ncsi_dev *nd);
 int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca);
 int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 		 struct packet_type *pt, struct net_device *orig_dev);
+int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb);
 
 #endif /* __NCSI_INTERNAL_H__ */
diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
new file mode 100644
index 0000000..82ed563
--- /dev/null
+++ b/net/ncsi/ncsi-aen.c
@@ -0,0 +1,190 @@
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
+static int ncsi_validate_aen_pkt(struct ncsi_aen_pkt_hdr *h,
+				 const unsigned short payload)
+{
+	unsigned char *stream;
+	__be32 *checksum, csum;
+	__be32 high, low;
+	int i;
+
+	if (h->common.revision != NCSI_PKT_REVISION)
+		return -EINVAL;
+	if (ntohs(h->common.length) != payload)
+		return -EINVAL;
+
+	/* Validate checksum, which might be zeroes if the
+	 * sender doesn't support checksum according to NCSI
+	 * specification.
+	 */
+	checksum = (__be32 *)((void *)(h + 1) + payload - 4);
+	if (ntohl(*checksum) == 0)
+		return 0;
+
+	csum = 0;
+	stream = (unsigned char *)h;
+	for (i = 0; i < sizeof(*h) + payload - 4; i += 2) {
+		high = stream[i];
+		low = stream[i + 1];
+		csum += ((high << 8) | low);
+	}
+
+	csum = ~csum + 1;
+	if (*checksum != htonl(csum))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
+				struct ncsi_aen_pkt_hdr *h)
+{
+	struct ncsi_dev *nd = &ndp->ndp_ndev;
+	struct ncsi_aen_lsc_pkt *lsc;
+	struct ncsi_channel *nc;
+	struct ncsi_channel_mode *ncm;
+	int ret;
+
+	ret = ncsi_validate_aen_pkt(h, 12);
+	if (ret)
+		return ret;
+
+	/* Find the NCSI channel */
+	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
+	if (!nc)
+		return -ENODEV;
+
+	/* Update the link status */
+	ncm = &nc->nc_modes[NCSI_MODE_LINK];
+	lsc = (struct ncsi_aen_lsc_pkt *)h;
+	ncm->ncm_data[2] = ntohl(lsc->status);
+	ncm->ncm_data[4] = ntohl(lsc->oem_status);
+	if (!ndp->ndp_active_channel ||
+	    ndp->ndp_active_channel != nc)
+		return 0;
+
+	ndp->ndp_flags |= NCSI_DEV_FLAG_RESHUFFLE;
+	ncsi_suspend_dev(nd);
+
+	return 0;
+}
+
+static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
+			       struct ncsi_aen_pkt_hdr *h)
+{
+	struct ncsi_dev *nd = &ndp->ndp_ndev;
+	struct ncsi_channel *nc;
+	int ret;
+
+	ret = ncsi_validate_aen_pkt(h, 4);
+	if (ret)
+		return ret;
+
+	/* Find the NCSI channel */
+	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
+	if (!nc)
+		return -ENODEV;
+
+	/* If the channel is active one, we need reconfigure it */
+	if (!ndp->ndp_active_channel ||
+	    ndp->ndp_active_channel != nc)
+		return 0;
+
+	ncsi_config_dev(nd);
+
+	return 0;
+}
+
+static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
+				   struct ncsi_aen_pkt_hdr *h)
+{
+	struct ncsi_dev *nd = &ndp->ndp_ndev;
+	struct ncsi_channel *nc;
+	struct ncsi_channel_mode *ncm;
+	struct ncsi_aen_hncdsc_pkt *hncdsc;
+	int ret;
+
+	ret = ncsi_validate_aen_pkt(h, 4);
+	if (ret)
+		return ret;
+
+	/* Find the NCSI channel */
+	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
+	if (!nc)
+		return -ENODEV;
+
+	/* If the channel is active one, we need reconfigure it */
+	ncm = &nc->nc_modes[NCSI_MODE_LINK];
+	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
+	ncm->ncm_data[3] = ntohl(hncdsc->status);
+	if (ndp->ndp_active_channel != nc ||
+	    ncm->ncm_data[3] & 0x1)
+		return 0;
+
+	/* If this channel is the active one and the link doesn't
+	 * work, we have to choose another channel to be active one.
+	 * The logic here is exactly similar to what we do when link
+	 * is down on the active channel.
+	 */
+	ndp->ndp_flags |= NCSI_DEV_FLAG_RESHUFFLE;
+	ncsi_suspend_dev(nd);
+	return 0;
+}
+
+static struct ncsi_aen_handler {
+	unsigned char nah_type;
+	int           (*nah_handler)(struct ncsi_dev_priv *ndp,
+				     struct ncsi_aen_pkt_hdr *h);
+} ncsi_aen_handlers[] = {
+	{ NCSI_PKT_AEN_LSC,    ncsi_aen_handler_lsc    },
+	{ NCSI_PKT_AEN_CR,     ncsi_aen_handler_cr     },
+	{ NCSI_PKT_AEN_HNCDSC, ncsi_aen_handler_hncdsc },
+	{ 0,                   NULL                    }
+};
+
+int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
+{
+	struct ncsi_aen_pkt_hdr *h;
+	struct ncsi_aen_handler *nah;
+	int ret;
+
+	/* Find the handler */
+	h = (struct ncsi_aen_pkt_hdr *)skb_network_header(skb);
+	nah = ncsi_aen_handlers;
+	while (nah->nah_handler) {
+		if (nah->nah_type == h->type)
+			break;
+
+		nah++;
+	}
+
+	if (!nah->nah_handler) {
+		pr_warn("NCSI: Invalid AEN packet (0x%x) received\n",
+			h->type);
+		return -ENOENT;
+	}
+
+	ret = nah->nah_handler(ndp, h);
+	consume_skb(skb);
+	return ret;
+}
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index 95882f3..6248835 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -31,6 +31,12 @@ struct ncsi_rsp_pkt_hdr {
 	__be16              reason; /* Response reason           */
 };
 
+struct ncsi_aen_pkt_hdr {
+	struct ncsi_pkt_hdr common;       /* Common NCSI packet header */
+	unsigned char       reserved2[3]; /* Reserved                  */
+	unsigned char       type;         /* AEN packet type           */
+};
+
 /* NCSI common command packet */
 struct ncsi_cmd_pkt {
 	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
@@ -282,6 +288,30 @@ struct ncsi_rsp_gnpts_pkt {
 	__be32                  checksum;       /* Checksum            */
 };
 
+/* AEN: Link State Change */
+struct ncsi_aen_lsc_pkt {
+	struct ncsi_aen_pkt_hdr aen;        /* AEN header      */
+	__be32                  status;     /* Link status     */
+	__be32                  oem_status; /* OEM link status */
+	__be32                  checksum;   /* Checksum        */
+	unsigned char           pad[14];
+};
+
+/* AEN: Configuration Required */
+struct ncsi_aen_cr_pkt {
+	struct ncsi_aen_pkt_hdr aen;      /* AEN header */
+	__be32                  checksum; /* Checksum   */
+	unsigned char           pad[22];
+};
+
+/* AEN: Host Network Controller Driver Status Change */
+struct ncsi_aen_hncdsc_pkt {
+	struct ncsi_aen_pkt_hdr aen;      /* AEN header */
+	__be32                  status;   /* Status     */
+	__be32                  checksum; /* Checksum   */
+	unsigned char           pad[18];
+};
+
 /* NCSI packet revision */
 #define NCSI_PKT_REVISION	0x01
 
@@ -356,4 +386,10 @@ struct ncsi_rsp_gnpts_pkt {
 #define NCSI_PKT_RSP_R_LENGTH		0x0005  /* Invalid payload length   */
 #define NCSI_PKT_RSP_R_UNKNOWN		0x7fff  /* Command type unsupported */
 
+/* NCSI packet type: AEN */
+#define NCSI_PKT_AEN		0xFF /* AEN Packet               */
+#define NCSI_PKT_AEN_LSC	0x00 /* Link status change       */
+#define NCSI_PKT_AEN_CR		0x01 /* Configuration required   */
+#define NCSI_PKT_AEN_HNCDSC	0x02 /* HNC driver status change */
+
 #endif /* __NCSI_PKT_H__ */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 92dcbf4..30578d3 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1125,8 +1125,12 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 	if (!ndp)
 		return -ENODEV;
 
-	/* Find the handler */
+	/* Check if it is AEN packet */
 	hdr = (struct ncsi_pkt_hdr *)skb_network_header(skb);
+	if (hdr->type == NCSI_PKT_AEN)
+		return ncsi_aen_handler(ndp, skb);
+
+	/* Find the handler */
 	nrh = ncsi_rsp_handlers;
 	while (nrh->nrh_handler) {
 		if (nrh->nrh_type == hdr->type)
-- 
2.1.0
