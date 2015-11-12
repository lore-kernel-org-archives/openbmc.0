Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7858A1A0835
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:06:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447323626643653.6129174461295;
 Thu, 12 Nov 2015 02:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ 06/10] fixed the parse error
Date: Thu, 12 Nov 2015 05:20:08 -0500
Message-Id: <1447323612-15427-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 11:06:26 -0000

From: adamliyi <adamliyi@msn.com>

---
 occ.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/occ.c b/occ.c
index 9f0a6c0..adf773b 100644
--- a/occ.c
+++ b/occ.c
@@ -46,6 +46,14 @@ typedef struct {
 	uint16_t value;
 } powr_sensor;
 
+typedef struct {
+	uint16_t curr_powercap;
+	uint16_t curr_powerreading;
+	uint16_t norm_powercap;
+	uint16_t max_powercap;
+	uint16_t min_powercap;
+	uint16_t user_powerlimit;
+} caps_sensor;
 
 typedef struct {
 	char sensor_type[5];
@@ -55,6 +63,7 @@ typedef struct {
 	uint8_t num_of_sensors;
 	occ_sensor *sensor;
 	powr_sensor *powr;
+	caps_sensor *caps;
 } sensor_data_block;
 
 typedef struct {
@@ -87,6 +96,7 @@ typedef struct {
 	uint16_t temp_block_id;	
 	uint16_t freq_block_id;	
 	uint16_t power_block_id;	
+	uint16_t caps_block_id;	
 } occ_response_t;
 
 static occ_response_t occ_resp;
@@ -390,7 +400,7 @@ static int parse_occ_response(char* d, occ_response_t* o)
 			}
 		}
 		else if (strcmp(o->data.blocks[b].sensor_type, "POWR") == 0) {
-/*
+			
 			o->data.blocks[b].powr =
 				kzalloc(sizeof(powr_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
 			
@@ -399,7 +409,7 @@ static int parse_occ_response(char* d, occ_response_t* o)
 				goto abort;
 			}
 			o->power_block_id = b;
-			for (s = 0; s< o->data.blocks[b].num_of_sensors; s++) {
+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
 				o->data.blocks[b].powr[s].sensor_id = d[dnum] << 8;
 				o->data.blocks[b].powr[s].sensor_id = o->data.blocks[b].powr[s].sensor_id | d[dnum+1];
 				o->data.blocks[b].powr[s].update_tag = d[dnum+2] << 24;
@@ -414,11 +424,45 @@ static int parse_occ_response(char* d, occ_response_t* o)
 				o->data.blocks[b].powr[s].value = o->data.blocks[b].powr[s].value | d[dnum+11];
 				
 				printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-					b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
+					b, s, o->data.blocks[b].powr[s].sensor_id, o->data.blocks[b].powr[s].value);
 				
 				dnum = dnum + o->data.blocks[b].sensor_length;
 			}
-*/
+		}
+		else if (strcmp(o->data.blocks[b].sensor_type, "CAPS") == 0) {
+			
+			o->data.blocks[b].caps =
+				kzalloc(sizeof(caps_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
+
+                        if (o->data.blocks[b].caps == NULL) {
+                                ret = -ENOMEM;
+                                goto abort;
+                        }
+                        o->caps_block_id = b;
+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
+				o->data.blocks[b].caps[s].curr_powercap = d[dnum] << 8;
+				o->data.blocks[b].caps[s].curr_powercap = o->data.blocks[b].caps[s].curr_powercap | d[dnum+1];
+				o->data.blocks[b].caps[s].curr_powerreading = d[dnum+2] << 8;
+				o->data.blocks[b].caps[s].curr_powerreading = o->data.blocks[b].caps[s].curr_powerreading | d[dnum+3];
+				o->data.blocks[b].caps[s].norm_powercap = d[dnum+4] << 8;
+				o->data.blocks[b].caps[s].norm_powercap = o->data.blocks[b].caps[s].norm_powercap | d[dnum+5];
+				o->data.blocks[b].caps[s].max_powercap = d[dnum+6] << 8;
+				o->data.blocks[b].caps[s].max_powercap = o->data.blocks[b].caps[s].max_powercap| d[dnum+7];
+				o->data.blocks[b].caps[s].min_powercap = d[dnum+8] << 8;
+				o->data.blocks[b].caps[s].min_powercap = o->data.blocks[b].caps[s].min_powercap| d[dnum+9];
+				o->data.blocks[b].caps[s].user_powerlimit = d[dnum+10] << 8;
+				o->data.blocks[b].caps[s].user_powerlimit = o->data.blocks[b].caps[s].user_powerlimit| d[dnum+11];
+
+				dnum = dnum + o->data.blocks[b].sensor_length;
+				printk("CAPS sensor #%d:\n", s);
+				printk("curr_powercap is %x \n", o->data.blocks[b].caps[s].curr_powercap);
+				printk("curr_powerreading is %x \n", o->data.blocks[b].caps[s].curr_powerreading);
+				printk("norm_powercap is %x \n", o->data.blocks[b].caps[s].norm_powercap);
+				printk("max_powercap is %x \n", o->data.blocks[b].caps[s].max_powercap);
+				printk("min_powercap is %x \n", o->data.blocks[b].caps[s].min_powercap);
+				printk("user_powerlimit is %x \n", o->data.blocks[b].caps[s].user_powerlimit);
+			}
+		
 		}
 		else {
       			printk("ERROR: sensor type %s not supported\n", o->data.blocks[b].sensor_type);
@@ -519,7 +563,7 @@ static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 		return -1;
 	}
 	
-	for (b = 8; b < num_bytes; b = b + 8) {
+	for (b = 8; b < num_bytes + 8; b = b + 8) {
 		//occ_getscomb(client, SCOM_OCC_SRAM_DATA, occ_data, b);
 		occ_getscomb(client, OCB_DATA, occ_data, b);
 #ifdef DUMP_RAW
-- 
2.6.3
