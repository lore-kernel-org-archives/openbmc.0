Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpkJj6mFXzDrZr
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 03:07:17 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v88H4mSs103581
 for <openbmc@lists.ozlabs.org>; Fri, 8 Sep 2017 13:07:14 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cuw50qf5f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 13:07:14 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 8 Sep 2017 13:07:13 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 8 Sep 2017 13:07:12 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v88H7Bg950397308; Fri, 8 Sep 2017 17:07:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C643AC03F;
 Fri,  8 Sep 2017 13:07:39 -0400 (EDT)
Received: from eddies-mbp.austin.ibm.com (unknown [9.41.250.114])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id E4AA1AC03A;
 Fri,  8 Sep 2017 13:07:38 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/hwmon/occ: Add temperature fault
 attribute and VRM temp alarm
Date: Fri,  8 Sep 2017 12:07:09 -0500
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
X-TM-AS-GCONF: 00
x-cbid: 17090817-0044-0000-0000-0000038BBE97
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007690; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000227; SDB=6.00914119; UDB=6.00458861; IPR=6.00694378; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017071; XFM=3.00000015;
 UTC=2017-09-08 17:07:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090817-0045-0000-0000-000007BABF12
Message-Id: <20170908170709.8908-1-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-08_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709080256
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
X-List-Received-Date: Fri, 08 Sep 2017 17:07:18 -0000

From: Eddie James <eajames@us.ibm.com>

VRM temp doesn't return temperature, only alarm bit.
Add fault attribute, triggered when the temp sensor returns the 0xFF code.

Signed-off-by: Eddie James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 34002fb6a4e7..8ffb55682a60 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -19,6 +19,10 @@
 #define OCC_EXT_STAT_MEM_THROTTLE	0x20
 #define OCC_EXT_STAT_QUICK_DROP		0x10
 
+#define OCC_TEMP_SENSOR_FAULT		0xFF
+
+#define OCC_FRU_TYPE_VRM		3
+
 atomic_t occ_num_occs = ATOMIC_INIT(0);
 
 struct temp_sensor_1 {
@@ -377,11 +381,23 @@ static ssize_t occ_show_temp_2(struct device *dev,
 		val = get_unaligned_be32(&temp->sensor_id);
 		break;
 	case 1:
-		val = temp->value * 1000;
+		val = temp->value;
+		if (val == OCC_TEMP_SENSOR_FAULT)
+			return -EREMOTEIO;
+
+		if (temp->fru_type != OCC_FRU_TYPE_VRM) {
+			if (val == 0)
+				return -EAGAIN;
+
+			val *= 1000;
+		}
 		break;
 	case 2:
 		val = temp->fru_type;
 		break;
+	case 3:
+		val = temp->value == OCC_TEMP_SENSOR_FAULT;
+		break;
 	}
 
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
@@ -780,6 +796,7 @@ static ssize_t occ_show_extended(struct device *dev,
 int occ_setup_sensor_attrs(struct occ *occ)
 {
 	unsigned int i, s;
+	struct temp_sensor_2 *temp;
 	struct device *dev = occ->bus_dev;
 	struct occ_sensors *sensors = &occ->sensors;
 	struct occ_attribute *attr;
@@ -799,7 +816,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
 		occ->num_attrs += (sensors->temp.num_sensors * 2);
 		break;
 	case 2:
-		occ->num_attrs += (sensors->temp.num_sensors * 3);
+		occ->num_attrs += (sensors->temp.num_sensors * 4);
 		show_temp = occ_show_temp_2;
 		break;
 	default:
@@ -871,13 +888,22 @@ int occ_setup_sensor_attrs(struct occ *occ)
 
 	for (i = 0; i < sensors->temp.num_sensors; ++i) {
 		s = i + 1;
+		temp = ((struct temp_sensor_2 *)sensors->temp.data) + i;
 
 		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
 		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
 					     0, i);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
+		if (sensors->temp.version > 1 &&
+		    temp->fru_type == OCC_FRU_TYPE_VRM) {
+			snprintf(attr->name, sizeof(attr->name), "temp%d_alarm",
+				 s);
+		} else {
+			snprintf(attr->name, sizeof(attr->name), "temp%d_input",
+				 s);
+		}
+
 		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
 					     1, i);
 		attr++;
@@ -888,6 +914,12 @@ int occ_setup_sensor_attrs(struct occ *occ)
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_temp, NULL, 2, i);
 			attr++;
+
+			snprintf(attr->name, sizeof(attr->name), "temp%d_fault",
+				 s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_temp, NULL, 3, i);
+			attr++;
 		}
 	}
 
-- 
2.11.0 (Apple Git-81)
