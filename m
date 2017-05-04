Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJmLl4QtFzDqFT
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 06:08:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v44K3TiK085737
 for <openbmc@lists.ozlabs.org>; Thu, 4 May 2017 16:08:46 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a8adt1q4a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 May 2017 16:08:45 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 4 May 2017 16:08:44 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 4 May 2017 16:08:43 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v44K8g6i44433516; Thu, 4 May 2017 20:08:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 676C212403D;
 Thu,  4 May 2017 16:08:37 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 0C5FB124044;
 Thu,  4 May 2017 16:08:36 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 6/6] dts: aspeed: witherspoon: Add I2C master
 under FSI masters
Date: Thu,  4 May 2017 15:08:25 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050420-0024-0000-0000-00000263A25B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007022; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00856257; UDB=6.00423874; IPR=6.00635441; 
 BA=6.00005326; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015308; XFM=3.00000014;
 UTC=2017-05-04 20:08:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050420-0025-0000-0000-000043DE5CC7
Message-Id: <1493928505-30816-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-04_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705040290
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
X-List-Received-Date: Thu, 04 May 2017 20:08:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Include all the ports that are present off I2C engine on P9.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 156 +++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f20aaf4..ac903c8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -65,6 +65,8 @@
 
 	gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
 
 		status = "okay";
 
@@ -73,6 +75,160 @@
 		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			i2c-master@1800 {
+				compatible = "ibm,fsi-i2c-master";
+				reg = <0x1800 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					port = <0>;
+				};
+
+				port@1 {
+					port = <1>;
+				};
+
+				port@2 {
+					port = <2>;
+				};
+
+				port@3 {
+					port = <3>;
+				};
+
+				port@4 {
+					port = <4>;
+				};
+
+				port@5 {
+					port = <5>;
+				};
+
+				port@6 {
+					port = <6>;
+				};
+
+				port@7 {
+					port = <7>;
+				};
+
+				port@8 {
+					port = <8>;
+				};
+
+				port@9 {
+					port = <9>;
+				};
+
+				port@10 {
+					port = <10>;
+				};
+
+				port@11 {
+					port = <11>;
+				};
+
+				port@12 {
+					port = <12>;
+				};
+
+				port@13 {
+					port = <13>;
+				};
+
+				port@14 {
+					port = <14>;
+				};
+			};
+
+			hub@3400 {
+				compatible = "fsi-master-hub";
+				reg = <0x3400 0x400>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+
+				cfam@1,0 {
+					reg = <1 0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					i2c-master@1800 {
+						compatible = "ibm,fsi-i2c-master";
+						reg = <0x1800 0x400>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							port = <0>;
+						};
+
+						port@1 {
+							port = <1>;
+						};
+
+						port@2 {
+							port = <2>;
+						};
+
+						port@3 {
+							port = <3>;
+						};
+
+						port@4 {
+							port = <4>;
+						};
+
+						port@5 {
+							port = <5>;
+						};
+
+						port@6 {
+							port = <6>;
+						};
+
+						port@7 {
+							port = <7>;
+						};
+
+						port@8 {
+							port = <8>;
+						};
+
+						port@9 {
+							port = <9>;
+						};
+
+						port@10 {
+							port = <10>;
+						};
+
+						port@11 {
+							port = <11>;
+						};
+
+						port@12 {
+							port = <12>;
+						};
+
+						port@13 {
+							port = <13>;
+						};
+
+						port@14 {
+							port = <14>;
+						};
+					};
+
+				};
+			};
+		};
 	};
 
 	iio-hwmon {
-- 
1.8.3.1
