Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxK3F3BvCzDr2d
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 05:33:13 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5QJT8nr076933
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 15:33:10 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bb3v2m0eb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 15:33:10 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 26 Jun 2017 15:33:10 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 26 Jun 2017 15:33:07 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5QJX7eC52297922; Mon, 26 Jun 2017 19:33:07 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 036FCAE034;
 Mon, 26 Jun 2017 15:33:09 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id A8FF1AE03B;
 Mon, 26 Jun 2017 15:33:08 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] arm/dts: Add I2C master and ports to FSI cfam
Date: Mon, 26 Jun 2017 14:33:05 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17062619-0048-0000-0000-000001B2AC52
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007281; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00879080; UDB=6.00438096; IPR=6.00659235; 
 BA=6.00005443; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015957; XFM=3.00000015;
 UTC=2017-06-26 19:33:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062619-0049-0000-0000-000041AA1919
Message-Id: <1498505585-1820-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-26_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706260319
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
X-List-Received-Date: Mon, 26 Jun 2017 19:33:14 -0000

From: "Edward A. James" <eajames@us.ibm.com>

FSI I2C master algorithm probes port devices based on dts.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 134 +++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index f29c6e3..a0b5c97 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -4,6 +4,73 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		i2cm@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				port = <0>;
+			};
+
+			port@1 {
+				port = <1>;
+			};
+
+			port@2 {
+				port = <2>;
+			};
+
+			port@3 {
+				port = <3>;
+			};
+
+			port@4 {
+				port = <4>;
+			};
+
+			port@5 {
+				port = <5>;
+			};
+
+			port@6 {
+				port = <6>;
+			};
+
+			port@7 {
+				port = <7>;
+			};
+
+			port@8 {
+				port = <8>;
+			};
+
+			port@9 {
+				port = <9>;
+			};
+
+			port@10 {
+				port = <10>;
+			};
+
+			port@11 {
+				port = <11>;
+			};
+
+			port@12 {
+				port = <12>;
+			};
+
+			port@13 {
+				port = <13>;
+			};
+
+			port@14 {
+				port = <14>;
+			};
+		};
+
 		sbefifo@2400 {
 			compatible = "ibm,p9-sbefifo";
 			reg = <0x2400 0x400>;
@@ -31,6 +98,73 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 
+				i2cm@1800 {
+					compatible = "ibm,fsi-i2c-master";
+					reg = <0x1800 0x400>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						port = <0>;
+					};
+
+					port@1 {
+						port = <1>;
+					};
+
+					port@2 {
+						port = <2>;
+					};
+
+					port@3 {
+						port = <3>;
+					};
+
+					port@4 {
+						port = <4>;
+					};
+
+					port@5 {
+						port = <5>;
+					};
+
+					port@6 {
+						port = <6>;
+					};
+
+					port@7 {
+						port = <7>;
+					};
+
+					port@8 {
+						port = <8>;
+					};
+
+					port@9 {
+						port = <9>;
+					};
+
+					port@10 {
+						port = <10>;
+					};
+
+					port@11 {
+						port = <11>;
+					};
+
+					port@12 {
+						port = <12>;
+					};
+
+					port@13 {
+						port = <13>;
+					};
+
+					port@14 {
+						port = <14>;
+					};
+				};
+
 				sbefifo@2400 {
 					compatible = "ibm,p9-sbefifo";
 					reg = <0x2400 0x400>;
-- 
1.8.3.1
