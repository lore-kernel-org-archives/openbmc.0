Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXth0499zDr1s
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 04:03:39 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHxStn150128
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:37 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c9dc54b56-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:37 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 14:03:36 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 14:03:33 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BI3WQ924314038; Fri, 11 Aug 2017 18:03:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73426112047;
 Fri, 11 Aug 2017 14:03:23 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 290FD112040;
 Fri, 11 Aug 2017 14:03:23 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/4] hwmon: (pmbus): Switch status registers
 to 16 bit
Date: Fri, 11 Aug 2017 13:03:25 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081118-0036-0000-0000-000002577E2A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900861; UDB=6.00451051; IPR=6.00681064; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 18:03:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081118-0037-0000-0000-00004168415A
Message-Id: <1502474608-2674-2-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 18:03:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Switch the storage of status registers to 16 bit values. This allows us
to store all the bits of STATUS_WORD.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3c8bcbd..06924b3 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -113,7 +113,7 @@ struct pmbus_data {
 	 * A single status register covers multiple attributes,
 	 * so we keep them all together.
 	 */
-	u8 status[PB_NUM_STATUS_REG];
+	u16 status[PB_NUM_STATUS_REG];
 	u8 status_register;
 
 	u8 currpage;
@@ -858,10 +858,10 @@ static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
 {
 	struct pmbus_sensor *s1 = b->s1;
 	struct pmbus_sensor *s2 = b->s2;
-	u16 reg = (index >> 8) & 0xffff;
-	u8 mask = index & 0xff;
+	u16 reg = (index >> 16) & 0xffff;
+	u16 mask = index & 0xffff;
 	int ret, status;
-	u8 regval;
+	u16 regval;
 
 	status = data->status[reg];
 	if (status < 0)
@@ -1002,7 +1002,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 			     const char *name, const char *type, int seq,
 			     struct pmbus_sensor *s1,
 			     struct pmbus_sensor *s2,
-			     u16 reg, u8 mask)
+			     u16 reg, u16 mask)
 {
 	struct pmbus_boolean *boolean;
 	struct sensor_device_attribute *a;
@@ -1018,7 +1018,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 	boolean->s1 = s1;
 	boolean->s2 = s2;
 	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
-			(reg << 8) | mask);
+			(reg << 16) | mask);
 
 	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
@@ -1110,7 +1110,7 @@ struct pmbus_limit_attr {
  */
 struct pmbus_sensor_attr {
 	u16 reg;			/* sensor register */
-	u8 gbit;			/* generic status bit */
+	u16 gbit;			/* generic status bit */
 	u8 nlimit;			/* # of limit registers */
 	enum pmbus_sensor_classes class;/* sensor class */
 	const char *label;		/* sensor label */
-- 
1.8.3.1
