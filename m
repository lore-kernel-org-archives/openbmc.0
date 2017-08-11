Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXtk605HzDr4T
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 04:03:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHxN6l130475
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:40 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c9fksw004-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:40 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 14:03:40 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 14:03:37 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BI3ab827263072; Fri, 11 Aug 2017 18:03:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ED17112054;
 Fri, 11 Aug 2017 14:03:27 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 15CA2112047;
 Fri, 11 Aug 2017 14:03:27 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 3/4] hwmon: (pmbus): Add generic alarm bit
 for iin and pin
Date: Fri, 11 Aug 2017 13:03:27 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081118-0040-0000-0000-0000038E59BC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900860; UDB=6.00451051; IPR=6.00681064; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 18:03:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081118-0041-0000-0000-000007828803
Message-Id: <1502474608-2674-4-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 18:03:43 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
need to redo the status register checking before setting up the boolean
attribute, since it won't necessarily check STATUS_WORD if the device
doesn't support it, which we need for this bit.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 306abdc..40ceb5a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -115,6 +115,7 @@ struct pmbus_data {
 	 */
 	u16 status[PB_NUM_STATUS_REG];
 
+	bool has_status_word;		/* device uses STATUS_WORD register */
 	int (*read_status)(struct i2c_client *client, int page);
 
 	u8 currpage;
@@ -1193,6 +1194,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 				      const struct pmbus_sensor_attr *attr)
 {
 	struct pmbus_sensor *base;
+	bool upper = !!(attr->gbit & 0xff00);	/* need to check STATUS_WORD */
 	int ret;
 
 	if (attr->label) {
@@ -1213,9 +1215,11 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 		/*
 		 * Add generic alarm attribute only if there are no individual
 		 * alarm attributes, if there is a global alarm bit, and if
-		 * the generic status register for this page is accessible.
+		 * the generic status register (word or byte, depending on
+		 * which global bit is set) for this page is accessible.
 		 */
 		if (!ret && attr->gbit &&
+		    (!upper || (upper && data->has_status_word)) &&
 		    pmbus_check_status_register(client, page)) {
 			ret = pmbus_add_boolean(data, name, "alarm", index,
 						NULL, NULL,
@@ -1472,6 +1476,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_IIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = iin_limit_attrs,
 		.nlimit = ARRAY_SIZE(iin_limit_attrs),
 	}, {
@@ -1556,6 +1561,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.func = PMBUS_HAVE_PIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
+		.gbit = PB_STATUS_INPUT,
 		.limit = pin_limit_attrs,
 		.nlimit = ARRAY_SIZE(pin_limit_attrs),
 	}, {
@@ -1967,6 +1973,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			dev_err(dev, "PMBus status register not found\n");
 			return -ENODEV;
 		}
+	} else {
+		data->has_status_word = true;
 	}
 
 	/* Enable PEC if the controller supports it */
-- 
1.8.3.1
