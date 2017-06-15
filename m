Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpZB54ZQLzDqL8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 06:00:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5FJwgmX019389
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:43 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b3uwmp3x7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:42 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 15 Jun 2017 14:00:41 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Jun 2017 14:00:38 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5FK0b5T63242292; Thu, 15 Jun 2017 13:00:37 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C8456E040;
 Thu, 15 Jun 2017 14:00:37 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 4DD0B6E048;
 Thu, 15 Jun 2017 14:00:37 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 2/3] arch/arm/boot/dts: Add optional
 property for max31785
Date: Thu, 15 Jun 2017 15:00:32 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17061520-0016-0000-0000-000006F96314
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007238; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00875272; UDB=6.00435772; IPR=6.00655361; 
 BA=6.00005423; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015840; XFM=3.00000015;
 UTC=2017-06-15 20:00:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061520-0017-0000-0000-00003A220EB4
Message-Id: <20170615200033.67387-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706150345
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
X-List-Received-Date: Thu, 15 Jun 2017 20:00:46 -0000

Add new optional property 'fault-max-fan'.  Indicates that the
max31785 should be configured to set 100% PWM fan duty cycle
on fault condition.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 42b70a5d..d47da9d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -196,6 +196,7 @@
 	max31785@52 {
 		compatible = "maxim,max31785";
 		reg = <0x52>;
+		fault-max-fan;
 	};
 
 	dps310@76 {
-- 
1.8.2.2
