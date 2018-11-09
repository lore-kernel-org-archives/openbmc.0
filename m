Return-Path: <prvs=4851223f2f=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4851223f2f=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lBVBgiYR"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rhQw5wckzF3W3
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 11:50:44 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA90mXdg020466
 for <openbmc@lists.ozlabs.org>; Thu, 8 Nov 2018 16:50:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=ljTeKdEeCx3bbJTRDWGLsNnzI10JrvLf5mAQgwqaUuo=;
 b=lBVBgiYRHnjr/gYT/dmpgCDvNYlCjs+DTOU3yigEkH74D1ol9PR7ltGPBRcNUKc8Gfc1
 CmTmA1Qf4EO4fjQph6XKwmJjRI5/YkNh2LSLH24/ONbtfutL3CR3RepiNAqc5bu4n8tA
 YUhfsTEgxUQjQPoHythphWxkMER8aFp6T/E= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nmxea09a9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Nov 2018 16:50:41 -0800
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Thu, 8 Nov 2018 16:50:39 -0800
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id 200F67D68273; Thu,  8 Nov 2018 16:50:37 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH v3 1/2] ARM: dts: Add Facebook BMC flash layout
Date: Thu, 8 Nov 2018 16:50:34 -0800
Message-ID: <20181109005034.210138-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-08_13:, , signatures=0
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
X-List-Received-Date: Fri, 09 Nov 2018 00:50:49 -0000

This is the layout used by Facebook BMC systems. It describes the fixed
flash layout of a 32MB mtd device.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 Changes in v3:
   - adding comments explaining why "data0" and "flash0" partitions are
     needed.
 Changes in v2:
   - adding facebook copyright.

 .../boot/dts/facebook-bmc-flash-layout.dtsi   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi b/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
new file mode 100644
index 000000000000..87bb8b576250
--- /dev/null
+++ b/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
@@ -0,0 +1,42 @@
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
+	/*
+	 * "data0" partition is used by several Facebook BMC platforms
+	 * as persistent data store.
+	 */
+	data0@1c00000 {
+		reg = <0x1c00000 0x400000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x2000000>;
+		label = "flash0";
+	};
+};
-- 
2.17.1
