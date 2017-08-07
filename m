Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRCm6708rzDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 09:04:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77N467H183545
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 19:04:51 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c6txe0fnw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 19:04:51 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 19:04:51 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 19:04:50 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77N4olb33095700; Mon, 7 Aug 2017 23:04:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE65612403D;
 Mon,  7 Aug 2017 19:02:13 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 73E82124037;
 Mon,  7 Aug 2017 19:02:13 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.10 1/3] drivers/hwmon/pmbus: Use STATUS_WORD by
 default and do correct access
Date: Mon,  7 Aug 2017 18:04:43 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080723-0048-0000-0000-000001D00DD3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899055; UDB=6.00449968; IPR=6.00679260; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016580; XFM=3.00000015;
 UTC=2017-08-07 23:04:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080723-0049-0000-0000-00004227CEF1
Message-Id: <1502147085-437-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070383
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
X-List-Received-Date: Mon, 07 Aug 2017 23:04:55 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Pmbus core always read byte data from the status register, even if
configured to use STATUS_WORD. Use a function pointer so we always do
the correct byte/word access. Also switch to use STATUS_WORD by default.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 69 +++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3c8bcbd..b293682 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -114,7 +114,8 @@ struct pmbus_data {
 	 * so we keep them all together.
 	 */
 	u8 status[PB_NUM_STATUS_REG];
-	u8 status_register;
+
+	int (*read_status)(struct i2c_client *client, int page);
 
 	u8 currpage;
 };
@@ -460,7 +461,7 @@ static int pmbus_check_status_cml(struct i2c_client *client)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int status, status2;
 
-	status = _pmbus_read_byte_data(client, -1, data->status_register);
+	status = data->read_status(client, -1);
 	if (status < 0 || (status & PB_STATUS_CML)) {
 		status2 = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
 		if (status2 < 0 || (status2 & PB_CML_FAULT_INVALID_COMMAND))
@@ -484,6 +485,36 @@ static bool pmbus_check_register(struct i2c_client *client,
 	return rv >= 0;
 }
 
+/* Check specified page status register accessibility. Need a separate
+ * function rather than the two above so we can use the correct status
+ * register, and we can optimize out the second status register read.
+ */
+static bool pmbus_check_status_register(struct i2c_client *client, int page)
+{
+	int status, rc = 0;
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	status = data->read_status(client, page);
+	if (status < 0)
+		goto out;
+
+	if (!(data->flags & PMBUS_SKIP_STATUS_CHECK)) {
+		if (status & PB_STATUS_CML) {
+			status = _pmbus_read_byte_data(client, -1,
+						       PMBUS_STATUS_CML);
+			if (status < 0 ||
+			    (status & PB_CML_FAULT_INVALID_COMMAND))
+				goto out;
+		}
+	}
+
+	rc = 1;
+
+out:
+	pmbus_clear_fault_page(client, -1);
+	return rc;
+}
+
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
@@ -529,9 +560,8 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 		int i, j;
 
 		for (i = 0; i < info->pages; i++) {
-			data->status[PB_STATUS_BASE + i]
-			    = _pmbus_read_byte_data(client, i,
-						    data->status_register);
+			data->status[PB_STATUS_BASE + i] =
+				data->read_status(client, i);
 			for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
 				struct _pmbus_status *s = &pmbus_status[j];
 
@@ -1199,8 +1229,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 		 * the generic status register for this page is accessible.
 		 */
 		if (!ret && attr->gbit &&
-		    pmbus_check_byte_register(client, page,
-					      data->status_register)) {
+		    pmbus_check_status_register(client, page)) {
 			ret = pmbus_add_boolean(data, name, "alarm", index,
 						NULL, NULL,
 						PB_STATUS_BASE + page,
@@ -1921,6 +1950,16 @@ static int pmbus_identify_common(struct i2c_client *client,
 	return 0;
 }
 
+static int pmbus_read_status_word(struct i2c_client *client, int page)
+{
+	return _pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
+}
+
+static int pmbus_read_status_byte(struct i2c_client *client, int page)
+{
+	return _pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
+}
+
 static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
@@ -1928,16 +1967,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	int page, ret;
 
 	/*
-	 * Some PMBus chips don't support PMBUS_STATUS_BYTE, so try
-	 * to use PMBUS_STATUS_WORD instead if that is the case.
+	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
+	 * to use PMBUS_STATUS_BYTE instead if that is the case.
 	 * Bail out if both registers are not supported.
 	 */
-	data->status_register = PMBUS_STATUS_BYTE;
-	ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-	if (ret < 0 || ret == 0xff) {
-		data->status_register = PMBUS_STATUS_WORD;
-		ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-		if (ret < 0 || ret == 0xffff) {
+	data->read_status = pmbus_read_status_word;
+	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	if (ret < 0 || ret == 0xffff) {
+		data->read_status = pmbus_read_status_byte;
+		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
 			return -ENODEV;
 		}
-- 
1.8.3.1
