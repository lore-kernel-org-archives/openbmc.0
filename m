Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yScsl0tNTzDqlM
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 07:59:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA2KxasF035771
 for <openbmc@lists.ozlabs.org>; Thu, 2 Nov 2017 16:59:53 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e06d6x14y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Nov 2017 16:59:52 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Nov 2017 16:59:51 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Nov 2017 16:59:48 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vA2KxlrN50004150; Thu, 2 Nov 2017 20:59:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 242FAAC04A;
 Thu,  2 Nov 2017 17:00:35 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id BF4BAAC040;
 Thu,  2 Nov 2017 17:00:34 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/2] hwmon: (pmbus): cffps: Add input_history
 debugfs file
Date: Thu,  2 Nov 2017 15:59:41 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17110220-0052-0000-0000-0000027BDE49
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008000; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00940228; UDB=6.00474102; IPR=6.00720484; 
 BA=6.00005668; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017838; XFM=3.00000015;
 UTC=2017-11-02 20:59:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17110220-0053-0000-0000-000052826FC3
Message-Id: <1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-02_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1711020257
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
X-List-Received-Date: Thu, 02 Nov 2017 20:59:55 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Provide binary data of the powers supply input history to debugfs.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 97 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 1a6294c..0570c12 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -7,13 +7,19 @@
  * (at your option) any later version.
  */
 
+#include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include "pmbus.h"
 
+#define CFFPS_INPUT_HISTORY_CMD			0xD6
+#define CFFPS_INPUT_HISTORY_SIZE		100
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -24,6 +30,70 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+struct ibm_cffps {
+	struct i2c_client *client;
+
+	struct mutex update_lock;
+	unsigned long last_updated;
+
+	u8 byte_count;
+	u8 input_history[CFFPS_INPUT_HISTORY_SIZE];
+};
+
+static ssize_t ibm_cffps_read_input_history(struct file *file,
+					    char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	int rc;
+	struct ibm_cffps *psu = file->private_data;
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
+		mutex_lock(&psu->update_lock);
+		if (time_after(jiffies, psu->last_updated + HZ)) {
+			/*
+			 * Use a raw i2c transfer, since we need more bytes
+			 * than Linux I2C supports through smbus xfr (only 32).
+			 */
+			rc = i2c_transfer(psu->client->adapter, msg, 2);
+			if (rc < 0) {
+				mutex_unlock(&psu->update_lock);
+				return rc;
+			}
+
+			psu->byte_count = msgbuf1[0];
+			memcpy(psu->input_history, &msgbuf1[1],
+			       CFFPS_INPUT_HISTORY_SIZE);
+			psu->last_updated = jiffies;
+		}
+
+		mutex_unlock(&psu->update_lock);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, psu->input_history,
+				       psu->byte_count);
+}
+
+static const struct file_operations ibm_cffps_fops = {
+	.llseek = noop_llseek,
+	.read = ibm_cffps_read_input_history,
+	.open = simple_open,
+};
+
 static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
 				    int reg)
 {
@@ -119,7 +189,32 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
-	return pmbus_do_probe(client, id, &ibm_cffps_info);
+	int rc;
+	struct dentry *debugfs;
+	struct ibm_cffps *psu;
+
+	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
+	if (rc)
+		return rc;
+
+	/* Don't fail the probe if we can't create debugfs */
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu->client = client;
+	mutex_init(&psu->update_lock);
+	if (jiffies > HZ)
+		psu->last_updated = jiffies - HZ;
+
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
+
+	debugfs_create_file("ibm_cffps_input_history", 0444, debugfs, psu,
+			    &ibm_cffps_fops);
+
+	return 0;
 }
 
 static const struct i2c_device_id ibm_cffps_id[] = {
-- 
1.8.3.1
