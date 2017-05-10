Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNLNx6DnvzDqLt
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 01:53:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4AFmmFL077573
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:53:04 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2abx63ex14-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:53:04 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 10 May 2017 09:53:02 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 09:52:58 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4AFqw8t13893956; Wed, 10 May 2017 08:52:58 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27AC613603C;
 Wed, 10 May 2017 09:52:58 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id CCDF5136043;
 Wed, 10 May 2017 09:52:57 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 6/6] dts: aspeed: witherspoon: Add I2C
 master under FSI masters
Date: Wed, 10 May 2017 10:52:42 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17051015-0028-0000-0000-0000078F80EE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007043; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858722; UDB=6.00425519; IPR=6.00638195; 
 BA=6.00005342; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015397; XFM=3.00000015;
 UTC=2017-05-10 15:53:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051015-0029-0000-0000-000035B1304A
Message-Id: <1494431562-25101-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100107
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
X-List-Received-Date: Wed, 10 May 2017 15:53:06 -0000

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
