Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wZD8q0YrQzDqVP
 for <openbmc@lists.ozlabs.org>; Sat, 27 May 2017 03:46:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4QHhs01042838
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2apkxxdk5u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:44 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 May 2017 13:46:43 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 May 2017 13:46:41 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4QHkeKI54329550; Fri, 26 May 2017 17:46:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B9B112051;
 Fri, 26 May 2017 13:46:42 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 552C3112034;
 Fri, 26 May 2017 13:46:42 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/3] drivers: hwmon: OCC: Add common
 functionality and SBE access
Date: Fri, 26 May 2017 12:46:32 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17052617-0040-0000-0000-0000034B64A7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007122; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865931; UDB=6.00430071; IPR=6.00645792; 
 BA=6.00005375; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015597; XFM=3.00000015;
 UTC=2017-05-26 17:46:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052617-0041-0000-0000-0000073F9BA1
Message-Id: <1495820793-24205-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705260316
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
X-List-Received-Date: Fri, 26 May 2017 17:46:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add functions common to all POWER processors and bus transfer methods.
Add the main function to actually fetch the OCC poll response via SBE.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 97 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/common.h | 10 +++++
 drivers/hwmon/occ/p9_sbe.c | 82 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index a2fb57b..1f17def 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -9,7 +9,102 @@
 
 #include "common.h"
 
+void occ_parse_poll_response(struct occ *occ)
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
+		if (strncmp(block->header.eye_catcher, "TEMP", 4) == 0)
+			sensor = &sensors->temp;
+		else if (strncmp(block->header.eye_catcher, "FREQ", 4) == 0)
+			sensor = &sensors->freq;
+		else if (strncmp(block->header.eye_catcher, "POWR", 4) == 0)
+			sensor = &sensors->power;
+		else if (strncmp(block->header.eye_catcher, "CAPS", 4) == 0)
+			sensor = &sensors->caps;
+		else {
+			dev_warn(occ->bus_dev, "sensor not supported %.4s\n",
+				 block->header.eye_catcher);
+			continue;
+		}
+
+		sensor->num_sensors = block->header.num_sensors;
+		sensor->data = &block->data;
+	}
+}
+
 int occ_poll(struct occ *occ)
 {
-	return 0;
+	u16 checksum = occ->poll_cmd_data + 1;
+	u8 cmd[8];
+
+	cmd[0] = 0;
+	cmd[1] = 0;
+	cmd[2] = 0;
+	cmd[3] = 1;
+	cmd[4] = occ->poll_cmd_data;
+	cmd[5] = checksum >> 8;
+	cmd[6] = checksum & 0xFF;
+	cmd[7] = 0;
+
+	return occ->send_cmd(occ, cmd);
+}
+
+int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
+{
+	int rc;
+	u8 cmd[8];
+	u16 checksum = 0x24;
+
+	user_power_cap = cpu_to_be16(user_power_cap);
+
+	cmd[0] = 0;
+	cmd[1] = 0x22;
+	cmd[2] = 0;
+	cmd[3] = 2;
+
+	memcpy(&cmd[4], &user_power_cap, 2);
+
+	checksum += cmd[4] + cmd[5];
+	cmd[6] = checksum >> 8;
+	cmd[7] = checksum & 0xFF;
+
+	mutex_lock(&occ->lock);
+	rc = occ->send_cmd(occ, cmd);
+	mutex_unlock(&occ->lock);
+
+	return rc;
+}
+
+int occ_update_response(struct occ *occ)
+{
+	int rc = 0;
+
+	mutex_lock(&occ->lock);
+
+	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
+		rc = occ_poll(occ);
+		occ->last_update = jiffies;
+	}
+
+	mutex_unlock(&occ->lock);
+	return rc;
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dcb1218..8d07878 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,6 +13,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
+#define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_RESP_DATA_BYTES		4089
 
 struct occ_response {
@@ -75,10 +76,19 @@ struct occ_sensors {
 struct occ {
 	struct device *bus_dev;
 
+	unsigned long last_update;
+	struct mutex lock;
+
 	struct occ_response resp;
 	struct occ_sensors sensors;
+
+	u8 poll_cmd_data;
+	int (*send_cmd)(struct occ *occ, u8 *cmd);
 };
 
+void occ_parse_poll_response(struct occ *occ);
 int occ_poll(struct occ *occ);
+int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
+int occ_update_response(struct occ *occ);
 
 #endif /* __OCC_COMMON_H__ */
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 83eaec3..889594c 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -16,6 +16,18 @@
 #include <linux/sched.h>
 #include <linux/workqueue.h>
 
+#define OCC_TIMEOUT_MS			5000
+#define OCC_CMD_IN_PRG_MS		100
+
+#define RESP_RETURN_CMD_IN_PRG		0xFF
+#define RESP_RETURN_SUCCESS		0
+#define RESP_RETURN_CMD_INVAL		0x11
+#define RESP_RETURN_CMD_LEN		0x12
+#define RESP_RETURN_DATA_INVAL		0x13
+#define RESP_RETURN_CHKSUM		0x14
+#define RESP_RETURN_OCC_ERR		0x15
+#define RESP_RETURN_STATE		0x16
+
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
@@ -23,6 +35,72 @@ struct p9_sbe_occ {
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
+static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
+{
+	int rc;
+	unsigned long start;
+	struct occ_client *client;
+	struct occ_response *resp = &occ->resp;
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	start = jiffies;
+
+retry:
+	client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	if (!client)
+		return -ENODEV;
+
+	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
+	if (rc < 0)
+		goto err;
+
+	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+	if (rc < 0)
+		goto err;
+
+	occ_drv_release(client);
+
+	switch (resp->return_status) {
+	case RESP_RETURN_CMD_IN_PRG:
+		if (time_after(jiffies, start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
+			rc = -EALREADY;
+		else {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
+
+			goto retry;
+		}
+		break;
+	case RESP_RETURN_SUCCESS:
+		rc = 0;
+		break;
+	case RESP_RETURN_CMD_INVAL:
+	case RESP_RETURN_CMD_LEN:
+	case RESP_RETURN_DATA_INVAL:
+	case RESP_RETURN_CHKSUM:
+		rc = -EINVAL;
+		break;
+	case RESP_RETURN_OCC_ERR:
+		rc = -EREMOTE;
+		break;
+	default:
+		rc = -EFAULT;
+	}
+
+	if (rc < 0) {
+		dev_warn(occ->bus_dev, "occ bad response:%d\n",
+			 resp->return_status);
+		return rc;
+	}
+
+	return 0;
+
+err:
+	occ_drv_release(client);
+	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
+	return rc;
+}
+
 static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	struct occ *occ;
@@ -36,6 +114,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 
 	occ = &p9_sbe_occ->occ;
 	occ->bus_dev = &pdev->dev;
+	occ->poll_cmd_data = 0x20;
+	occ->send_cmd = p9_sbe_occ_send_cmd;
+	mutex_init(&occ->lock);
+	platform_set_drvdata(pdev, p9_sbe_occ);
 
 	return 0;
 }
-- 
1.8.3.1
