Return-Path: <prvs=901799edcb=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=901799edcb=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MogJTY+s"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pw8s1r0wzDqRZ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 19:32:59 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3O9TVTL001473
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 02:32:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=Wjeih4drKxvCXgraFNPv3LrPtimhzFKHZMw/UQDDo9g=;
 b=MogJTY+sxUi5Eixza1waPiWVNAgY9W50Ipk5t5x/0D1m7928+J0c4v6PCyYagX+WePbL
 rdORfdLL/dJAEVt2nqeQAmDpX4RgW9Uz0wOjuHcrvGxYHlN44ALd1ZWqKXZedmqkGyGR
 SEWTbVP0TvEVw4VHrdzn5ohFgcud6gEOfWw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s2k7s0fm6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 02:32:55 -0700
Received: from mx-out.facebook.com (2620:10d:c0a1:3::13) by
 mail.thefacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Wed, 24 Apr 2019 02:32:53 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id AAAE013BA5DD3; Tue, 23 Apr 2019 14:20:38 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: add eth_addr_inc in etherdevice.h
Date: Tue, 23 Apr 2019 14:20:37 -0700
Message-ID: <20190423212037.1983760-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-24_07:, , signatures=0
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
X-List-Received-Date: Wed, 24 Apr 2019 09:33:01 -0000

Add eth_addr_inc function in etherdevice.h to increment MAC address. One
of the use cases is in ncsi stack, where the host's MAC address needs to
be incremented to get BMC's MAC address.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 include/linux/etherdevice.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
index e2f3b21cd72a..d48e3a724c54 100644
--- a/include/linux/etherdevice.h
+++ b/include/linux/etherdevice.h
@@ -448,6 +448,19 @@ static inline void eth_addr_dec(u8 *addr)
 	u64_to_ether_addr(u, addr);
 }
 
+/**
+ * eth_addr_inc - Increment the given MAC address
+ *
+ * @addr: Pointer to a six-byte array containing Ethernet address to increment
+ */
+static inline void eth_addr_inc(u8 *addr)
+{
+	u64 u = ether_addr_to_u64(addr);
+
+	u++;
+	u64_to_ether_addr(u, addr);
+}
+
 /**
  * is_etherdev_addr - Tell if given Ethernet address belongs to the device.
  * @dev: Pointer to a device structure
-- 
2.17.1
