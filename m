Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjK1R4S4DzDqXv
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 07:50:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7ULo0pC029786
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:17 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cp023tg66-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:16 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 17:50:16 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 17:50:14 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7ULoEwB30277710; Wed, 30 Aug 2017 21:50:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49EC3AE043;
 Wed, 30 Aug 2017 17:50:38 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id E85F0AE052;
 Wed, 30 Aug 2017 17:50:35 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v6 3/3] hwmon: (ucd9000) Add debugfs to list
 mfr_status info
Date: Wed, 30 Aug 2017 16:49:53 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17083021-0008-0000-0000-00000276DAEA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007638; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909906; UDB=6.00456396; IPR=6.00690190; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016932; XFM=3.00000015;
 UTC=2017-08-30 21:50:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083021-0009-0000-0000-0000368AA81F
Message-Id: <20170830214953.73327-4-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300333
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
X-List-Received-Date: Wed, 30 Aug 2017 21:50:20 -0000

Expose via files in debugfs the gpiN_fault fields as well as
the entire contents of the mfr_status register.  Allows user
space to pull this data for error logging etc...

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v6 - Remove chip idx values on remove so that we can retain the
     same indexes regardless how many times we're bound/unbound.
   - Remove type 90160 check when adding debugfs.
v5 - Add unique debugfs dir ID for each ucd9000 sysfs device.
   - Change branching return to a !! method.
   - Clean up line breaks, other white space.
   - Add comments on assumptions made regarding ucd90160 versus other
     types.
v2 - Remove mfr_status directory in debugfs and place the files
     up in the parent ucd9000 directory.
---
 drivers/hwmon/pmbus/ucd9000.c | 160 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 61abd3a..d5c310f 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -29,6 +30,7 @@
 #include <linux/sysfs.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/gpio.h>
+#include <linux/idr.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -38,6 +40,7 @@
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
 #define UCD9000_LOGGED_FAULTS		0xea
+#define UCD9000_MFR_STATUS		0xf3
 #define UCD9000_GPIO_SELECT		0xfa
 #define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
@@ -59,17 +62,29 @@
 #define UCD9000_MON_VOLTAGE_HW	4
 
 #define UCD9000_NUM_FAN		4
+#define UCD9000_NAME_SIZE	24
 
 #define UCD9000_GPIO_NAME_LEN	16
 #define UCD90160_NUM_GPIOS	26
+#define UCD90160_GPI_COUNT	8
+#define UCD90160_GPI_FAULT_BASE	16
+
+static DEFINE_IDA(ucd9000_ida);
 
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
 	struct gpio_chip gpio;
+	struct dentry *debugfs;
+	int idx;
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
@@ -297,6 +312,140 @@ static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
 	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, val);
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
+
+		return ret;
+	}
+
+	/*
+	 * Warning:
+	 *
+	 * Though not currently supported this will cause stack corruption for
+	 * ucd90240!  Command reference, page 81:
+	 *
+	 *    With the ucd90120 and ucd90124 devices, this command [MFR_STATUS]
+	 *    is 2 bytes long (bits 0-15).  With the ucd90240 this command is 5
+	 *    bytes long.  With all other devices, it is 4 bytes long.
+	 */
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
+		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
+			ret);
+
+		return ret;
+	}
+
+	*val = !!(ret & BIT(nr));
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
+		ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
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
+		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
+			ret);
+
+		return ret;
+	}
+
+	*val = ret;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
+		ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
+
+static int ucd9000_init_debugfs(struct i2c_client *client,
+				struct ucd9000_data *data)
+{
+	struct ucd9000_debugfs_entry *entries;
+	char name[UCD9000_NAME_SIZE];
+	int i;
+
+	data->idx = ida_simple_get(&ucd9000_ida, 0, INT_MAX, GFP_KERNEL);
+	scnprintf(name, UCD9000_NAME_SIZE, "ucd9000.%d", data->idx);
+	ucd9000_debugfs_dir = debugfs_create_dir(name, NULL);
+	if (IS_ERR(ucd9000_debugfs_dir)) {
+		dev_warn(&client->dev, "Failed to create debugfs dir: %p\n",
+			ucd9000_debugfs_dir);
+		ucd9000_debugfs_dir = NULL;
+		ida_simple_remove(&ucd9000_ida, data->idx);
+		return 0;
+	}
+
+	/*
+	 * Warning:
+	 *
+	 * Makes assumption we're on a ucd90160 type! entries will be different
+	 * sizes for other types.
+	 */
+	entries = devm_kzalloc(&client->dev, sizeof(*entries) *
+				(UCD90160_GPI_COUNT + 1) * 10, GFP_KERNEL);
+	if (!entries) {
+		ida_simple_remove(&ucd9000_ida, data->idx);
+		return -ENOMEM;
+	}
+
+	/*
+	 * Warning:
+	 *
+	 * This makes the assumption we're probing a ucd90160 type and how the
+	 * GPI information is organized.  Needs to account for all other
+	 * ucd9000 varieties.
+	 */
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
+			&ucd9000_debugfs_ops_mfr_status_word);
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
@@ -474,12 +623,21 @@ static int ucd9000_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	ret = ucd9000_init_debugfs(client, data);
+	if (ret < 0)
+		dev_warn(&client->dev, "Failed to register debugfs: %d\n", ret);
+
+	return  pmbus_do_probe(client, mid, info);
 }
 
 static int ucd9000_remove(struct i2c_client *client)
 {
+	struct ucd9000_data *data
+		= to_ucd9000_data(pmbus_get_driver_info(client));
+
 	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
+	ida_simple_remove(&ucd9000_ida, data->idx);
+	debugfs_remove_recursive(ucd9000_debugfs_dir);
 	return pmbus_do_remove(client);
 }
 
-- 
1.8.2.2
