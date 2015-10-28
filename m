Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 246061A09A7
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 09:04:31 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446069867127437.64903915216144;
 Wed, 28 Oct 2015 15:04:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 3/3] Allow esels to be sent to dbus
 event log switched to find_if vectoring moved const structure to dynamic
 length
Date: Wed, 28 Oct 2015 17:04:20 -0500
Message-Id: <1446069860-19280-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446069860-19280-1-git-send-email-patches@stwcx.xyz>
References: <1446069860-19280-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 22:04:32 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile         |  17 +++-
 ipmid.C          |   6 +-
 ipmid.H          |   5 ++
 storageaddsel.C  | 255 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 storageaddsel.h  |   3 +
 storagehandler.C |  24 +++---
 storagehandler.h |  12 +++
 testaddsel.C     | 107 +++++++++++++++++++++++
 8 files changed, 410 insertions(+), 19 deletions(-)
 create mode 100644 storageaddsel.C
 create mode 100644 storageaddsel.h
 create mode 100644 testaddsel.C

diff --git a/Makefile b/Makefile
index 1f2c7aa..a91328e 100755
--- a/Makefile
+++ b/Makefile
@@ -2,23 +2,31 @@ CXX ?= $(CROSS_COMPILE)g++
 
 TESTER = testit
 
+TESTADDSEL = testaddsel
+
 DAEMON = ipmid
 DAEMON_OBJ  = $(DAEMON).o
+
+
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
               dcmihandler.o    \
               ipmisensor.o     \
+              storageaddsel.o  \
 
 
+TESTADDSEL_OBJ = $(TESTADDSEL).o \
+                 storageaddsel.o
+
 TESTER_OBJ = ipmisensor.o 	   \
-			 testit.o
+	     testit.o
 
 LIB_APP     = libapphandler.so
 INSTALLED_LIBS += $(LIB_APP)
 INSTALLED_HEADERS = ipmid-api.h
 
-INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
+INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
 
@@ -30,7 +38,7 @@ LIBDIR ?= /usr/lib
 all: $(DAEMON) $(LIB_APP) $(TESTER)
 
 %.o: %.C
-	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	$(CXX) -std=c++14 -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
 
 $(LIB_APP): $(LIB_APP_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
@@ -44,6 +52,9 @@ $(TESTER): $(TESTER_OBJ)
 clean:
 	rm -f $(DAEMON) $(TESTER) *.o *.so
 
+$(TESTADDSEL): $(TESTADDSEL_OBJ)
+	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
+		
 install:
 		install -m 0755 -d $(DESTDIR)$(SBINDIR)
 		install -m 0755 ipmid $(DESTDIR)$(SBINDIR)
diff --git a/ipmid.C b/ipmid.C
index 6514849..11bd53e 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,7 @@
 
 
 sd_bus *bus = NULL;
+FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
 // Channel that is used for OpenBMC Barreleye
 const char * DBUS_NAME = "org.openbmc.HostIpmi";
@@ -440,7 +441,6 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
 
     int r;
 
-
     r = sd_bus_message_new_method_call(bus,&m,interface->bus,interface->path,"org.freedesktop.DBus.Properties","Get");
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
@@ -477,6 +477,7 @@ final:
     return r;
 }
 
+
 // Use a lookup table to find the interface name of a specific sensor
 // This will be used until an alternative is found.  this is the first
 // step for mapping IPMI
@@ -522,9 +523,6 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
 
     interface->sensornumber = num;
 
-    printf("%s\n", str2);
-
-
 final:
 
     sd_bus_error_free(&error);
diff --git a/ipmid.H b/ipmid.H
index 1cfe4c3..d6851db 100755
--- a/ipmid.H
+++ b/ipmid.H
@@ -1,6 +1,8 @@
 #ifndef __HOST_IPMID_IPMI_H__
 #define __HOST_IPMID_IPMI_H__
 #include "ipmid-api.h"
