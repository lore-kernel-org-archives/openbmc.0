Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4016qV2qNXzF0Pd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 08:07:02 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2DL1EcR107913
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:06:59 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gpnn0hbyf-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:06:58 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 17:06:57 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 17:06:55 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2DL6sAB43778186; Tue, 13 Mar 2018 21:06:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4739BB204D;
 Tue, 13 Mar 2018 18:09:08 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.85.147.96])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id B78ABB204E;
 Tue, 13 Mar 2018 18:09:07 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 v2 2/2] hwmon: (ucd9000) Add debugfs attributes
 to provide mfr_status
Date: Tue, 13 Mar 2018 16:06:48 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1520975208-6406-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520975208-6406-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18031321-0036-0000-0000-000002D010D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008667; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01002604; UDB=6.00510172; IPR=6.00781934; 
 MB=3.00020014; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-13 21:06:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031321-0037-0000-0000-000043A257F2
Message-Id: <1520975208-6406-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130234
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
X-List-Received-Date: Tue, 13 Mar 2018 21:07:03 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Expose the gpiN_fault fields of mfr_status as individual debugfs
attributes. This provides a way for users to be easily notified of gpi
faults. Also provide the whole mfr_status register in debugfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 140 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 023fb9e..b073d8e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -36,6 +37,7 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_MFR_STATUS		0xf3
 #define UCD9000_GPIO_SELECT		0xfa
 #define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
@@ -63,13 +65,22 @@
 #define UCD901XX_NUM_GPIOS	26
 #define UCD90910_NUM_GPIOS	26
 
+#define UCD9000_DEBUGFS_NAME_LEN	24
+#define UCD9000_GPI_COUNT		8
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
 	struct gpio_chip gpio;
+	struct dentry *debugfs;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
+struct ucd9000_debugfs_entry {
+	struct i2c_client *client;
+	u8 index;
+};
+
 static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
 {
 	int fan_config = 0;
@@ -306,6 +317,124 @@ static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
 					  val);
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int ucd9000_get_mfr_status(struct i2c_client *client, u8 *buffer)
+{
+	int ret = pmbus_set_page(client, 0);
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * With the ucd90120 and ucd90124 devices, this command [MFR_STATUS]
+	 * is 2 bytes long (bits 0-15).  With the ucd90240 this command is 5
+	 * bytes long.  With all other devices, it is 4 bytes long.
+	 */
+	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS, buffer);
+}
+
+static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
+{
+	struct ucd9000_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	u8 buffer[4];
+	int ret;
+
+	/*
+	 * This attribute is only created for devices that return 4 bytes for
+	 * status_mfr, so it's safe to call with 4-byte buffer.
+	 */
+	ret = ucd9000_get_mfr_status(client, buffer);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Attribute only created for devices with gpi fault bits at bits
+	 * 16-23, which is the second byte of the response.
+	 */
+	*val = !!(buffer[1] & BIT(entry->index));
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_bit,
+			 ucd9000_debugfs_show_mfr_status_bit, NULL, "%1lld\n");
+
+static ssize_t ucd9000_debugfs_read_mfr_status(struct file *file,
+					       char __user *buf, size_t count,
+					       loff_t *ppos)
+{
+	struct i2c_client *client = file->private_data;
+	u8 buffer[5] = { 0 };	/* Need max 5 bytes for any ucd9000 chip. */
+	int ret;
+
+	ret = ucd9000_get_mfr_status(client, buffer);
+	if (ret < 0)
+		return ret;
+
+	return simple_read_from_buffer(buf, count, ppos, buffer, ret);
+}
+
+static const struct file_operations ucd9000_debugfs_show_mfr_status_fops = {
+	.llseek = noop_llseek,
+	.read = ucd9000_debugfs_read_mfr_status,
+	.open = simple_open,
+};
+
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				const struct i2c_device_id *mid,
+				struct ucd9000_data *data)
+{
+	struct dentry *debugfs;
+	struct ucd9000_debugfs_entry *entries;
+	int i;
+	char name[UCD9000_DEBUGFS_NAME_LEN];
+
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return -ENOENT;
+
+	data->debugfs = debugfs_create_dir(client->name, debugfs);
+	if (!data->debugfs)
+		return -ENOENT;
+
+	/*
+	 * Of the chips this driver supports, only the UCD9090, UCD90160,
+	 * and UCD90910 report GPI faults in their MFR_STATUS register, so only
+	 * create the GPI fault debugfs attributes for those chips.
+	 */
+	if (mid->driver_data == ucd9090 || mid->driver_data == ucd90160 ||
+	    mid->driver_data == ucd90910) {
+		entries = devm_kzalloc(&client->dev,
+				       sizeof(*entries) * UCD9000_GPI_COUNT,
+				       GFP_KERNEL);
+		if (!entries)
+			return -ENOMEM;
+
+		for (i = 0; i < UCD9000_GPI_COUNT; i++) {
+			entries[i].client = client;
+			entries[i].index = i;
+			scnprintf(name, UCD9000_DEBUGFS_NAME_LEN,
+				  "gpi%d_alarm", i + 1);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[i],
+					    &ucd9000_debugfs_mfr_status_bit);
+		}
+	}
+
+	scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
+	debugfs_create_file(name, 0444, data->debugfs, client,
+			    &ucd9000_debugfs_show_mfr_status_fops);
+
+	return 0;
+}
+#else
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				struct ucd9000_data *data)
+{
+	return 0;
+}
+#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -464,7 +593,16 @@ static int ucd9000_probe(struct i2c_client *client,
 				 ret);
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	ret = pmbus_do_probe(client, mid, info);
+	if (ret)
+		return ret;
+
+	ret = ucd9000_init_debugfs(client, mid, data);
+	if (ret)
+		dev_warn(&client->dev, "Failed to register debugfs: %d\n",
+			 ret);
+
+	return 0;
 }
 
 /* This is the driver that will be inserted */
-- 
1.8.3.1
