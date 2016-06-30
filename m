Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG2v10m5zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANbxl014691
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:03 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23v6yectv5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:03 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:00 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:27:57 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 3A55E2CE8057
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:27:57 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UARvdH10420660
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:27:57 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UARub2013064
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:27:57 +1000
Received: from gwshan ([9.192.205.20])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UARuqA013056; Thu, 30 Jun 2016 20:27:56 +1000
Received: by gwshan (Postfix, from userid 1000)
 id 87CD5943482; Thu, 30 Jun 2016 20:27:55 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 01/10] net/ncsi: Resource management
Date: Thu, 30 Jun 2016 20:27:42 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0004-0000-0000-00000174F5B6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0005-0000-0000-0000082E5242
Message-Id: <1467282471-16560-2-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:07 -0000

NCSI spec (DSP0222) defines several objects: package, channel, mode,
filter, version and statistics etc. This introduces the data structs
to represent those objects and implement functions to manage them.

   * The user (e.g. netdev driver) dereference NCSI device by
     "struct ncsi_dev", which is embedded to "struct ncsi_dev_priv".
     The later one is used by NCSI stack internally.
   * Every NCSI device can have multiple packages simultaneously, up
     to 8 packages. It's represented by "struct ncsi_package" and
     identified by 3-bits ID.
   * Every NCSI package can have multiple channels, up to 32. It's
     represented by "struct ncsi_channel" and identified by 5-bits ID.
   * Every NCSI channel has version, statistics, various modes and
     filters. They are represented by "struct ncsi_channel_version",
     "struct ncsi_channel_stats", "struct ncsi_channel_mode" and
     "struct ncsi_channel_filter" separately.
   * Apart from AEN (Asynchronous Event Notification), the NCSI stack
     works in terms of command and response. This introduces struct
     ncsi_req" to represent a complete NCSI transaction made of NCSI
     request and response.

This also introduces CONFIG_NET_NCSI to enable NCSI stack.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 net/Kconfig            |   1 +
 net/Makefile           |   1 +
 net/ncsi/Kconfig       |  10 ++
 net/ncsi/Makefile      |   4 +
 net/ncsi/internal.h    | 253 ++++++++++++++++++++++++++++
 net/ncsi/ncsi-manage.c | 435 +++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 704 insertions(+)
 create mode 100644 net/ncsi/Kconfig
 create mode 100644 net/ncsi/Makefile
 create mode 100644 net/ncsi/internal.h
 create mode 100644 net/ncsi/ncsi-manage.c

diff --git a/net/Kconfig b/net/Kconfig
index ff40562..c2cdbce 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -237,6 +237,7 @@ source "net/hsr/Kconfig"
 source "net/switchdev/Kconfig"
 source "net/l3mdev/Kconfig"
 source "net/qrtr/Kconfig"
+source "net/ncsi/Kconfig"
 
 config RPS
 	bool
diff --git a/net/Makefile b/net/Makefile
index bdd1455..9bd20bb 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -79,3 +79,4 @@ ifneq ($(CONFIG_NET_L3_MASTER_DEV),)
 obj-y				+= l3mdev/
 endif
 obj-$(CONFIG_QRTR)		+= qrtr/
