Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="p/OKzAXD"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LnVQ1hpqzF38y;
 Fri, 28 Sep 2018 07:09:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538082542; x=1569618542;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rXBl5YVl4XMNF6YIyBeuIRc7rXTerP8N1SHbn0hciK8=;
 b=p/OKzAXD7LBoaYr+i/y5KkNH46q33/NXFYJRRHNmGMfSO2uxhgK4lSoW
 gydV/8tq0hfFyABz3nD5ei/hNOAjL+JJylo+G64SIUNN8l0vGctJJuxGG
 jhE/nRICt3W93lA8v3MZdpecc3t5OPxlDSrRHuicW1nmKCKLb4FaqbncM 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EpAACURq1bhyWd50NbGwEBAQEDAQE?=
 =?us-ascii?q?BBwMBAQGBU4JyfygKhzSFKowNg3qUKoF6CxuBFYM8hAohNhYBAwEBAgEBAgE?=
 =?us-ascii?q?BAhABAQEKCwkIKSMMgjUigUZfQBYIDRM/EgE+aAEEAQkEBQgagn8BggGZMYl?=
 =?us-ascii?q?XAQEBgWgzg3CGHop+gQ+BCIERAYJkiwQCgSgBm2gGAQKGQ4ljH486kXgBgno?=
 =?us-ascii?q?CBAIEBQIUgUgBggdwgW6BTgmCGQMOCRGDD4J/h3lvi2QCBR8DBIEBgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2EpAACURq1bhyWd50NbGwEBAQEDAQEBBwMBAQGBU4Jyf?=
 =?us-ascii?q?ygKhzSFKowNg3qUKoF6CxuBFYM8hAohNhYBAwEBAgEBAgEBAhABAQEKCwkIK?=
 =?us-ascii?q?SMMgjUigUZfQBYIDRM/EgE+aAEEAQkEBQgagn8BggGZMYlXAQEBgWgzg3CGH?=
 =?us-ascii?q?op+gQ+BCIERAYJkiwQCgSgBm2gGAQKGQ4ljH486kXgBgnoCBAIEBQIUgUgBg?=
 =?us-ascii?q?gdwgW6BTgmCGQMOCRGDD4J/h3lvi2QCBR8DBIEBgR8BAQ?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Sep 2018 16:08:52 -0500
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8RL8ZhD135558; Thu, 27 Sep 2018 17:08:51 -0400
Received: from esa6.dell-outbound2.iphmx.com (esa6.dell-outbound2.iphmx.com
 [68.232.154.99])
 by mx0b-00154901.pphosted.com with ESMTP id 2ms4ev8sma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Sep 2018 17:08:51 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 28 Sep 2018 03:08:49 +0600
X-LoopCount0: from 10.166.135.98
X-IronPort-AV: E=Sophos;i="5.54,312,1534827600"; d="scan'208";a="1305246591"
To: <joel@jms.id.au>, <sam@mendozajonas.com>
CC: <amithash@fb.com>, <vijaykhemka@fb.com>, <linux-aspeed@lists.ozlabs.org>, 
 <openbmc@lists.ozlabs.org>, <sdasari@fb.com>, <netdev@vger.kernel.org>,
 <christian@cmd.nu>
Subject: [PATCH net] net/ncsi: Extend NC-SI Netlink interface to allow user
 space to send NC-SI command
Thread-Topic: [PATCH net] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Index: AdRWgQu+A/oy9nTYTt+lbETexQpDaA==
Date: Thu, 27 Sep 2018 21:08:28 +0000
Message-ID: <a2f68c5eb785436ea248cb46b73ea246@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809270196
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
X-List-Received-Date: Thu, 27 Sep 2018 21:09:04 -0000

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
 net/ncsi/ncsi-aen.c       |  10 ++-
 net/ncsi/ncsi-cmd.c       | 106 ++++++++++++++++--------
 net/ncsi/ncsi-manage.c    |  74 ++++++++++++++---
 net/ncsi/ncsi-netlink.c   | 199 ++++++++++++++++++++++++++++++++++++++++++=
