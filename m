Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycf64H6zDsRL
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wdiO058379
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:40 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c2bx8g1gh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:40 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:39 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:37 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710waMJ22741144; Tue, 1 Aug 2017 00:58:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB514AC040;
 Mon, 31 Jul 2017 20:58:50 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 860E1AC03F;
 Mon, 31 Jul 2017 20:58:50 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 03/10] drivers/hwmon/occ: Parse OCC poll
 response
Date: Mon, 31 Jul 2017 19:58:20 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0036-0000-0000-00000251A4A8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0037-0000-0000-00004149272A
Message-Id: <1501549107-22323-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:43 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add method to parse the response from the OCC poll command. This only
needs to be done during probe(), since the OCC shouldn't change the
number or format of sensors while it's running. The parsed response
allows quick access to sensor data, as well as information on the
number and version of sensors, which we need to instantiate hwmon
attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 92f06ae..c55aec0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/kernel.h>
 
 #include "common.h"
 
@@ -29,6 +30,53 @@ static int occ_poll(struct occ *occ)
 	return occ->send_cmd(occ, cmd);
 }
 
+/* only need to do this once at startup, as OCC won't change sensors on us */
+static void occ_parse_poll_response(struct occ *occ)
+{
+	unsigned int i, offset = 0, size = 0;
+	struct occ_sensor *sensor;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_response *resp = &occ->resp;
+	struct occ_poll_response *poll =
+		(struct occ_poll_response *)&resp->data[0];
+	struct occ_poll_response_header *header = &poll->header;
+	struct occ_sensor_data_block *block = &poll->block;
+
+	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
+		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		offset = (block->header.num_sensors *
+			  block->header.sensor_length) + sizeof(block->header);
+		size += offset;
+
+		/* validate all the length/size fields */
+		if ((size + sizeof(*header)) >= OCC_RESP_DATA_BYTES) {
+			dev_warn(occ->bus_dev, "exceeded response buffer\n");
+			return;
+		}
+
+		/* match sensor block type */
+		if (strncmp(block->header.eye_catcher, "TEMP", 4) == 0)
+			sensor = &sensors->temp;
+		else if (strncmp(block->header.eye_catcher, "FREQ", 4) == 0)
+			sensor = &sensors->freq;
+		else if (strncmp(block->header.eye_catcher, "POWR", 4) == 0)
+			sensor = &sensors->power;
+		else if (strncmp(block->header.eye_catcher, "CAPS", 4) == 0)
+			sensor = &sensors->caps;
+		else if (strncmp(block->header.eye_catcher, "EXTN", 4) == 0)
+			sensor = &sensors->extended;
+		else {
+			dev_warn(occ->bus_dev, "sensor not supported %.4s\n",
+				 block->header.eye_catcher);
+			continue;
+		}
+
+		sensor->num_sensors = block->header.num_sensors;
+		sensor->version = block->header.sensor_format;
+		sensor->data = &block->data;
+	}
+}
+
 int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
@@ -40,5 +88,7 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	occ_parse_poll_response(occ);
+
 	return 0;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 705dfe3..f52d45a 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -26,10 +26,64 @@ struct occ_response {
 	__be16 checksum;
 } __packed;
 
+struct occ_sensor_data_block_header {
+	u8 eye_catcher[4];
+	u8 reserved;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 num_sensors;
+} __packed;
+
+struct occ_sensor_data_block {
+	struct occ_sensor_data_block_header header;
+	u32 data;
+} __packed;
+
+struct occ_poll_response_header {
+	u8 status;
+	u8 ext_status;
+	u8 occs_present;
+	u8 config_data;
+	u8 occ_state;
+	u8 mode;
+	u8 ips_status;
+	u8 error_log_id;
+	__be32 error_log_start_address;
+	__be16 error_log_length;
+	u16 reserved;
+	u8 occ_code_level[16];
+	u8 eye_catcher[6];
+	u8 num_sensor_data_blocks;
+	u8 sensor_data_block_header_version;
+} __packed;
+
+struct occ_poll_response {
+	struct occ_poll_response_header header;
+	struct occ_sensor_data_block block;
+} __packed;
+
+struct occ_sensor {
+	u8 num_sensors;
+	u8 version;
+	void *data;	/* pointer to sensor data start within response */
+};
+
+/* OCC only provides one sensor data block of each type, but any number of
+ * sensors within that block.
+ */
+struct occ_sensors {
+	struct occ_sensor temp;
+	struct occ_sensor freq;
+	struct occ_sensor power;
+	struct occ_sensor caps;
+	struct occ_sensor extended;
+};
+
 struct occ {
 	struct device *bus_dev;
 
 	struct occ_response resp;
+	struct occ_sensors sensors;
 
 	u8 poll_cmd_data;		/* to perform OCC poll command */
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
-- 
1.8.3.1
