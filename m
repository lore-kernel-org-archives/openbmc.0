Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkH4W0nQHzDqbr
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 06:26:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v58KNkxv013516
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 16:26:01 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ayde1ge9r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 16:26:00 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 8 Jun 2017 14:26:00 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Jun 2017 14:25:57 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v58KPuCN19202390; Thu, 8 Jun 2017 13:25:56 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7CB8BE038;
 Thu,  8 Jun 2017 14:25:56 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 7E221BE03A;
 Thu,  8 Jun 2017 14:25:56 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/2] drivers: hwmon: occ: Add new sensor
 versions and non-hwmon attributes
Date: Thu,  8 Jun 2017 15:25:50 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1496953551-27567-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1496953551-27567-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17060820-0020-0000-0000-00000C1EF9E6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007196; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872030; UDB=6.00433795; IPR=6.00652040; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015750; XFM=3.00000015;
 UTC=2017-06-08 20:25:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060820-0021-0000-0000-00005CB3DB9B
Message-Id: <1496953551-27567-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706080358
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
X-List-Received-Date: Thu, 08 Jun 2017 20:26:03 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Switch to versioned sensors which can be used for both p8 and p9. This
adds more common code and removes the need for the processor-specific
functions (other than the OCC access code).

Also add non-hwmon attributes for OCC status.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Makefile |   2 +-
 drivers/hwmon/occ/common.c | 992 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/common.h |   5 +
 drivers/hwmon/occ/p9.c     | 350 ----------------
 drivers/hwmon/occ/p9.h     |  17 -
 drivers/hwmon/occ/p9_sbe.c |  18 +-
 6 files changed, 1009 insertions(+), 375 deletions(-)
 delete mode 100644 drivers/hwmon/occ/p9.c
 delete mode 100644 drivers/hwmon/occ/p9.h

diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 3b0ddc6..6245c25 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1 @@
-obj-y += p9.o p9_sbe.o common.o
+obj-y += p9_sbe.o common.o
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 1f17def..84c7de6 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -7,8 +7,114 @@
  * (at your option) any later version.
  */
 
+#include <asm/unaligned.h>
 #include "common.h"
 
+#define OCC_NUM_STATUS_ATTRS		6
+
+#define OCC_STAT_ACTIVE			0x01
+#define OCC_EXT_STAT_DVFS_OT		0x80
+#define OCC_EXT_STAT_DVFS_POWER		0x40
+#define OCC_EXT_STAT_MEM_THROTTLE	0x20
+#define OCC_EXT_STAT_QUICK_DROP		0x10
+
+struct temp_sensor_1 {
+	u16 sensor_id;
+	u16 value;
+} __packed;
+
+struct temp_sensor_2 {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+} __packed;
+
+struct freq_sensor_1 {
+	u16 sensor_id;
+	u16 value;
+} __packed;
+
+struct freq_sensor_2 {
+	u32 sensor_id;
+	u16 value;
+} __packed;
+
+struct power_sensor_1 {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+} __packed;
+
+struct power_sensor_2 {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+} __packed;
+
+struct power_sensor_data {
+	u16 value;
+	u32 update_tag;
+	u64 accumulator;
+} __packed;
+
+struct power_sensor_data_and_time {
+	u16 update_time;
+	u16 value;
+	u32 update_tag;
+	u64 accumulator;
+} __packed;
+
+struct power_sensor_a0 {
+	u32 sensor_id;
+	struct power_sensor_data_and_time system;
+	u32 reserved;
+	struct power_sensor_data_and_time proc;
+	struct power_sensor_data vdd;
+	struct power_sensor_data vdn;
+} __packed;
+
+struct caps_sensor_1 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+} __packed;
+
+struct caps_sensor_2 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+} __packed;
+
+struct caps_sensor_3 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 hard_min_powercap;
+	u16 soft_min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+} __packed;
+
+struct extended_sensor {
+	u8 name[4];
+	u8 flags;
+	u8 reserved;
+	u8 data[6];
+} __packed;
+
 void occ_parse_poll_response(struct occ *occ)
 {
 	unsigned int i, offset = 0, size = 0;
@@ -40,6 +146,8 @@ void occ_parse_poll_response(struct occ *occ)
 			sensor = &sensors->power;
 		else if (strncmp(block->header.eye_catcher, "CAPS", 4) == 0)
 			sensor = &sensors->caps;
+		else if (strncmp(block->header.eye_catcher, "EXTN", 4) == 0)
+			sensor = &sensors->extended;
 		else {
 			dev_warn(occ->bus_dev, "sensor not supported %.4s\n",
 				 block->header.eye_catcher);
@@ -47,6 +155,7 @@ void occ_parse_poll_response(struct occ *occ)
 		}
 
 		sensor->num_sensors = block->header.num_sensors;
+		sensor->version = block->header.sensor_format;
 		sensor->data = &block->data;
 	}
 }
