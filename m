Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnzMN5gQ7zDqLX
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 06:51:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5EKmlDq058018
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:42 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b3bgrjd88-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:41 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 14 Jun 2017 16:51:41 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Jun 2017 16:51:38 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5EKpcV462849176; Wed, 14 Jun 2017 20:51:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B23F8112040;
 Wed, 14 Jun 2017 16:51:43 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.200.165])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 54355112051;
 Wed, 14 Jun 2017 16:51:40 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/3] drivers/hwmon: max31785 Set fan fault
 response based on dev tree
Date: Wed, 14 Jun 2017 15:51:15 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170614205115.47342-1-cbostic@linux.vnet.ibm.com>
References: <20170614205115.47342-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17061420-0048-0000-0000-000001A6F12A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007232; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00874809; UDB=6.00435495; IPR=6.00654901; 
 BA=6.00005421; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015827; XFM=3.00000015;
 UTC=2017-06-14 20:51:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061420-0049-0000-0000-00004184D9F1
Message-Id: <20170614205115.47342-4-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706140347
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
X-List-Received-Date: Wed, 14 Jun 2017 20:51:45 -0000

Check for the optional device tree property 'fault-max-fan'.  If
present, configure hardware for 100% PWM fan duty cycle on fault
condition.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/max31785.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fc03b7c..5d7bdd3 100644
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
+#define MAX31785_FAULT_RESP_PIN_MONITOR		0x01
+
 /* Fan Command constants */
 #define MAX31785_FAN_COMMAND_PWM_RATIO		40
 
@@ -762,6 +766,32 @@ static int max31785_get_capabilities(struct max31785 *data)
 	return 0;
 }
 
+static int max31785_init_fault_resp(struct i2c_client *client)
+{
+	struct device_node *np = client->dev.of_node;
+	int rc;
+
+	if (np && of_get_property(np, "fault-max-fan", NULL)) {
+
+		/* set max fans on fault */
+		rc = max31785_set_page(client, 0);
+		if (rc < 0)
+			return rc;
+
+		rc = i2c_smbus_read_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP);
+		if (rc < 0)
+			return rc;
+
+		rc |= MAX31785_FAULT_RESP_PIN_MONITOR;
+		rc = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -783,6 +813,10 @@ static int max31785_probe(struct i2c_client *client,
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