+obj-$(CONFIG_NET_NCSI)		+= ncsi/
diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
new file mode 100644
index 0000000..723f0eb
--- /dev/null
+++ b/net/ncsi/Kconfig
@@ -0,0 +1,10 @@
+#
+# Configuration for NCSI support
+#
+
+config NET_NCSI
+	bool "NCSI interface support (EXPERIMENTAL)"
+	depends on INET
+	---help---
+	  This module provides NCSI (Network Controller Sideband Interface)
+	  support.
diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
new file mode 100644
index 0000000..07b5625
--- /dev/null
+++ b/net/ncsi/Makefile
@@ -0,0 +1,4 @@
+#
+# Makefile for NCSI API
+#
+obj-$(CONFIG_NET_NCSI) += ncsi-manage.o
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
new file mode 100644
index 0000000..4a8bd76
--- /dev/null
+++ b/net/ncsi/internal.h
@@ -0,0 +1,253 @@
+/*
+ * Copyright Gavin Shan, IBM Corporation 2016.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __NCSI_INTERNAL_H__
+#define __NCSI_INTERNAL_H__
+
+enum {
+	NCSI_CAP_BASE		= 0,
+	NCSI_CAP_GENERIC	= 0,
+	NCSI_CAP_BC,
+	NCSI_CAP_MC,
+	NCSI_CAP_BUFFER,
+	NCSI_CAP_AEN,
+	NCSI_CAP_VLAN,
+	NCSI_CAP_MAX
+};
+
+enum {
+	NCSI_CAP_GENERIC_HWA	= 0x01,	/* HW arbitration             */
+	NCSI_CAP_GENERIC_HDS	= 0x02,	/* HNC driver status change   */
+	NCSI_CAP_GENERIC_FC	= 0x04,	/* HNC to MC flow control     */
+	NCSI_CAP_GENERIC_FC1	= 0x08,	/* MC to HNC flow control     */
+	NCSI_CAP_GENERIC_MC	= 0x10,	/* Global multicast filtering */
+	NCSI_CAP_GENERIC_MASK	= 0x1f,
+	NCSI_CAP_BC_ARP		= 0x01,	/* ARP packet filtering       */
+	NCSI_CAP_BC_DHCPC	= 0x02,	/* DHCP client filtering      */
+	NCSI_CAP_BC_DHCPS	= 0x04,	/* DHCP server filtering      */
+	NCSI_CAP_BC_NETBIOS	= 0x08,	/* NetBIOS packet filtering   */
+	NCSI_CAP_BC_MASK	= 0x0f,
+	NCSI_CAP_MC_NEIGHBOR	= 0x01,	/* IPv6 neighbor filtering    */
+	NCSI_CAP_MC_ROUTER	= 0x02,	/* IPv6 router filering       */
+	NCSI_CAP_MC_DHCPV6	= 0x04,	/* DHCPv6 filtering           */
+	NCSI_CAP_MC_MASK	= 0x07,
+	NCSI_CAP_AEN_LSC	= 0x01,	/* Link status change AEN     */
+	NCSI_CAP_AEN_CR		= 0x02,	/* Configuration required AEN */
+	NCSI_CAP_AEN_HDS	= 0x04,	/* HNC driver status AEN      */
+	NCSI_CAP_AEN_MASK	= 0x07,
+	NCSI_CAP_VLAN_ONLY	= 0x01,	/* VLAN is supported          */
+	NCSI_CAP_VLAN_NO	= 0x02,	/* Filter VLAN and non-VLAN   */
+	NCSI_CAP_VLAN_ANY	= 0x04,	/* Filter Any-and-non-VLAN    */
+	NCSI_CAP_VLAN_MASK	= 0x07
+};
+
+enum {
+	NCSI_MODE_BASE		= 0,
+	NCSI_MODE_ENABLE	= 0,
+	NCSI_MODE_TX_ENABLE,
+	NCSI_MODE_LINK,
+	NCSI_MODE_VLAN,
+	NCSI_MODE_BC,
+	NCSI_MODE_MC,
+	NCSI_MODE_AEN,
+	NCSI_MODE_FC,
+	NCSI_MODE_MAX
+};
+
+enum {
+	NCSI_FILTER_BASE	= 0,
+	NCSI_FILTER_VLAN	= 0,
+	NCSI_FILTER_UC,
+	NCSI_FILTER_MC,
+	NCSI_FILTER_MIXED,
+	NCSI_FILTER_MAX
+};
+
+struct ncsi_channel_version {
+	unsigned int   ncv_version;     /* Supported BCD encoded NCSI version */
+	unsigned int   ncv_alpha2;      /* Supported BCD encoded NCSI version */
+	unsigned char  ncv_fw_name[12];	/* Firware name string                */
+	unsigned int   ncv_fw_version;  /* Firmware version                   */
+	unsigned short ncv_pci_ids[4];  /* PCI identification                 */
+	unsigned int   ncv_mf_id;       /* Manufacture ID                     */
+};
+
+struct ncsi_channel_cap {
+	unsigned int ncc_index;	/* Index of channel capabilities */
+	unsigned int ncc_cap;	/* NCSI channel capability       */
+};
+
+struct ncsi_channel_mode {
+	unsigned int ncm_index;   /* Index of channel modes      */
+	unsigned int ncm_enable;  /* Enabled or disabled         */
+	unsigned int ncm_size;    /* Valid entries in ncm_data[] */
+	unsigned int ncm_data[8]; /* Data entries                */
+};
+
+struct ncsi_channel_filter {
+	unsigned int  ncf_index;  /* Index of channel filters          */
+	unsigned int  ncf_total;  /* Total entries in the filter table */
+	unsigned long ncf_bitmap; /* Bitmap of valid entries           */
+	unsigned char ncf_data[]; /* Data for the valid entries        */
+};
+
+struct ncsi_channel_stats {
+	unsigned int ncs_hnc_cnt_hi;         /* Counter cleared            */
+	unsigned int ncs_hnc_cnt_lo;         /* Counter cleared            */
+	unsigned int ncs_hnc_rx_bytes;       /* Rx bytes                   */
+	unsigned int ncs_hnc_tx_bytes;       /* Tx bytes                   */
+	unsigned int ncs_hnc_rx_uc_pkts;     /* Rx UC packets              */
+	unsigned int ncs_hnc_rx_mc_pkts;     /* Rx MC packets              */
+	unsigned int ncs_hnc_rx_bc_pkts;     /* Rx BC packets              */
+	unsigned int ncs_hnc_tx_uc_pkts;     /* Tx UC packets              */
+	unsigned int ncs_hnc_tx_mc_pkts;     /* Tx MC packets              */
+	unsigned int ncs_hnc_tx_bc_pkts;     /* Tx BC packets              */
+	unsigned int ncs_hnc_fcs_err;        /* FCS errors                 */
+	unsigned int ncs_hnc_align_err;      /* Alignment errors           */
+	unsigned int ncs_hnc_false_carrier;  /* False carrier detection    */
+	unsigned int ncs_hnc_runt_pkts;      /* Rx runt packets            */
+	unsigned int ncs_hnc_jabber_pkts;    /* Rx jabber packets          */
+	unsigned int ncs_hnc_rx_pause_xon;   /* Rx pause XON frames        */
+	unsigned int ncs_hnc_rx_pause_xoff;  /* Rx XOFF frames             */
+	unsigned int ncs_hnc_tx_pause_xon;   /* Tx XON frames              */
+	unsigned int ncs_hnc_tx_pause_xoff;  /* Tx XOFF frames             */
+	unsigned int ncs_hnc_tx_s_collision; /* Single collision frames    */
+	unsigned int ncs_hnc_tx_m_collision; /* Multiple collision frames  */
+	unsigned int ncs_hnc_l_collision;    /* Late collision frames      */
+	unsigned int ncs_hnc_e_collision;    /* Excessive collision frames */
+	unsigned int ncs_hnc_rx_ctl_frames;  /* Rx control frames          */
+	unsigned int ncs_hnc_rx_64_frames;   /* Rx 64-bytes frames         */
+	unsigned int ncs_hnc_rx_127_frames;  /* Rx 65-127 bytes frames     */
+	unsigned int ncs_hnc_rx_255_frames;  /* Rx 128-255 bytes frames    */
+	unsigned int ncs_hnc_rx_511_frames;  /* Rx 256-511 bytes frames    */
+	unsigned int ncs_hnc_rx_1023_frames; /* Rx 512-1023 bytes frames   */
+	unsigned int ncs_hnc_rx_1522_frames; /* Rx 1024-1522 bytes frames  */
+	unsigned int ncs_hnc_rx_9022_frames; /* Rx 1523-9022 bytes frames  */
+	unsigned int ncs_hnc_tx_64_frames;   /* Tx 64-bytes frames         */
+	unsigned int ncs_hnc_tx_127_frames;  /* Tx 65-127 bytes frames     */
+	unsigned int ncs_hnc_tx_255_frames;  /* Tx 128-255 bytes frames    */
+	unsigned int ncs_hnc_tx_511_frames;  /* Tx 256-511 bytes frames    */
+	unsigned int ncs_hnc_tx_1023_frames; /* Tx 512-1023 bytes frames   */
+	unsigned int ncs_hnc_tx_1522_frames; /* Tx 1024-1522 bytes frames  */
+	unsigned int ncs_hnc_tx_9022_frames; /* Tx 1523-9022 bytes frames  */
+	unsigned int ncs_hnc_rx_valid_bytes; /* Rx valid bytes             */
+	unsigned int ncs_hnc_rx_runt_pkts;   /* Rx error runt packets      */
+	unsigned int ncs_hnc_rx_jabber_pkts; /* Rx error jabber packets    */
+	unsigned int ncs_ncsi_rx_cmds;       /* Rx NCSI commands           */
+	unsigned int ncs_ncsi_dropped_cmds;  /* Dropped commands           */
+	unsigned int ncs_ncsi_cmd_type_errs; /* Command type errors        */
+	unsigned int ncs_ncsi_cmd_csum_errs; /* Command checksum errors    */
+	unsigned int ncs_ncsi_rx_pkts;       /* Rx NCSI packets            */
+	unsigned int ncs_ncsi_tx_pkts;       /* Tx NCSI packets            */
+	unsigned int ncs_ncsi_tx_aen_pkts;   /* Tx AEN packets             */
+	unsigned int ncs_pt_tx_pkts;         /* Tx packets                 */
+	unsigned int ncs_pt_tx_dropped;      /* Tx dropped packets         */
+	unsigned int ncs_pt_tx_channel_err;  /* Tx channel errors          */
+	unsigned int ncs_pt_tx_us_err;       /* Tx undersize errors        */
+	unsigned int ncs_pt_rx_pkts;         /* Rx packets                 */
+	unsigned int ncs_pt_rx_dropped;      /* Rx dropped packets         */
+	unsigned int ncs_pt_rx_channel_err;  /* Rx channel errors          */
+	unsigned int ncs_pt_rx_us_err;       /* Rx undersize errors        */
+	unsigned int ncs_pt_rx_os_err;       /* Rx oversize errors         */
+};
+
+struct ncsi_dev_priv;
+struct ncsi_package;
+
+#define NCSI_PACKAGE_INDEX(c)	(((c) >> 5) & 0x7)
+#define NCSI_CHANNEL_INDEX(c)	((c) & 0x1ffff)
+#define NCSI_TO_CHANNEL(p, c)	((((p) & 0x7) << 5) | ((c) & 0x1ffff))
+
+/* Channel state */
+enum {
+	ncsi_channel_state_deselected_initial,
+	ncsi_channel_state_selected_initial,
+	ncsi_channel_state_deselected_ready,
+	ncsi_channel_state_selected_ready,
+};
+
+struct ncsi_channel {
+	unsigned char               nc_id;
+	int                         nc_state;
+	struct ncsi_package         *nc_package;
+	struct ncsi_channel_version nc_version;
+	struct ncsi_channel_cap	    nc_caps[NCSI_CAP_MAX];
+	struct ncsi_channel_mode    nc_modes[NCSI_MODE_MAX];
+	struct ncsi_channel_filter  *nc_filters[NCSI_FILTER_MAX];
+	struct ncsi_channel_stats   nc_stats;
+	struct list_head            nc_node;
+};
+
+struct ncsi_package {
+	unsigned char        np_id;           /* NCSI package ID          */
+	struct ncsi_dev_priv *np_ndp;         /* NCSI device              */
+	atomic_t             np_channel_num;  /* Number of channels       */
+	spinlock_t           np_channel_lock; /* Protect list of channels */
+	struct list_head     np_channels;     /* List of chanels          */
+	struct list_head     np_node;
+};
+
+struct ncsi_req {
+	unsigned char        nr_id;            /* Request ID          */
+	bool                 nr_used;          /* Request used or not */
+	struct ncsi_dev_priv *nr_ndp;          /* NCSI device         */
+	struct sk_buff       *nr_cmd;          /* Command packet      */
+	struct sk_buff       *nr_rsp;          /* Response packet     */
+	struct timer_list    nr_timer;         /* Associated timer    */
+	bool                 nr_timer_enabled; /* Timer was started   */
+};
+
+struct ncsi_dev_priv {
+	struct ncsi_dev     ndp_ndev;            /* NCSI device              */
+	int                 ndp_flags;           /* NCSI device flags        */
+	struct ncsi_package *ndp_active_package; /* Active NCSI package      */
+	struct ncsi_channel *ndp_active_channel; /* Active NCSI channel      */
+	atomic_t            ndp_package_num;     /* Number of packages       */
+	spinlock_t          ndp_package_lock;    /* Protect list of packages */
+	struct list_head    ndp_packages;        /* List of packages         */
+	atomic_t            ndp_last_req_idx;    /* Last used request ID     */
+	spinlock_t          ndp_req_lock;        /* Protect request table    */
+	struct ncsi_req     ndp_reqs[256];       /* Request table            */
+	struct list_head    ndp_node;
+};
+
+extern struct list_head ncsi_dev_list;
+extern spinlock_t ncsi_dev_lock;
+
+#define TO_NCSI_DEV_PRIV(nd) \
+	container_of(nd, struct ncsi_dev_priv, ndp_ndev)
+#define NCSI_FOR_EACH_DEV(ndp) \
+	list_for_each_entry_rcu(ndp, &ncsi_dev_list, ndp_node)
+#define NCSI_FOR_EACH_PACKAGE(ndp, np) \
+	list_for_each_entry_rcu(np, &ndp->ndp_packages, np_node)
+#define NCSI_FOR_EACH_CHANNEL(np, nc) \
+	list_for_each_entry_rcu(nc, &np->np_channels, nc_node)
+
+/* Resources */
+int ncsi_find_channel_filter(struct ncsi_channel *nc, int table, void *data);
+int ncsi_add_channel_filter(struct ncsi_channel *nc, int table, void *data);
+int ncsi_del_channel_filter(struct ncsi_channel *nc, int table, int index);
+struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np,
+				      unsigned char id);
+struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
+				       unsigned char id);
+struct ncsi_package *ncsi_add_package(struct ncsi_dev_priv *ndp,
+				      unsigned char id);
+struct ncsi_package *ncsi_find_package(struct ncsi_dev_priv *ndp,
+				       unsigned char id);
+void ncsi_release_package(struct ncsi_package *np);
+void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
+				   unsigned char id,
+				   struct ncsi_package **np,
+				   struct ncsi_channel **nc);
+struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp);
+void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout);
+struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
+
+#endif /* __NCSI_INTERNAL_H__ */
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
new file mode 100644
index 0000000..dab54bc
--- /dev/null
+++ b/net/ncsi/ncsi-manage.c
@@ -0,0 +1,435 @@
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
+#include <linux/netlink.h>
+
+#include <net/ncsi.h>
+#include <net/net_namespace.h>
+#include <net/sock.h>
+
+#include "internal.h"
+
+LIST_HEAD(ncsi_dev_list);
+DEFINE_SPINLOCK(ncsi_dev_lock);
+
+int ncsi_find_channel_filter(struct ncsi_channel *nc, int table, void *data)
+{
+	struct ncsi_channel_filter *ncf;
+	int idx, entry_size;
+	void *bitmap;
+
+	switch (table) {
+	case NCSI_FILTER_VLAN:
+		entry_size = 2;
+		break;
+	case NCSI_FILTER_UC:
+	case NCSI_FILTER_MC:
+	case NCSI_FILTER_MIXED:
+		entry_size = 6;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Check if the filter table has been initialized */
+	ncf = nc->nc_filters[table];
+	if (!ncf)
+		return -ENODEV;
+
+	/* Check the valid entries one by one */
+	bitmap = (void *)&ncf->ncf_bitmap;
+	idx = -1;
+	while ((idx = find_next_bit(bitmap, ncf->ncf_total, idx + 1))
+		< ncf->ncf_total) {
+		if (!memcmp(ncf->ncf_data + entry_size * idx, data, entry_size))
+			return idx;
+	}
+
+	return -ENOENT;
+}
+
+int ncsi_add_channel_filter(struct ncsi_channel *nc, int table, void *data)
+{
+	struct ncsi_channel_filter *ncf;
+	int idx, entry_size;
+	void *bitmap;
+
+	/* Needn't add it if it's already existing */
+	idx = ncsi_find_channel_filter(nc, table, data);
+	if (idx >= 0)
+		return idx;
+
+	switch (table) {
+	case NCSI_FILTER_VLAN:
+		entry_size = 2;
+		break;
+	case NCSI_FILTER_UC:
+	case NCSI_FILTER_MC:
+	case NCSI_FILTER_MIXED:
+		entry_size = 6;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Check if the filter table has been initialized */
+	ncf = nc->nc_filters[table];
+	if (!ncf)
+		return -ENODEV;
+
+	/* Propagate the filter */
+	bitmap = (void *)&ncf->ncf_bitmap;
+	do {
+		idx = find_next_zero_bit(bitmap, ncf->ncf_total, 0);
+		if (idx >= ncf->ncf_total)
+			return -ENOSPC;
+	} while (test_and_set_bit(idx, bitmap));
+
+	memcpy(ncf->ncf_data + entry_size * idx, data, entry_size);
+	return idx;
+}
+
+int ncsi_del_channel_filter(struct ncsi_channel *nc, int table, int index)
+{
+	struct ncsi_channel_filter *ncf;
+	int entry_size;
+	void *bitmap;
+
+	switch (table) {
+	case NCSI_FILTER_VLAN:
+		entry_size = 2;
+		break;
+	case NCSI_FILTER_UC:
+	case NCSI_FILTER_MC:
+	case NCSI_FILTER_MIXED:
+		entry_size = 6;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Check if the filter table has been initialized */
+	ncf = nc->nc_filters[table];
+	if (!ncf || index >= ncf->ncf_total)
+		return -ENODEV;
+
+	/* Check if the entry is valid */
+	bitmap = (void *)&ncf->ncf_bitmap;
+	if (test_and_clear_bit(index, bitmap))
+		memset(ncf->ncf_data + entry_size * index, 0, entry_size);
+
+	return 0;
+}
+
+struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
+{
+	struct ncsi_channel *nc, *tmp;
+	int index;
+
+	nc = kzalloc(sizeof(*nc), GFP_ATOMIC);
+	if (!nc)
+		return NULL;
+
+	nc->nc_package = np;
+	nc->nc_id = id;
+	for (index = 0; index < NCSI_CAP_MAX; index++)
+		nc->nc_caps[index].ncc_index = index;
+	for (index = 0; index < NCSI_MODE_MAX; index++)
+		nc->nc_modes[index].ncm_index = index;
+
+	spin_lock(&np->np_channel_lock);
+	tmp = ncsi_find_channel(np, id);
+	if (tmp) {
+		spin_unlock(&np->np_channel_lock);
+		kfree(nc);
+		return tmp;
+	}
+	list_add_tail_rcu(&nc->nc_node, &np->np_channels);
+	spin_unlock(&np->np_channel_lock);
+
+	atomic_inc(&np->np_channel_num);
+	return nc;
+}
+
+struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
+				       unsigned char id)
+{
+	struct ncsi_channel *nc;
+
+	NCSI_FOR_EACH_CHANNEL(np, nc) {
+		if (nc->nc_id == id)
+			return nc;
+	}
+
+	return NULL;
+}
+
+static void ncsi_release_channel(struct ncsi_channel *nc)
+{
+	struct ncsi_dev_priv *ndp = nc->nc_package->np_ndp;
+	struct ncsi_channel_filter *ncf;
+	int i;
+
+	/* Release filters */
+	for (i = 0; i < NCSI_FILTER_MAX; i++) {
+		ncf = nc->nc_filters[i];
+		if (!ncf)
+			continue;
+
+		nc->nc_filters[i] = NULL;
+		kfree(ncf);
+	}
+
+	/* Update active channel if necessary */
+	if (ndp->ndp_active_channel == nc) {
+		ndp->ndp_active_package = NULL;
+		ndp->ndp_active_channel = NULL;
+	}
+
+	/* Remove and free channel */
+	list_del_rcu(&nc->nc_node);
+	kfree(nc);
+}
+
+struct ncsi_package *ncsi_add_package(struct ncsi_dev_priv *ndp,
+				      unsigned char id)
+{
+	struct ncsi_package *np, *tmp;
+
+	np = kzalloc(sizeof(*np), GFP_ATOMIC);
+	if (!np)
+		return NULL;
+
+	np->np_id = id;
+	np->np_ndp = ndp;
+	spin_lock_init(&np->np_channel_lock);
+	INIT_LIST_HEAD(&np->np_channels);
+
+	spin_lock(&ndp->ndp_package_lock);
+	tmp = ncsi_find_package(ndp, id);
+	if (tmp) {
+		spin_unlock(&ndp->ndp_package_lock);
+		kfree(np);
+		return tmp;
+	}
+	list_add_tail_rcu(&np->np_node, &ndp->ndp_packages);
+	spin_unlock(&ndp->ndp_package_lock);
+
+	atomic_inc(&ndp->ndp_package_num);
+	return np;
+}
+
+struct ncsi_package *ncsi_find_package(struct ncsi_dev_priv *ndp,
+				       unsigned char id)
+{
+	struct ncsi_package *np;
+
+	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		if (np->np_id == id)
+			return np;
+	}
+
+	return NULL;
+}
+
+void ncsi_release_package(struct ncsi_package *np)
+{
+	struct ncsi_dev_priv *ndp = np->np_ndp;
+	struct ncsi_channel *nc, *tmp;
+
+	/* Release all child channels */
+	spin_lock(&np->np_channel_lock);
+	list_for_each_entry_safe(nc, tmp, &np->np_channels, nc_node)
+		ncsi_release_channel(nc);
+	spin_unlock(&np->np_channel_lock);
+
+	/* Clear active package if necessary */
+	if (ndp->ndp_active_package == np) {
+		ndp->ndp_active_package = NULL;
+		ndp->ndp_active_channel = NULL;
+	}
+
+	/* Remove and free package */
+	list_del_rcu(&np->np_node);
+	kfree(np);
+}
+
+void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
+				   unsigned char id,
+				   struct ncsi_package **np,
+				   struct ncsi_channel **nc)
+{
+	struct ncsi_package *p;
+	struct ncsi_channel *c;
+
+	p = ncsi_find_package(ndp, NCSI_PACKAGE_INDEX(id));
+	c = p ? ncsi_find_channel(p, NCSI_CHANNEL_INDEX(id)) : NULL;
+
+	if (np)
+		*np = p;
+	if (nc)
+		*nc = c;
+}
+
+/* For two consective NCSI commands, the packet IDs shouldn't be
+ * same. Otherwise, the bogus response might be replied. So the
+ * available IDs are allocated in round-robin fasion.
+ */
+struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp)
+{
+	struct ncsi_req *nr = NULL;
+	int idx, limit = 256;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ndp->ndp_req_lock, flags);
+
+	/* Check if there is one available request until the ceiling */
+	for (idx = atomic_read(&ndp->ndp_last_req_idx);
+	     !nr && idx < limit; idx++) {
+		if (ndp->ndp_reqs[idx].nr_used)
+			continue;
+
+		ndp->ndp_reqs[idx].nr_used = true;
+		nr = &ndp->ndp_reqs[idx];
+		atomic_inc(&ndp->ndp_last_req_idx);
+		if (atomic_read(&ndp->ndp_last_req_idx) >= limit)
+			atomic_set(&ndp->ndp_last_req_idx, 0);
+	}
+
+	/* Fail back to check from the starting cursor */
+	for (idx = 0; !nr && idx < atomic_read(&ndp->ndp_last_req_idx); idx++) {
+		if (ndp->ndp_reqs[idx].nr_used)
+			continue;
+
+		ndp->ndp_reqs[idx].nr_used = true;
+		nr = &ndp->ndp_reqs[idx];
+		atomic_inc(&ndp->ndp_last_req_idx);
+		if (atomic_read(&ndp->ndp_last_req_idx) >= limit)
+			atomic_set(&ndp->ndp_last_req_idx, 0);
+	}
+
+	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
+	return nr;
+}
+
+void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout)
+{
+	struct ncsi_dev_priv *ndp = nr->nr_ndp;
+	struct sk_buff *cmd, *rsp;
+	unsigned long flags;
+
+	if (nr->nr_timer_enabled) {
+		nr->nr_timer_enabled = false;
+		del_timer_sync(&nr->nr_timer);
+	}
+
+	spin_lock_irqsave(&ndp->ndp_req_lock, flags);
+	cmd = nr->nr_cmd;
+	rsp = nr->nr_rsp;
+	nr->nr_cmd = NULL;
+	nr->nr_rsp = NULL;
+	nr->nr_used = false;
+	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
+
+	/* Release command and response */
+	consume_skb(cmd);
+	consume_skb(rsp);
+}
+
+struct ncsi_dev *ncsi_find_dev(struct net_device *dev)
+{
+	struct ncsi_dev_priv *ndp;
+
+	NCSI_FOR_EACH_DEV(ndp) {
+		if (ndp->ndp_ndev.nd_dev == dev)
+			return &ndp->ndp_ndev;
+	}
+
+	return NULL;
+}
+
+static void ncsi_req_timeout(unsigned long data)
+{
+	struct ncsi_req *nr = (struct ncsi_req *)data;
+	struct ncsi_dev_priv *ndp = nr->nr_ndp;
+	unsigned long flags;
+
+	/* If the request already had associated response,
+	 * let the response handler to release it.
+	 */
+	spin_lock_irqsave(&ndp->ndp_req_lock, flags);
+	nr->nr_timer_enabled = false;
+	if (nr->nr_rsp || !nr->nr_cmd) {
+		spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
+
+	/* Release the request */
+	ncsi_free_req(nr, true, true);
+}
+
+struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
+				   void (*handler)(struct ncsi_dev *ndev))
+{
+	struct ncsi_dev_priv *ndp;
+	struct ncsi_dev *nd;
+	int idx;
+
+	/* Check if the device has been registered or not */
+	nd = ncsi_find_dev(dev);
+	if (nd)
+		return nd;
+
+	/* Create NCSI device */
+	ndp = kzalloc(sizeof(*ndp), GFP_ATOMIC);
+	if (!ndp)
+		return NULL;
+
+	nd = &ndp->ndp_ndev;
+	nd->nd_state = ncsi_dev_state_registered;
+	nd->nd_dev = dev;
+	nd->nd_handler = handler;
+
+	/* Initialize private NCSI device */
+	spin_lock_init(&ndp->ndp_package_lock);
+	INIT_LIST_HEAD(&ndp->ndp_packages);
+	spin_lock_init(&ndp->ndp_req_lock);
+	atomic_set(&ndp->ndp_last_req_idx, 0);
+	for (idx = 0; idx < 256; idx++) {
+		ndp->ndp_reqs[idx].nr_id = idx;
+		ndp->ndp_reqs[idx].nr_ndp = ndp;
+		setup_timer(&ndp->ndp_reqs[idx].nr_timer, ncsi_req_timeout,
+			    (unsigned long)&ndp->ndp_reqs[idx]);
+	}
+
+	spin_lock(&ncsi_dev_lock);
+	list_add_tail_rcu(&ndp->ndp_node, &ncsi_dev_list);
+	spin_unlock(&ncsi_dev_lock);
+
+	return nd;
+}
+EXPORT_SYMBOL_GPL(ncsi_register_dev);
+
+void ncsi_unregister_dev(struct ncsi_dev *nd)
+{
+	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
+	struct ncsi_package *np, *tmp;
+
+	spin_lock(&ndp->ndp_package_lock);
+	list_for_each_entry_safe(np, tmp, &ndp->ndp_packages, np_node)
+		ncsi_release_package(np);
+	spin_unlock(&ndp->ndp_package_lock);
+}
+EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
-- 
2.1.0
