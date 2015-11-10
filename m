Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3F7C51A027B
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 05:20:19 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447179612483857.4296188616183;
 Tue, 10 Nov 2015 10:20:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] eeprom read CLI
Date: Tue, 10 Nov 2015 13:20:10 -0500
Message-Id: <1447179610-896-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447179610-896-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447179610-896-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 Nov 2015 18:20:19 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile        | 20 ++++++++----
 argument.C      | 59 +++++++++++++++++++++++++++++++++++
 argument.H      | 27 ++++++++++++++++
 readeeprom.C    | 45 ++++++++++++++++++++++++++
 strgfnhandler.C | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 writefrudata.C  | 90 ----------------------------------------------------
 writefrudata.H  |  1 +
 7 files changed, 243 insertions(+), 96 deletions(-)
 create mode 100644 argument.C
 create mode 100644 argument.H
 create mode 100644 readeeprom.C
 create mode 100644 strgfnhandler.C

diff --git a/Makefile b/Makefile
index f56eba3..22446e7 100644
--- a/Makefile
+++ b/Makefile
@@ -1,23 +1,31 @@
-LIBS += libwritefrudata.so
-libwritefrudata.so_OBJS += frup.o writefrudata.o
-libwritefrudata.so_NEEDED += libsystemd
+LIBS += libstrgfnhandler.so libwritefrudata.so
+libwritefrudata.so_OBJS  += frup.o writefrudata.o
+libstrgfnhandler.so_OBJS += strgfnhandler.o
+
+EXES += phosphor-read-eeprom
+
+phosphor-read-eeprom_OBJS  += readeeprom.o argument.o
+phosphor-read-eeprom_LIBS  += writefrudata
+libstrgfnhandler.so_EXTRA_LIBS  += writefrudata
+libwritefrudata.so_NEEDED  += libsystemd
 
 #### -----------------------------------------------------------------------####
 #                                                                              #
 ##                       Compilare Regulas Sequi                              ##
 #                                                                              #
 #### -----------------------------------------------------------------------####
-OPTFLAGS ?= -O3 -g -pipe
+OPTFLAGS ?= -O3 -g -pipe -G -K
 CFLAGS ?= $(OPTFLAGS)
 CXXFLAGS ?= $(OPTFLAGS)
 CFLAGS += -Wall -flto -fPIC
 CXXFLAGS += --std=gnu++14 -Wall -flto -fPIC
 
 __PKG_CONFIG = $(if $1,$(shell pkg-config $2 $1))
+__EXTRA_LIB_RESOLV = $(if $1,-l$1)
 
 define __BUILD_EXE
 $1 : $$($1_OBJS) $$(LIBS)