+++-
 net/ncsi/ncsi-netlink.h   |   4 +
 net/ncsi/ncsi-rsp.c       |  70 ++++++++++++++--
 8 files changed, 420 insertions(+), 58 deletions(-)

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
index 8055e39..20ce735 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -215,12 +215,17 @@ struct ncsi_request {
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
@@ -301,10 +306,13 @@ struct ncsi_cmd_arg {
 	unsigned short       payload;     /* Command packet payload length */
 	unsigned int         req_flags;   /* NCSI request properties       */
 	union {
-		unsigned char  bytes[16]; /* Command packet specific data  */
+		unsigned char  bytes[16];     /* Command packet specific data  */
 		unsigned short words[8];
 		unsigned int   dwords[4];
 	};
+
+	unsigned char        *data;       /* Netlink data                  */
+	struct genl_info     *info;       /* Netlink information           */
 };
=20
 extern struct list_head ncsi_dev_list;
diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 25e483e..b5ec193 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -16,6 +16,7 @@
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
 #include <net/sock.h>
+#include <net/genetlink.h>
=20
 #include "internal.h"
 #include "ncsi-pkt.h"
@@ -73,8 +74,8 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp=
,
 	ncm->data[2] =3D data;
 	ncm->data[4] =3D ntohl(lsc->oem_status);
=20
-	netdev_dbg(ndp->ndev.dev, "NCSI: LSC AEN - channel %u state %s\n",
-		   nc->id, data & 0x1 ? "up" : "down");
+	netdev_dbg(ndp->ndev.dev, "NCSI: LSC AEN - pkg %u ch %u state %s\n",
+		   nc->package->id, nc->id, data & 0x1 ? "up" : "down");
=20
 	chained =3D !list_empty(&nc->link);
 	state =3D nc->state;
@@ -148,9 +149,10 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_pri=
v *ndp,
 	hncdsc =3D (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] =3D ntohl(hncdsc->status);
 	spin_unlock_irqrestore(&nc->lock, flags);
+
 	netdev_dbg(ndp->ndev.dev,
-		   "NCSI: host driver %srunning on channel %u\n",
-		   ncm->data[3] & 0x1 ? "" : "not ", nc->id);
+		   "NCSI: host driver %srunning on pkg %u ch %u\n",
+		   ncm->data[3] & 0x1 ? "" : "not ", nc->package->id, nc->id);
=20
 	return 0;
 }
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 7567ca63..b291297 100644
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
@@ -211,42 +212,75 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
 	return 0;
 }
