Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3WVH58qDzDr4w
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 07:44:39 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66LiISQ078849
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 17:44:37 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bhvb8j3tq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 17:44:36 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 17:44:36 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 17:44:34 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66LiYPx60817548; Thu, 6 Jul 2017 21:44:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBD81112040;
 Thu,  6 Jul 2017 17:44:33 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 61626112034;
 Thu,  6 Jul 2017 17:44:33 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 1/3] arm/dts: Add I2C master and ports to
 FSI cfams
Date: Thu,  6 Jul 2017 16:44:27 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070621-0052-0000-0000-00000238E95E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007332; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883845; UDB=6.00440963; IPR=6.00664032; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016117; XFM=3.00000015;
 UTC=2017-07-06 21:44:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070621-0053-0000-0000-0000513B9E3A
Message-Id: <1499377469-30625-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060372
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
X-List-Received-Date: Thu, 06 Jul 2017 21:44:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

FSI I2C master algorithm probes port devices based on dts. Set all
devices to disabled.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 164 +++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index f29c6e3..ede778d 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -4,6 +4,88 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_i2c0: i2c-bus@0 {
+				status = "disabled";
+				reg = <0>;
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				status = "disabled";
+				reg = <1>;
+			};
+
+			cfam0_i2c2: i2c-bus@2 {
+				status = "disabled";
+				reg = <2>;
+			};
+
+			cfam0_i2c3: i2c-bus@3 {
+				status = "disabled";
+				reg = <3>;
+			};
+
+			cfam0_i2c4: i2c-bus@4 {
+				status = "disabled";
+				reg = <4>;
+			};
+
+			cfam0_i2c5: i2c-bus@5 {
+				status = "disabled";
+				reg = <5>;
+			};
+
+			cfam0_i2c6: i2c-bus@6 {
+				status = "disabled";
+				reg = <6>;
+			};
+
+			cfam0_i2c7: i2c-bus@7 {
+				status = "disabled";
+				reg = <7>;
+			};
+
+			cfam0_i2c8: i2c-bus@8 {
+				status = "disabled";
+				reg = <8>;
+			};
+
+			cfam0_i2c9: i2c-bus@9 {
+				status = "disabled";
+				reg = <9>;
+			};
+
+			cfam0_i2c10: i2c-bus@10 {
+				status = "disabled";
+				reg = <10>;
+			};
+
+			cfam0_i2c11: i2c-bus@11 {
+				status = "disabled";
+				reg = <11>;
+			};
+
+			cfam0_i2c12: i2c-bus@12 {
+				status = "disabled";
+				reg = <12>;
+			};
+
+			cfam0_i2c13: i2c-bus@13 {
+				status = "disabled";
+				reg = <13>;
+			};
+
+			cfam0_i2c14: i2c-bus@14 {
+				status = "disabled";
+				reg = <14>;
+			};
+		};
+
 		sbefifo@2400 {
 			compatible = "ibm,p9-sbefifo";
 			reg = <0x2400 0x400>;
@@ -31,6 +113,88 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 
+				i2c@1800 {
+					compatible = "ibm,fsi-i2c-master";
+					reg = <0x1800 0x400>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cfam1_i2c0: i2c-bus@0 {
+						status = "disabled";
+						reg = <0>;
+					};
+
+					cfam1_i2c1: i2c-bus@1 {
+						status = "disabled";
+						reg = <1>;
+					};
+
+					cfam1_i2c2: i2c-bus@2 {
+						status = "disabled";
+						reg = <2>;
+					};
+
+					cfam1_i2c3: i2c-bus@3 {
+						status = "disabled";
+						reg = <3>;
+					};
+
+					cfam1_i2c4: i2c-bus@4 {
+						status = "disabled";
+						reg = <4>;
+					};
+
+					cfam1_i2c5: i2c-bus@5 {
+						status = "disabled";
+						reg = <5>;
+					};
+
+					cfam1_i2c6: i2c-bus@6 {
+						status = "disabled";
+						reg = <6>;
+					};
+
+					cfam1_i2c7: i2c-bus@7 {
+						status = "disabled";
+						reg = <7>;
+					};
+
+					cfam1_i2c8: i2c-bus@8 {
+						status = "disabled";
+						reg = <8>;
+					};
+
+					cfam1_i2c9: i2c-bus@9 {
+						status = "disabled";
+						reg = <9>;
+					};
+
+					cfam1_i2c10: i2c-bus@10 {
+						status = "disabled";
+						reg = <10>;
+					};
+
+					cfam1_i2c11: i2c-bus@11 {
+						status = "disabled";
+						reg = <11>;
+					};
+
+					cfam1_i2c12: i2c-bus@12 {
+						status = "disabled";
+						reg = <12>;
+					};
+
+					cfam1_i2c13: i2c-bus@13 {
+						status = "disabled";
+						reg = <13>;
+					};
+
+					cfam1_i2c14: i2c-bus@14 {
+						status = "disabled";
+						reg = <14>;
+					};
+				};
+
 				sbefifo@2400 {
 					compatible = "ibm,p9-sbefifo";
 					reg = <0x2400 0x400>;
-- 
1.8.3.1