-		$$(LINK.cpp) -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--libs)
+		$$(LINK.cpp) -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
 
 $(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
 
@@ -28,7 +36,7 @@ $(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
 
 define __BUILD_LIB
 $1 : $$($1_OBJS)
-		$$(LINK.cpp) -shared -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--libs)
+		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$($1_EXTRA_LIBS)) $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
 
 $(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
 
diff --git a/argument.C b/argument.C
new file mode 100644
index 0000000..190573f
--- /dev/null
+++ b/argument.C
@@ -0,0 +1,59 @@
+#include <iostream>
+#include <iterator>
+#include <algorithm>
+#include <cassert>
+#include "argument.H"
+
+ArgumentParser::ArgumentParser(int argc, char** argv)
+{
+    int option = 0;
+    while(-1 != (option = getopt_long(argc, argv, optionstr, options, NULL)))
+    {
+        if ((option == '?') || (option == 'h'))
+        {
+            usage(argv);
+            exit(-1);
+        }
+
+        auto i = &options[0];
+        while ((i->val != option) && (i->val != 0)) ++i;
+
+        if (i->val)
+            arguments[i->name] = (i->has_arg ? optarg : true_string);
+    }
+}
+
+const std::string& ArgumentParser::operator[](const std::string& opt)
+{
+    auto i = arguments.find(opt);
+    if (i == arguments.end())
+    {
+        return empty_string;
+    }
+    else
+    {
+        return i->second;
+    }
+}
+
+void ArgumentParser::usage(char** argv)
+{
+    std::cerr << "Usage: " << argv[0] << " [options]" << std::endl;
+    std::cerr << "Options:" << std::endl;
+    std::cerr << "    --eeprom=<eeprom file path>      Absolute file name of eeprom"
+              << std::endl;
+    std::cerr << "    --help      display help"
+			  << std::endl;
+}
+
+const option ArgumentParser::options[] =
+{
+    { "eeprom",   required_argument,  NULL, 'e' },
+    { "help",     no_argument,        NULL, 'h' },
+    { 0, 0, 0, 0},
+};
+
+const char* ArgumentParser::optionstr = "e:?h";
+
+const std::string ArgumentParser::true_string = "true";
+const std::string ArgumentParser::empty_string = "";
diff --git a/argument.H b/argument.H
new file mode 100644
index 0000000..bd3b0b2
--- /dev/null
+++ b/argument.H
@@ -0,0 +1,27 @@
+#ifndef __ARGUMENT_H
+#define __ARGUMENT_H
+#include <getopt.h>
+#include <map>
+#include <string>
+class ArgumentParser
+{
+    public:
+        ArgumentParser(int argc, char** argv);
+        const std::string& operator[](const std::string& opt);
+
+        static void usage(char** argv);
+
+        static const std::string true_string;
+        static const std::string empty_string;
+
+    private:
+        std::map<const std::string, std::string> arguments;
+
+        static const option options[];
+        static const char* optionstr;
+
+    private:
+        ArgumentParser() {};
+};
+
+#endif
diff --git a/readeeprom.C b/readeeprom.C
new file mode 100644
index 0000000..ccda2b0
--- /dev/null
+++ b/readeeprom.C
@@ -0,0 +1,45 @@
+#include <iostream>
+#include <memory>
+#include "argument.H"
+#include "writefrudata.H"
+
+// FRU ID of VPD contaied in BMC accessible EEPROM
+#define BARRELEYE_IO_BOARD	 	 64
+
+static void exit_with_error(const char* err, char** argv)
+{
+    ArgumentParser::usage(argv);
+    std::cerr << std::endl;
+    std::cerr << "ERROR: " << err << std::endl;
+    exit(-1);
+}
+
+//--------------------------------------------------------------------------
+// This gets called by udev monitor soon after seeing hog plugs for EEPROMS. 
+//--------------------------------------------------------------------------
+int main(int argc, char **argv)
+{
+	int rc = 0;
+
+    uint8_t fruid_io_board = BARRELEYE_IO_BOARD;
+
+	// Read the arguments.
+	auto cli_options = std::make_unique<ArgumentParser>(argc, argv);
+	
+	// Parse out each argument.
+	auto eeprom_file = (*cli_options)["eeprom"];
+    if (eeprom_file == ArgumentParser::empty_string)
+    {
+		// User has not passed in the appropriate argument value
+        exit_with_error("eeprom data not found.", argv);
+    }
+
+    // Finished getting options out, so release the parser.
+    cli_options.release();
+
+	// Now that we have the file that contains the eeprom data, go read it and
+	// update the Inventory DB.
+    rc = ipmi_validate_fru_area(fruid_io_board, eeprom_file.c_str());
+
+    return rc;
+}
diff --git a/strgfnhandler.C b/strgfnhandler.C
new file mode 100644
index 0000000..f2bfecc
--- /dev/null
+++ b/strgfnhandler.C
@@ -0,0 +1,97 @@
+#include <host-ipmid/ipmid-api.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include "writefrudata.H"
+
+void register_netfn_storage_write_fru() __attribute__((constructor));
+
+///-------------------------------------------------------
+// Called by IPMI netfn router for write fru data command
+//--------------------------------------------------------
+ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    FILE *fp = NULL;
+    char fru_file_name[16] = {0};
+    uint8_t offset = 0;
+    uint16_t len = 0;
+    ipmi_ret_t rc = IPMI_CC_INVALID;
+    const char *mode = NULL;
+
+    // From the payload, extract the header that has fruid and the offsets
+    write_fru_data_t *reqptr = (write_fru_data_t*)request;
+
+    // Maintaining a temporary file to pump the data
+    sprintf(fru_file_name, "%s%02x", "/tmp/ipmifru", reqptr->frunum);
+
+    offset = ((uint16_t)reqptr->offsetms) << 8 | reqptr->offsetls;
+
+    // Length is the number of request bytes minus the header itself.
+    // The header contains an extra byte to indicate the start of
+    // the data (so didn't need to worry about word/byte boundaries)
+    // hence the -1...
+    len = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
+
+    // On error there is no response data for this command.
+    *data_len = 0;
+    
+#ifdef __IPMI__DEBUG__
+    printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
+            fru_file_name, offset, len);
+#endif
+
+
+    if( access( fru_file_name, F_OK ) == -1 ) {
+        mode = "wb";
+    } else {
+        mode = "rb+";
+    }
+
+    if ((fp = fopen(fru_file_name, mode)) != NULL)
+    {
+        if(fseek(fp, offset, SEEK_SET))
+        {
+            perror("Error:");
+            fclose(fp);
+            return rc;
+        }
+    
+        if(fwrite(&reqptr->data, len, 1, fp) != 1)
+        {
+            perror("Error:");
+            fclose(fp);
+            return rc;
+        }
+    
+        fclose(fp);
+    } 
+    else 
+    {
+        fprintf(stderr, "Error trying to write to fru file %s\n",fru_file_name);
+        return rc;
+    }
+
+
+    // If we got here then set the resonse byte
+    // to the number of bytes written
+    memcpy(response, &len, 1);
+    *data_len = 1;
+    rc = IPMI_CC_OK;
+
+    // We received some bytes. It may be full or partial. Send a valid
+    // FRU file to the inventory controller on DBus for the correct number
+    ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
+
+    return rc;
+}
+
+//-------------------------------------------------------
+// Registering WRITE FRU DATA command handler with daemon
+//-------------------------------------------------------
+void register_netfn_storage_write_fru()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
+}
diff --git a/writefrudata.C b/writefrudata.C
index 69bbb47..587ef66 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -1,4 +1,3 @@
-#include <host-ipmid/ipmid-api.h>
 #include <vector>
 #include <stdlib.h>
 #include <dlfcn.h>
