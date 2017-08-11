Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXl22wqqzDr2q
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:57:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHriM5120856
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:57:00 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c9gmusxt1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:56:59 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 13:56:58 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 13:56:57 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BHuuom24379506; Fri, 11 Aug 2017 17:56:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19AB0B204E;
 Fri, 11 Aug 2017 13:54:23 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id A3AF3B2046;
 Fri, 11 Aug 2017 13:54:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v5 4/4] ARM: dts: aspeed: Witherspoon: Add
 power supplies to i2c bus
Date: Fri, 11 Aug 2017 12:56:45 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081117-0036-0000-0000-000002577D9D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900858; UDB=6.00451050; IPR=6.00681061; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 17:56:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081117-0037-0000-0000-000041683D32
Message-Id: <1502474205-1557-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110279
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
X-List-Received-Date: Fri, 11 Aug 2017 17:57:03 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 9ab8e46..dd30c20 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -417,6 +417,16 @@
 			type = <PCA955X_TYPE_GPIO>;
 		};
 	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps1";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps1";
+		reg = <0x69>;
+	};
 };
 
 &i2c4 {
-- 
1.8.3.1