=20
+static int ncsi_cmd_handler_oem(struct sk_buff *skb,
+								struct ncsi_cmd_arg *nca)
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
 	int           (*handler)(struct sk_buff *skb,
 				 struct ncsi_cmd_arg *nca);
 } ncsi_cmd_handlers[] =3D {
-	{ NCSI_PKT_CMD_CIS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_SP,     4, ncsi_cmd_handler_sp      },
-	{ NCSI_PKT_CMD_DP,     0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_EC,     0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_DC,     4, ncsi_cmd_handler_dc      },
-	{ NCSI_PKT_CMD_RC,     4, ncsi_cmd_handler_rc      },
-	{ NCSI_PKT_CMD_ECNT,   0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_DCNT,   0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_AE,     8, ncsi_cmd_handler_ae      },
-	{ NCSI_PKT_CMD_SL,     8, ncsi_cmd_handler_sl      },
-	{ NCSI_PKT_CMD_GLS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_SVF,    8, ncsi_cmd_handler_svf     },
-	{ NCSI_PKT_CMD_EV,     4, ncsi_cmd_handler_ev      },
-	{ NCSI_PKT_CMD_DV,     0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_SMA,    8, ncsi_cmd_handler_sma     },
-	{ NCSI_PKT_CMD_EBF,    4, ncsi_cmd_handler_ebf     },
-	{ NCSI_PKT_CMD_DBF,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_EGMF,   4, ncsi_cmd_handler_egmf    },
-	{ NCSI_PKT_CMD_DGMF,   0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_SNFC,   4, ncsi_cmd_handler_snfc    },
-	{ NCSI_PKT_CMD_GVI,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GC,     0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GP,     0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GCPS,   0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
-	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
-	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
-	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
+	{ NCSI_PKT_CMD_CIS,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SP,      4, ncsi_cmd_handler_sp      },
+	{ NCSI_PKT_CMD_DP,      0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_EC,      0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_DC,      4, ncsi_cmd_handler_dc      },
+	{ NCSI_PKT_CMD_RC,      4, ncsi_cmd_handler_rc      },
+	{ NCSI_PKT_CMD_ECNT,    0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_DCNT,    0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_AE,      8, ncsi_cmd_handler_ae      },
+	{ NCSI_PKT_CMD_SL,      8, ncsi_cmd_handler_sl      },
+	{ NCSI_PKT_CMD_GLS,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SVF,     8, ncsi_cmd_handler_svf     },
+	{ NCSI_PKT_CMD_EV,      4, ncsi_cmd_handler_ev      },
+	{ NCSI_PKT_CMD_DV,      0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SMA,     8, ncsi_cmd_handler_sma     },
+	{ NCSI_PKT_CMD_EBF,     4, ncsi_cmd_handler_ebf     },
+	{ NCSI_PKT_CMD_DBF,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_EGMF,    4, ncsi_cmd_handler_egmf    },
+	{ NCSI_PKT_CMD_DGMF,    0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_SNFC,    4, ncsi_cmd_handler_snfc    },
+	{ NCSI_PKT_CMD_GVI,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GC,      0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GP,      0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GCPS,    0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GNS,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GNPTS,   0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GPS,     0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_OEM,    -1, ncsi_cmd_handler_oem     },
+	{ NCSI_PKT_CMD_PLDM,    0, NULL                     },
+	{ NCSI_PKT_CMD_GPUUID,  0, ncsi_cmd_handler_default }
 };
=20
 static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
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
@@ -341,6 +384,7 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 	 * connection a 1 second delay should be sufficient.
 	 */
 	nr->enabled =3D true;
+
 	mod_timer(&nr->timer, jiffies + 1 * HZ);
=20
 	/* Send NCSI packet */
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 0912847..6629103 100644
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
@@ -110,8 +111,9 @@ static void ncsi_channel_monitor(struct timer_list *t)
 	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
 		break;
 	default:
-		netdev_err(ndp->ndev.dev, "NCSI Channel %d timed out!\n",
-			   nc->id);
+		netdev_err(ndp->ndev.dev, "NCSI: pkg %u ch %u timed out!\n",
+			   np->id, nc->id);
+
 		if (!(ndp->flags & NCSI_DEV_HWA)) {
 			ncsi_report_link(ndp, true);
 			ndp->flags |=3D NCSI_DEV_RESHUFFLE;
@@ -143,6 +145,10 @@ void ncsi_start_channel_monitor(struct ncsi_channel *n=
c)
 {
 	unsigned long flags;
=20
+	netdev_dbg(nc->package->ndp->ndev.dev,
+			   "NCSI: %s pkg %u ch %u\n",
+			   __func__, nc->package->id, nc->id);
+
 	spin_lock_irqsave(&nc->lock, flags);
 	WARN_ON_ONCE(nc->monitor.enabled);
 	nc->monitor.enabled =3D true;
@@ -156,6 +162,10 @@ void ncsi_stop_channel_monitor(struct ncsi_channel *nc=
)
 {
 	unsigned long flags;
=20
+	netdev_dbg(nc->package->ndp->ndev.dev,
+			   "NCSI: %s pkg %u ch %u\n",
+			   __func__, nc->package->id, nc->id);
+
 	spin_lock_irqsave(&nc->lock, flags);
 	if (!nc->monitor.enabled) {
 		spin_unlock_irqrestore(&nc->lock, flags);
@@ -406,8 +416,13 @@ static void ncsi_request_timeout(struct timer_list *t)
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
@@ -415,10 +430,23 @@ static void ncsi_request_timeout(struct timer_list *t=
)
 	nr->enabled =3D false;
 	if (nr->rsp || !nr->cmd) {
 		spin_unlock_irqrestore(&ndp->lock, flags);
+
+		netdev_dbg(ndp->ndev.dev, "NCSI: %s - early return\n", __func__);
+
 		return;
 	}
 	spin_unlock_irqrestore(&ndp->lock, flags);
=20
+	if (nr->flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN) {
+		if (nr->cmd) {
+			/* Find the package */
+			cmd =3D (struct ncsi_cmd_pkt *)skb_network_header(nr->cmd);
+			ncsi_find_package_and_channel(ndp, cmd->cmd.common.channel,
+									      &np, &nc);
+			ncsi_send_netlink_timeout(nr, np, nc);
+		}
+	}
+
 	/* Release the request */
 	ncsi_free_request(nr);
 }
@@ -432,6 +460,10 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv =
*ndp)
 	unsigned long flags;
 	int ret;
=20
+	netdev_dbg(ndp->ndev.dev,
+			   "NCSI: %s pkg %u ch %u state %04x\n",
+			   __func__, np->id, nc->id, nd->state);
+
 	nca.ndp =3D ndp;
 	nca.req_flags =3D NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
@@ -647,6 +679,10 @@ static void ncsi_configure_channel(struct ncsi_dev_pri=
v *ndp)
 	unsigned long flags;
 	int ret;
=20
+	netdev_dbg(ndp->ndev.dev,
+			   "NCSI: %s pkg %u ch %u state %04x\n",
+			   __func__, np->id, nc->id, nd->state);
+
 	nca.ndp =3D ndp;
 	nca.req_flags =3D NCSI_REQ_FLAG_EVENT_DRIVEN;
 	switch (nd->state) {
@@ -788,8 +824,9 @@ static void ncsi_configure_channel(struct ncsi_dev_priv=
 *ndp)
 		}
 		break;
 	case ncsi_dev_state_config_done:
-		netdev_dbg(ndp->ndev.dev, "NCSI: channel %u config done\n",
-			   nc->id);
+		netdev_dbg(ndp->ndev.dev,
+				   "NCSI: pkg %u ch %u config done\n",
+				   nc->package->id, nc->id);
 		spin_lock_irqsave(&nc->lock, flags);
 		if (nc->reconfigure_needed) {
 			/* This channel's configuration has been updated
@@ -815,9 +852,10 @@ static void ncsi_configure_channel(struct ncsi_dev_pri=
v *ndp)
 		} else {
 			hot_nc =3D NULL;
 			nc->state =3D NCSI_CHANNEL_INACTIVE;
+
 			netdev_dbg(ndp->ndev.dev,
-				   "NCSI: channel %u link down after config\n",
-				   nc->id);
+					   "NCSI: pkg %u ch %u link down after config\n",
+					   nc->package->id, nc->id);
 		}
 		spin_unlock_irqrestore(&nc->lock, flags);
=20
@@ -853,6 +891,8 @@ static int ncsi_choose_active_channel(struct ncsi_dev_p=
riv *ndp)
 	force_package =3D ndp->force_package;
 	spin_unlock_irqrestore(&ndp->lock, flags);
=20
+	netdev_dbg(ndp->ndev.dev, "NCSI: %s\n", __func__);
+
 	/* Force a specific channel whether or not it has link if we have been
 	 * configured to do so
 	 */
@@ -861,8 +901,8 @@ static int ncsi_choose_active_channel(struct ncsi_dev_p=
riv *ndp)
 		ncm =3D &found->modes[NCSI_MODE_LINK];
 		if (!(ncm->data[2] & 0x1))
 			netdev_info(ndp->ndev.dev,
-				    "NCSI: Channel %u forced, but it is link down\n",
-				    found->id);
+					   "NCSI: pkg %u ch %u forced, but it is link down\n",
+					   found->package->id, found->id);
 		goto out;
 	}
=20
@@ -914,6 +954,7 @@ static int ncsi_choose_active_channel(struct ncsi_dev_p=
riv *ndp)
 out:
 	spin_lock_irqsave(&ndp->lock, flags);
 	list_add_tail_rcu(&found->link, &ndp->channel_queue);
+
 	spin_unlock_irqrestore(&ndp->lock, flags);
=20
 	return ncsi_process_next_channel(ndp);
@@ -1154,6 +1195,8 @@ static void ncsi_dev_work(struct work_struct *work)
 			struct ncsi_dev_priv, work);
 	struct ncsi_dev *nd =3D &ndp->ndev;
=20
+	netdev_dbg(ndp->ndev.dev, "NCSI: %s\n", __func__);
+
 	switch (nd->state & ncsi_dev_state_major) {
 	case ncsi_dev_state_probe:
 		ncsi_probe_channel(ndp);
@@ -1176,6 +1219,8 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *n=
dp)
 	int old_state;
 	unsigned long flags;
=20
+	netdev_dbg(ndp->ndev.dev, "NCSI: %s\n", __func__);
+
 	spin_lock_irqsave(&ndp->lock, flags);
 	nc =3D list_first_or_null_rcu(&ndp->channel_queue,
 				    struct ncsi_channel, link);
@@ -1198,14 +1243,14 @@ int ncsi_process_next_channel(struct ncsi_dev_priv =
*ndp)
 	switch (old_state) {
 	case NCSI_CHANNEL_INACTIVE:
 		ndp->ndev.state =3D ncsi_dev_state_config;
-		netdev_dbg(ndp->ndev.dev, "NCSI: configuring channel %u\n",
-	                   nc->id);
+		netdev_dbg(ndp->ndev.dev, "NCSI: configuring pkg %u ch %u\n",
+				   nc->package->id, nc->id);
 		ncsi_configure_channel(ndp);
 		break;
 	case NCSI_CHANNEL_ACTIVE:
 		ndp->ndev.state =3D ncsi_dev_state_suspend;
-		netdev_dbg(ndp->ndev.dev, "NCSI: suspending channel %u\n",
-			   nc->id);
+		netdev_dbg(ndp->ndev.dev, "NCSI: suspending pkg %u ch %u\n",
+				   nc->package->id, nc->id);
 		ncsi_suspend_channel(ndp);
 		break;
 	default:
@@ -1225,6 +1270,9 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *n=
dp)
 		return ncsi_choose_active_channel(ndp);
 	}
