Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsnYc6M3pzF1mj
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 09:44:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w21Mhvvo123746
 for <openbmc@lists.ozlabs.org>; Thu, 1 Mar 2018 17:44:34 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gesc3akrq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:44:34 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 1 Mar 2018 17:44:33 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Mar 2018 17:44:32 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w21MiVKi39780552; Thu, 1 Mar 2018 22:44:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E572A112034;
 Thu,  1 Mar 2018 17:42:50 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.85.161.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 607AF112047;
 Thu,  1 Mar 2018 17:42:50 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, spinler@linux.vnet.ibm.com,
 Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.13 2/2] hwmon (occ): Fix integer overflow in
 multiplication
Date: Thu,  1 Mar 2018 16:44:19 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18030122-2213-0000-0000-00000278E896
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008609; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00996985; UDB=6.00506901; IPR=6.00776303; 
 MB=3.00019807; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-01 22:44:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030122-2214-0000-0000-0000594803F9
Message-Id: <1519944259-27898-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-01_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803010276
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
X-List-Received-Date: Thu, 01 Mar 2018 22:44:37 -0000

Power values were overflowing INT_MAX when being converted to
microwatts, even though the storage was sufficiently large (unsigned 64
bit). Change literals to unsigned long long. Also change tmep storage to u32
to avoid overflows at 65000 millidegrees.

OpenBMC-Staging-Count: 1
Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/occ/common.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index a5c4df0..3e73889 100644
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
@@ -380,7 +380,7 @@ static ssize_t occ_show_power_1(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int rc;
-	u32 val = 0;
+	u64 val = 0;
 	struct power_sensor_1 *power;
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_sensors *sensors = &occ->sensors;
@@ -404,13 +404,13 @@ static ssize_t occ_show_power_1(struct device *dev,
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
@@ -441,7 +441,7 @@ static ssize_t occ_show_power_2(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->value) * 1000000;
+		val = get_unaligned_be16(&power->value) * 1000000ULL;
 		break;
 	case 4:
 		val = power->function_id;
@@ -483,7 +483,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 3:
 		/* microwatts */
-		val = get_unaligned_be16(&power->system.value) * 1000000;
+		val = get_unaligned_be16(&power->system.value) * 1000000ULL;
 		break;
 	case 4:
 		val = get_unaligned_be32(&power->system.update_tag);
@@ -498,7 +498,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		break;
 	case 8:
 		/* microwatts */
-		val = get_unaligned_be16(&power->proc.value) * 1000000;
+		val = get_unaligned_be16(&power->proc.value) * 1000000ULL;
 		break;
 	case 9:
 		val = get_unaligned_be32(&power->proc.update_tag);
@@ -510,7 +510,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return snprintf(buf, PAGE_SIZE - 1, "vdd\n");
 	case 12:
 		/* microwatts */
-		val = get_unaligned_be16(&power->vdd.value) * 1000000;
+		val = get_unaligned_be16(&power->vdd.value) * 1000000ULL;
 		break;
 	case 13:
 		val = get_unaligned_be32(&power->vdd.update_tag);
@@ -522,7 +522,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
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
