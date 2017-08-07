Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRCm94hQczDqkX
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 09:04:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77N48iu087326
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 19:04:55 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c6t95259q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 19:04:55 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 19:04:54 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 19:04:52 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77N4qI053608584; Mon, 7 Aug 2017 23:04:52 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8093124037;
 Mon,  7 Aug 2017 19:02:15 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 6DCD6124035;
 Mon,  7 Aug 2017 19:02:15 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.10 2/3] drivers/hmwon/pmbus: store STATUS_WORD in
 status registers
Date: Mon,  7 Aug 2017 18:04:44 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080723-0036-0000-0000-000002552A3D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899055; UDB=6.00449968; IPR=6.00679260; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016580; XFM=3.00000015;
 UTC=2017-08-07 23:04:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080723-0037-0000-0000-0000415CEA9C
Message-Id: <1502147085-437-3-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 07 Aug 2017 23:04:58 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Higher byte of the status register wasn't available for boolean alarms.
Store the STATUS_WORD register if it's available, and read it out when
queried by boolean attributes.

The method of storing and retrieving the status reg is a bit hacky but
I couldn't work out another way without doubling the storage requirement
of every pmbus device or tearing up more of the pmbus core code.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b293682..fc88cae 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -43,7 +43,7 @@
  * Index into status register array, per status register group
  */
 #define PB_STATUS_BASE		0
-#define PB_STATUS_VOUT_BASE	(PB_STATUS_BASE + PMBUS_PAGES)
+#define PB_STATUS_VOUT_BASE	(PB_STATUS_BASE + (PMBUS_PAGES * 2))
 #define PB_STATUS_IOUT_BASE	(PB_STATUS_VOUT_BASE + PMBUS_PAGES)
 #define PB_STATUS_FAN_BASE	(PB_STATUS_IOUT_BASE + PMBUS_PAGES)
 #define PB_STATUS_FAN34_BASE	(PB_STATUS_FAN_BASE + PMBUS_PAGES)
@@ -557,11 +557,14 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		int i, j;
+		int i, j, status;
 
 		for (i = 0; i < info->pages; i++) {
-			data->status[PB_STATUS_BASE + i] =
-				data->read_status(client, i);
+			status = data->read_status(client, i);
+			data->status[PB_STATUS_BASE + (i * 2)] = status;
+			data->status[PB_STATUS_BASE + (i * 2) + 1] =
+				status >> 8;
+
 			for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
 				struct _pmbus_status *s = &pmbus_status[j];
 
@@ -860,6 +863,18 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	return regval;
 }
 
+static int pmbus_get_status(struct pmbus_data *data, int reg)
+{
+	int ret;
+
+	if (reg < PB_STATUS_BASE + PMBUS_PAGES)
+		ret = data->status[reg * 2] | data->status[(reg * 2) + 1] << 8;
+	else
+		ret = data->status[reg];
+
+	return ret;
+}
+
 /*
  * Return boolean calculated from converted data.
  * <index> defines a status register index and mask.
@@ -888,12 +903,12 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
 {
 	struct pmbus_sensor *s1 = b->s1;
 	struct pmbus_sensor *s2 = b->s2;
-	u16 reg = (index >> 8) & 0xffff;
-	u8 mask = index & 0xff;
+	u16 reg = index >> 16;
+	u16 mask = index & 0xffff;
 	int ret, status;
 	u8 regval;
 
-	status = data->status[reg];
+	status = pmbus_get_status(data, reg);
 	if (status < 0)
 		return status;
 
@@ -1032,7 +1047,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 			     const char *name, const char *type, int seq,
 			     struct pmbus_sensor *s1,
 			     struct pmbus_sensor *s2,
-			     u16 reg, u8 mask)
+			     u16 reg, u16 mask)
 {
 	struct pmbus_boolean *boolean;
 	struct sensor_device_attribute *a;
@@ -1048,7 +1063,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 	boolean->s1 = s1;
 	boolean->s2 = s2;
 	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
-			(reg << 8) | mask);
+			(reg << 16) | mask);
 
 	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
@@ -1140,7 +1155,7 @@ struct pmbus_limit_attr {
  */
 struct pmbus_sensor_attr {
 	u16 reg;			/* sensor register */
-	u8 gbit;			/* generic status bit */
+	u16 gbit;			/* generic status bit */
 	u8 nlimit;			/* # of limit registers */
 	enum pmbus_sensor_classes class;/* sensor class */
 	const char *label;		/* sensor label */
@@ -1485,6 +1500,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_IIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = iin_limit_attrs,
 		.nlimit = ARRAY_SIZE(iin_limit_attrs),
 	}, {
@@ -1569,6 +1585,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_PIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = pin_limit_attrs,
 		.nlimit = ARRAY_SIZE(pin_limit_attrs),
 	}, {
-- 
1.8.3.1