=20
+	netdev_dbg(ndp->ndev.dev,
+			   "NCSI: No more channels to process\n");
+
 	ncsi_report_link(ndp, false);
 	return -ENODEV;
 }
@@ -1475,6 +1523,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device =
*dev,
 	if (list_empty(&ncsi_dev_list))
 		register_inet6addr_notifier(&ncsi_inet6addr_notifier);
 #endif
+
 	list_add_tail_rcu(&ndp->node, &ncsi_dev_list);
 	spin_unlock_irqrestore(&ncsi_dev_lock, flags);
=20
@@ -1564,6 +1613,7 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 	if (list_empty(&ncsi_dev_list))
 		unregister_inet6addr_notifier(&ncsi_inet6addr_notifier);
 #endif
+
 	spin_unlock_irqrestore(&ncsi_dev_lock, flags);
=20
 	ncsi_unregister_netlink(nd->dev);
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index 45f33d6..ab1a959 100644
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
+	[NCSI_ATTR_DATA] =3D			{ .type =3D NLA_BINARY, .len =3D 2048 },
 };
=20
 static struct ncsi_dev_priv *ndp_from_ifindex(struct net *net, u32 ifindex=
)
@@ -240,7 +242,7 @@ static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
 		return 0; /* done */
=20
 	hdr =3D genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
