Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0Tb5HP8zDqb0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:45:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhkL8015302
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:45:13 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29btm73nd5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:45:13 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:45:12 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:57 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLivxi9634216; Thu, 23 Mar 2017 14:44:57 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE36478043;
 Thu, 23 Mar 2017 15:44:56 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id A5E027803F;
 Thu, 23 Mar 2017 15:44:56 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 7/7] dts: aspeed: witherspoon: Add an I2C master
 as FSI device child
Date: Thu, 23 Mar 2017 16:44:39 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17032321-0020-0000-0000-00000BA1483E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006837; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837963; UDB=6.00412008; IPR=6.00615726; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:45:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0021-0000-0000-00005B1AE5A1
Message-Id: <1490305479-17065-8-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:45:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Also add port devices under the I2C master.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 128 +++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 6772b53..698f2e7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -63,6 +63,134 @@
 			compatible = "fixed-clock";
 			clock-frequency = <8333333>;
 		};
+
+		i2cm@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			compatible = "ibm,power9-i2cm";
+			reg = <0x00001800>;
+
+			i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <0>;
+			};
+
+			i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <1>;
+			};
+
+			i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <2>;
+			};
+
+			i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <3>;
+			};
+
+			i2c-bus@4 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <4>;
+			};
+
+			i2c-bus@5 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <5>;
+			};
+
+			i2c-bus@6 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <6>;
+			};
+
+			i2c-bus@7 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <7>;
+			};
+
+			i2c-bus@8 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <8>;
+			};
+
+			i2c-bus@9 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <9>;
+			};
+
+			i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <10>;
+			};
+
+			i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <11>;
+			};
+
+			i2c-bus@12 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <12>;
+			};
+
+			i2c-bus@13 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <13>;
+			};
+
+			i2c-bus@14 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				compatible = "ibm,power9-i2c-port";
+				reg = <14>;
+			};
+		};
 	};
 };
 
-- 
1.8.3.1
