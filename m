Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cJnp4zSpzF2WK
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 01:23:42 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w43FKU4c075894
 for <openbmc@lists.ozlabs.org>; Thu, 3 May 2018 11:23:38 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hr3hh55an-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 May 2018 11:23:37 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 3 May 2018 09:23:37 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 May 2018 09:23:35 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w43FNXnm7799082; Thu, 3 May 2018 08:23:34 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D43676A03C;
 Thu,  3 May 2018 09:23:34 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 926AC6A03D;
 Thu,  3 May 2018 09:23:34 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13] ARM: configs: aspeed: Add watchdog sysfs
Date: Thu,  3 May 2018 10:23:33 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18050315-0008-0000-0000-000009B48357
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008962; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000258; SDB=6.01026942; UDB=6.00524533; IPR=6.00806075; 
 MB=3.00020905; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-03 15:23:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050315-0009-0000-0000-0000471589CA
Message-Id: <1525361013-19896-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-03_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805030134
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2018 15:23:43 -0000

This kernel config adds sysfs entries for watchdog devices. This is
needed in order to access the bootstatus sysfs file that will indicate
whether or not the BMC has tripped the watchdog and subsequently
switched sides.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 arch/arm/configs/aspeed_g4_defconfig | 1 +
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 74d9343..ed1c470 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -219,6 +219,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_FUNCTION_TRACER=y
 # CONFIG_TRACING_EVENTS_GPIO is not set
 CONFIG_DEBUG_USER=y
+CONFIG_WATCHDOG_SYSFS=y
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
 # CONFIG_XZ_DEC_X86 is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 538e30b..66450bd 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -222,6 +222,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_FUNCTION_TRACER=y
 # CONFIG_TRACING_EVENTS_GPIO is not set
 CONFIG_DEBUG_USER=y
+CONFIG_WATCHDOG_SYSFS=y
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
 # CONFIG_XZ_DEC_X86 is not set
-- 
1.8.3.1
