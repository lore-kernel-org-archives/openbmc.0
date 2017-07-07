Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47Wc5GT2zDr9D
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:47:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67LhtUf117469
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:47:54 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bj3v7gnrc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:47:54 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 15:47:53 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 15:47:49 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LlnNW9306454; Fri, 7 Jul 2017 14:47:49 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E52C603E;
 Fri,  7 Jul 2017 15:47:49 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id A5024C6047;
 Fri,  7 Jul 2017 15:47:48 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 1/3] arm/dts: Add I2C master and ports to
 FSI cfams
Date: Fri,  7 Jul 2017 16:47:35 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070721-0020-0000-0000-00000C52CDFB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884326; UDB=6.00441252; IPR=6.00664514; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:47:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0021-0000-0000-00005D24B4A0
Message-Id: <1499464057-27830-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070362
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
X-List-Received-Date: Fri, 07 Jul 2017 21:47:57 -0000

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
