Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="RlEGpFNe"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lLXs3BfszDqHv
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 10:07:41 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NN0ACr028137
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 15:07:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=2jQYWN8E5VF93e6TTK8hq1JjJEjugfav3B7F+OutISU=;
 b=RlEGpFNe/OthFnH3aeUx8IEnvkF5kumbcIDrJbm1LHbhw/t+bFBzVrfgHkrwyVf7mTG3
 uF+ViDD0/o1iN/9e+i5z/6yWMG7iZAFL8rTrg2yODhWZYgXlIAuccu/W5NvoFleT7Cf9
 ruPrDgflKirLVvfgTiyFH71dh5vvOgeooBA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q700arajg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 15:07:39 -0800
Received: from mx-out.facebook.com (2620:10d:c0a1:3::13) by
 mail.thefacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Wed, 23 Jan 2019 15:07:37 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 76B23861B07A; Wed, 23 Jan 2019 15:07:36 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <vijaykhemka@fb.com>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH 2/2] ARM: dts: aspeed: Add uarts for SoL in Facebook
Date: Wed, 23 Jan 2019 15:07:33 -0800
Message-ID: <20190123230733.1821501-2-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123230733.1821501-1-vijaykhemka@fb.com>
References: <20190123230733.1821501-1-vijaykhemka@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_11:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 23:07:42 -0000

Added uart2 and uart3 in Facebook Tiogapass for routing serial input
from Host to BMC for SoL via LPC.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index d60dbb019f82..42e0d7a8e8d0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -72,6 +72,16 @@
 		     &pinctrl_rxd1_default>;
 };
 
+&uart2 {
+	// SoL Host Console
+	status = "okay";
+};
+
+&uart3 {
+	// SoL BMC Console
+	status = "okay";
+};
+
 &uart5 {
 	// BMC Console
 	status = "okay";
-- 
2.17.1
