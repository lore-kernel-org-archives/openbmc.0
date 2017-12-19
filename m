Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1TCF29ylzF06v
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 06:55:04 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBJJsUGP087846
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 14:55:02 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ey6bc165a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 14:55:01 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 19 Dec 2017 14:55:01 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Dec 2017 14:54:58 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBJJsw0R45744182; Tue, 19 Dec 2017 19:54:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50A75AC041;
 Tue, 19 Dec 2017 14:56:02 -0500 (EST)
Received: from talon7.austin.ibm.com (unknown [9.41.241.240])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id EA6A2AC040;
 Tue, 19 Dec 2017 14:56:01 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.13 v3] hwmon (occ): Fix integer overflow in
 multiplication
Date: Tue, 19 Dec 2017 13:54:55 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17121919-0048-0000-0000-0000021759FB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008228; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00962623; UDB=6.00486920; IPR=6.00742617; 
 BA=6.00005752; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018629; XFM=3.00000015;
 UTC=2017-12-19 19:54:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121919-0049-0000-0000-000043818F8F
Message-Id: <1513713295-27120-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712190285
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
X-List-Received-Date: Tue, 19 Dec 2017 19:55:05 -0000

Power values were overflowing INT_MAX when being converted to
microwatts, even though the storage was sufficiently large (unsigned 64
bit). Change literals to unsigned long long. Also change temp storage to u32
to avoid overflows at 65000 millidegrees.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 7c97a4c..d0b2a29 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -256,7 +256,7 @@ static ssize_t occ_show_temp_1(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	int rc;
-	u16 val = 0;
+	u32 val = 0;
 	struct temp_sensor_1 *temp;
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_sensors *sensors = &occ->sensors;
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
+		val = get_unaligned_be16(&power->value) * 1000000ULL;
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
+		val = get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	case 4:
 		val = power->function_id;
@@ -496,7 +496,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->system.value) * 1000000;
+		val = get_unaligned_be16(&power->system.value) * 1000000ULL;
 		break;
 	case 4:
 		val = get_unaligned_be32(&power->system.update_tag);
@@ -511,7 +511,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 8:
 		/* microwatts */
-		val = get_unaligned_be16(&power->proc.value) * 1000000;
+		val = get_unaligned_be16(&power->proc.value) * 1000000ULL;
 		break;
 	case 9:
 		val = get_unaligned_be32(&power->proc.update_tag);
@@ -523,7 +523,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return snprintf(buf, PAGE_SIZE - 1, "vdd\n");
 	case 12:
 		/* microwatts */
-		val = get_unaligned_be16(&power->vdd.value) * 1000000;
+		val = get_unaligned_be16(&power->vdd.value) * 1000000ULL;
 		break;
 	case 13:
 		val = get_unaligned_be32(&power->vdd.update_tag);
@@ -535,7 +535,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return snprintf(buf, PAGE_SIZE - 1, "vdn\n");
 	case 16:
 		/* microwatts */
-		val = get_unaligned_be16(&power->vdn.value) * 1000000;
+		val = get_unaligned_be16(&power->vdn.value) * 1000000ULL;
 		break;
 	case 17:
 		val = get_unaligned_be32(&power->vdn.update_tag);
-- 
1.8.3.1
