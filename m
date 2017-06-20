Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsc6D4gKszDqMP
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 04:37:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5KIYOsr089444
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:37:53 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b729jndf7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:37:53 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 20 Jun 2017 14:37:52 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 14:37:49 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5KIbnVT62521572; Tue, 20 Jun 2017 18:37:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79229B205D;
 Tue, 20 Jun 2017 14:35:22 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 2E9E7B2046;
 Tue, 20 Jun 2017 14:35:22 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/hwmon: max31785 Set fan fault response
 based on dev tree
Date: Tue, 20 Jun 2017 13:37:47 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17062018-0036-0000-0000-0000023103A8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007262; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877557; UDB=6.00437169; IPR=6.00657695; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015902; XFM=3.00000015;
 UTC=2017-06-20 18:37:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062018-0037-0000-0000-000040CC9357
Message-Id: <20170620183747.25327-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706200320
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
X-List-Received-Date: Tue, 20 Jun 2017 18:37:57 -0000

Check for the optional device tree property 'fault-max-fan'.  If
present, configure hardware for 100% PWM fan duty cycle on fault
condition.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v3 - Change bit field definition to use macro BIT(x)
   - Set all 6 fans to same fault response
   - Rename fault response register #define to match the spec

v2 - Set 4 fans to same fault response
---
 drivers/hwmon/max31785.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fc03b7c..4010504 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -38,6 +38,7 @@
 #define MAX31785_REG_MFR_ID			0x99
 #define MAX31785_REG_MFR_MODEL			0x9a
 #define MAX31785_REG_MFR_REVISION		0x9b
+#define MAX31785_REG_MFR_FAULT_RESP		0xd9
 #define MAX31785_REG_MFR_FAN_CONFIG		0xf1
 #define MAX31785_REG_READ_FAN_PWM		0xf3
 
@@ -51,6 +52,9 @@
 /* Fan Status register bits */
 #define MAX31785_FAN_STATUS_FAULT_MASK		0x80
 
+/* Fault response register bits */
+#define MAX31785_FAULT_PIN_MONITOR		BIT(0)
+
 /* Fan Command constants */
 #define MAX31785_FAN_COMMAND_PWM_RATIO		40
 
@@ -762,6 +766,35 @@ static int max31785_get_capabilities(struct max31785 *data)
 	return 0;
 }
 
+static int max31785_init_fault_resp(struct i2c_client *client)
+{
+	struct device_node *np = client->dev.of_node;
+	int page;
+	int rc;
+
+	if (np && of_get_property(np, "fault-max-fan", NULL)) {
+		for (page = 0; page < NR_CHANNEL; page++) {
+
+			/* set max fans on fault */
+			rc = max31785_set_page(client, page);
+			if (rc < 0)
+				return rc;
+
+			rc = i2c_smbus_read_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP);
+			if (rc < 0)
+				return rc;
+
+			rc |= MAX31785_FAULT_PIN_MONITOR;
+			rc = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rc);
+		}
+		return rc;
+	}
+
+	return 0;
+}
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -783,6 +816,10 @@ static int max31785_probe(struct i2c_client *client,
 	data->client = client;
 	mutex_init(&data->lock);
 
+	rc = max31785_init_fault_resp(client);
+	if (rc)
+		return rc;
+
 	rc = max31785_init_fans(data);
 	if (rc)
 		return rc;
-- 
1.8.2.2
