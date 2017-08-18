Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYQdd4DnhzDrMw
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 11:35:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7I1XoIS152849
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 21:35:47 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cdmac6uha-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 21:35:47 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 17 Aug 2017 21:35:46 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Aug 2017 21:35:43 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7I1Zhxr23789576; Fri, 18 Aug 2017 01:35:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52E17112047;
 Thu, 17 Aug 2017 21:35:32 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.3.230])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 54195112040;
 Thu, 17 Aug 2017 21:35:29 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 2/2] hwmon: (ucd9000) Add debugfs for
 mfr_status
Date: Thu, 17 Aug 2017 20:35:26 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081801-0024-0000-0000-000002C157C9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007564; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000222; SDB=6.00903875; UDB=6.00452837; IPR=6.00684087; 
 BA=6.00005538; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016748; XFM=3.00000015;
 UTC=2017-08-18 01:35:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081801-0025-0000-0000-00004521F1E7
Message-Id: <20170818013526.35678-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708180021
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
X-List-Received-Date: Fri, 18 Aug 2017 01:35:50 -0000

Add a debugfs for the mfr_status register.  Add individual
files for each gpiN_fault and a separate file for the entire
contents of the register.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 143 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index af44c1e..fddb40e 100644
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
@@ -190,6 +201,113 @@ static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
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
+	if (!ucd9000_debugfs_dir)
+		return -ENODEV;
+
+	/*
+	 * Create the debugfs directory for this device.
+	 */
+	data->debugfs = debugfs_create_dir("mfr_status",
+					ucd9000_debugfs_dir);
+	if (IS_ERR_OR_NULL(data->debugfs)) {
+		data->debugfs = NULL;
+		return -ENODEV;
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
+		debugfs_create_file(name, 0444, data->debugfs, &entries[i],
+					&ucd9000_debugfs_ops_mfr_status_bit);
+	}
+	entries[i].client = client;
+	scnprintf(name, UCD9000_NAME_SIZE, "mfr_status");
+	debugfs_create_file(name, 0444, data->debugfs, &entries[i],
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
@@ -353,12 +471,19 @@ static int ucd9000_probe(struct i2c_client *client,
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
 
@@ -372,7 +497,23 @@ static int ucd9000_remove(struct i2c_client *client)
 	.id_table = ucd9000_id,
 };
 
-module_i2c_driver(ucd9000_driver);
+static int __init ucd9000_init(void)
+{
+	ucd9000_debugfs_dir = debugfs_create_dir("ucd9000", NULL);
+	if (IS_ERR(ucd9000_debugfs_dir))
+		ucd9000_debugfs_dir = NULL;
+
+	return i2c_add_driver(&ucd9000_driver);
+}
+
+static void __exit ucd9000_exit(void)
+{
+	i2c_del_driver(&ucd9000_driver);
+	debugfs_remove_recursive(ucd9000_debugfs_dir);
+}
+
+module_init(ucd9000_init);
+module_exit(ucd9000_exit);
 
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for TI UCD90xxx");
-- 
1.8.2.2
