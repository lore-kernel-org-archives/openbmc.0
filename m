Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZcj4hPFzF0Zc
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:47:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BIjeEc105314
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:31 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fecmt2c3u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:31 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 13:47:30 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 13:47:27 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BIlQBo46923846; Thu, 11 Jan 2018 18:47:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C212112034;
 Thu, 11 Jan 2018 13:45:37 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id CFA74112051;
 Thu, 11 Jan 2018 13:45:36 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH linux dev-4.10 4/5] hwmon: (pmbus) cffps: Add debugfs entries
Date: Thu, 11 Jan 2018 12:47:16 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011118-0040-0000-0000-000003E01DC7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973566; UDB=6.00493310; IPR=6.00753511; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 18:47:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011118-0041-0000-0000-000007D578EB
Message-Id: <1515696437-10508-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110255
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
X-List-Received-Date: Thu, 11 Jan 2018 18:47:34 -0000

Add debugfs entries for additional power supply data, including part
number, serial number, FRU number, firmware revision, ccin, and the
input history of the power supply. The input history is 10 minutes of
input power data in the form of twenty 30-second packets. Each packet
contains average and maximum power for that 30 second period.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
[groeck: Fixed endianness problem]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 202 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 3269617..503f4c5 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -7,14 +7,28 @@
  * (at your option) any later version.
  */
 
+#include <linux/bitops.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/i2c/pmbus.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include "pmbus.h"
 
+#define CFFPS_FRU_CMD				0x9A
+#define CFFPS_PN_CMD				0x9B
+#define CFFPS_SN_CMD				0x9E
+#define CFFPS_CCIN_CMD				0xBD
+#define CFFPS_FW_CMD_START			0xFA
+#define CFFPS_FW_NUM_BYTES			4
+
+#define CFFPS_INPUT_HISTORY_CMD			0xD6
+#define CFFPS_INPUT_HISTORY_SIZE		100
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -25,6 +39,144 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+enum {
+	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
+	CFFPS_DEBUGFS_FRU,
+	CFFPS_DEBUGFS_PN,
+	CFFPS_DEBUGFS_SN,
+	CFFPS_DEBUGFS_CCIN,
+	CFFPS_DEBUGFS_FW,
+	CFFPS_DEBUGFS_NUM_ENTRIES
+};
+
+struct ibm_cffps_input_history {
+	struct mutex update_lock;
+	unsigned long last_update;
+
+	u8 byte_count;
+	u8 data[CFFPS_INPUT_HISTORY_SIZE];
+};
+
+struct ibm_cffps {
+	struct i2c_client *client;
+
+	struct ibm_cffps_input_history input_history;
+
+	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
+};
+
+#define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
+
+static ssize_t ibm_cffps_read_input_history(struct ibm_cffps *psu,
+					    char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	int rc;
+	u8 msgbuf0[1] = { CFFPS_INPUT_HISTORY_CMD };
+	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] = { 0 };
+	struct i2c_msg msg[2] = {
+		{
+			.addr = psu->client->addr,
+			.flags = psu->client->flags,
+			.len = 1,
+			.buf = msgbuf0,
+		}, {
+			.addr = psu->client->addr,
+			.flags = psu->client->flags | I2C_M_RD,
+			.len = CFFPS_INPUT_HISTORY_SIZE + 1,
+			.buf = msgbuf1,
+		},
+	};
+
+	if (!*ppos) {
+		mutex_lock(&psu->input_history.update_lock);
+		if (time_after(jiffies, psu->input_history.last_update + HZ)) {
+			/*
+			 * Use a raw i2c transfer, since we need more bytes
+			 * than Linux I2C supports through smbus xfr (only 32).
+			 */
+			rc = i2c_transfer(psu->client->adapter, msg, 2);
+			if (rc < 0) {
+				mutex_unlock(&psu->input_history.update_lock);
+				return rc;
+			}
+
+			psu->input_history.byte_count = msgbuf1[0];
+			memcpy(psu->input_history.data, &msgbuf1[1],
+			       CFFPS_INPUT_HISTORY_SIZE);
+			psu->input_history.last_update = jiffies;
+		}
+
+		mutex_unlock(&psu->input_history.update_lock);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos,
+				       psu->input_history.data,
+				       psu->input_history.byte_count);
+}
+
+static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	u8 cmd;
+	int i, rc;
+	int *idxp = file->private_data;
+	int idx = *idxp;
+	struct ibm_cffps *psu = to_psu(idxp, idx);
+	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
+
+	switch (idx) {
+	case CFFPS_DEBUGFS_INPUT_HISTORY:
+		return ibm_cffps_read_input_history(psu, buf, count, ppos);
+	case CFFPS_DEBUGFS_FRU:
+		cmd = CFFPS_FRU_CMD;
+		break;
+	case CFFPS_DEBUGFS_PN:
+		cmd = CFFPS_PN_CMD;
+		break;
+	case CFFPS_DEBUGFS_SN:
+		cmd = CFFPS_SN_CMD;
+		break;
+	case CFFPS_DEBUGFS_CCIN:
+		rc = i2c_smbus_read_word_swapped(psu->client, CFFPS_CCIN_CMD);
+		if (rc < 0)
+			return rc;
+
+		rc = snprintf(data, 5, "%04X", rc);
+		goto done;
+	case CFFPS_DEBUGFS_FW:
+		for (i = 0; i < CFFPS_FW_NUM_BYTES; ++i) {
+			rc = i2c_smbus_read_byte_data(psu->client,
+						      CFFPS_FW_CMD_START + i);
+			if (rc < 0)
+				return rc;
+
+			snprintf(&data[i * 2], 3, "%02X", rc);
+		}
+
+		rc = i * 2;
+		goto done;
+	default:
+		return -EINVAL;
+	}
+
+	rc = i2c_smbus_read_block_data(psu->client, cmd, data);
+	if (rc < 0)
+		return rc;
+
+done:
+	data[rc] = '\n';
+	rc += 2;
+
+	return simple_read_from_buffer(buf, count, ppos, data, rc);
+}
+
+static const struct file_operations ibm_cffps_fops = {
+	.llseek = noop_llseek,
+	.read = ibm_cffps_debugfs_op,
+	.open = simple_open,
+};
+
 static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
 				    int reg)
 {
@@ -124,8 +276,56 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
+	int i, rc;
+	struct dentry *debugfs;
+	struct dentry *ibm_cffps_dir;
+	struct ibm_cffps *psu;
+
 	client->dev.platform_data = &ibm_cffps_pdata;
-	return pmbus_do_probe(client, id, &ibm_cffps_info);
+	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
+	if (rc)
+		return rc;
+
+	/* Don't fail the probe if we can't create debugfs */
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
+
+	ibm_cffps_dir = debugfs_create_dir(client->name, debugfs);
+	if (!ibm_cffps_dir)
+		return 0;
+
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu->client = client;
+	mutex_init(&psu->input_history.update_lock);
+	psu->input_history.last_update = jiffies - HZ;
+
+	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
+		psu->debugfs_entries[i] = i;
+
+	debugfs_create_file("input_history", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_INPUT_HISTORY],
+			    &ibm_cffps_fops);
+	debugfs_create_file("fru", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_FRU],
+			    &ibm_cffps_fops);
+	debugfs_create_file("part_number", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_PN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("serial_number", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_SN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("ccin", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_CCIN],
+			    &ibm_cffps_fops);
+	debugfs_create_file("fw_version", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_FW],
+			    &ibm_cffps_fops);
+
+	return 0;
 }
 
 static const struct i2c_device_id ibm_cffps_id[] = {
-- 
1.8.3.1
