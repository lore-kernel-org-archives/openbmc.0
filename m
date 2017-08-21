Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbntR6KlczDqgx
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 08:10:07 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7LM8n4N126466
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 18:10:05 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cg25ba6fa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 18:10:05 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 21 Aug 2017 18:10:04 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Aug 2017 18:10:02 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7LMA2Yx20906038; Mon, 21 Aug 2017 22:10:02 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52076112040;
 Mon, 21 Aug 2017 18:09:50 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.0.233])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 2D5F2112054;
 Mon, 21 Aug 2017 18:09:47 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v4 2/2] hwmon: (ucd9000) Add debugfs for
 mfr_status info
Date: Mon, 21 Aug 2017 17:09:46 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17082122-0008-0000-0000-00000271D3D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007587; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00905718; UDB=6.00453884; IPR=6.00685922; 
 BA=6.00005545; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016799; XFM=3.00000015;
 UTC=2017-08-21 22:10:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082122-0009-0000-0000-0000367297A2
Message-Id: <20170821220946.85617-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-21_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708210343
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
X-List-Received-Date: Mon, 21 Aug 2017 22:10:08 -0000

Add debugfs to list the mfr_status register and its gpiN_fault
fields.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2 - Remove mfr_status directory in debugfs and place the files
     up in the parent ucd9000 directory.
---
 drivers/hwmon/pmbus/ucd9000.c | 122 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 5cea5f6..f906d8e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -38,6 +39,7 @@
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
 #define UCD9000_LOGGED_FAULTS		0xea
+#define UCD9000_MFR_STATUS		0xf3
 #define UCD9000_GPIO_SELECT		0xfa
 #define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
@@ -56,16 +58,25 @@
 #define UCD9000_MON_VOLTAGE_HW	4
 
 #define UCD9000_NUM_FAN		4
+#define UCD9000_NAME_SIZE	24
 
 #define UCD90160_NUM_GPIOS	26
+#define UCD90160_GPI_COUNT	8
+#define UCD90160_GPI_FAULT_BASE	16
 
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
 	struct gpio_chip gpio;
+	struct dentry *debugfs;	/* debugfs device directory */
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
@@ -143,6 +154,7 @@ static int ucd9000_gpio_read_config(struct i2c_client *client,
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
 			ret);
+
 		return ret;
 	}
 
@@ -157,6 +169,7 @@ static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	ret = ucd9000_gpio_read_config(client, offset);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to read GPIO config\n");
+
 		return ret;
 	}
 
@@ -185,6 +198,108 @@ static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
 	return 0;
 }
 
+static struct dentry *ucd9000_debugfs_dir;
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int ucd9000_get_mfr_status(struct i2c_client *client, u32 *buffer)
+{
+	int ret;
+
+	ret = pmbus_set_page(client, 0);
+	if (ret < 0) {
+		dev_err(&client->dev, "pmbus_set_page failed. rc:%d\n", ret);
+		return ret;
+	}
+	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
+					(u8 *)buffer);
+}
+
+static int ucd9000_debugfs_get_mfr_status_bit(void *data, u64 *val)
+{
+	struct ucd9000_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	int nr = entry->index;
+	u32 buffer;
+	int ret;
+
+	ret = ucd9000_get_mfr_status(client, &buffer);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read mfr status. rc:%d\n", ret);
+		return ret;
+	}
+
+	*val = ret & BIT(nr) ? 1 : 0;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
+			ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
+
+static int ucd9000_debugfs_get_mfr_status_word(void *data, u64 *val)
+{
+	struct ucd9000_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	u32 buffer;
+	int ret;
+
+	ret = ucd9000_get_mfr_status(client, &buffer);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read mfr status. rc:%d\n", ret);
+		return ret;
+	}
+
+	*val = ret;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
+			ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
+
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				struct ucd9000_data *data)
+{
+	struct ucd9000_debugfs_entry *entries;
+	char name[UCD9000_NAME_SIZE];
+	int i;
+
+	ucd9000_debugfs_dir = debugfs_create_dir("ucd9000", NULL);
+	if (IS_ERR(ucd9000_debugfs_dir)) {
+		ucd9000_debugfs_dir = NULL;
+		dev_warn(&client->dev, "Failed to create debugfs dir\n");
+		return 0;
+	}
+
+	entries = devm_kzalloc(&client->dev, sizeof(*entries) *
+				(UCD90160_GPI_COUNT + 1) * 10,
+				GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	for (i = 0; i < UCD90160_GPI_COUNT; i++) {
+		entries[i].client = client;
+		entries[i].index = UCD90160_GPI_FAULT_BASE + i;
+		scnprintf(name, UCD9000_NAME_SIZE, "gpi%d_alarm", i+1);
+		debugfs_create_file(name, 0444, ucd9000_debugfs_dir,
+				&entries[i],
+				&ucd9000_debugfs_ops_mfr_status_bit);
+	}
+	entries[i].client = client;
+	scnprintf(name, UCD9000_NAME_SIZE, "mfr_status");
+	debugfs_create_file(name, 0444, ucd9000_debugfs_dir, &entries[i],
+				&ucd9000_debugfs_ops_mfr_status_word);
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
 static ssize_t ucd9000_clear_logged_faults(struct device *dev,
 				struct device_attribute *attr, const char *buf,
 				size_t count)
@@ -345,12 +460,19 @@ static int ucd9000_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
+	if (mid->driver_data == ucd90160) {
+		ret = ucd9000_init_debugfs(client, data);
+		if (ret < 0)
+			dev_warn(&client->dev, "Failed to register debugfs\n");
+	}
+
 	return  pmbus_do_probe(client, mid, info);
 }
 
 static int ucd9000_remove(struct i2c_client *client)
 {
 	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
+	debugfs_remove_recursive(ucd9000_debugfs_dir);
 	return pmbus_do_remove(client);
 }
 
-- 
1.8.2.2
