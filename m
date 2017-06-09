Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkqq94TRvzDqLF
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 04:01:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59HxjF4021338
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 14:01:23 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ays2meau0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 14:01:23 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Jun 2017 12:01:22 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 12:01:19 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59I1J0B16711796; Fri, 9 Jun 2017 11:01:19 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48C8C78051;
 Fri,  9 Jun 2017 12:01:19 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 04CD77803F;
 Fri,  9 Jun 2017 12:01:18 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 5/5] aspeed: update power9 dts and
 defconfigs for OCC
Date: Fri,  9 Jun 2017 13:01:05 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17060918-0024-0000-0000-0000169CBAC3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007202; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872402; UDB=6.00434054; IPR=6.00652472; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 18:01:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060918-0025-0000-0000-00004B4D58C8
Message-Id: <1497031265-29545-6-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090312
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
X-List-Received-Date: Fri, 09 Jun 2017 18:01:26 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 9 +++++++++
 arch/arm/configs/aspeed_g4_defconfig   | 2 ++
 arch/arm/configs/aspeed_g5_defconfig   | 1 +
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index 5beb978..f29c6e3 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -13,6 +13,10 @@
 			occ@1 {
 				compatible = "ibm,p9-occ";
 				reg = <1>;
+
+				occ-hwmon@1 {
+					compatible = "ibm,p9-occ-hwmon";
+				};
 			};
 		};
 
@@ -37,6 +41,11 @@
 						compatible =
 							"ibm,p9-occ";
 						reg = <2>;
+
+						occ-hwmon@2 {
+							compatible =
+							    "ibm,p9-occ-hwmon";
+						};
 					};
 				};
 			};
diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 1dbea59..4766919 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -141,6 +141,8 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
+CONFIG_SENSORS_OCC=y
+CONFIG_SENSORS_OCC_P8_I2C=y
 CONFIG_PMBUS=y
 # CONFIG_SENSORS_PMBUS is not set
 CONFIG_SENSORS_ADM1275=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 64e3aed..a8a34bc 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -140,6 +140,7 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
+CONFIG_SENSORS_OCC=y
 CONFIG_SENSORS_OCC_P9_SBE=y
 CONFIG_PMBUS=y
 CONFIG_SENSORS_ADM1275=y
-- 
1.8.3.1
