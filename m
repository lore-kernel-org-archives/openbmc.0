Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWSpc2wHJzDqlN
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 07:06:46 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7EL3fIP105337
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:06:43 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cbe3j76sw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:06:43 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 14 Aug 2017 15:06:42 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 14 Aug 2017 15:06:40 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7EL6ejj32047174; Mon, 14 Aug 2017 14:06:40 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5FD178043;
 Mon, 14 Aug 2017 15:06:39 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 963CA78041;
 Mon, 14 Aug 2017 15:06:39 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] hwmon: (occ): Return power readings in
 micro-Watts
Date: Mon, 14 Aug 2017 16:06:37 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081421-0016-0000-0000-000007579A13
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007545; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00902346; UDB=6.00451927; IPR=6.00682562; 
 BA=6.00005531; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016693; XFM=3.00000015;
 UTC=2017-08-14 21:06:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081421-0017-0000-0000-00003B08C824
Message-Id: <1502744797-27565-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-14_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708140345
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
X-List-Received-Date: Mon, 14 Aug 2017 21:06:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

hwmon expects -6 exponent.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 3f63467..34002fb 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -470,7 +470,7 @@ static ssize_t occ_show_power_1(struct device *dev,
 		val = get_unaligned_be32(&power->accumulator);
 		break;
 	case 3:
-		val = get_unaligned_be16(&power->value);
+		val = get_unaligned_be16(&power->value) * 1000000;
 		break;
 	}
 
@@ -504,7 +504,7 @@ static ssize_t occ_show_power_2(struct device *dev,
 		val = get_unaligned_be64(&power->accumulator);
 		break;
 	case 3:
-		val = get_unaligned_be16(&power->value);
+		val = get_unaligned_be16(&power->value) * 1000000;
 		break;
 	case 4:
 		val = power->function_id;
@@ -541,7 +541,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->system.update_time);
 		break;
 	case 2:
-		val = get_unaligned_be16(&power->system.value);
+		val = get_unaligned_be16(&power->system.value) * 1000000;
 		break;
 	case 3:
 		val = get_unaligned_be32(&power->system.update_tag);
@@ -553,7 +553,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->proc.update_time);
 		break;
 	case 6:
-		val = get_unaligned_be16(&power->proc.value);
+		val = get_unaligned_be16(&power->proc.value) * 1000000;
 		break;
 	case 7:
 		val = get_unaligned_be32(&power->proc.update_tag);
@@ -562,7 +562,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be64(&power->proc.accumulator);
 		break;
 	case 9:
-		val = get_unaligned_be16(&power->vdd.value);
+		val = get_unaligned_be16(&power->vdd.value) * 1000000;
 		break;
 	case 10:
 		val = get_unaligned_be32(&power->vdd.update_tag);
@@ -571,7 +571,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be64(&power->vdd.accumulator);
 		break;
 	case 12:
-		val = get_unaligned_be16(&power->vdn.value);
+		val = get_unaligned_be16(&power->vdn.value) * 1000000;
 		break;
 	case 13:
 		val = get_unaligned_be32(&power->vdn.update_tag);
-- 
1.8.3.1
