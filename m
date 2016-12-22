Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkgyq5RfrzDwYh
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBM64XxG008099
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:57 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27g1v0nj1g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:56 -0500
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 22 Dec 2016 16:06:54 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 22 Dec 2016 16:06:53 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 43F053578052
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:53 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBM66r9W26804294
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:53 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBM66qS4021442
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:53 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBM66qRl021437; Thu, 22 Dec 2016 17:06:52 +1100
Received: from camb691.ibm.com (unknown [9.81.194.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 503E5A0114;
 Thu, 22 Dec 2016 17:06:52 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Subject: [PATCH v2 1/5] ARM: dts: aspeed: Reserve BMC ram for host to BMC
 communication
Date: Thu, 22 Dec 2016 17:06:06 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161222060610.29695-1-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122206-0004-0000-0000-000001CB5A46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122206-0005-0000-0000-0000095BD016
Message-Id: <20161222060610.29695-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-22_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612220102
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
X-List-Received-Date: Thu, 22 Dec 2016 06:07:00 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 12 ++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 13e9f18fbed8..b60044800ea1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -29,6 +29,18 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
+	};
+
+	flash_buffer@1e789000 {
+		compatible = "aspeed,ast2400-lpc-ctrl";
+		memory-region = <&flash_memory>;
+		reg = <0x1e789000 0x8>;
 	};
 
         leds {
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7c78eb1c01ff..1ed2a9ba7ab8 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -870,6 +870,12 @@
 				interrupts = <8>;
 			};
 
+			mbox: mbox@1e789200 {
+				compatible = "aspeed,ast2400-mbox";
+				reg = <0x1e789200 0x5c>;
+				interrupts = <46>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.11.0
