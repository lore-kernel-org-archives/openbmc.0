Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="QeFtybZH"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MKcQ5rxLzF3JD;
 Sat, 29 Sep 2018 04:16:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538158567; x=1569694567;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=d2PHq9zOk8sLo7afTU9gyznVG6qooN9r+beEQZzv5cY=;
 b=QeFtybZHSJljc8XXhI3dAvIm3dIMRM8dOMjg4IZFhKRvWsXKEIPRhQad
 7N7IS4W5SyVOwN9GTJHQ+QBetMqjS+3s1n2CoEnBQUSX+Cx286XU9QIpx
 FxSIt1iYHm7RRhOU+FfpXESowzDxMvd9Oi+cwS3AZEmR7oTCbRaQ+ynzZ Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EXAABFb65bhyeV50NbGwEBAQEDAQE?=
 =?us-ascii?q?BBwMBAQGBUYJ0fygKhzSES1+LUjuDepQugXoLG4EVgzyDfiE0GAEDAQECAQE?=
 =?us-ascii?q?CAQECEAEBAQoLCQgpIwyCNSKBRl9AFhUTPxIBPmgBBAEJBAUIGoJ/AYIBmiu?=
 =?us-ascii?q?JVwEBAYFoM4Nwhh+KfoEPgQiBEQGCZIsEAoEoAZt0BgEChkOJZR+PSJF+AYJ?=
 =?us-ascii?q?9AgQCBAUCFIFCgg5wgW6BTgmCGQMOCRGDD4J/h3lvingCBR8HgQGBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2EXAABFb65bhyeV50NbGwEBAQEDAQEBBwMBAQGBUYJ0f?=
 =?us-ascii?q?ygKhzSES1+LUjuDepQugXoLG4EVgzyDfiE0GAEDAQECAQECAQECEAEBAQoLC?=
 =?us-ascii?q?QgpIwyCNSKBRl9AFhUTPxIBPmgBBAEJBAUIGoJ/AYIBmiuJVwEBAYFoM4Nwh?=
 =?us-ascii?q?h+KfoEPgQiBEQGCZIsEAoEoAZt0BgEChkOJZR+PSJF+AYJ9AgQCBAUCFIFCg?=
 =?us-ascii?q?g5wgW6BTgmCGQMOCRGDD4J/h3lvingCBR8HgQGBHwEB?=
Received: from mx0a-00154901.pphosted.com ([67.231.149.39])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Sep 2018 13:16:02 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8SID9lD050772; Fri, 28 Sep 2018 14:16:02 -0400
Received: from esa6.dell-outbound2.iphmx.com (esa6.dell-outbound2.iphmx.com
 [68.232.154.99])
 by mx0b-00154901.pphosted.com with ESMTP id 2msnth9c9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Sep 2018 14:16:02 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 29 Sep 2018 00:16:01 +0600
X-LoopCount0: from 10.166.135.96
X-IronPort-AV: E=Sophos;i="5.54,316,1534827600"; d="scan'208";a="237310258"
To: <joel@jms.id.au>, <sam@mendozajonas.com>
CC: <linux-aspeed@lists.ozlabs.org>, <netdev@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <amithash@fb.com>, <christian@cmd.nu>,
 <vijaykhemka@fb.com>
Subject: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow user
 space to send NC-SI command
Thread-Topic: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Index: AdRXVsR4fRwK5ubSQ2OHaqPrycIEsg==
Date: Fri, 28 Sep 2018 18:15:59 +0000
Message-ID: <58fff61ffd8d4038b59f32b696e76bbc@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809280179
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
X-List-Received-Date: Fri, 28 Sep 2018 18:16:08 -0000

The new command (NCSI_CMD_SEND_CMD) is added to allow user space applicatio=
n=20
to send NC-SI command to the network card.
Also, add a new attribute (NCSI_ATTR_DATA) for transferring request and res=
ponse.

The work flow is as below.=20

Request:
User space application -> Netlink interface (msg)
                                              -> new Netlink handler - ncsi=
_send_cmd_nl()
                                              -> ncsi_xmit_cmd()
Response:
Response received - ncsi_rcv_rsp() -> internal response handler - ncsi_rsp_=
handler_xxx()
                                                                        -> =
ncsi_rsp_handler_netlink()
                                                                        -> =
ncsi_send_netlink_rsp ()
                                                                        -> =
Netlink interface (msg)
                                                                        -> =
