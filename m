Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZck6hQYzF0Zy
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:47:34 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BIhkkv115619
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:33 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fec2s3xud-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:32 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 13:47:32 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 13:47:29 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BIlTSO49938646; Thu, 11 Jan 2018 18:47:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52D10112040;
 Thu, 11 Jan 2018 13:45:39 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 0AB0C112034;
 Thu, 11 Jan 2018 13:45:38 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 5/5] hwmon (pmbus): cffps: Add led class device
 for power supply fault led
Date: Thu, 11 Jan 2018 12:47:17 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011118-0008-0000-0000-000002BE1E61
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973566; UDB=6.00493310; IPR=6.00753511; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 18:47:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011118-0009-0000-0000-000037E09406
Message-Id: <1515696437-10508-6-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110255
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 18:47:35 -0000

This power supply device doesn't correctly manage it's own fault led.
Add an led class device and register it so that userspace can manage
power supply fault led as necessary.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 96 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 503f4c5..28757cf 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c/pmbus.h>
 #include <linux/jiffies.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -25,6 +26,7 @@
 #define CFFPS_CCIN_CMD				0xBD
 #define CFFPS_FW_CMD_START			0xFA
 #define CFFPS_FW_NUM_BYTES			4
+#define CFFPS_SYS_CONFIG_CMD			0xDA
 
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
@@ -39,6 +41,11 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+#define CFFPS_LED_BLINK				BIT(0)
+#define CFFPS_LED_ON				BIT(1)
+#define CFFPS_LED_OFF				BIT(2)
+#define CFFPS_BLINK_RATE_MS			250
+
 enum {
 	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
 	CFFPS_DEBUGFS_FRU,
@@ -63,6 +70,10 @@ struct ibm_cffps {
 	struct ibm_cffps_input_history input_history;
 
 	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
+
+	char led_name[32];
+	u8 led_state;
+	struct led_classdev led;
 };
 
 #define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
@@ -258,6 +269,69 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 	return rc;
 }
 
+static void ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
+					 enum led_brightness brightness)
+{
+	int rc;
+	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
+
+	if (brightness == LED_OFF) {
+		psu->led_state = CFFPS_LED_OFF;
+	} else {
+		brightness = LED_FULL;
+		if (psu->led_state != CFFPS_LED_BLINK)
+			psu->led_state = CFFPS_LED_ON;
+	}
+
+	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
+				       psu->led_state);
+	if (rc < 0)
+		return;
+
+	led_cdev->brightness = brightness;
+}
+
+static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
+				   unsigned long *delay_on,
+				   unsigned long *delay_off)
+{
+	int rc;
+	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
+
+	psu->led_state = CFFPS_LED_BLINK;
+
+	if (led_cdev->brightness == LED_OFF)
+		return 0;
+
+	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
+				       CFFPS_LED_BLINK);
+	if (rc < 0)
+		return rc;
+
+	*delay_on = CFFPS_BLINK_RATE_MS;
+	*delay_off = CFFPS_BLINK_RATE_MS;
+
+	return 0;
+}
+
+static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
+{
+	int rc;
+	struct i2c_client *client = psu->client;
+	struct device *dev = &client->dev;
+
+	snprintf(psu->led_name, sizeof(psu->led_name), "%s-%02x", client->name,
+		 client->addr);
+	psu->led.name = psu->led_name;
+	psu->led.max_brightness = LED_FULL;
+	psu->led.brightness_set = ibm_cffps_led_brightness_set;
+	psu->led.blink_set = ibm_cffps_led_blink_set;
+
+	rc = devm_led_classdev_register(dev, &psu->led);
+	if (rc)
+		dev_warn(dev, "failed to register led class: %d\n", rc);
+}
+
 static struct pmbus_driver_info ibm_cffps_info = {
 	.pages = 1,
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
@@ -286,6 +360,20 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	if (rc)
 		return rc;
 
+	/*
+	 * Don't fail the probe if there isn't enough memory for leds and
+	 * debugfs.
+	 */
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu->client = client;
+	mutex_init(&psu->input_history.update_lock);
+	psu->input_history.last_update = jiffies - HZ;
+
+	ibm_cffps_create_led_class(psu);
+
 	/* Don't fail the probe if we can't create debugfs */
 	debugfs = pmbus_get_debugfs_dir(client);
 	if (!debugfs)
@@ -295,14 +383,6 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	if (!ibm_cffps_dir)
 		return 0;
 
-	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
-	if (!psu)
-		return 0;
-
-	psu->client = client;
-	mutex_init(&psu->input_history.update_lock);
-	psu->input_history.last_update = jiffies - HZ;
-
 	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
 		psu->debugfs_entries[i] = i;
 
-- 
1.8.3.1
