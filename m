Return-Path: <prvs=901799edcb=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=901799edcb=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="f0SX9uln"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pnfT2pxhzDqTW
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 14:39:43 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3O4ZCPo030436
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 21:39:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=FKM86vzGVWMsHvjlcaHnvMjzrwLXYOENyblxu5Zhi2w=;
 b=f0SX9ulnzjlPagikhdDxMKJRzRo4yrdz1V8J/hi1Jj7/0FMWToqhMsLKJ+vXR3L434g4
 4Q/lmF+66FxObV+sdkQG3s3EMi8/9dMFTzjSXmz/WoepGbaPF7zjYvKjsurqMW5M6Q04
 0YNE7u6cMcQv9kjkhHfC+jE2ErdEUzi4G9k= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s2c5qs5ed-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 21:39:40 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 23 Apr 2019 21:39:40 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id C2A9C13BA5DE1; Tue, 23 Apr 2019 14:20:49 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: "David S . Miller" <davem@davemloft.net>, Maxim Mikityanskiy
 <maximmi@mellanox.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jakub Kicinski
 <jakub.kicinski@netronome.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net v2 2/2] net/ncsi: handle overflow when incrementing mac
 address
Date: Tue, 23 Apr 2019 14:20:48 -0700
Message-ID: <20190423212048.1984122-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-24_02:, , signatures=0
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
X-List-Received-Date: Wed, 24 Apr 2019 04:39:45 -0000

Previously BMC's MAC address is calculated by simply adding 1 to the
last byte of network controller's MAC address, and it produces incorrect
result when network controller's MAC address ends with 0xFF.

The problem can be fixed by calling "net_addr_inc" function to increment
MAC address; besides, the MAC address is also validated before assigning
to BMC.

Fixes: cb10c7c0dfd9 ("net/ncsi: Add NCSI Broadcom OEM command")
Signed-off-by: Tao Ren <taoren@fb.com>
---
 net/ncsi/ncsi-rsp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Changes in v2:
 - increment MAC address by calling net_addr_inc function.
 - validate MAC address before assigning to BMC.

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index dc07fcc7938e..802db01e3075 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/netdevice.h>
+#include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 
 #include <net/ncsi.h>
@@ -667,7 +668,10 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
 	/* Increase mac address by 1 for BMC's address */
-	saddr.sa_data[ETH_ALEN - 1]++;
+	eth_addr_inc((u8 *)saddr.sa_data);
+	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
+		return -ENXIO;
+
 	ret = ops->ndo_set_mac_address(ndev, &saddr);
 	if (ret < 0)
 		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
-- 
2.17.1