+#include <stdio.h>
+#include <stdint.h>
 
 // When the requester sends in a netfn and a command along with data, this
 // function will look for registered handlers that will handle that [netfn,cmd]
@@ -16,4 +18,7 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 // needs 1 byte for the length field. 
 #define MAX_IPMI_BUFFER 63
 
+
+extern FILE *ipmiio, *ipmidbus, *ipmicmddetails;
+
 #endif
diff --git a/storageaddsel.C b/storageaddsel.C
new file mode 100644
index 0000000..9aefe42
--- /dev/null
+++ b/storageaddsel.C
@@ -0,0 +1,255 @@
+#include <stdint.h>
+#include <cstdlib>
+#include <cstring>
+#include <fstream>
+#include <iostream>
+#include <algorithm>
+#include <vector>
+#include <memory>
+#include <systemd/sd-bus.h>
+
+#include "ipmid.H"
+#include "storagehandler.h"
+#include "sensorhandler.h"
+
+using namespace std;
+
+extern int find_openbmc_path(const char *, const uint8_t , dbus_interface_t *);
+
+
+//////////////////////////
+struct esel_section_headers_t {
+	uint8_t sectionid[2];
+	uint8_t sectionlength[2];
+	uint8_t version;
+	uint8_t subsectiontype;
+	uint8_t compid;
+};
+
+struct severity_values_t {
+	uint8_t type;
+	const char *description;
+};
+
+
+const std::vector<severity_values_t> g_sev_desc = {
+	{0x10, "recoverable error"},
+	{0x20, "predictive error"},
+	{0x40, "unrecoverable error"},
+	{0x50, "critical error"},
+	{0x60, "error from a diagnostic test"},
+	{0x70, "recovered symptom "},
+	{0xFF, "Unknown"},
+};
+
+const char* sev_lookup(uint8_t n) {
+	auto i = std::find_if(std::begin(g_sev_desc), std::end(g_sev_desc),
+	                      [n](auto p){ return p.type == n; });
+	return i->description;
+}
+
+
+
+
+int find_sensor_type_string(uint8_t sensor_number, char **s) {
+
+	dbus_interface_t a;
+	const char *p;
+	char r;
+
+	r = find_openbmc_path("SENSOR", sensor_number, &a);
+
+	if ((r < 0) || (a.bus[0] == 0)) {
+		// Just make a generic message for errors that 
+		// occur on sensors that dont exist
+		asprintf(s, "Unknown Sensor (0x%02x)", sensor_number);
+	} else {
+
+		if ((p = strrchr (a.path, '/')) == NULL) {
+			p = "/Unknown Sensor";
+		}
+
+		asprintf(s, "%s", p+1);
+	}
+
+	return 0;
+}
+
+
+size_t getfilestream(const char *fn, uint8_t **buffer) {
+
+	FILE *fp;
+	size_t size = 0;
+
+	if ((fp = fopen(fn, "rb")) != NULL) {
+
+		fseek(fp, 0, SEEK_END);
+		size = ftell(fp);
+		fseek(fp, 0, SEEK_SET);
+
+		size = 0x100;
+
+		*buffer = new uint8_t [size];
+
+		fread(*buffer, 1, size, fp);
+		fclose(fp);
+	}
+
+	return size;
+}
+
+
+const char *create_esel_severity(const uint8_t *buffer) {
+
+	uint8_t severity;
+	// Dive in to the IBM log to find the severity
+	severity = (0xF0  & buffer[0x4A]);
+
+	return sev_lookup(severity);
+}
+
+int create_esel_association(const uint8_t *buffer, char **m) {
+
+	ipmi_add_sel_request_t *p;
+	dbus_interface_t dbusint;
+	uint8_t sensor;
+	
+	p = ( ipmi_add_sel_request_t *) buffer;
+	
+	sensor = p->sensornumber;
+
+	find_openbmc_path("SENSOR", sensor, &dbusint);
+
+	if (strlen(dbusint.path) < 1) {
+		printf("Sensor not found\n");
+		snprintf(dbusint.path, sizeof(dbusint.path), "0x%x", sensor);
+	}
+
+	asprintf(m, "%s", dbusint.path);
+
+	return 0;
+}
+
+
+
+int create_esel_description(const uint8_t *buffer, const char *sev, char **message) {
+
+
+	ipmi_add_sel_request_t *p;
+	int r;
+	char *m;
+
+	p =  ( ipmi_add_sel_request_t *) buffer;
+	
+	find_sensor_type_string(p->sensornumber,&m);
+
+	asprintf(message, "A %s has experienced a %s", m, sev );
+	
+	free(m);
+
+	return 0;
+}
+
+
+int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {
+
+	sd_bus *mbus = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+    uint16_t *pty;
+    int r;
+
+
+
+    /* Connect to system bus */
+    r = sd_bus_open_system(&mbus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n",
+                strerror(-r));
+        goto finish;
+    }
+    r = sd_bus_message_new_method_call(mbus,&m,
+    									"org.openbmc.records.events", 
+    									"/org/openbmc/records/events",
+    									"org.openbmc.recordlog",
+    									"acceptHostMessage");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
+        return -1;
+    }
+    
+    r = sd_bus_message_append(m, "sss", desc, sev, details);
+    if (r < 0) {
+        fprintf(stderr, "Failed add the message strings : %s\n", strerror(-r));
+        return -1;
+    }
+
+    r = sd_bus_message_append_array(m, 'y', debug, debuglen);
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
+        return -1;
+    }
+
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(mbus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        return -1;
+    }
+
+    r = sd_bus_message_read(reply, "q", &pty);
+    if (r < 0) {
+       fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+    }
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
+    sd_bus_unref(mbus);
+
+    return r;
+
+}
+
+
+void send_esel(uint16_t recordid) {
+	char *desc, *assoc, *ascii;
+	const char *sev;
+	uint8_t *buffer = NULL;
+	char *path;
+	size_t sz;
+
+	uint8_t hack[] = {0x30, 0x32, 0x34};
+
+	asprintf(&path,"%s%04x", "/tmp/esel", recordid);
+
+	sz = getfilestream(path, &buffer);
+
+	if (sz == 0) { 
+		printf("Error file does not exist %d\n",__LINE__);
+		free(path);
+		return;
+	}
+
+
+	sev = create_esel_severity(buffer);
+
+	create_esel_association(buffer, &assoc);
+
+	create_esel_description(buffer, sev, &desc);
+	
+
+	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
+	// I cant send extended ascii chars.  So 0,2,4 for now...
+	send_esel_to_dbus(desc, sev, assoc, hack, 3);
+	
+
+	free(path);
+	free(assoc);
+	free(desc);
+
+	delete[] buffer;
+
+	return;
+}
\ No newline at end of file
diff --git a/storageaddsel.h b/storageaddsel.h
new file mode 100644
index 0000000..7535208
--- /dev/null
+++ b/storageaddsel.h
@@ -0,0 +1,3 @@
+#include <stdint.h>
+
+void send_esel(uint16_t recordid) ;
\ No newline at end of file
diff --git a/storagehandler.C b/storagehandler.C
index 659fff5..1101d85 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -1,9 +1,11 @@
-#include "storagehandler.h"
-#include "ipmid-api.h"
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
 
