Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT2wW2vQ0zDr0Y
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:33:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMOFBZ048919
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:33:28 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c8u196h8n-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:33:28 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 16:33:27 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 16:33:25 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMXPMk1114518; Thu, 10 Aug 2017 15:33:25 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 073A6136040;
 Thu, 10 Aug 2017 16:33:25 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id A9E3E13604B;
 Thu, 10 Aug 2017 16:33:24 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 4/4] hwmon: (pmbus): Add debugfs for status
 registers
Date: Thu, 10 Aug 2017 17:33:15 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502404395-22900-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502404395-22900-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081022-0016-0000-0000-00000752F1E0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900484; UDB=6.00450826; IPR=6.00680686; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:33:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0017-0000-0000-00003AFB67C4
Message-Id: <1502404395-22900-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100351
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
X-List-Received-Date: Thu, 10 Aug 2017 22:33:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Export all the available status registers through debugfs, if the client
driver wants them.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus.h      |   6 ++
 drivers/hwmon/pmbus/pmbus_core.c | 201 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index a863b8f..73ea4b2 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -410,6 +410,12 @@ struct pmbus_driver_info {
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
+
+	/*
+	 * Controls whether or not to create debugfs entries for this driver's
+	 * devices.
+	 */
+	bool debugfs;
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 40ceb5a..f86941b 100644
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
@@ -2085,6 +2093,184 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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
+	/* Check if client driver requested debugfs support. */
+	if (!data->info->debugfs)
+		return 0;
+
+	/* Create the root pmbus debugfs directory if it's not created yet. */
+	if (!pmbus_debugfs_dir) {
+		pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
+		if (IS_ERR_OR_NULL(pmbus_debugfs_dir)) {
+			pmbus_debugfs_dir = NULL;
+			return -ENODEV;
+		}
+	}
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
+			snprintf(name, PMBUS_NAME_SIZE, "status%d", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_status);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_VOUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_IOUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_INPUT;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_CML;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_OTHER;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
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
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_12;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
+			debugfs_create_file(name, 0444, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops);
+		}
+
+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_STATUS_FAN_34;
+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
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
@@ -2144,6 +2330,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (ret)
 		goto out_unregister;
 
+	ret = pmbus_init_debugfs(client, data);
+	if (ret)
+		dev_warn(dev, "Failed to register debugfs\n");
+
 	return 0;
 
 out_unregister:
@@ -2157,6 +2347,17 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	debugfs_remove_recursive(data->debugfs);
+	if (pmbus_debugfs_dir && simple_empty(pmbus_debugfs_dir)) {
+		/*
+		 * Remove the root pmbus debugfs directory if we've removed
+		 * all the device directories underneath already.
+		 */
+		debugfs_remove(pmbus_debugfs_dir);
+		pmbus_debugfs_dir = NULL;
+	}
+
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
 	return 0;
-- 
1.8.3.1
