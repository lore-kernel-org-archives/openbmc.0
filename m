Return-Path: <prvs=4848222c58=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4848222c58=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Jt+Wzdbw"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pxQG3fY3zF36b
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 15:29:10 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA64PVcR017070
 for <openbmc@lists.ozlabs.org>; Mon, 5 Nov 2018 20:29:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=wF0B3AXpYzmcb1gWZSn31mYmLSc/IPNM1MgPQEXIcS8=;
 b=Jt+Wzdbwh/Fe0kr14KJzXfrdRFyOYICkgGp2P1weBsDAdHFlZ3Pp0A+ubhLQv9ydodnE
 BQpsxh7Ac6YYtxei3px1+lc9DoOdL8MNBsS4JLdwL8L/MygFPXe73+cuaJhLO1LDO4Sx
 2v+Ir5HbLeHy2CGW76X0kDvf4sNHNPmsHiQ= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nk3cwg29g-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 20:29:08 -0800
Received: from mx-out.facebook.com (2620:10d:c0a1:3::13) by
 mail.thefacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Mon, 5 Nov 2018 20:28:40 -0800
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id 4C5C67AB1627; Mon,  5 Nov 2018 20:28:31 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
Date: Mon, 5 Nov 2018 20:28:29 -0800
Message-ID: <20181106042829.2771226-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-06_02:, , signatures=0
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
X-List-Received-Date: Tue, 06 Nov 2018 04:29:11 -0000

This is the layout used by Facebook BMC systems. It describes the fixed
flash layout of a 32MB mtd device.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 Changes since v1:
  - adding facebook copyright.

 .../boot/dts/facebook-bmc-flash-layout.dtsi   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi b/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
new file mode 100644
index 000000000000..94039d7b7de5
--- /dev/null
+++ b/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0x60000>;
+		label = "u-boot";
+	};
+
+	u-boot-env@60000 {
+		reg = <0x60000 0x20000>;
+		label = "env";
+	};
+
+	fit@80000 {
+		reg = <0x80000 0x1b80000>;
+		label = "fit";
+	};
+
+	data0@1c00000 {
+		reg = <0x1c00000 0x400000>;
+		label = "data0";
+	};
+
+	flash0@0 {
+		reg = <0x0 0x2000000>;
+		label = "flash0";
+	};
+};
-- 
2.17.1
