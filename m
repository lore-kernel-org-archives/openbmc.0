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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40jLw207z7zF2w4
 for <openbmc@lists.ozlabs.org>; Sat, 12 May 2018 06:16:32 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4BK9D6m031423
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 16:16:30 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hwfcfpbr5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 16:16:29 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 May 2018 16:16:28 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 May 2018 16:16:25 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4BKGOQC48824358; Fri, 11 May 2018 20:16:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 501E6AE034;
 Fri, 11 May 2018 16:18:23 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 81D95AE03B;
 Fri, 11 May 2018 16:18:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13] pmbus: core: Use 64-bit ints for returned
 sensor values
Date: Fri, 11 May 2018 15:16:22 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18051120-0056-0000-0000-0000044D1350
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009007; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01030878; UDB=6.00526882; IPR=6.00810009; 
 MB=3.00021055; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-11 20:16:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051120-0057-0000-0000-000008912450
Message-Id: <1526069782-20693-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110184
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
X-List-Received-Date: Fri, 11 May 2018 20:16:34 -0000

It's possible to overflow sensor values, especially for power sensors
reporting micro Watts. Use 64-bit values to prevent overflow.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d0ffa4b..4957243 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -629,12 +629,12 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
  * Convert linear sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_linear(struct pmbus_data *data,
-				  struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_linear(struct pmbus_data *data,
+				 struct pmbus_sensor *sensor)
 {
 	s16 exponent;
 	s32 mantissa;
-	long val;
+	s64 val;
 
 	if (sensor->class == PSC_VOLTAGE_OUT) {	/* LINEAR16 */
 		exponent = data->exponent[sensor->page];
@@ -648,11 +648,11 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
 
 	/* scale result to milli-units for all sensors except fans */
 	if (sensor->class != PSC_FAN)
-		val = val * 1000L;
+		val = val * 1000LL;
 
 	/* scale result to micro-units for power sensors */
 	if (sensor->class == PSC_POWER)
-		val = val * 1000L;
+		val = val * 1000LL;
 
 	if (exponent >= 0)
 		val <<= exponent;
@@ -666,10 +666,10 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
  * Convert direct sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_direct(struct pmbus_data *data,
-				  struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_direct(struct pmbus_data *data,
+				 struct pmbus_sensor *sensor)
 {
-	long val = (s16) sensor->data;
+	s64 val = sensor->data;
 	long m, b, R;
 
 	m = data->info->m[sensor->class];
@@ -694,23 +694,24 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
 	}
 
 	while (R > 0) {
-		val *= 10;
+		val *= 10LL;
 		R--;
 	}
 	while (R < 0) {
-		val = DIV_ROUND_CLOSEST(val, 10);
+		val = DIV_ROUND_CLOSEST_ULL(val, 10);
 		R++;
 	}
 
-	return (val - b) / m;
+	val -= b;
+	return do_div(val, m);
 }
 
 /*
  * Convert VID sensor values to milli- or micro-units
  * depending on sensor type.
  */
-static long pmbus_reg2data_vid(struct pmbus_data *data,
-			       struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data_vid(struct pmbus_data *data,
+			      struct pmbus_sensor *sensor)
 {
 	long val = sensor->data;
 	long rv = 0;
@@ -728,9 +729,9 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 	return rv;
 }
 
-static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
+static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 {
-	long val;
+	s64 val;
 
 	if (!sensor->convert)
 		return sensor->data;
@@ -968,7 +969,7 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	if (sensor->data < 0)
 		return sensor->data;
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", pmbus_reg2data(data, sensor));
+	return snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
 }
 
 static ssize_t pmbus_set_sensor(struct device *dev,
-- 
1.8.3.1
