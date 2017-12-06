Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysTD136MYzDrMq
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 06:28:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vB6JOvFB066837
 for <openbmc@lists.ozlabs.org>; Wed, 6 Dec 2017 14:27:58 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eppat0yst-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2017 14:27:58 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 6 Dec 2017 14:27:58 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 6 Dec 2017 14:27:56 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vB6JRtQt37421136; Wed, 6 Dec 2017 19:27:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13551AC057;
 Wed,  6 Dec 2017 14:28:55 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id BC802AC040;
 Wed,  6 Dec 2017 14:28:54 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.13] hwmon (occ): Fix integer overflow in
 multiplication
Date: Wed,  6 Dec 2017 13:27:53 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17120619-0040-0000-0000-000003CDAFFF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008161; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00956383; UDB=6.00483444; IPR=6.00736419; 
 BA=6.00005729; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018387; XFM=3.00000015;
 UTC=2017-12-06 19:27:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17120619-0041-0000-0000-000007C2E891
Message-Id: <1512588473-819-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712060275
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
X-List-Received-Date: Wed, 06 Dec 2017 19:28:02 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Power values were overflowing INT_MAX when being converted to
microwatts, even though the storage was sufficiently large (unsigned 64
bit). Change literals to unsigned long long.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 7c97a4c..bb0d0e0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -393,7 +393,7 @@ static ssize_t occ_show_power_1(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int rc;
-	u32 val = 0;
+	u64 val = 0;
 	struct power_sensor_1 *power;
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_sensors *sensors = &occ->sensors;
@@ -417,13 +417,13 @@ static ssize_t occ_show_power_1(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
 }
 
 static ssize_t occ_show_power_2(struct device *dev,
@@ -454,7 +454,7 @@ static ssize_t occ_show_power_2(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	case 4:
 		val = power->function_id;
@@ -496,7 +496,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->system.value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->system.value) *
+			1000000ULL;
 		break;
 	case 4:
 		val = get_unaligned_be32(&power->system.update_tag);
@@ -511,7 +512,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 8:
 		/* microwatts */
-		val = get_unaligned_be16(&power->proc.value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->proc.value) * 1000000ULL;
 		break;
 	case 9:
 		val = get_unaligned_be32(&power->proc.update_tag);
@@ -523,7 +524,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return snprintf(buf, PAGE_SIZE - 1, "vdd\n");
 	case 12:
 		/* microwatts */
-		val = get_unaligned_be16(&power->vdd.value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->vdd.value) * 1000000ULL;
 		break;
 	case 13:
 		val = get_unaligned_be32(&power->vdd.update_tag);
@@ -535,7 +536,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return snprintf(buf, PAGE_SIZE - 1, "vdn\n");
 	case 16:
 		/* microwatts */
-		val = get_unaligned_be16(&power->vdn.value) * 1000000;
+		val = (u64)get_unaligned_be16(&power->vdn.value) * 1000000ULL;
 		break;
 	case 17:
 		val = get_unaligned_be32(&power->vdn.update_tag);
-- 
1.8.3.1
