Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSqN05FS0zF0Q8
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2018 06:53:36 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0QJi7o0012860
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:34 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fr9pyjdmj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:32 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 Jan 2018 12:53:32 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Jan 2018 12:53:30 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0QJrTn712517884; Fri, 26 Jan 2018 12:53:29 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1F956E038;
 Fri, 26 Jan 2018 12:53:29 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.85.176.85])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 140296E035;
 Fri, 26 Jan 2018 12:53:28 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/5] ARM: dts: aspeed-g5: fix watchdog 3
 definition
Date: Fri, 26 Jan 2018 13:53:20 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18012619-0008-0000-0000-0000093B1914
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008433; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00980763; UDB=6.00497211; IPR=6.00760064; 
 BA=6.00005797; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019231; XFM=3.00000015;
 UTC=2018-01-26 19:53:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012619-0009-0000-0000-000045B9CB86
Message-Id: <1516996404-25133-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801260259
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 19:53:37 -0000

From: Milton Miller <miltonm@us.ibm.com>

Fix wdt3 reg and compatible properties.

The ast2500 generation SOC has added a third watchdog.  The address specified
is incorrect, and the compatible was not updated when upstream requested
the SOC name in the compatible property.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ba3607c..a8a237d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -317,8 +317,8 @@
 			};
 
 			wdt3: wdt@1e785040 {
-				compatible = "aspeed,wdt";
-				reg = <0x1e785074 0x1c>;
+				compatible = "aspeed,ast2500-wdt";
+				reg = <0x1e785040 0x1c>;
 				status = "disabled";
 			};
 
-- 
1.8.3.1