+#include "storagehandler.h"
+#include "storageaddsel.h"
+#include "ipmid-api.h"
+
 void register_netfn_storage_functions() __attribute__((constructor));
 
 
@@ -138,6 +140,7 @@ ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     printf("IPMI Handling RESERVE-SEL 0x%04x\n", g_sel_reserve);
 
+
     *data_len = sizeof(g_sel_reserve);
 
     // Pack the actual response
@@ -146,30 +149,27 @@ ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-
 ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
 
     ipmi_ret_t rc = IPMI_CC_OK;
+    ipmi_add_sel_request_t *p = (ipmi_add_sel_request_t*) request;
+    uint16_t recordid;
+
+    recordid = ((uint16_t)p->eventdata[1] << 8) | p->eventdata[2];
 
-    printf("IPMI Handling ADD-SEL \n");
+    printf("IPMI Handling ADD-SEL for record 0x%04x\n", recordid);
 
     *data_len = sizeof(g_sel_reserve);
 
     // Pack the actual response
-    memcpy(response, &g_sel_reserve, *data_len);
+    memcpy(response, &recordid, 2);
 
     // TODO This code should grab the completed partial esel located in 
     // the /tmp/esel0100 file and commit it to the error log handler.  
-
-
-    // TODO I advanced the sel reservation number so next time HB asks
-    // for a reservation they get a new number.  This tech may change 
-    // based on how the HB team currently uses sel reservations but
-    // for now provide the ability to get new reservations 
-    g_sel_reserve++;
+    send_esel(recordid);
 
     return rc;
 }