user space application
Command timeout - ncsi_request_timeout() -> ncsi_send_netlink_timeout ()
                                                                           =
                 -> Netlink interface (msg with zero data length)
                                                                           =
                 -> user space application
Error:
Error detected -> ncsi_send_netlink_err () -> Netlink interface (err msg)
                                                                           =
            -> user space application


Signed-off-by: Justin Lee <justin.lee1@dell.com>

---
 include/uapi/linux/ncsi.h |   3 +
 net/ncsi/internal.h       |  12 ++-
 net/ncsi/ncsi-cmd.c       |  47 ++++++++++-
 net/ncsi/ncsi-manage.c    |  22 +++++
 net/ncsi/ncsi-netlink.c   | 205 ++++++++++++++++++++++++++++++++++++++++++=
++++
 net/ncsi/ncsi-netlink.h   |  12 +++
 net/ncsi/ncsi-rsp.c       |  71 ++++++++++++++--
 7 files changed, 363 insertions(+), 9 deletions(-)

diff --git a/include/uapi/linux/ncsi.h b/include/uapi/linux/ncsi.h
index 4c292ec..4992bfc 100644
--- a/include/uapi/linux/ncsi.h
+++ b/include/uapi/linux/ncsi.h
@@ -30,6 +30,7 @@ enum ncsi_nl_commands {
 	NCSI_CMD_PKG_INFO,
 	NCSI_CMD_SET_INTERFACE,
 	NCSI_CMD_CLEAR_INTERFACE,
+	NCSI_CMD_SEND_CMD,
=20
 	__NCSI_CMD_AFTER_LAST,
 	NCSI_CMD_MAX =3D __NCSI_CMD_AFTER_LAST - 1
@@ -43,6 +44,7 @@ enum ncsi_nl_commands {
  * @NCSI_ATTR_PACKAGE_LIST: nested array of NCSI_PKG_ATTR attributes
  * @NCSI_ATTR_PACKAGE_ID: package ID
  * @NCSI_ATTR_CHANNEL_ID: channel ID
+ * @NCSI_ATTR_DATA: command payload
  * @NCSI_ATTR_MAX: highest attribute number
  */
 enum ncsi_nl_attrs {
@@ -51,6 +53,7 @@ enum ncsi_nl_attrs {
 	NCSI_ATTR_PACKAGE_LIST,
 	NCSI_ATTR_PACKAGE_ID,
 	NCSI_ATTR_CHANNEL_ID,
+	NCSI_ATTR_DATA,
=20
 	__NCSI_ATTR_AFTER_LAST,
 	NCSI_ATTR_MAX =3D __NCSI_ATTR_AFTER_LAST - 1
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 8055e39..1a3ef9e 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -171,6 +171,8 @@ struct ncsi_package;
 #define NCSI_RESERVED_CHANNEL	0x1f
 #define NCSI_CHANNEL_INDEX(c)	((c) & ((1 << NCSI_PACKAGE_SHIFT) - 1))
 #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
+#define NCSI_MAX_PACKAGE	8
+#define NCSI_MAX_CHANNEL	32
=20
 struct ncsi_channel {
 	unsigned char               id;
@@ -215,12 +217,17 @@ struct ncsi_request {
 	unsigned char        id;      /* Request ID - 0 to 255           */
 	bool                 used;    /* Request that has been assigned  */
 	unsigned int         flags;   /* NCSI request property           */
-#define NCSI_REQ_FLAG_EVENT_DRIVEN	1
+#define NCSI_REQ_FLAG_EVENT_DRIVEN		1
+#define NCSI_REQ_FLAG_NETLINK_DRIVEN	2
 	struct ncsi_dev_priv *ndp;    /* Associated NCSI device          */
 	struct sk_buff       *cmd;    /* Associated NCSI command packet  */
 	struct sk_buff       *rsp;    /* Associated NCSI response packet */
 	struct timer_list    timer;   /* Timer on waiting for response   */
 	bool                 enabled; /* Time has been enabled or not    */
+
+	u32                  snd_seq;     /* netlink sending sequence number */
+	u32                  snd_portid;  /* netlink portid of sender        */
+	struct nlmsghdr      nlhdr;       /* netlink message header          */
 };
=20
 enum {
@@ -305,6 +312,9 @@ struct ncsi_cmd_arg {
 		unsigned short words[8];
 		unsigned int   dwords[4];
 	};
+
+	unsigned char        *data;       /* Netlink data                  */
+	struct genl_info     *info;       /* Netlink information           */
 };
=20
 extern struct list_head ncsi_dev_list;
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 7567ca63..43b544c 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -17,6 +17,7 @@
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
 #include <net/sock.h>
+#include <net/genetlink.h>
=20
 #include "internal.h"
 #include "ncsi-pkt.h"
@@ -211,6 +212,39 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
 	return 0;
 }
=20
+static int ncsi_cmd_handler_oem(struct sk_buff *skb,
+				struct ncsi_cmd_arg *nca)
+{
+	struct ncsi_cmd_pkt *cmd;
+	unsigned char *dest, *source;
+	unsigned short len;
+
+	/* struct ncsi_cmd_pkt =3D minimum length
+	 *                       - frame checksum
+	 *                       - Ethernet header
+	 *                     =3D 64 - 4 - 14 =3D 46
+	 * minimum payload =3D 46 - ncsi header - ncsi checksum
+	 *                 =3D 46 - 16 - 4 =3D 26
+	 */
+	len =3D nca->payload;
+
+	/* minimum payload length is 26 bytes to meet minimum packet
+	 * length 64
+	 */
+	if (len < 26)
+		cmd =3D skb_put_zero(skb, sizeof(*cmd));
+	else
+		cmd =3D skb_put_zero(skb, len + sizeof(struct ncsi_pkt_hdr) + 4);
+
+	dest =3D (unsigned char *)cmd + sizeof(struct ncsi_pkt_hdr);
+	source =3D (unsigned char *)nca->data + sizeof(struct ncsi_pkt_hdr);
+	memcpy(dest, source, len);
+
+	ncsi_cmd_build_header(&cmd->cmd.common, nca);
+
+	return 0;
+}
+
 static struct ncsi_cmd_handler {
 	unsigned char type;
 	int           payload;
@@ -244,7 +278,7 @@ static struct ncsi_cmd_handler {
 	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
+	{ NCSI_PKT_CMD_OEM,    -1, ncsi_cmd_handler_oem     },
 	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
 	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
 };
@@ -317,11 +351,20 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	}
=20
 	/* Get packet payload length and allocate the request */
-	nca->payload =3D nch->payload;
+	if (nch->payload >=3D 0)
+		nca->payload =3D nch->payload;
+
 	nr =3D ncsi_alloc_command(nca);
 	if (!nr)
 		return -ENOMEM;
=20
+	/* track netlink information */
+	if (nca->req_flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN) {
+		nr->snd_seq =3D nca->info->snd_seq;
+		nr->snd_portid =3D nca->info->snd_portid;
+		nr->nlhdr =3D *nca->info->nlhdr;
+	}
+
 	/* Prepare the packet */
 	nca->id =3D nr->id;
 	ret =3D nch->handler(nr->cmd, nca);
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 0912847..29f33a1 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -19,6 +19,7 @@
 #include <net/addrconf.h>
 #include <net/ipv6.h>
 #include <net/if_inet6.h>
+#include <net/genetlink.h>
=20
 #include "internal.h"
 #include "ncsi-pkt.h"
@@ -406,8 +407,13 @@ static void ncsi_request_timeout(struct timer_list *t)
 {
 	struct ncsi_request *nr =3D from_timer(nr, t, timer);
 	struct ncsi_dev_priv *ndp =3D nr->ndp;
+	struct ncsi_package *np;
+	struct ncsi_channel *nc;
+	struct ncsi_cmd_pkt *cmd;
 	unsigned long flags;
=20
+	netdev_dbg(ndp->ndev.dev, "NCSI: %s\n", __func__);
+
 	/* If the request already had associated response,
 	 * let the response handler to release it.
 	 */
@@ -415,10 +421,26 @@ static void ncsi_request_timeout(struct timer_list *t=
)
 	nr->enabled =3D false;
 	if (nr->rsp || !nr->cmd) {
 		spin_unlock_irqrestore(&ndp->lock, flags);
+
+		netdev_dbg(ndp->ndev.dev,
+			   "NCSI: %s - early return\n", __func__);
+
 		return;
 	}
 	spin_unlock_irqrestore(&ndp->lock, flags);
=20
+	if (nr->flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN) {
+		if (nr->cmd) {
+			/* Find the package */
+			cmd =3D (struct ncsi_cmd_pkt *)
+			      skb_network_header(nr->cmd);
+			ncsi_find_package_and_channel(ndp,
+						      cmd->cmd.common.channel,
+						      &np, &nc);
+			ncsi_send_netlink_timeout(nr, np, nc);
+		}
+	}
+
 	/* Release the request */
 	ncsi_free_request(nr);
 }
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index 45f33d6..ce57675 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -20,6 +20,7 @@
 #include <uapi/linux/ncsi.h>
=20
 #include "internal.h"
+#include "ncsi-pkt.h"
 #include "ncsi-netlink.h"
=20
 static struct genl_family ncsi_genl_family;
@@ -29,6 +30,7 @@ static const struct nla_policy ncsi_genl_policy[NCSI_ATTR=
_MAX + 1] =3D {
 	[NCSI_ATTR_PACKAGE_LIST] =3D	{ .type =3D NLA_NESTED },
 	[NCSI_ATTR_PACKAGE_ID] =3D	{ .type =3D NLA_U32 },
 	[NCSI_ATTR_CHANNEL_ID] =3D	{ .type =3D NLA_U32 },
+	[NCSI_ATTR_DATA] =3D		{ .type =3D NLA_BINARY, .len =3D 2048 },
 };
=20
 static struct ncsi_dev_priv *ndp_from_ifindex(struct net *net, u32 ifindex=
)
@@ -366,6 +368,203 @@ static int ncsi_clear_interface_nl(struct sk_buff *ms=
g, struct genl_info *info)
 	return 0;
 }
=20
+static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
+{
+	struct ncsi_dev_priv *ndp;
+
+	struct ncsi_cmd_arg nca;
+	struct ncsi_pkt_hdr *hdr;
+
+	u32 package_id, channel_id;
+	unsigned char *data;
+	void *head;
+	int len, ret;
+
+	if (!info || !info->attrs) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	if (!info->attrs[NCSI_ATTR_IFINDEX]) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	if (!info->attrs[NCSI_ATTR_PACKAGE_ID]) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	if (!info->attrs[NCSI_ATTR_CHANNEL_ID]) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	ndp =3D ndp_from_ifindex(get_net(sock_net(msg->sk)),
+			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp) {
+		ret =3D -ENODEV;
+		goto out;
+	}
+
+	package_id =3D nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
+	channel_id =3D nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
+
+	if (package_id >=3D NCSI_MAX_PACKAGE || channel_id >=3D NCSI_MAX_CHANNEL)=
 {
+		ret =3D -ERANGE;
+		goto out_netlink;
+	}
+
+	len =3D nla_len(info->attrs[NCSI_ATTR_DATA]);
+	if (len < sizeof(struct ncsi_pkt_hdr)) {
+		netdev_info(ndp->ndev.dev, "NCSI: no OEM command to send %u\n",
+			    package_id);
+		ret =3D -EINVAL;
+		goto out_netlink;
+	} else {
+		head =3D nla_data(info->attrs[NCSI_ATTR_DATA]);
+		data =3D (unsigned char *)head;
+	}
+
+	hdr =3D (struct ncsi_pkt_hdr *)data;
+
+	nca.ndp =3D ndp;
+	nca.package =3D (unsigned char)package_id;
+	nca.channel =3D (unsigned char)channel_id;
+	nca.type =3D hdr->type;
+	nca.req_flags =3D NCSI_REQ_FLAG_NETLINK_DRIVEN;
+	nca.info =3D info;
+	nca.payload =3D ntohs(hdr->length);
+	nca.data =3D data;
+
+	ret =3D ncsi_xmit_cmd(&nca);
+out_netlink:
+	if (ret !=3D 0) {
+		netdev_err(ndp->ndev.dev,
+			   "Error %d sending OEM command\n", ret);
+		ncsi_send_netlink_err(ndp->ndev.dev,
+				      info->snd_seq,
+				      info->snd_portid,
+				      info->nlhdr,
+				      ret);
+	}
+out:
+	return ret;
+}
+
+int ncsi_send_netlink_rsp(struct ncsi_request *nr,
+			  struct ncsi_package *np,
+			  struct ncsi_channel *nc)
+{
+	struct sk_buff *skb;
+	struct net *net;
+	void *hdr;
+	int rc;
+
+	netdev_dbg(nr->ndp->ndev.dev, "NCSI: %s\n", __func__);
+
+	net =3D dev_net(nr->rsp->dev);
+
+	skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr =3D genlmsg_put(skb, nr->snd_portid, nr->snd_seq,
+			  &ncsi_genl_family, 0, NCSI_CMD_SEND_CMD);
+	if (!hdr) {
+		kfree_skb(skb);
+		return -EMSGSIZE;
+	}
+
+	nla_put_u32(skb, NCSI_ATTR_IFINDEX, nr->rsp->dev->ifindex);
+	if (np)
+		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID, np->id);
+	if (nc)
+		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, nc->id);
+	else
+		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, NCSI_RESERVED_CHANNEL);
+
+	rc =3D nla_put(skb, NCSI_ATTR_DATA, nr->rsp->len, (void *)nr->rsp->data);
+	if (rc)
+		goto err;
+
+	genlmsg_end(skb, hdr);
+	return genlmsg_unicast(net, skb, nr->snd_portid);
+
+err:
+	kfree_skb(skb);
+	return rc;
+}
+
+int ncsi_send_netlink_timeout(struct ncsi_request *nr,
+			      struct ncsi_package *np,
+			      struct ncsi_channel *nc)
+{
+	struct sk_buff *skb;
+	struct net *net;
+	void *hdr;
+
+	netdev_dbg(nr->ndp->ndev.dev, "NCSI: %s\n", __func__);
+
+	skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr =3D genlmsg_put(skb, nr->snd_portid, nr->snd_seq,
+			  &ncsi_genl_family, 0, NCSI_CMD_SEND_CMD);
+	if (!hdr) {
+		kfree_skb(skb);
+		return -EMSGSIZE;
+	}
+
+	net =3D dev_net(nr->cmd->dev);
+
+	nla_put_u32(skb, NCSI_ATTR_IFINDEX, nr->cmd->dev->ifindex);
+
+	if (np)
+		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID, np->id);
+	else
+		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID,
+			    NCSI_PACKAGE_INDEX((((struct ncsi_pkt_hdr *)
+						 nr->cmd->data)->channel)));
+
+	if (nc)
+		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, nc->id);
+	else
+		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, NCSI_RESERVED_CHANNEL);
+
+	genlmsg_end(skb, hdr);
+	return genlmsg_unicast(net, skb, nr->snd_portid);
+}
+
+int ncsi_send_netlink_err(struct net_device *dev,
+			  u32 snd_seq,
+			  u32 snd_portid,
+			  struct nlmsghdr *nlhdr,
+			  int err)
+{
+	struct sk_buff *skb;
+	struct nlmsghdr *nlh;
+	struct nlmsgerr *nle;
+	struct net *net;
+
+	skb =3D nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
+	net =3D dev_net(dev);
+
+	nlh =3D nlmsg_put(skb, snd_portid, snd_seq,
+			NLMSG_ERROR, sizeof(*nle), 0);
+	nle =3D (struct nlmsgerr *)nlmsg_data(nlh);
+	nle->error =3D err;
+	memcpy(&nle->msg, nlhdr, sizeof(*nlh));
+
+	nlmsg_end(skb, nlh);
+
+	return nlmsg_unicast(net->genl_sock, skb, snd_portid);
+}
+
 static const struct genl_ops ncsi_ops[] =3D {
 	{
 		.cmd =3D NCSI_CMD_PKG_INFO,
@@ -386,6 +585,12 @@ static const struct genl_ops ncsi_ops[] =3D {
 		.doit =3D ncsi_clear_interface_nl,
 		.flags =3D GENL_ADMIN_PERM,
 	},
+	{
+		.cmd =3D NCSI_CMD_SEND_CMD,
+		.policy =3D ncsi_genl_policy,
+		.doit =3D ncsi_send_cmd_nl,
+		.flags =3D GENL_ADMIN_PERM,
+	},
 };
=20
 static struct genl_family ncsi_genl_family __ro_after_init =3D {
diff --git a/net/ncsi/ncsi-netlink.h b/net/ncsi/ncsi-netlink.h
index 91a5c25..c4a4688 100644
--- a/net/ncsi/ncsi-netlink.h
+++ b/net/ncsi/ncsi-netlink.h
@@ -14,6 +14,18 @@
=20
 #include "internal.h"
=20
+int ncsi_send_netlink_rsp(struct ncsi_request *nr,
+			  struct ncsi_package *np,
+			  struct ncsi_channel *nc);
+int ncsi_send_netlink_timeout(struct ncsi_request *nr,
+			      struct ncsi_package *np,
+			      struct ncsi_channel *nc);
+int ncsi_send_netlink_err(struct net_device *dev,
+			  u32 snd_seq,
+			  u32 snd_portid,
+			  struct nlmsghdr *nlhdr,
+			  int err);
+
 int ncsi_init_netlink(struct net_device *dev);
 int ncsi_unregister_netlink(struct net_device *dev);
=20
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 930c1d3..010970f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -16,9 +16,11 @@
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
 #include <net/sock.h>
+#include <net/genetlink.h>
=20
 #include "internal.h"
 #include "ncsi-pkt.h"
+#include "ncsi-netlink.h"
=20
 static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 				 unsigned short payload)
@@ -32,15 +34,22 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *n=
r,
 	 * before calling this function.
 	 */
 	h =3D (struct ncsi_rsp_pkt_hdr *)skb_network_header(nr->rsp);
-	if (h->common.revision !=3D NCSI_PKT_REVISION)
+
+	if (h->common.revision !=3D NCSI_PKT_REVISION) {
+		netdev_dbg(nr->ndp->ndev.dev, "NCSI: unsupported header revision\n");
 		return -EINVAL;
-	if (ntohs(h->common.length) !=3D payload)
+	}
+	if (ntohs(h->common.length) !=3D payload) {
+		netdev_dbg(nr->ndp->ndev.dev, "NCSI: payload length mismatched\n");
 		return -EINVAL;
+	}
=20
 	/* Check on code and reason */
 	if (ntohs(h->code) !=3D NCSI_PKT_RSP_C_COMPLETED ||
-	    ntohs(h->reason) !=3D NCSI_PKT_RSP_R_NO_ERROR)
-		return -EINVAL;
+	    ntohs(h->reason) !=3D NCSI_PKT_RSP_R_NO_ERROR) {
+		netdev_dbg(nr->ndp->ndev.dev, "NCSI: non zero response/reason code\n");
+		return -EPERM;
+	}
=20
 	/* Validate checksum, which might be zeroes if the
 	 * sender doesn't support checksum according to NCSI
@@ -52,8 +61,11 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr=
,
=20
 	checksum =3D ncsi_calculate_checksum((unsigned char *)h,
 					   sizeof(*h) + payload - 4);
-	if (*pchecksum !=3D htonl(checksum))
+
+	if (*pchecksum !=3D htonl(checksum)) {
+		netdev_dbg(nr->ndp->ndev.dev, "NCSI: checksum mismatched\n");
 		return -EINVAL;
+	}
=20
 	return 0;
 }
@@ -900,6 +912,31 @@ static int ncsi_rsp_handler_gpuuid(struct ncsi_request=
 *nr)
 	return 0;
 }
=20
+static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
+{
+	return 0;
+}
+
+static int ncsi_rsp_handler_netlink(struct ncsi_request *nr)
+{
+	struct ncsi_rsp_pkt *rsp;
+	struct ncsi_dev_priv *ndp =3D nr->ndp;
+	struct ncsi_package *np;
+	struct ncsi_channel *nc;
+	int ret;
+
+	/* Find the package */
+	rsp =3D (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
+	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
+				      &np, &nc);
+	if (!np)
+		return -ENODEV;
+
+	ret =3D ncsi_send_netlink_rsp(nr, np, nc);
+
+	return ret;
+}
+
 static struct ncsi_rsp_handler {
 	unsigned char	type;
 	int             payload;
@@ -932,7 +969,7 @@ static struct ncsi_rsp_handler {
 	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
 	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
 	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
-	{ NCSI_PKT_RSP_OEM,     0, NULL                     },
+	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
 	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
 	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
 };
@@ -1002,6 +1039,17 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_dev=
ice *dev,
 		netdev_warn(ndp->ndev.dev,
 			    "NCSI: 'bad' packet ignored for type 0x%x\n",
 			    hdr->type);
+
+		if (nr->flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN) {
+			if (ret =3D=3D -EPERM)
+				goto out_netlink;
+			else
+				ncsi_send_netlink_err(ndp->ndev.dev,
+						      nr->snd_seq,
+						      nr->snd_portid,
+						      &nr->nlhdr,
+						      ret);
+		}
 		goto out;
 	}
=20
@@ -1011,6 +1059,17 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_dev=
ice *dev,
 		netdev_err(ndp->ndev.dev,
 			   "NCSI: Handler for packet type 0x%x returned %d\n",
 			   hdr->type, ret);
+
+out_netlink:
+	if (nr->flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN) {
+		ret =3D ncsi_rsp_handler_netlink(nr);
+		if (ret) {
+			netdev_err(ndp->ndev.dev,
+				   "NCSI: Netlink handler for packet type 0x%x returned %d\n",
+				   hdr->type, ret);
+		}
+	}
+
 out:
 	ncsi_free_request(nr);
 	return ret;
--=20
2.9.3
