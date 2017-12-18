Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0tRk3ywyzDrpG
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 07:48:49 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBIKjCNE047636
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 15:48:47 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2exjdcxjfh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 15:48:47 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 18 Dec 2017 15:48:46 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 18 Dec 2017 15:48:44 -0500
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBIKmiAM62193864; Mon, 18 Dec 2017 20:48:44 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFCA1124037;
 Mon, 18 Dec 2017 15:45:41 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 622B7124035;
 Mon, 18 Dec 2017 15:45:41 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] hwmon (occ): Fix integer overflow in
 multiplication
Date: Mon, 18 Dec 2017 14:48:42 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17121820-0044-0000-0000-000003C0A582
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008223; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00962163; UDB=6.00486653; IPR=6.00742158; 
 BA=6.00005750; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018611; XFM=3.00000015;
 UTC=2017-12-18 20:48:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121820-0045-0000-0000-000007EFEB1E
Message-Id: <1513630122-22725-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-18_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712180276
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
X-List-Received-Date: Mon, 18 Dec 2017 20:48:51 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Power values were overflowing INT_MAX when being converted to
microwatts, even though the storage was sufficiently large (unsigned 64
bit). Change literals to unsigned long long.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/occ/common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 3175e7b..fde642d 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int rc;
-	u32 val = 0;
+	u64 val = 0;
 	struct power_sensor_1 *power;
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_sensors *sensors = &occ->sensors;
@@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
 		val = get_unaligned_be32(&power->accumulator);
 		break;
 	case 3:
-		val = get_unaligned_be16(&power->value) * 1000000;
+		val = get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
 }
 
 static ssize_t occ_show_power_2(struct device *dev,
@@ -525,7 +525,7 @@ static ssize_t occ_show_power_2(struct device *dev,
 		val = get_unaligned_be64(&power->accumulator);
 		break;
 	case 3:
-		val = get_unaligned_be16(&power->value) * 1000000;
+		val = get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	case 4:
 		val = power->function_id;
@@ -562,7 +562,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->system.update_time);
 		break;
 	case 2:
-		val = get_unaligned_be16(&power->system.value) * 1000000;
+		val = get_unaligned_be16(&power->system.value) * 1000000ULL;
 		break;
 	case 3:
 		val = get_unaligned_be32(&power->system.update_tag);
@@ -574,7 +574,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->proc.update_time);
 		break;
 	case 6:
-		val = get_unaligned_be16(&power->proc.value) * 1000000;
+		val = get_unaligned_be16(&power->proc.value) * 1000000ULL;
 		break;
 	case 7:
 		val = get_unaligned_be32(&power->proc.update_tag);
@@ -583,7 +583,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be64(&power->proc.accumulator);
 		break;
 	case 9:
-		val = get_unaligned_be16(&power->vdd.value) * 1000000;
+		val = get_unaligned_be16(&power->vdd.value) * 1000000ULL;
 		break;
 	case 10:
 		val = get_unaligned_be32(&power->vdd.update_tag);
@@ -592,7 +592,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be64(&power->vdd.accumulator);
 		break;
 	case 12:
-		val = get_unaligned_be16(&power->vdn.value) * 1000000;
+		val = get_unaligned_be16(&power->vdn.value) * 1000000ULL;
 		break;
 	case 13:
 		val = get_unaligned_be32(&power->vdn.update_tag);
-- 
1.8.3.1