diff --git a/storagehandler.h b/storagehandler.h
index 56c1a8b..5af7efe 100644
--- a/storagehandler.h
+++ b/storagehandler.h
@@ -13,4 +13,16 @@ enum ipmi_netfn_storage_cmds
 
 };
 
+struct ipmi_add_sel_request_t {
+
+	uint8_t recordid[2];
+	uint8_t recordtype;
+	uint8_t timestampe[4];
+	uint8_t generatorid[2];
+	uint8_t evmrev;
+	uint8_t sensortype;
+	uint8_t sensornumber;
+	uint8_t eventdir;
+	uint8_t eventdata[3];
+};
 #endif
diff --git a/testaddsel.C b/testaddsel.C
new file mode 100644
index 0000000..202200a
--- /dev/null
+++ b/testaddsel.C
@@ -0,0 +1,107 @@
+#include <stdlib.h>
+#include <limits.h>
+#include <stdio.h>
+#include <errno.h>
+#include <stdint.h>
+#include <systemd/sd-bus.h>
+#include "sensorhandler.h"
+
+
+extern void send_esel(uint16_t recordid);
+
+sd_bus *bus = NULL;
+
+// Use a lookup table to find the interface name of a specific sensor
+// This will be used until an alternative is found.  this is the first
+// step for mapping IPMI
+int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *interface) {
+
+    const char  *busname = "org.openbmc.managers.System";
+    const char  *objname = "/org/openbmc/managers/System";
+
+    char  *str1, *str2, *str3;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+
+    int r;
+
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,busname,"getObjectFromByteId");
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+    }
+
+    r = sd_bus_message_append(m, "sy", type, num);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+    }
+
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        goto final;
+    }
+
+
+    r = sd_bus_message_read(reply, "(sss)", &str1, &str2, &str3);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        goto final;
+    }
+
+    strncpy(interface->bus, str1, MAX_DBUS_PATH);
+    strncpy(interface->path, str2, MAX_DBUS_PATH);
+    strncpy(interface->interface, str3, MAX_DBUS_PATH);
+
+    interface->sensornumber = num;
+
+final:
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return r;
+}
+
+
+
+
+int main(int argc, char *argv[])
+{
+	int base;
+	char *endptr, *str;
+	long val;
+	uint16_t num;
+	int r;
+	
+	if (argc < 2) {
+		fprintf(stderr, "Usage: %s sensornumber\n", argv[0]);
+		return -1;
+	}
+	
+	str = argv[1];
+	base = (argc > 2) ? atoi(argv[2]) : 10;
+
+	val = strtol(str, &endptr, base);
+
+	num = (uint16_t) val;
+
+
+
+    /* Connect to system bus */
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n",
+                strerror(-r));
+        goto finish;
+    } 
+
+    send_esel(num);	
+
+	
+finish:
+    sd_bus_unref(bus);
+
+	return 0;
+}
\ No newline at end of file
-- 
2.6.0
