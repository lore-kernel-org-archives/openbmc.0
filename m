Return-Path: <vishwa@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yjF0k1cL6zDr8f
 for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2017 20:49:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAN9mVm6089393
 for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2017 04:49:39 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2edue9ah7f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2017 04:49:38 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 23 Nov 2017 04:49:37 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Nov 2017 04:49:36 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAN9na5E24510606; Thu, 23 Nov 2017 09:49:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5240112040;
 Thu, 23 Nov 2017 04:48:58 -0500 (EST)
Received: from vishwa.in.ibm.com (unknown [9.199.74.35])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id CB4A1112051;
 Thu, 23 Nov 2017 04:48:57 -0500 (EST)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: witherspoon: Add power-button LED
Date: Thu, 23 Nov 2017 15:20:37 +0530
X-Mailer: git-send-email 1.9.1
X-TM-AS-GCONF: 00
x-cbid: 17112309-0052-0000-0000-0000028711B1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008107; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000241; SDB=6.00949967; UDB=6.00479731; IPR=6.00730077; 
 BA=6.00005706; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018144; XFM=3.00000015;
 UTC=2017-11-23 09:49:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17112309-0053-0000-0000-000052B580E2
Message-Id: <1511430637-14131-1-git-send-email-vishwa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-23_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711230136
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Nov 2017 09:49:42 -0000

This LED wired to GPIO R5 is integrated with power button

Change-Id: I899405013fbb6b93783dec59090e86453a5ec383
Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 68058ec..d25c7dc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -143,6 +143,10 @@
 		rear-power {
 			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
 		};
+
+		power-button {
+			gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	fsi: gpio-fsi {
-- 
1.9.1
