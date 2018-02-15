Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="D9Vu/sqC"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lB7ubP4V"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhhdH6HLVzF1Kt
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 14:31:14 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 37EBE20AD6;
 Wed, 14 Feb 2018 22:31:12 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 14 Feb 2018 22:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EwSxF3hddxlukWZVr
 aUc7jdmWv4Illx87wR7+jQ8YJ0=; b=D9Vu/sqCvKRioSxOiMf0u++nJSVHQ0hk+
 8CYw6jqDGG2a1V+X5szdpNyJmY1/AGGDsqXicXeY/1655blLnPY4Dbr1fpNCywXe
 hLCKSVwReDJ6PsLKUJNszrrzrioSmJ6JEoPw7QWlakIjdUdDtigP01W0IqbYPnfg
 X2hRK7mWwXjOd6W/3vUNzeMC9N4+1ZPVsU+KUoiJzZIRNNbOffR0rhxXqMdz4U+z
 fKxXIsX9wMvKM8N1E9xYXV2bYN5XxeSH+6lWvNfeFY+v03qbPwCIkBKr/YpnKQ60
 i5uqDxTiv1F9dalqFMgNjJIM848zYvQzlD6gh3E2qQWzEDeMxRcAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EwSxF3hddxlukWZVr
 aUc7jdmWv4Illx87wR7+jQ8YJ0=; b=lB7ubP4Vz0RrON7cNZoNYigr9Z4SuKiwh
 pfOSNZHHpUMahh1NrZAcOuN9bgJ3KoG1VBaAKWqMLx6QdtwamNyfDaSaW/37FGB/
 LjFH7d/rCCkhE+/ZY6oh0TtSlpyAYfGFiYf93G25hC52Qm0/UdcofeYIqIKkLEz2
 sYPUDIijD+rS0r252sdGewzM7AQx08lj6ELp6UpjJ4i/Qwdya9VhcJ72Y1yVHyUM
 v7VeCbRMOa9Pa0SEbLz1D3I4x9jXlJLRLR0xs/iwqGfbv9cB5i948aeaRcos2XSq
 CVMH/vKd+5SzODvMpk3k1P9rMP52ynfXpSRCxJf2ZOIhsIA6Ujxbg==
X-ME-Sender: <xms:AP-EWqHVN7VJ7fyMjotMuvzpWM_-EM59l1QM-LdMCEEPvAQJmA7_rA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E60B0240DE;
 Wed, 14 Feb 2018 22:31:10 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [RFC PATCH] net/ncsi: Add generic netlink family
Date: Thu, 15 Feb 2018 14:30:57 +1100
Message-Id: <20180215033057.1766-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.16.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 03:31:18 -0000

Add a generic netlink family for NCSI. This supports two commands;
NCSI_CMD_PKG_INFO which returns information on packages and their
associated channels, and NCSI_CMD_SET_INTERFACE which allows a specific
package or package/channel combination to be set as the preferred
choice.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
Fielding an RFC first to gauge what sort of information people may want
out of an NCSI user API before it gets carved in stone. This RFC exposes
a few main things such as link state, active link, channel versions, and
active vlan ids, is there more that could be helpful in version 1 of the
UAPI?
The big drawcard here is of course the ability to set preferred packages
and channels so that the NCSI link can be bound to *only* port 0 for
example. If you have opinions about how this should function now is the
time to speak up :)

 include/uapi/linux/ncsi.h |  65 ++++++++
 net/ncsi/Makefile         |   2 +-
 net/ncsi/internal.h       |   3 +
 net/ncsi/ncsi-manage.c    |  28 +++-
 net/ncsi/ncsi-netlink.c   | 394 ++++++++++++++++++++++++++++++++++++++++++++++
 net/ncsi/ncsi-netlink.h   |  20 +++
 6 files changed, 508 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/linux/ncsi.h
 create mode 100644 net/ncsi/ncsi-netlink.c
 create mode 100644 net/ncsi/ncsi-netlink.h

