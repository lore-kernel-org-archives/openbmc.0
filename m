Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpZB55MYBzDqLB
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 06:00:45 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5FJweGq051250
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:43 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b3wnq85sy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:42 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 15 Jun 2017 14:00:41 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Jun 2017 14:00:39 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5FK0dpq65208530; Thu, 15 Jun 2017 13:00:39 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC5676E045;
 Thu, 15 Jun 2017 14:00:38 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id A58536E040;
 Thu, 15 Jun 2017 14:00:38 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 3/3] drivers/hwmon: max31785 Set fan fault
 response based on dev tree
Date: Thu, 15 Jun 2017 15:00:33 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17061520-0028-0000-0000-000007D1B603
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007238; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00875272; UDB=6.00435773; IPR=6.00655360; 
 BA=6.00005423; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015840; XFM=3.00000015;
 UTC=2017-06-15 20:00:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061520-0029-0000-0000-0000363C90A3
Message-Id: <20170615200033.67387-4-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706150345
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
X-List-Received-Date: Thu, 15 Jun 2017 20:00:46 -0000

Check for the optional device tree property 'fault-max-fan'.  If
present, configure hardware for 100% PWM fan duty cycle on fault
condition.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/max31785.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fc03b7c..a67d5e5 100644
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
 
@@ -762,6 +766,36 @@ static int max31785_get_capabilities(struct max31785 *data)
 	return 0;
 }
 
+static int max31785_init_fault_resp(struct i2c_client *client)
+{
+	struct device_node *np = client->dev.of_node;
+	int page;
+	int rc;
+
+	if (np && of_get_property(np, "fault-max-fan", NULL)) {
+		/* TODO: number of fans/pages is platform dependent */
+		for (page = 0; page < 4; page++) {
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
+			rc |= MAX31785_FAULT_RESP_PIN_MONITOR;
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
@@ -783,6 +817,10 @@ static int max31785_probe(struct i2c_client *client,
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
