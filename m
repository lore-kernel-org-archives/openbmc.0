Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRCmC1kDCzDqkX
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 09:04:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77N49bN046607
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 19:04:57 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c6u469cg6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 19:04:57 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 19:04:56 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 19:04:54 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77N4rnW32833652; Mon, 7 Aug 2017 23:04:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86B17124035;
 Mon,  7 Aug 2017 19:02:17 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 4AA2C124037;
 Mon,  7 Aug 2017 19:02:17 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.10 3/3] drivers/hwmon/pmbus: Add sensor status to
 pmbus attributes
Date: Mon,  7 Aug 2017 18:04:45 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080723-0040-0000-0000-0000038C101D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899055; UDB=6.00449968; IPR=6.00679260; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016580; XFM=3.00000015;
 UTC=2017-08-07 23:04:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080723-0041-0000-0000-000007803D56
Message-Id: <1502147085-437-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070383
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
X-List-Received-Date: Mon, 07 Aug 2017 23:04:59 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Extend the pmbus core to provide status registers for attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index fc88cae..d319f94 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -87,6 +87,14 @@ struct pmbus_label {
 #define to_pmbus_label(_attr) \
 	container_of(_attr, struct pmbus_label, attribute)
 
+struct pmbus_status {
+	char name[PMBUS_NAME_SIZE];	/* sysfs status name */
+	struct device_attribute attribute;
+	int reg;
+};
+#define to_pmbus_status(_attr) \
+	container_of(_attr, struct pmbus_status, attribute)
+
 struct pmbus_data {
 	struct device *dev;
 	struct device *hwmon_dev;
@@ -993,6 +1001,16 @@ static ssize_t pmbus_show_label(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
 }
 
+static ssize_t pmbus_show_status(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct pmbus_status *status = to_pmbus_status(da);
+	struct pmbus_data *data = pmbus_update_device(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%02x\n",
+			pmbus_get_status(data, status->reg) & 0xFF);
+}
+
 static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
 {
 	if (data->num_attributes >= data->max_attributes - 1) {
@@ -1131,6 +1149,25 @@ static int pmbus_add_label(struct pmbus_data *data,
 	return pmbus_add_attribute(data, &a->attr);
 }
 
+static int pmbus_add_status(struct pmbus_data *data, const char *name, int seq,
+			    int reg)
+{
+	struct pmbus_status *status;
+	struct device_attribute *a;
+
+	status = devm_kzalloc(data->dev, sizeof(*status), GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
+	a = &status->attribute;
+
+	snprintf(status->name, sizeof(status->name), "%s%d_status", name, seq);
+	status->reg = reg;
+
+	pmbus_dev_attr_init(a, status->name, S_IRUGO, pmbus_show_status, NULL);
+	return pmbus_add_attribute(data, &a->attr);
+}
+
 /*
  * Search for attributes. Allocate sensors, booleans, and labels as needed.
  */
@@ -1253,6 +1290,16 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 				return ret;
 		}
 	}
+	if (attr->sbase > 0 && attr->sbase < PB_STATUS_VMON_BASE) {
+		/* Add "status" attribute for physical status registers to dump
+		 * the contents. This is pretty useful for hardware diagnostic
+		 * purposes, as an alarm or fault bit doesn't necessarily
+		 * provide all the info available.
+		 */
+		ret = pmbus_add_status(data, name, index, attr->sbase + page);
+		if (ret)
+			return ret;
+	}
 	return 0;
 }
 
@@ -1885,6 +1932,10 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 					PB_FAN_FAN1_FAULT >> (f & 1));
 				if (ret)
 					return ret;
+				ret = pmbus_add_status(data, "fan", index,
+						       base);
+				if (ret)
+					return ret;
 			}
 			index++;
 		}
-- 
1.8.3.1