diff --git a/include/uapi/linux/ncsi.h b/include/uapi/linux/ncsi.h
new file mode 100644
index 000000000000..45de201569e3
--- /dev/null
+++ b/include/uapi/linux/ncsi.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __UAPI_NCSI_NETLINK_H__
+#define __UAPI_NCSI_NETLINK_H__
+
+enum ncsi_nl_commands {
+	NCSI_CMD_UNSPEC,
+	NCSI_CMD_SET_INTERFACE,
+	NCSI_CMD_PKG_INFO,
+	NCSI_CMD_MAX,
+};
+
+#define NCSI_CMD_MAX (NCSI_CMD_MAX - 1)
+
+enum ncsi_nl_attrs {
+	NCSI_ATTR_UNSPEC,
+	NCSI_ATTR_IFINDEX,
+	NCSI_ATTR_PACKAGE_LIST,
+	NCSI_ATTR_PACKAGE_ID,
+	NCSI_ATTR_CHANNEL_ID,
+	NCSI_ATTR_MAX,
+};
+
+enum ncsi_nl_pkg_attrs {
+	NCSI_PKG_ATTR_UNSPEC,
+	NCSI_PKG_ATTR,
+	NCSI_PKG_ATTR_ID,
+	NCSI_PKG_ATTR_CHANNEL_LIST,
+	NCSI_PKG_ATTR_MAX,
+};
+
+enum ncsi_nl_channel_attrs {
+	NCSI_CHANNEL_ATTR_UNSPEC,
+	NCSI_CHANNEL_ATTR,
+	NCSI_CHANNEL_ATTR_ID,
+	NCSI_CHANNEL_ATTR_VERSION_MAJOR,
+	NCSI_CHANNEL_ATTR_VERSION_MINOR,
+	NCSI_CHANNEL_ATTR_VERSION_STR,
+	NCSI_CHANNEL_ATTR_LINK_STATE,
+	NCSI_CHANNEL_ATTR_ACTIVE,
+	NCSI_CHANNEL_ATTR_VLAN_LIST,
+	NCSI_CHANNEL_ATTR_MAX,
+};
+
+enum ncsi_nl_vlan_attrs {
+	NCSI_VLAN_UNSPEC,
+	NCSI_VLAN_ATTR,
+	NCSI_VLAN_ATTR_ID,
+	NCSI_VLAN_ATTR_PROTO,
+	NCSI_VLAN_ATTR_MAX,
+};
+
+#define NCSI_ATTR_MAX (NCSI_ATTR_MAX - 1)
+#define NCSI_PKG_ATTR_MAX (NCSI_PKG_ATTR_MAX - 1)
+#define NCSI_CHANNEL_ATTR_MAX (NCSI_CHANNEL_ATTR_MAX - 1)
+#define NCSI_VLAN_ATTR_MAX (NCSI_VLAN_ATTR_MAX - 1)
+
+#endif /* __UAPI_NCSI_NETLINK_H__ */
diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
index dd12b564f2e7..436ef68331f2 100644
--- a/net/ncsi/Makefile
+++ b/net/ncsi/Makefile
@@ -1,4 +1,4 @@
 #
 # Makefile for NCSI API
 #
-obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o
+obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o ncsi-netlink.o
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index d30f7bd741d0..8da84312cd3b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -276,6 +276,8 @@ struct ncsi_dev_priv {
 	unsigned int        package_num;     /* Number of packages         */
 	struct list_head    packages;        /* List of packages           */
 	struct ncsi_channel *hot_channel;    /* Channel was ever active    */
+	struct ncsi_package *force_package;  /* Force a specific package   */
+	struct ncsi_channel *force_channel;  /* Force a specific channel   */
 	struct ncsi_request requests[256];   /* Request table              */
 	unsigned int        request_id;      /* Last used request ID       */
 #define NCSI_REQ_START_IDX	1
@@ -318,6 +320,7 @@ extern spinlock_t ncsi_dev_lock;
 	list_for_each_entry_rcu(nc, &np->channels, node)
 
 /* Resources */
+u32 *ncsi_get_filter(struct ncsi_channel *nc, int table, int index);
 int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data);
 int ncsi_add_filter(struct ncsi_channel *nc, int table, void *data);
 int ncsi_remove_filter(struct ncsi_channel *nc, int table, int index);
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index b799d7962544..f324f3fec11b 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
-#include <linux/netlink.h>
 
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
@@ -23,6 +22,7 @@
 
 #include "internal.h"
 #include "ncsi-pkt.h"
