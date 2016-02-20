Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D58901A0997
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145598163730620.79735222415377;
 Sat, 20 Feb 2016 07:20:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Enable debug data section of event logs
Date: Sat, 20 Feb 2016 09:20:35 -0600
Message-Id: <1455981635-30583-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455981635-30583-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455981635-30583-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:42 -0000

From: Chris Austen <austenc@us.ibm.com>

until now event logs have 3 bytes of debug data.  This was due to
a bug in our debug / testing interface.  Now that the problem has
been resolved we can start seeing the full ESEL over the rest
interface.  This will lead to larger files in the writable
filesystem.
---
 storageaddsel.C  | 17 +++++------------
 storagehandler.C |  2 --
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/storageaddsel.C b/storageaddsel.C
index 3c24ec0..51edc59 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -87,8 +87,6 @@ size_t getfilestream(const char *fn, uint8_t **buffer) {
 		size = ftell(fp);
 		fseek(fp, 0, SEEK_SET);
 
-		size = 0x100;
-
 		*buffer = new uint8_t [size];
 
 		fread(*buffer, 1, size, fp);
@@ -120,9 +118,10 @@ int create_esel_association(const uint8_t *buffer, char **m) {
 
 	find_openbmc_path("SENSOR", sensor, &dbusint);
 
+	// Simply no associations if the sensor can not be found
 	if (strlen(dbusint.path) < 1) {
-		printf("Sensor not found\n");
-		snprintf(dbusint.path, sizeof(dbusint.path), "0x%x", sensor);
+		printf("Sensor 0x%x not found\n", sensor);
+		memset(dbusint.path,0,sizeof(dbusint.path));
 	}
 
 	asprintf(m, "%s", dbusint.path);
@@ -204,15 +203,12 @@ void send_esel(uint16_t recordid) {
 	char *desc, *assoc;
 	const char *sev;
 	uint8_t *buffer = NULL;
-	char *path;
+	const char *path = "/tmp/esel";
 	size_t sz;
 
-	uint8_t hack[] = {0x30, 0x32, 0x34};
-	asprintf(&path,"%s%04x", "/tmp/esel", recordid);
 	sz = getfilestream(path, &buffer);
 	if (sz == 0) {
 		printf("Error file does not exist %d\n",__LINE__);
-		free(path);
 		return;
 	}
 
@@ -220,11 +216,8 @@ void send_esel(uint16_t recordid) {
 	create_esel_association(buffer, &assoc);
 	create_esel_description(buffer, sev, &desc);
 
-	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
-	// I cant send extended ascii chars.  So 0,2,4 for now...
-	send_esel_to_dbus(desc, sev, assoc, hack, 3);
+	send_esel_to_dbus(desc, sev, assoc, buffer, sz);
 
-	free(path);
 	free(assoc);
 	free(desc);
 	delete[] buffer;
diff --git a/storagehandler.C b/storagehandler.C
index a68da8f..020a0c9 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -138,8 +138,6 @@ ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Pack the actual response
     memcpy(response, &p->eventdata[1], 2);
 
-    // TODO This code should grab the completed partial esel located in
-    // the /tmp/esel0100 file and commit it to the error log handler.
     send_esel(recordid);
 
     return rc;
-- 
2.7.1
