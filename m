Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8wZl5zghzDqCG
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 23:50:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463579445730924.8994948178089;
 Wed, 18 May 2016 06:50:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Cleanup phosphor-host-ipmid
 storageaddsel.C
Date: Wed, 18 May 2016 08:50:40 -0500
Message-Id: <1463579440-22774-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463579440-22774-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463579440-22774-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 13:50:56 -0000

From: Nan Li <bjlinan@cn.ibm.com>

1.Check returns and handle errors for file IO.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 storageaddsel.C | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/storageaddsel.C b/storageaddsel.C
index cb90aab..3343772 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -80,16 +80,39 @@ size_t getfilestream(const char *fn, uint8_t **buffer) {
 
 	FILE *fp;
 	size_t size = 0;
+	int r;
 
 	if ((fp = fopen(fn, "rb")) != NULL) {
 
-		fseek(fp, 0, SEEK_END);
+		r = fseek(fp, 0, SEEK_END);
+		if (r) {
+			fprintf(stderr,"Fseek failed\n");
+			goto fclose_fp;
+		}
+
 		size = ftell(fp);
-		fseek(fp, 0, SEEK_SET);
+		if (size == -1L) {
+			fprintf(stderr,"Ftell failed for %s\n", strerror(errno));
+			size = 0;
+			goto fclose_fp;
+		}
+
+		r = fseek(fp, 0, SEEK_SET);
+		if (r) {
+			fprintf(stderr,"Fseek failed\n");
+			size = 0;
+			goto fclose_fp;
+		}
 
 		*buffer = new uint8_t [size];
 
-		fread(*buffer, 1, size, fp);
+		r = fread(*buffer, 1, size, fp);
+		if ( r != size) {
+			size = 0;
+			fprintf(stderr,"Fread failed\n");
+		}
+
+fclose_fp:
 		fclose(fp);
 	}
 
@@ -205,6 +228,7 @@ void send_esel(uint16_t recordid) {
 	uint8_t *buffer = NULL;
 	const char *path = "/tmp/esel";
 	size_t sz;
+	int r;
 
 	sz = getfilestream(path, &buffer);
 	if (sz == 0) {
@@ -216,7 +240,10 @@ void send_esel(uint16_t recordid) {
 	create_esel_association(buffer, &assoc);
 	create_esel_description(buffer, sev, &desc);
 
-	send_esel_to_dbus(desc, sev, assoc, buffer, sz);
+	r = send_esel_to_dbus(desc, sev, assoc, buffer, sz);
+	if (r < 0) {
+		fprintf(stderr, "Failed to send esel to dbus\n");
+	}
 
 	free(assoc);
 	free(desc);
-- 
2.8.2