+#include "ncsi-netlink.h"
 
 LIST_HEAD(ncsi_dev_list);
 DEFINE_SPINLOCK(ncsi_dev_lock);
@@ -964,20 +964,37 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 
 static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 {
-	struct ncsi_package *np;
-	struct ncsi_channel *nc, *found, *hot_nc;
+	struct ncsi_package *np, *force_package;
+	struct ncsi_channel *nc, *found, *hot_nc, *force_channel;
 	struct ncsi_channel_mode *ncm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&ndp->lock, flags);
 	hot_nc = ndp->hot_channel;
+	force_channel = ndp->force_channel;
+	force_package = ndp->force_package;
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
+	/* Force a specific channel whether or not it has link if we have been
+	 * configured to do so
+	 */
+	if (force_package && force_channel) {
+		found = force_channel;
+		ncm = &found->modes[NCSI_MODE_LINK];
+		if (!(ncm->data[2] & 0x1))
+			netdev_info(ndp->ndev.dev,
+				    "NCSI: Channel %u forced, but it is link down\n",
+				    found->id);
+		goto out;
+	}
+
 	/* The search is done once an inactive channel with up
 	 * link is found.
 	 */
 	found = NULL;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		if (ndp->force_package && np != ndp->force_package)
+			continue;
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			spin_lock_irqsave(&nc->lock, flags);
 
@@ -1594,6 +1611,9 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	ndp->ptype.dev = dev;
 	dev_add_pack(&ndp->ptype);
 
+	/* Set up generic netlink interface */
+	ncsi_init_netlink(dev);
+
 	return nd;
 }
 EXPORT_SYMBOL_GPL(ncsi_register_dev);
@@ -1673,6 +1693,8 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 #endif
 	spin_unlock_irqrestore(&ncsi_dev_lock, flags);
 
+	ncsi_unregister_netlink(nd->dev);
+
 	kfree(ndp);
 }
 EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
