Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXtr1tbjzDr39
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 04:03:47 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BI3VH5042966
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:46 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c9cvhxa24-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:45 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 14:03:42 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 14:03:39 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BI3cu324248562; Fri, 11 Aug 2017 18:03:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CFF711204B;
 Fri, 11 Aug 2017 14:03:29 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 2C3CA112051;
 Fri, 11 Aug 2017 14:03:29 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 4/4] hwmon: (pmbus): Add debugfs for status
 registers
Date: Fri, 11 Aug 2017 13:03:28 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081118-0044-0000-0000-0000037BEB72
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900861; UDB=6.00451051; IPR=6.00681064; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 18:03:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081118-0045-0000-0000-000007AA0108
Message-Id: <1502474608-2674-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110280
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
X-List-Received-Date: Fri, 11 Aug 2017 18:03:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Export all the available status registers through debugfs, if the client
driver wants them.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 200 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 40ceb5a..c491cc4 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -102,6 +103,7 @@ struct pmbus_data {
 	int num_attributes;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+	struct dentry *debugfs;		/* debugfs device directory */
 
 	struct pmbus_sensor *sensors;
 
@@ -142,6 +144,12 @@ struct pmbus_data {
 	PMBUS_FAN_COMMAND_4,
 };
 
+struct pmbus_debugfs_entry {
+	struct i2c_client *client;
+	u8 page;
+	u8 reg;
+};
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -2085,6 +2093,174 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 }
 #endif
 
+static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int pmbus_debugfs_get(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+
+	*val = _pmbus_read_byte_data(entry->client, entry->page, entry->reg);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
+			 "0x%02llx\n");
+
+static int pmbus_debugfs_get_status(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
+
+	*val = pdata->read_status(entry->client, entry->page);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
+			 NULL, "0x%04llx\n");
+
+static int pmbus_init_debugfs(struct i2c_client *client,
+			      struct pmbus_data *data)
+{
+	int i, idx = 0;
+	char name[PMBUS_NAME_SIZE];
+	struct pmbus_debugfs_entry *entries;
+
+	if (!pmbus_debugfs_dir)
+		return -ENODEV;
+
+	/*
+	 * Create the debugfs directory for this device. Use the hwmon device
+	 * name to avoid conflicts (hwmon numbers are globally unique).
+	 */
+	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
+					   pmbus_debugfs_dir);
+	if (IS_ERR_OR_NULL(data->debugfs)) {
+		data->debugfs = NULL;
+		return -ENODEV;
+	}
+
+	/* Allocate the max possible entries we need. */
+	entries = devm_kzalloc(data->dev,
+			       sizeof(*entries) * (data->info->pages * 10),
+			       GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	for (i = 0; i < data->info->pages; ++i) {
+		/* Check accessibility of status register if it's not page 0 */
+		if (!i || pmbus_check_status_register(client, i)) {
+			/* No need to set reg as we have special read op. */
+			entries[idx].client = client;
+			entries[idx].page = i;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_status);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_VOUT;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_IOUT;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_INPUT;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_CML;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_OTHER;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i,
+					      PMBUS_STATUS_MFR_SPECIFIC)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_MFR_SPECIFIC;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_12;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_34;
+			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+	}
+
+	return 0;
+}
+#else
+static int pmbus_init_debugfs(struct i2c_client *client,
+			      struct pmbus_data *data)
+{
+	return 0;
+}
+#endif	/* IS_ENABLED(CONFIG_DEBUG_FS) */
+
 int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 		   struct pmbus_driver_info *info)
 {
@@ -2144,6 +2320,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (ret)
 		goto out_unregister;
 
+	ret = pmbus_init_debugfs(client, data);
+	if (ret)
+		dev_warn(dev, "Failed to register debugfs\n");
+
 	return 0;
 
 out_unregister:
@@ -2157,12 +2337,32 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	debugfs_remove_recursive(data->debugfs);
+
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
 
+static int __init pmbus_core_init(void)
+{
+	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
+	if (IS_ERR(pmbus_debugfs_dir))
+		pmbus_debugfs_dir = NULL;
+
+	return 0;
+}
+
+static void __exit pmbus_core_exit(void)
+{
+	debugfs_remove_recursive(pmbus_debugfs_dir);
+}
+
+module_init(pmbus_core_init);
+module_exit(pmbus_core_exit);
+
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus core driver");
 MODULE_LICENSE("GPL");
-- 
1.8.3.1
