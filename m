Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CA22B1A04D4
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431726279182.03946221048852;
 Wed, 21 Oct 2015 05:48:46 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 13/20] Print the dlopen failure for
 debugging
Date: Wed, 21 Oct 2015 07:48:14 -0500
Message-Id: <1445431701-8681-14-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
References: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:48:49 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index d0dfba8..3f697f1 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -37,7 +37,7 @@ std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 void hexdump(void *mem, size_t len)
 {
         unsigned int i, j;
-        
+
         for(i = 0; i < len + ((len % HEXDUMP_COLS) ? (HEXDUMP_COLS - len % HEXDUMP_COLS) : 0); i++)
         {
                 /* print offset */
@@ -45,7 +45,7 @@ void hexdump(void *mem, size_t len)
                 {
                         printf("0x%06x: ", i);
                 }
- 
+
                 /* print hex data */
                 if(i < len)
                 {
@@ -55,7 +55,7 @@ void hexdump(void *mem, size_t len)
                 {
                         printf("   ");
                 }
-                
+
                 /* print ASCII dump */
                 if(i % HEXDUMP_COLS == (HEXDUMP_COLS - 1))
                 {
@@ -67,7 +67,7 @@ void hexdump(void *mem, size_t len)
                                 }
                                 else if(isprint(((char*)mem)[j])) /* printable char */
                                 {
-                                        putchar(0xFF & ((char*)mem)[j]);        
+                                        putchar(0xFF & ((char*)mem)[j]);
                                 }
                                 else /* other char */
                                 {
@@ -150,11 +150,11 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
     // Response message from the plugin goes into a byte post the base response
     rc = (handler_and_context.first) (netfn, cmd, request, respo,
                                       data_len, handler_and_context.second);
- 
+
     // Now copy the return code that we got from handler and pack it in first
     // byte.
     memcpy(response, &rc, IPMI_CC_LEN);
- 
+
     // Data length is now actual data + completion code.
     *data_len = *data_len + IPMI_CC_LEN;
 
@@ -191,7 +191,7 @@ static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned ch
         fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
         return -1;
     }
-   
+
     r = sd_bus_message_append_array(m, 'y', buf, len);
     if (r < 0) {
         fprintf(stderr, "Failed to add the string of response bytes: %s\n", strerror(-r));
@@ -210,7 +210,7 @@ static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned ch
     r = sd_bus_message_read(reply, "x", &pty);
 #ifdef __IPMI_DEBUG__
     printf("RC from the ipmi dbus method :%d \n", pty);
-#endif    
+#endif
     if (r < 0) {
        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
 
@@ -223,7 +223,7 @@ static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned ch
 
 #ifdef __IPMI_DEBUG__
     printf("%d : %s\n", __LINE__, __PRETTY_FUNCTION__ );
-#endif    
+#endif
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 
 }
@@ -258,11 +258,11 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     printf("Seq 0x%02x, NetFn 0x%02x, CMD: 0x%02x \n", sequence, netfn, cmd);
     hexdump((void*)request, sz);
 
-    // Allow the length field to be used for both input and output of the 
+    // Allow the length field to be used for both input and output of the
     // ipmi call
     resplen = sz;
 
-    // Now that we have parsed the entire byte array from the caller 
+    // Now that we have parsed the entire byte array from the caller
     // we can call the ipmi router to do the work...
     r = ipmi_netfn_router(netfn, cmd, (void *)request, (void *)response, &resplen);
     if(r != 0)
@@ -300,7 +300,7 @@ int handler_select(const struct dirent *entry)
     if(strstr(entry->d_name, IPMI_PLUGIN_EXTN))
     {
         // It is possible that .so could be anywhere in the string but unlikely
-        // But being careful here. Get the base address of the string, move 
+        // But being careful here. Get the base address of the string, move
         // until end and come back 3 steps and that gets what we need.
         strcpy(dname_copy, (entry->d_name + strlen(entry->d_name)-strlen(IPMI_PLUGIN_EXTN)));
         if(strcmp(dname_copy, IPMI_PLUGIN_EXTN) == 0)
@@ -312,7 +312,7 @@ int handler_select(const struct dirent *entry)
 }
 
 // This will do a dlopen of every .so in ipmi_lib_path and will dlopen everything so that they will
-// register a callback handler 
+// register a callback handler
 void ipmi_register_callback_handlers(const char* ipmi_lib_path)
 {
     // For walking the ipmi_lib_path
@@ -331,11 +331,11 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
     {
         // 1: Open ipmi_lib_path. Its usually "/usr/lib/phosphor-host-ipmid"
         // 2: Scan the directory for the files that end with .so
-        // 3: For each one of them, just do a 'dlopen' so that they register 
+        // 3: For each one of them, just do a 'dlopen' so that they register
         //    the handlers for callback routines.
 
         std::string handler_fqdn = ipmi_lib_path;
-        
+
         // Append a "/" since we need to add the name of the .so. If there is
         // already a .so, adding one more is not any harm.
         handler_fqdn += "/";
@@ -350,8 +350,8 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
             lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
             if(lib_handler == NULL)
             {
-                fprintf(stderr,"ERROR opening:[%s]\n",handler_fqdn.c_str());
-                dlerror();
+                fprintf(stderr,"ERROR opening [%s]: %s\n",
+                        handler_fqdn.c_str(), dlerror());
             }
             // Wipe the memory allocated for this particular entry.
             free(handler_list[num_handlers]);
@@ -381,7 +381,7 @@ int main(int argc, char *argv[])
     for(auto& iter : g_ipmid_router_map)
     {
         ipmi_fn_cmd_t fn_and_cmd = iter.first;
-        printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);  
+        printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);
     }
 #endif
 
-- 
2.6.0
