Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 07E4B1A034F
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435426654250.57669160766977;
 Tue, 24 Nov 2015 23:10:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/7] Remove unused variables and labels
Date: Wed, 25 Nov 2015 02:10:18 -0500
Message-Id: <1448435424-9067-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:30 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ipmid.C         | 6 ++----
 storageaddsel.C | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 440705c..f1f938c 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -233,7 +233,6 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
                          *ret_error) {
     int r = 0;
-    const char *msg = NULL;
     unsigned char sequence, netfn, lun, cmd;
     const void *request;
     size_t sz;
@@ -375,7 +374,6 @@ int main(int argc, char *argv[])
 {
     sd_bus_slot *slot = NULL;
     int r;
-    char *mode = NULL;
     unsigned long tvalue;
     int c;
 
@@ -458,7 +456,7 @@ finish:
 // step for mapping IPMI
 int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) {
 
-    char  *str1, *str2, *str3;
+    char  *str1;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
 
@@ -604,7 +602,7 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     dbus_interface_t a;
     int r;
     sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *reply = NULL, *m=NULL;
+    sd_bus_message *m=NULL;
 
     fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
diff --git a/storageaddsel.C b/storageaddsel.C
index 64b0e6a..345dfd5 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -136,7 +136,6 @@ int create_esel_description(const uint8_t *buffer, const char *sev, char **messa
 
 
 	ipmi_add_sel_request_t *p;
-	int r;
 	char *m;
 
 	p =  ( ipmi_add_sel_request_t *) buffer;
@@ -197,7 +196,6 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
         r = *pty;
     }
 
-finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
@@ -207,7 +205,7 @@ finish:
 
 
 void send_esel(uint16_t recordid) {
-	char *desc, *assoc, *ascii;
+	char *desc, *assoc;
 	const char *sev;
 	uint8_t *buffer = NULL;
 	char *path, *pathsent;
-- 
2.6.3
