Return-Path: <prvs=9015ffae35=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9015ffae35=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Sjg8klS9"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ntp30H3zzDqL9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 03:28:06 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x3MHIXa0009292
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 10:28:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=ggkFPjU/Ne5UtSggqEaeg9mpDeASwYIDmOn8efG8i/Q=;
 b=Sjg8klS96z95lPkfZvb1uVAu9t+BpLLT5PMA0enSq0u2AKGnYpFqGk/bG09Z96FE8o44
 gUyfHeXwy9oejNED2421021fUwQqCNNummPpRS+413+6H5kAgkj+ZkIuiUIvacjmrndL
 xroJaemAWIG6e2fU3IHYMKnKD3op8evvbUM= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0001303.ppops.net with ESMTP id 2ryy3cqaf2-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 10:28:03 -0700
Received: from mx-out.facebook.com (2620:10d:c0a1:3::13) by
 mail.thefacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 22 Apr 2019 10:27:57 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id DFEF413A2728A; Mon, 22 Apr 2019 10:27:56 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net] net/ncsi: handle overflow when incrementing mac address
Date: Mon, 22 Apr 2019 10:27:54 -0700
Message-ID: <20190422172754.1011894-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-22_01:, , signatures=0
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
X-List-Received-Date: Mon, 22 Apr 2019 17:28:12 -0000

Previously BMC's MAC address is calculated by simply adding 1 to the
last byte of network controller's MAC address, and it produces incorrect
result when network controller's MAC address ends with 0xFF.
The problem is fixed by detecting integer overflow when incrementing MAC
address and adding the carry bit (if any) to the next/left bytes of the
MAC address.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 net/ncsi/ncsi-rsp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index dc07fcc7938e..eb42bbdb7501 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -658,7 +658,8 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	const struct net_device_ops *ops = ndev->netdev_ops;
 	struct ncsi_rsp_oem_pkt *rsp;
 	struct sockaddr saddr;
-	int ret = 0;
+	int ret, offset;
+	u16 carry = 1;
 
 	/* Get the response header */
 	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
@@ -667,7 +668,12 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
 	/* Increase mac address by 1 for BMC's address */
-	saddr.sa_data[ETH_ALEN - 1]++;
+	offset = ETH_ALEN - 1;
+	do {
+		carry += (u8)saddr.sa_data[offset];
+		saddr.sa_data[offset] = (char)carry;
+		carry = carry >> 8;
+	} while (carry != 0 && --offset >= 0);
 	ret = ops->ndo_set_mac_address(ndev, &saddr);
 	if (ret < 0)
 		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
-- 
2.17.1