-			  &ncsi_genl_family, NLM_F_MULTI,  NCSI_CMD_PKG_INFO);
+			  &ncsi_genl_family, NLM_F_MULTI, NCSI_CMD_PKG_INFO);
 	if (!hdr) {
 		rc =3D -EMSGSIZE;
 		goto err;
@@ -316,8 +318,8 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, s=
truct genl_info *info)
 		 * package
 		 */
 		spin_unlock_irqrestore(&ndp->lock, flags);
-		netdev_info(ndp->ndev.dev, "NCSI: Channel %u does not exist!\n",
-			    channel_id);
+		netdev_info(ndp->ndev.dev, "NCSI: pkg %u ch %u does not exist!\n",
+					package_id, channel_id);
 		return -ERANGE;
 	}
=20
@@ -366,6 +368,191 @@ static int ncsi_clear_interface_nl(struct sk_buff *ms=
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
+						   nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp) {
+		ret =3D -ENODEV;
+		goto out;
+	}
+
+	package_id =3D nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
+	channel_id =3D nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
+
+	if ((package_id & ~0x07) || (channel_id & ~0x1f)) {
+		ret =3D -ERANGE;
+		goto out_netlink;
+	}
+
+	len =3D nla_len(info->attrs[NCSI_ATTR_DATA]);
+	if (len < sizeof(struct ncsi_pkt_hdr)) {
+		netdev_info(ndp->ndev.dev, "NCSI: no OEM command to send %u\n",
+					package_id);
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
+		netdev_err(ndp->ndev.dev, "Error %d sending OEM command\n", ret);
+		ncsi_send_netlink_err(ndp->ndev.dev,
+							  info->snd_seq, info->snd_portid, info->nlhdr,
+							  ret);
+	}
+out:
+	return ret;
+}
+
+int ncsi_send_netlink_rsp(struct ncsi_request *nr, struct ncsi_package *np=
, struct ncsi_channel *nc)
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
+int ncsi_send_netlink_timeout(struct ncsi_request *nr, struct ncsi_package=
 *np, struct ncsi_channel *nc)
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
+					NCSI_PACKAGE_INDEX((((struct ncsi_pkt_hdr *)nr->cmd->data)->channel))=
);
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
+int ncsi_send_netlink_err(struct net_device *dev, u32 snd_seq, u32 snd_por=
tid, struct nlmsghdr *nlhdr, int err)
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
+					NLMSG_ERROR, sizeof(*nle), 0);
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
@@ -386,6 +573,12 @@ static const struct genl_ops ncsi_ops[] =3D {
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
index 91a5c25..dadaf32 100644
--- a/net/ncsi/ncsi-netlink.h
+++ b/net/ncsi/ncsi-netlink.h
@@ -14,6 +14,10 @@
=20
 #include "internal.h"
=20
+int ncsi_send_netlink_rsp(struct ncsi_request *nr, struct ncsi_package *np=
, struct ncsi_channel *nc);
+int ncsi_send_netlink_timeout(struct ncsi_request *nr, struct ncsi_package=
 *np, struct ncsi_channel *nc);
+int ncsi_send_netlink_err(struct net_device *dev, u32 snd_seq, u32 snd_por=
tid, struct nlmsghdr *nlhdr, int err);
+
 int ncsi_init_netlink(struct net_device *dev);
 int ncsi_unregister_netlink(struct net_device *dev);
=20
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 930c1d3..bdf9519 100644
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
@@ -950,6 +987,7 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device=
 *dev,
=20
 	/* Find the NCSI device */
 	nd =3D ncsi_find_dev(dev);
+
 	ndp =3D nd ? TO_NCSI_DEV_PRIV(nd) : NULL;
 	if (!ndp)
 		return -ENODEV;
@@ -1002,6 +1040,15 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_dev=
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
+									  nr->snd_seq, nr->snd_portid, &nr->nlhdr,
+									  ret);
+		}
 		goto out;
 	}
=20
@@ -1011,6 +1058,17 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_dev=
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
+					   "NCSI: Netlink handler for packet type 0x%x returned %d\n",
+					   hdr->type, ret);
+		}
+	}
+
 out:
 	ncsi_free_request(nr);
 	return ret;
--=20
2.9.3
