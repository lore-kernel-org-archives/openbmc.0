Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qnyTg4BB1zDq5k
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 03:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460913042153298.70107468242554;
 Sun, 17 Apr 2016 10:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Adjust ipmi device id to accept dbus
 versioning
Date: Sun, 17 Apr 2016 12:10:40 -0500
Message-Id: <1460913040-6713-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460913040-6713-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460913040-6713-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 17 Apr 2016 17:10:48 -0000

From: Chris Austen <austenc@us.ibm.com>

Before this the ipmi device id would return
ipmitool -Idbus  mc info

...
Firmware Revision         : 0.06

Now it will track the version that you get from the version property of
/org/openbmc/inventory/system/chassis/motherboard/bmc
i.e.
version = v0.6-19-gf363f61-dirty
           ^ ^ ^^          ^
           | |  |----------|-- additional details
           | |---------------- Minor
           |------------------ Major

Now... ipmitool -Idbus  mc info
...
Firmware Revision         : 0.06
...
Aux Firmware Rev Info     :
    0x00
    0x19
    0x00
    0x01

If there is no -dirty (or anything really after the last '-') will force
the aux details byte 4 to 0.  A 0 means the FW image was created without
any changes in the yocto build.
---
 apphandler.C | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index fc6c811..f382b35 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -91,21 +91,106 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
+typedef struct rev_t
+{
+    char major;
+    char minor;
+    uint8_t d[4];
+} rev_t;
+
+
+/* Currently only supports the vx.x-x-[-x] format Will return -1 if not in  */
+/* the format this routine knows how to parse                               */
+/* version = v0.6-19-gf363f61-dirty                                         */
+/*            ^ ^ ^^          ^                                             */
+/*            | |  |----------|-- additional details                        */
+/*            | |---------------- Minor                                     */
+/*            |------------------ Major                                     */
+/* Additional details : If the option group exists it will force Auxiliary  */
+/* Firmware Revision Information 4th byte to 1 indicating the build was     */
+/* derived with additional edits                                            */
+int convert_version(const char *p, rev_t *rev)
+{
+    char *s, *token;
+    char hexbyte[5];
+    int l;
+
+    if (*p != 'v')
+        return -1;
+    p++;
+
+    s = strdup(p);
+    token = strtok(s,".-");
+
+    rev->major = (int8_t) atoi(token);
+
+    token = strtok(NULL, ".-");
+    rev->minor = (int8_t) atoi(token);
+
+    // Capture the number of commits on top of the minor tag.
+    // I'm using BE format like the ipmi spec asked for
+    token = strtok(NULL,".-");
+    l = strlen(token);
+    if (l > 4)
+        l = 4;
+
+    memset(hexbyte,'0', 4);
+    memcpy(&hexbyte[4-l], token, l);
+    sscanf(&hexbyte[0], "%2hhX", &rev->d[0]);
+    sscanf(&hexbyte[2], "%2hhX", &rev->d[1]);
+
+    rev->d[2] = 0;
+
+    // commit number we skip
+    token = strtok(NULL,".-");
+
+    // Any value of the optional parameter forces it to 1
+    token = strtok(NULL,".-");
+        rev->d[3] = (token != NULL) ? 1 : 0;
+
+    free(s);
+    return 0;
+}
+
+#define DEVICE_FW1 2
+#define DEVICE_FW2 3
+#define DEVICE_AUX 11
+
 ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
+    const char  *busname = "org.openbmc.Inventory";
+    const char  *objname = "/org/openbmc/inventory/system/chassis/motherboard/bmc";
+    const char  *iface   = "org.openbmc.InventoryItem";
+    char *ver;
+    int r;
+    rev_t rev;
 
     // TODO:
     // This value is the IANA number assigned to "IBM Platform Firmware
     // Division", which is also used by our service processor.  We may want
     // a different number or at least a different version?
-    uint8_t str[] = {0x00, 0, 1, 1,2, 0xD, 0x41, 0xA7, 0x00, 0x43, 0x40};
+    uint8_t str[] = {0, 0, 0, 0, 2, 0xD, 0x41, 0xA7, 0x00, 0x43, 0x40, 0, 0, 0, 0};
 
     // Data length
     *data_len = sizeof(str);
 
+    r = sd_bus_get_property_string(bus,busname,objname,iface,"version", NULL, &ver);
+    if ( r < 0 ) {
+        fprintf(stderr, "Failed to obtain version property: %s\n", strerror(-r));
+    } else {
+        r = convert_version(ver, &rev);
+        if( r >= 0 ) {
+            // bit7 identifies state of SDR repository, hence the mask
+            str[DEVICE_FW1] |= 0x7F & rev.major;
+            str[DEVICE_FW2] = rev.minor;
+            memcpy(&str[DEVICE_AUX], rev.d, 4);
+        }
+    }
+
     // Pack the actual response
     memcpy(response, &str, *data_len);
     return rc;
@@ -408,9 +493,6 @@ void register_netfn_app_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_get_bt_capabilities);
 
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
-
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_RESET_WD);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_RESET_WD, NULL, ipmi_app_reset_watchdog);
 
-- 
2.7.1
