Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNfMs2XLBzDqJ0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 04:53:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73ImsN2133521
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 14:53:27 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c43n9e1n1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 14:53:27 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 14:53:26 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 14:53:23 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73IrNms21758130; Thu, 3 Aug 2017 18:53:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5014AE03B;
 Thu,  3 Aug 2017 14:53:37 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.232])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id A0584AE03C;
 Thu,  3 Aug 2017 14:53:35 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/2] ARM: dts: fsi: Add hub master no scan on
 probe attribute
Date: Thu,  3 Aug 2017 13:53:06 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
References: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080318-0044-0000-0000-00000377D402
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897081; UDB=6.00448831; IPR=6.00677264; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016519; XFM=3.00000015;
 UTC=2017-08-03 18:53:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080318-0045-0000-0000-000007A5E6D9
Message-Id: <20170803185306.85007-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030288
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
X-List-Received-Date: Thu, 03 Aug 2017 18:53:29 -0000

Create a new hub master attribute to specify if it should
scan its connected devices at probe time.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index 5630e02..cb4f99f 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -127,6 +127,7 @@
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+			no-scan-on-probe;
 
 			cfam@1,0 {
 				reg = <1 0>;
-- 
1.8.2.2