@@ -73,8 +182,9 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	int rc;
 	u8 cmd[8];
 	u16 checksum = 0x24;
+	__be16 user_power_cap_be;
 
-	user_power_cap = cpu_to_be16(user_power_cap);
+	user_power_cap_be = cpu_to_be16(user_power_cap);
 
 	cmd[0] = 0;
 	cmd[1] = 0x22;
@@ -108,3 +218,883 @@ int occ_update_response(struct occ *occ)
 	mutex_unlock(&occ->lock);
 	return rc;
 }
+
+static ssize_t occ_show_status(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	int val;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_poll_response_header *header;
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+
+	switch (sattr->index) {
+	case 0:
+		val = header->status & OCC_STAT_ACTIVE;
+		break;
+	case 1:
+		val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
+		break;
+	case 2:
+		val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
+		break;
+	case 3:
+		val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
+		break;
+	case 4:
+		val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
+		break;
+	case 5:
+		val = header->occ_state;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t occ_show_temp_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct temp_sensor_1 *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct temp_sensor_1 *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&temp->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&temp->value) * 1000;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_temp_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct temp_sensor_2 *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct temp_sensor_2 *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&temp->sensor_id);
+		break;
+	case 1:
+		val = temp->value * 1000;
+		break;
+	case 2:
+		val = temp->fru_type;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_freq_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct freq_sensor_1 *freq;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	freq = ((struct freq_sensor_1 *)sensors->freq.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&freq->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&freq->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_freq_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct freq_sensor_2 *freq;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	freq = ((struct freq_sensor_2 *)sensors->freq.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&freq->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&freq->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_power_1(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct power_sensor_1 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_1 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be32(&power->update_tag);
+		break;
+	case 2:
+		val = get_unaligned_be32(&power->accumulator);
+		break;
+	case 3:
+		val = get_unaligned_be16(&power->value);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_power_2(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u64 val = 0;
+	struct power_sensor_2 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_2 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be32(&power->update_tag);
+		break;
+	case 2:
+		val = get_unaligned_be64(&power->accumulator);
+		break;
+	case 3:
+		val = get_unaligned_be16(&power->value);
+		break;
+	case 4:
+		val = power->function_id;
+		break;
+	case 5:
+		val = power->apss_channel;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+}
+
+static ssize_t occ_show_power_a0(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u64 val = 0;
+	struct power_sensor_a0 *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct power_sensor_a0 *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&power->sensor_id);
+		break;
+	case 1:
+		val = get_unaligned_be16(&power->system.update_time);
+		break;
+	case 2:
+		val = get_unaligned_be16(&power->system.value);
+		break;
+	case 3:
+		val = get_unaligned_be32(&power->system.update_tag);
+		break;
+	case 4:
+		val = get_unaligned_be64(&power->system.accumulator);
+		break;
+	case 5:
+		val = get_unaligned_be16(&power->proc.update_time);
+		break;
+	case 6:
+		val = get_unaligned_be16(&power->proc.value);
+		break;
+	case 7:
+		val = get_unaligned_be32(&power->proc.update_tag);
+		break;
+	case 8:
+		val = get_unaligned_be64(&power->proc.accumulator);
+		break;
+	case 9:
+		val = get_unaligned_be16(&power->vdd.value);
+		break;
+	case 10:
+		val = get_unaligned_be32(&power->vdd.update_tag);
+		break;
+	case 11:
+		val = get_unaligned_be64(&power->vdd.accumulator);
+		break;
+	case 12:
+		val = get_unaligned_be16(&power->vdn.value);
+		break;
+	case 13:
+		val = get_unaligned_be32(&power->vdn.update_tag);
+		break;
+	case 14:
+		val = get_unaligned_be64(&power->vdn.accumulator);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+}
+
+
+static ssize_t occ_show_caps_1(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_1 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_1 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_caps_2(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_2 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_2 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	case 6:
+		val = caps->user_powerlimit_source;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t occ_show_caps_3(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct caps_sensor_3 *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct caps_sensor_3 *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be16(&caps->curr_powercap);
+		break;
+	case 1:
+		val = get_unaligned_be16(&caps->curr_powerreading);
+		break;
+	case 2:
+		val = get_unaligned_be16(&caps->norm_powercap);
+		break;
+	case 3:
+		val = get_unaligned_be16(&caps->max_powercap);
+		break;
+	case 4:
+		val = get_unaligned_be16(&caps->hard_min_powercap);
+		break;
+	case 5:
+		val = get_unaligned_be16(&caps->user_powerlimit);
+		break;
+	case 6:
+		val = caps->user_powerlimit_source;
+		break;
+	case 7:
+		val = get_unaligned_be16(&caps->soft_min_powercap);
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+
+static ssize_t occ_store_caps_user(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	int rc;
+	u16 user_power_cap;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	rc = kstrtou16(buf, 0, &user_power_cap);
+	if (rc)
+		return rc;
+
+	rc = occ_set_user_power_cap(occ, user_power_cap);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+static ssize_t occ_show_extended(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	int rc;
+	struct extended_sensor *extn;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	extn = ((struct extended_sensor *)sensors->extended.data) +
+		sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x\n",
+			      extn->name[0], extn->name[1], extn->name[2],
+			      extn->name[3]);
+		break;
+	case 1:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x\n", extn->flags);
+		break;
+	case 2:
+		rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x%02x%02x\n",
+			      extn->data[0], extn->data[1], extn->data[2],
+			      extn->data[3], extn->data[4], extn->data[5]);
+		break;
+	}
+
+	return rc;
+}
+
+int occ_setup_sensor_attrs(struct occ *occ)
+{
+	unsigned int i, s;
+	struct device *dev = occ->bus_dev;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_attribute *attr;
+	ssize_t (*show_temp)(struct device *, struct device_attribute *,
+			     char *) = occ_show_temp_1;
+	ssize_t (*show_freq)(struct device *, struct device_attribute *,
+			     char *) = occ_show_freq_1;
+	ssize_t (*show_power)(struct device *, struct device_attribute *,
+			      char *) = occ_show_power_1;
+	ssize_t (*show_caps)(struct device *, struct device_attribute *,
+			     char *) = occ_show_caps_1;
+
+	occ->num_attrs = 0;
+
+	switch (sensors->temp.version) {
+	case 1:
+		occ->num_attrs += (sensors->temp.num_sensors * 2);
+		break;
+	case 2:
+		occ->num_attrs += (sensors->temp.num_sensors * 3);
+		show_temp = occ_show_temp_2;
+		break;
+	default:
+		sensors->temp.num_sensors = 0;
+	}
+
+	switch (sensors->freq.version) {
+	case 2:
+		show_freq = occ_show_freq_2;
+		/* fall through */
+	case 1:
+		occ->num_attrs += (sensors->freq.num_sensors * 2);
+		break;
+	default:
+		sensors->freq.num_sensors = 0;
+	}
+
+	switch (sensors->power.version) {
+	case 1:
+		occ->num_attrs += (sensors->power.num_sensors * 4);
+		break;
+	case 2:
+		occ->num_attrs += (sensors->power.num_sensors * 6);
+		show_power = occ_show_power_2;
+		break;
+	case 0xA0:
+		occ->num_attrs += (sensors->power.num_sensors * 15);
+		show_power = occ_show_power_a0;
+		break;
+	default:
+		sensors->power.num_sensors = 0;
+	}
+
+	switch (sensors->caps.version) {
+	case 1:
+		occ->num_attrs += (sensors->caps.num_sensors * 6);
+		break;
+	case 2:
+		occ->num_attrs += (sensors->caps.num_sensors * 7);
+		show_caps = occ_show_caps_2;
+		break;
+	case 3:
+		occ->num_attrs += (sensors->caps.num_sensors * 8);
+		show_caps = occ_show_caps_3;
+		break;
+	default:
+		sensors->caps.num_sensors = 0;
+	}
+
+	switch (sensors->extended.version) {
+	case 1:
+		occ->num_attrs += sensors->extended.num_sensors;
+		break;
+	default:
+		sensors->extended.num_sensors = 0;
+	}
+
+	occ->attrs = devm_kzalloc(dev, sizeof(*occ->attrs) * occ->num_attrs,
+				  GFP_KERNEL);
+	if (!occ->attrs)
+		return -ENOMEM;
+
+	occ->group.attrs = devm_kzalloc(dev, sizeof(*occ->group.attrs) *
+					occ->num_attrs + 1, GFP_KERNEL);
+	if (!occ->group.attrs)
+		return -ENOMEM;
+
+	attr = occ->attrs;
+
+	for (i = 0; i < sensors->temp.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
+					     1, i);
+		attr++;
+
+		if (sensors->temp.version > 1) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "temp%d_fru_type", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_temp, NULL, 2, i);
+			attr++;
+		}
+	}
+
+	for (i = 0; i < sensors->freq.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
+					     1, i);
+		attr++;
+	}
+
+	if (sensors->power.version == 0xA0) {
+		for (i = 0; i < sensors->power.num_sensors; ++i) {
+			s = i + 1;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 0, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_system_update_time", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 1, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_system_value", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 2, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_system_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 3, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_system_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 4, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_proc_update_time", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 5, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_proc_value", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 6, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_proc_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 7, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_proc_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 8, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdd_value", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 9, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdd_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 10, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdd_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 11, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdn_value", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 12, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdn_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 13, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_vdn_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 14, i);
+			attr++;
+		}
+	} else {
+		for (i = 0; i < sensors->power.num_sensors; ++i) {
+			s = i + 1;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 0, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_tag", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 1, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_accumulator", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 2, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 3, i);
+			attr++;
+
+			if (sensors->power.version > 1) {
+				snprintf(attr->name, sizeof(attr->name),
+					 "power%d_function_id", s);
+		 		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_power, NULL,
+							     4, i);
+				attr++;
+
+				snprintf(attr->name, sizeof(attr->name),
+					 "power%d_apss_channel", s);
+				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_power, NULL,
+							     5, i);
+				attr++;
+			}
+		}
+	}
+
+	for (i = 0; i < sensors->caps.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_current", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_reading", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_norm", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     2, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_max", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
+					     3, i);
+		attr++;
+
+		if (sensors->caps.version > 2) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_min_hard", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 4, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_min_soft", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 7, i);
+			attr++;
+		} else {
+			snprintf(attr->name, sizeof(attr->name), "caps%d_min",
+				 s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 4, i);
+			attr++;
+		}
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_user", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0644, show_caps,
+					     occ_store_caps_user, 5, i);
+		attr++;
+
+		if (sensors->caps.version > 1) {
+			snprintf(attr->name, sizeof(attr->name),
+				 "caps%d_user_source", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_caps, NULL, 6, i);
+			attr++;
+		}
+	}
+
+	for (i = 0; i < sensors->extended.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_flags", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "extn%d_value", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     occ_show_extended, NULL, 2, i);
+		attr++;
+	}
+
+	/* put the sensors in the group */
+	for (i = 0; i < occ->num_attrs; ++i)
+		occ->group.attrs[i] = &occ->attrs[i].sensor.dev_attr.attr;
+
+	return 0;
+}
+
+int occ_create_status_attrs(struct occ *occ)
+{
+	int rc, i;
+	struct device *dev = occ->bus_dev;
+
+	occ->status_attrs = devm_kzalloc(dev, sizeof(*occ->status_attrs) *
+					 OCC_NUM_STATUS_ATTRS, GFP_KERNEL);
+	if (!occ->status_attrs)
+		return -ENOMEM;
+
+	occ->status_attrs[0] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
+							    occ_show_status,
+							    NULL, 0);
+	occ->status_attrs[1] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_ot, 0444,
+							    occ_show_status,
+							    NULL, 1);
+	occ->status_attrs[2] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_power,
+							    0444,
+							    occ_show_status,
+							    NULL, 2);
+	occ->status_attrs[3] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_mem_throttle,
+							    0444,
+							    occ_show_status,
+							    NULL, 3);
+	occ->status_attrs[4] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_quick_drop,
+							    0444,
+							    occ_show_status,
+							    NULL, 4);
+	occ->status_attrs[5] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
+							    occ_show_status,
+							    NULL, 5);
+
+	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
+		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
+		if (rc)
+			dev_warn(dev, "error %d creating status attr %d\n", rc,
+				 i);
+	}
+
+	return 0;
+}
+
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index a3d733a..78da64f 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -63,6 +63,7 @@ struct occ_poll_response {
 
 struct occ_sensor {
 	u8 num_sensors;
+	u8 version;
 	void *data;
 };
 
@@ -71,6 +72,7 @@ struct occ_sensors {
 	struct occ_sensor freq;
 	struct occ_sensor power;
 	struct occ_sensor caps;
+	struct occ_sensor extended;
 };
 
 struct occ_attribute {
@@ -92,6 +94,7 @@ struct occ {
 	struct occ_attribute *attrs;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+	struct sensor_device_attribute *status_attrs;
 
 	u8 poll_cmd_data;
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
@@ -120,5 +123,7 @@ struct occ {
 int occ_poll(struct occ *occ);
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
 int occ_update_response(struct occ *occ);
+int occ_setup_sensor_attrs(struct occ *occ);
+int occ_create_status_attrs(struct occ *occ);
 
 #endif /* __OCC_COMMON_H__ */
diff --git a/drivers/hwmon/occ/p9.c b/drivers/hwmon/occ/p9.c
deleted file mode 100644
index 832d6ff..0000000
--- a/drivers/hwmon/occ/p9.c
+++ /dev/null
@@ -1,350 +0,0 @@
-/*
- * Copyright 2017 IBM Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <asm/unaligned.h>
-#include "common.h"
-
-struct p9_temp_sensor {
-	u32 sensor_id;
-	u8 fru_type;
-	u8 value;
-} __packed;
-
-struct p9_freq_sensor {
-	u32 sensor_id;
-	u16 value;
-} __packed;
-
-struct p9_power_sensor {
-	u32 sensor_id;
-	u8 function_id;
-	u8 apss_channel;
-	u16 reserved;
-	u32 update_tag;
-	u64 accumulator;
-	u16 value;
-} __packed;
-
-struct p9_caps_sensor {
-	u16 curr_powercap;
-	u16 curr_powerreading;
-	u16 norm_powercap;
-	u16 max_powercap;
-	u16 min_powercap;
-	u16 user_powerlimit;
-	u8 user_powerlimit_source;
-} __packed;
-
-static ssize_t p9_occ_show_temp(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
-{
-	int rc;
-	u32 val = 0;
-	struct p9_temp_sensor *temp;
-	struct occ *occ = dev_get_drvdata(dev);
-	struct occ_sensors *sensors = &occ->sensors;
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-
-	rc = occ_update_response(occ);
-	if (rc)
-		return rc;
-
-	temp = ((struct p9_temp_sensor *)sensors->temp.data) + sattr->index;
-
-	switch (sattr->nr) {
-	case 0:
-		val = be32_to_cpu(get_unaligned(&temp->sensor_id));
-		break;
-	case 1:
-		val = temp->fru_type;
-		break;
-	case 2:
-		/* millidegree */
-		val = temp->value * 1000;
-		break;
-	}
-
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
-}
-
-static ssize_t p9_occ_show_freq(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
-{
-	int rc;
-	u32 val = 0;
-	struct p9_freq_sensor *freq;
-	struct occ *occ = dev_get_drvdata(dev);
-	struct occ_sensors *sensors = &occ->sensors;
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-
-	rc = occ_update_response(occ);
-	if (rc)
-		return rc;
-
-	freq = ((struct p9_freq_sensor *)sensors->freq.data) + sattr->index;
-
-	switch (sattr->nr) {
-	case 0:
-		val = be32_to_cpu(get_unaligned(&freq->sensor_id));
-		break;
-	case 1:
-		val = be16_to_cpu(get_unaligned(&freq->value));
-		break;
-	}
-
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
-}
-
-static ssize_t p9_occ_show_power(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	int rc;
-	u64 val = 0;
-	struct p9_power_sensor *power;
-	struct occ *occ = dev_get_drvdata(dev);
-	struct occ_sensors *sensors = &occ->sensors;
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-
-	rc = occ_update_response(occ);
-	if (rc)
-		return rc;
-
-	power = ((struct p9_power_sensor *)sensors->power.data) + sattr->index;
-
-	switch (sattr->nr) {
-	case 0:
-		val = be32_to_cpu(get_unaligned(&power->sensor_id));
-		break;
-	case 1:
-		val = power->function_id;
-		break;
-	case 2:
-		val = power->apss_channel;
-		break;
-	case 3:
-		val = be32_to_cpu(get_unaligned(&power->update_tag));
-		break;
-	case 4:
-		val = be64_to_cpu(get_unaligned(&power->accumulator));
-		break;
-	case 5:
-		val = be16_to_cpu(get_unaligned(&power->value));
-		break;
-	}
-
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
-}
-
-static ssize_t p9_occ_show_caps(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
-{
-	int rc;
-	u16 val = 0;
-	struct p9_caps_sensor *caps;
-	struct occ *occ = dev_get_drvdata(dev);
-	struct occ_sensors *sensors = &occ->sensors;
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-
-	rc = occ_update_response(occ);
-	if (rc)
-		return rc;
-
-	caps = ((struct p9_caps_sensor *)sensors->caps.data) + sattr->index;
-
-	switch (sattr->nr) {
-	case 0:
-		val = be16_to_cpu(get_unaligned(&caps->curr_powercap));
-		break;
-	case 1:
-		val = be16_to_cpu(get_unaligned(&caps->curr_powerreading));
-		break;
-	case 2:
-		val = be16_to_cpu(get_unaligned(&caps->norm_powercap));
-		break;
-	case 3:
-		val = be16_to_cpu(get_unaligned(&caps->max_powercap));
-		break;
-	case 4:
-		val = be16_to_cpu(get_unaligned(&caps->min_powercap));
-		break;
-	case 5:
-		val = be16_to_cpu(get_unaligned(&caps->user_powerlimit));
-		break;
-	case 6:
-		val = caps->user_powerlimit_source;
-		break;
-	}
-
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
-}
-
-static ssize_t p9_occ_store_caps_user(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t count)
-{
-	int rc;
-	u16 user_power_cap;
-	struct occ *occ = dev_get_drvdata(dev);
-
-	rc = kstrtou16(buf, 0, &user_power_cap);
-	if (rc)
-		return rc;
-
-	rc = occ_set_user_power_cap(occ, user_power_cap);
-	if (rc)
-		return rc;
-
-	return count;
-}
-
-int p9_occ_setup_sensor_attrs(struct occ *occ)
-{
-	unsigned int i, s;
-	struct device *dev = occ->bus_dev;
-	struct occ_sensors *sensors = &occ->sensors;
-	struct occ_attribute *attr;
-
-	occ->num_attrs = (sensors->temp.num_sensors * 3);
-	occ->num_attrs += (sensors->freq.num_sensors * 2);
-	occ->num_attrs += (sensors->power.num_sensors * 6);
-	occ->num_attrs += (sensors->caps.num_sensors * 7);
-
-	occ->attrs = devm_kzalloc(dev, sizeof(*occ->attrs) * occ->num_attrs,
-				  GFP_KERNEL);
-	if (!occ->attrs)
-		return -ENOMEM;
-
-	occ->group.attrs = devm_kzalloc(dev, sizeof(*occ->group.attrs) *
-					occ->num_attrs + 1, GFP_KERNEL);
-	if (!occ->group.attrs)
-		return -ENOMEM;
-
-	attr = occ->attrs;
-	for (i = 0; i < sensors->temp.num_sensors; ++i) {
-		s = i + 1;
-
-		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_temp, NULL, 0, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "temp%d_fru_type", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_temp, NULL, 1, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_temp, NULL, 2, i);
-		attr++;
-	}
-
-	for (i = 0; i < sensors->freq.num_sensors; ++i) {
-		s = i + 1;
-
-		snprintf(attr->name, sizeof(attr->name), "freq%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_freq, NULL, 0, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "freq%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_freq, NULL, 1, i);
-		attr++;
-	}
-
-	for (i = 0; i < sensors->power.num_sensors; ++i) {
-		s = i + 1;
-
-		snprintf(attr->name, sizeof(attr->name), "power%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 0, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "power%d_function_id",
-			 s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 1, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name),
-			 "power%d_apss_channel", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 2, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "power%d_update_tag",
-			 s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 3, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "power%d_accumulator",
-			 s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 4, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "power%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_power, NULL, 5, i);
-		attr++;
-	}
-
-	for (i = 0; i < sensors->caps.num_sensors; ++i) {
-		s = i + 1;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_curr", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 0, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_reading", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 1, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_norm", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 2, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_max", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 3, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_min", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 4, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_user", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0644,
-					     p9_occ_show_caps,
-					     p9_occ_store_caps_user, 5, i);
-		attr++;
-
-		snprintf(attr->name, sizeof(attr->name), "caps%d_user_source",
-			 s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     p9_occ_show_caps, NULL, 6, i);
-		attr++;
-	}
-
-	/* put the sensors in the group */
-	for (i = 0; i < occ->num_attrs; ++i)
-		occ->group.attrs[i] = &occ->attrs[i].sensor.dev_attr.attr;
-
-	return 0;
-}
diff --git a/drivers/hwmon/occ/p9.h b/drivers/hwmon/occ/p9.h
deleted file mode 100644
index 12d1bc5..0000000
--- a/drivers/hwmon/occ/p9.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * Copyright 2017 IBM Corp.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#ifndef __OCC_P9_H__
-#define __OCC_P9_H__
-
-struct occ;
-
-int p9_occ_setup_sensor_attrs(struct occ *occ);
-
-#endif /* __OCC_P9_H__ */
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 88f71b1..bf1c52b 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -15,9 +15,8 @@
 #include <linux/occ.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
-#include "p9.h"
 
-#define P9_SBE_OCC_SETUP_DELAY		2500
+#define P9_SBE_OCC_SETUP_DELAY		5000
 
 #define OCC_TIMEOUT_MS			5000
 #define OCC_CMD_IN_PRG_MS		100
@@ -66,7 +65,8 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 	switch (resp->return_status) {
 	case RESP_RETURN_CMD_IN_PRG:
-		if (time_after(jiffies, start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
+		if (time_after(jiffies,
+			       start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
 			rc = -EALREADY;
 		else {
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -123,7 +123,7 @@ static void p9_sbe_occ_setup(struct work_struct *work)
 
 	occ_parse_poll_response(occ);
 
-	rc = p9_occ_setup_sensor_attrs(occ);
+	rc = occ_setup_sensor_attrs(occ);
 	if (rc) {
 		dev_err(occ->bus_dev, "failed to setup p9 attrs: %d\n", rc);
 		return;
@@ -137,6 +137,10 @@ static void p9_sbe_occ_setup(struct work_struct *work)
 			PTR_ERR(occ->hwmon));
 		return;
 	}
+
+	rc = occ_create_status_attrs(occ);
+	if (rc)
+		dev_err(occ->bus_dev, "failed to setup p9 status attrs: %d\n", rc);
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
@@ -157,7 +161,8 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	occ->send_cmd = p9_sbe_occ_send_cmd;
 	mutex_init(&occ->lock);
 	INIT_DELAYED_WORK(&p9_sbe_occ->setup, p9_sbe_occ_setup);
-	platform_set_drvdata(pdev, p9_sbe_occ);
+
+	platform_set_drvdata(pdev, occ);
 
 	schedule_delayed_work(&p9_sbe_occ->setup,
 			      msecs_to_jiffies(P9_SBE_OCC_SETUP_DELAY));
@@ -167,7 +172,8 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
-	struct p9_sbe_occ *p9_sbe_occ = platform_get_drvdata(pdev);
+	struct occ *occ = platform_get_drvdata(pdev);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
 
 	cancel_delayed_work_sync(&p9_sbe_occ->setup);
 
-- 
1.8.3.1