@@ -9,9 +8,6 @@
 #include <systemd/sd-bus.h>
 #include <unistd.h>
 
-
-void register_netfn_storage_write_fru() __attribute__((constructor));
-
 // Needed to be passed into fru parser alorithm
 typedef std::vector<fru_area_t> fru_area_vec_t;
 
@@ -471,89 +467,3 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name)
     return rc;
 }
 
-///-------------------------------------------------------
-// Called by IPMI netfn router for write fru data command
-//--------------------------------------------------------
-ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
-                              ipmi_data_len_t data_len, ipmi_context_t context)
-{
-    FILE *fp = NULL;
-    char fru_file_name[16] = {0};
-    uint8_t offset = 0;
-    uint16_t len = 0;
-    ipmi_ret_t rc = IPMI_CC_INVALID;
-    const char *mode = NULL;
-
-    // From the payload, extract the header that has fruid and the offsets
-    write_fru_data_t *reqptr = (write_fru_data_t*)request;
-
-    // Maintaining a temporary file to pump the data
-    sprintf(fru_file_name, "%s%02x", "/tmp/ipmifru", reqptr->frunum);
-
-    offset = ((uint16_t)reqptr->offsetms) << 8 | reqptr->offsetls;
-
-    // Length is the number of request bytes minus the header itself.
-    // The header contains an extra byte to indicate the start of
-    // the data (so didn't need to worry about word/byte boundaries)
-    // hence the -1...
-    len = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
-
-    // On error there is no response data for this command.
-    *data_len = 0;
-    
-#ifdef __IPMI__DEBUG__
-    printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
-            fru_file_name, offset, len);
-#endif
-
-
-    if( access( fru_file_name, F_OK ) == -1 ) {
-        mode = "wb";
-    } else {
-        mode = "rb+";
-    }
-
-    if ((fp = fopen(fru_file_name, mode)) != NULL)
-    {
-        if(fseek(fp, offset, SEEK_SET))
-        {
-            perror("Error:");
-            fclose(fp);
-            return rc;
-        }
-    
-        if(fwrite(&reqptr->data, len, 1, fp) != 1)
-        {
-            perror("Error:");
-            fclose(fp);
-            return rc;
-        }
-    
-        fclose(fp);
-    } 
-    else 
-    {
-        fprintf(stderr, "Error trying to write to fru file %s\n",fru_file_name);
-        return rc;
-    }
-
-
-    // If we got here then set the resonse byte
-    // to the number of bytes written
-    memcpy(response, &len, 1);
-    *data_len = 1;
-    rc = IPMI_CC_OK;
-
-    // We received some bytes. It may be full or partial. Send a valid
-    // FRU file to the inventory controller on DBus for the correct number
-    ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
-
-    return rc;
-}
-
-void register_netfn_storage_write_fru()
-{
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
-}
diff --git a/writefrudata.H b/writefrudata.H
index 42924a3..ac0bdda 100644
--- a/writefrudata.H
+++ b/writefrudata.H
@@ -50,4 +50,5 @@ typedef struct
 #define IPMI_FRU_HDR_CRC_OFFSET  offsetof(struct common_header, crc)
 #define IPMI_EIGHT_BYTES         8
 
+int ipmi_validate_fru_area(const uint8_t, const char *);
 #endif
-- 
2.6.3
