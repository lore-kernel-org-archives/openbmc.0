Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v229k470HzDqRh
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0G5Y15K119740
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 00:39:36 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 280dax0a5h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 00:39:35 -0500
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Mon, 16 Jan 2017 15:39:32 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 16 Jan 2017 15:39:31 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 6B5882CE8054
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:31 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0G5dXco56164486
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:33 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0G5dVkH018703
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:31 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0G5dUZf018699; Mon, 16 Jan 2017 16:39:30 +1100
Received: from camb691.ibm.com (unknown [9.81.197.197])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D6B5EA0206;
 Mon, 16 Jan 2017 16:39:29 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au
Subject: [PATCH v2 2/3] ARM: dts: aspeed-bmc-opp-zaius: Enable mailbox and LPC
 control nodes
Date: Mon, 16 Jan 2017 16:37:39 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170116053740.15299-1-cyrilbur@gmail.com>
References: <20170116053740.15299-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011605-0008-0000-0000-000000FD1681
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011605-0009-0000-0000-000008E1EE08
Message-Id: <20170116053740.15299-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701160088
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2017 05:39:39 -0000

Also add the reserved-memory node needed by the LPC control driver.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 0adf6e7e284c..cb43a597de5a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -20,6 +20,17 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@94000000 {
+			no-map;
+			reg = <0x94000000 0x04000000>; /* 64M */
+		};
+	};
+
 	onewire0 {
 		compatible = "w1-gpio";
 		gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
@@ -98,6 +109,16 @@
 	};
 };
 
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&mbox {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.11.0