new file mode 100644
index 000000000000..02f4f89805d6
--- /dev/null
+++ b/net/ncsi/ncsi-netlink.c
@@ -0,0 +1,394 @@
+/*
+ * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/if_arp.h>
+#include <linux/rtnetlink.h>
+#include <linux/etherdevice.h>
+#include <linux/module.h>
+#include <net/genetlink.h>
+#include <net/ncsi.h>
+#include <linux/skbuff.h>
+#include <net/sock.h>
+#include <uapi/linux/ncsi.h>
+
+#include "internal.h"
+#include "ncsi-netlink.h"
+
+static struct genl_family ncsi_genl_family;
+
+static const struct nla_policy ncsi_genl_policy[NCSI_ATTR_MAX + 1] = {
+	[NCSI_ATTR_IFINDEX] =		{ .type = NLA_U32 },
+	[NCSI_ATTR_PACKAGE_LIST] =	{ .type = NLA_NESTED },
+	[NCSI_ATTR_PACKAGE_ID] =	{ .type = NLA_U32 },
+	[NCSI_ATTR_CHANNEL_ID] =	{ .type = NLA_U32 },
+};
+
+static struct ncsi_dev_priv *ndp_from_ifindex(struct net *net, u32 ifindex)
+{
+	struct ncsi_dev_priv *ndp;
+	struct net_device *dev;
+	struct ncsi_dev *nd;
+	struct ncsi_dev;
+
+	if (!net)
+		return NULL;
+
+	dev = dev_get_by_index(net, ifindex);
+	if (!dev) {
+		printk(KERN_ERR "NCSI netlink: No device for ifindex %u\n",
+		       ifindex);
+		return NULL;
+	}
+
+	nd = ncsi_find_dev(dev);
+	ndp = nd ? TO_NCSI_DEV_PRIV(nd) : NULL;
+
+	dev_put(dev);
+	return ndp;
+}
+
+static int ncsi_write_channel_info(struct sk_buff *skb,
+				   struct ncsi_dev_priv *ndp,
+				   struct ncsi_channel *nc)
+{
+	struct nlattr *vlist_nest, *vlan_nest;
+	struct ncsi_channel_filter *ncf;
+	struct ncsi_channel_mode *m;
+	u32 *data;
+	int i;
+
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_ID, nc->id);
+	m = &nc->modes[NCSI_MODE_LINK];
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_LINK_STATE, m->data[2]);
+	if (nc->state == NCSI_CHANNEL_ACTIVE)
+		nla_put_flag(skb, NCSI_CHANNEL_ATTR_ACTIVE);
+
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MAJOR, nc->version.version);
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MINOR, nc->version.alpha2);
+	nla_put_string(skb, NCSI_CHANNEL_ATTR_VERSION_STR, nc->version.fw_name);
+
+	vlist_nest = nla_nest_start(skb, NCSI_CHANNEL_ATTR_VLAN_LIST);
+	if (!vlist_nest)
+		return -ENOMEM;
+	ncf = nc->filters[NCSI_FILTER_VLAN];
+	i = -1;
+	if (ncf) {
+		while ((i = find_next_bit((void *)&ncf->bitmap, ncf->total,
+					  i + 1)) < ncf->total) {
+			data = ncsi_get_filter(nc, NCSI_FILTER_VLAN, i);
+			/* Uninitialised channels will have 'zero' vlan ids */
+			if (!data || !*data)
+				continue;
+			vlan_nest = nla_nest_start(skb, NCSI_VLAN_ATTR);
+			if (!vlan_nest)
+				continue;
+			nla_put_u16(skb, NCSI_VLAN_ATTR_ID, *(u16 *)data);
+			nla_nest_end(skb, vlan_nest);
+		}
+	}
+	nla_nest_end(skb, vlist_nest);
+
+	return 0;
+}
+
+static int ncsi_write_package_info(struct sk_buff *skb,
+				   struct ncsi_dev_priv *ndp, unsigned int id)
+{
+	struct nlattr *pnest, *cnest, *nest;
+	struct ncsi_package *np;
+	struct ncsi_channel *nc;
+	bool found;
+	int rc;
+
+	if (id > ndp->package_num) {
+		netdev_info(ndp->ndev.dev, "NCSI: No package with id %u\n", id);
+		return -ENODEV;
+	}
+
+	found = false;
+	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		if (np->id != id)
+			continue;
+		pnest = nla_nest_start(skb, NCSI_PKG_ATTR);
+		if (!pnest)
+			return -ENOMEM;
+		nla_put_u32(skb, NCSI_PKG_ATTR_ID, np->id);
+		cnest = nla_nest_start(skb, NCSI_PKG_ATTR_CHANNEL_LIST);
+		if (!cnest) {
+			nla_nest_cancel(skb, pnest);
+			return -ENOMEM;
+		}
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			nest = nla_nest_start(skb, NCSI_CHANNEL_ATTR);
+			if (!nest) {
+				nla_nest_cancel(skb, cnest);
+				nla_nest_cancel(skb, pnest);
+				return -ENOMEM;
+			}
+			rc = ncsi_write_channel_info(skb, ndp, nc);
+			if (rc) {
+				nla_nest_cancel(skb, nest);
+				nla_nest_cancel(skb, cnest);
+				nla_nest_cancel(skb, pnest);
+				return rc;
+			}
+			nla_nest_end(skb, nest);
+		}
+		nla_nest_end(skb, cnest);
+		nla_nest_end(skb, pnest);
+		found = true;
+	}
+
+	if (!found)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
+{
+	struct ncsi_dev_priv *ndp;
+	unsigned int package_id;
+	struct sk_buff *skb;
+	struct nlattr *attr;
+	void *hdr;
+	int rc;
+
+	if (!info || !info->attrs)
+		return -EINVAL;
+
+	if (!info->attrs[NCSI_ATTR_IFINDEX])
+		return -EINVAL;
+
+	if (!info->attrs[NCSI_ATTR_PACKAGE_ID])
+		return -EINVAL;
+
+	ndp = ndp_from_ifindex(genl_info_net(info),
+			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp)
+		return -ENODEV;
+
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(skb, info->snd_portid, info->snd_seq,
+			  &ncsi_genl_family, 0, NCSI_CMD_PKG_INFO);
+	if (!hdr) {
+		kfree(skb);
+		return -EMSGSIZE;
+	}
+
+	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
+
+	attr = nla_nest_start(skb, NCSI_ATTR_PACKAGE_LIST);
+	rc = ncsi_write_package_info(skb, ndp, package_id);
+
+	if (rc) {
+		nla_nest_cancel(skb, attr);
+		goto err;
+	}
+
+	nla_nest_end(skb, attr);
+
+	genlmsg_end(skb, hdr);
+	return genlmsg_reply(skb, info);
+
+err:
+	genlmsg_cancel(skb, hdr);
+	kfree(skb);
+	return rc;
+}
+
+static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
+				struct netlink_callback *cb)
+{
+	struct nlattr *attrs[NCSI_ATTR_MAX];
+	struct ncsi_package *np, *package;
+	struct ncsi_dev_priv *ndp;
+	unsigned int package_id;
+	struct nlattr *attr;
+	void *hdr;
+	int rc;
+
+	rc = genlmsg_parse(cb->nlh, &ncsi_genl_family, attrs, NCSI_ATTR_MAX,
+			   ncsi_genl_policy);
+	if (rc)
+		return rc;
+
+	if (!attrs[NCSI_ATTR_IFINDEX])
+		return -EINVAL;
+
+	ndp = ndp_from_ifindex(get_net(sock_net(skb->sk)),
+			       nla_get_u32(attrs[NCSI_ATTR_IFINDEX]));
+
+	if (!ndp)
+		return -ENODEV;
+
+	package_id = cb->args[0];
+	package = NULL;
+	NCSI_FOR_EACH_PACKAGE(ndp, np)
+		if (np->id == package_id)
+			package = np;
+
+	if (!package)
+		return 0; /* done */
+
+	hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
+			  &ncsi_genl_family, 0,  NCSI_CMD_PKG_INFO);
+	if (!hdr) {
+		rc = -EMSGSIZE;
+		goto err;
+	}
+
+	attr = nla_nest_start(skb, NCSI_ATTR_PACKAGE_LIST);
+	rc = ncsi_write_package_info(skb, ndp, package->id);
+	if (rc) {
+		nla_nest_cancel(skb, attr);
+		goto err;
+	}
+
+	nla_nest_end(skb, attr);
+	genlmsg_end(skb, hdr);
+
+	cb->args[0] = package_id + 1;
+
+	return skb->len;
+err:
+	genlmsg_cancel(skb, hdr);
+	return rc;
+}
+
+static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
+{
+	struct ncsi_package *np, *package;
+	struct ncsi_channel *nc, *channel;
+	u32 package_id, channel_id;
+	struct ncsi_dev_priv *ndp;
+	unsigned long flags;
+
+	if (!info || !info->attrs)
+		return -EINVAL;
+
+	if (!info->attrs[NCSI_ATTR_IFINDEX])
+		return -EINVAL;
+
+	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp)
+		return -ENODEV;
+
+	if (!info->attrs[NCSI_ATTR_PACKAGE_ID]) {
+		/* Clear any override */
+		spin_lock_irqsave(&ndp->lock, flags);
+		ndp->force_package = NULL;
+		ndp->force_channel = NULL;
+		spin_unlock_irqrestore(&ndp->lock, flags);
+		netdev_info(ndp->ndev.dev,
+			    "NCSI: Cleared preferred package/channel\n");
+		goto done;
+	}
+
+	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
+	package = NULL;
+
+	spin_lock_irqsave(&ndp->lock, flags);
+
+	NCSI_FOR_EACH_PACKAGE(ndp, np)
+		if (np->id == package_id)
+			package = np;
+	if (!package) {
+		/* The user has set a package that does not exist */
+		return -ERANGE;
+	}
+
+	channel = NULL;
+	if (!info->attrs[NCSI_ATTR_CHANNEL_ID]) {
+		/* Allow any channel */
+		channel_id = NCSI_RESERVED_CHANNEL;
+	} else {
+		channel_id = nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
+		NCSI_FOR_EACH_CHANNEL(package, nc)
+			if (nc->id == channel_id)
+				channel = nc;
+	}
+
+	if (channel_id != NCSI_RESERVED_CHANNEL && !channel) {
+		/* The user has set a channel that does not exist on this
+		 * package
+		 */
+		netdev_info(ndp->ndev.dev, "NCSI: Channel %u does not exist!\n",
+			    channel_id);
+		return -ERANGE;
+	}
+
+	ndp->force_package = package;
+	ndp->force_channel = channel;
+	spin_unlock_irqrestore(&ndp->lock, flags);
+
+	netdev_info(ndp->ndev.dev, "Set package 0x%x, channel 0x%x%s as preferred\n",
+		    package_id, channel_id,
+		    channel_id == NCSI_RESERVED_CHANNEL ? " (any)" : "");
+
+done:
+	/* Bounce the NCSI channel to set changes */
+	ncsi_stop_dev(&ndp->ndev);
+	ncsi_start_dev(&ndp->ndev);
+
+	return 0;
+}
+
+static const struct genl_ops ncsi_ops[] = {
+	{
+		.cmd = NCSI_CMD_SET_INTERFACE,
+		.policy = ncsi_genl_policy,
+		.doit = ncsi_set_interface_nl,
+		.flags = GENL_ADMIN_PERM,
+	},
+	{
+		.cmd = NCSI_CMD_PKG_INFO,
+		.policy = ncsi_genl_policy,
+		.doit = ncsi_pkg_info_nl,
+		.dumpit = ncsi_pkg_info_all_nl,
+		.flags = 0,
+	},
+};
+
+static struct genl_family ncsi_genl_family __ro_after_init = {
+	.name = "NCSI",
+	.version = 0,
+	.maxattr = NCSI_ATTR_MAX,
+	.module = THIS_MODULE,
+	.ops = ncsi_ops,
+	.n_ops = ARRAY_SIZE(ncsi_ops),
+};
+
+int ncsi_init_netlink(struct net_device *dev)
+{
+	int rc;
+
+	rc = genl_register_family(&ncsi_genl_family);
+	if (rc)
+		netdev_err(dev, "ncsi: failed to register netlink family\n");
+
+	return rc;
+}
+
+int ncsi_unregister_netlink(struct net_device *dev)
+{
+	int rc;
+
+	rc = genl_unregister_family(&ncsi_genl_family);
+	if (rc)
+		netdev_err(dev, "ncsi: failed to unregister netlink family\n");
+
+	return rc;
+}
diff --git a/net/ncsi/ncsi-netlink.h b/net/ncsi/ncsi-netlink.h
new file mode 100644
index 000000000000..91a5c256f8c4
--- /dev/null
+++ b/net/ncsi/ncsi-netlink.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __NCSI_NETLINK_H__
+#define __NCSI_NETLINK_H__
+
+#include <linux/netdevice.h>
+
+#include "internal.h"
+
+int ncsi_init_netlink(struct net_device *dev);
+int ncsi_unregister_netlink(struct net_device *dev);
+
+#endif /* __NCSI_NETLINK_H__ */
-- 
2.16.1
