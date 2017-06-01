Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdyzc6H1KzDqKK
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 06:06:51 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v51K42kq001215
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jun 2017 16:06:49 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2atmfay1er-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2017 16:06:48 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 1 Jun 2017 16:06:48 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Jun 2017 16:06:46 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v51K6itO64553018; Thu, 1 Jun 2017 20:06:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FE17112047;
 Thu,  1 Jun 2017 16:06:50 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id F3F9911204B;
 Thu,  1 Jun 2017 16:06:49 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/hwmon: MAX31785 Provide config of
 fault pin bevavior
Date: Thu,  1 Jun 2017 15:06:44 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17060120-0052-0000-0000-000002126646
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007154; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00868804; UDB=6.00431810; IPR=6.00648693; 
 BA=6.00005393; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015673; XFM=3.00000015;
 UTC=2017-06-01 20:06:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060120-0053-0000-0000-000050CBBF59
Message-Id: <20170601200644.56311-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-01_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706010372
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
X-List-Received-Date: Thu, 01 Jun 2017 20:06:53 -0000

Provide interface to set behavior when FAULT pin is asserted.
When enabled force fan to 100% PWM duty cycle.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/max31785.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fb7b3f0..9b42ce5 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -37,6 +37,7 @@
 #define MAX31785_REG_FAN_SPEED_1		0x90
 #define MAX31785_REG_MFR_ID			0x99
 #define MAX31785_REG_MFR_MODEL			0x9a
+#define MAX31785_REG_MFR_FAULT_RESP		0xd9
 #define MAX31785_REG_MFR_FAN_CONFIG		0xf1
 #define MAX31785_REG_READ_FAN_PWM		0xf3
 
@@ -50,6 +51,9 @@
 /* Fan Status register bits */
 #define MAX31785_FAN_STATUS_FAULT_MASK		0x80
 
+/* Fault response register bits */
+#define MAX31785_FAULT_RESP_PIN_MONITOR		0x01
+
 /* Fan Command constants */
 #define MAX31785_FAN_COMMAND_PWM_RATIO		40
 
@@ -657,6 +661,68 @@ static int max31785_detect(struct i2c_client *client,
 	return 0;
 }
 
+static ssize_t fault_resp_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int rv;
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		return rv;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		return rv;
+
+	if (!strncmp(buf, "on", strlen("on"))) {
+		if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
+			rv |= MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				return rv;
+		}
+	} else if (!strncmp(buf, "off", strlen("off"))) {
+		if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
+			rv &= ~MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				return rv;
+		}
+	} else {
+		dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
+		return -EINVAL;
+	}
+	return count;
+}
+
+static ssize_t fault_resp_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int rv;
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		return rv;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		return rv;
+
+	if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
+		rv = sprintf(buf, "on\n");
+	else
+		rv = sprintf(buf, "off\n");
+
+	return rv;
+}
+
+static DEVICE_ATTR(fault_resp, 0644, fault_resp_show, fault_resp_store);
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -684,6 +750,10 @@ static int max31785_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
+	err = device_create_file(dev, &dev_attr_fault_resp);
+	if (err)
+		return err;
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 			client->name, data, max31785_groups);
 
-- 
1.8.2.2
