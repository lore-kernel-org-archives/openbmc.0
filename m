Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3pJh5TmmzDqBM
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 15:51:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462859457637717.9539612668825;
 Mon, 9 May 2016 22:50:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v9 07/23] fix info memory leak
Date: Tue, 10 May 2016 00:50:33 -0500
Message-Id: <1462859449-5466-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 05:51:01 -0000

From: Ken <ken1029@gmail.com>

---
 objects/info.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/objects/info.c b/objects/info.c
index ab2d98c..d872c3f 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -42,6 +42,7 @@ static int i2c_open() {
   fd = open(fn, O_RDWR);
   if (fd == -1) {
     LOG_ERR(errno, "Failed to open i2c device %s", fn);
+    close(fd);
     return -1;
   }
 
@@ -108,6 +109,7 @@ static int i2c_io(int fd) {
   rc = ioctl(fd, I2C_RDWR, &data);
   if (rc < 0) {
     LOG_ERR(errno, "Failed to do raw io");
+    close(fd);
     return -1;
   }
 
@@ -126,6 +128,7 @@ int get_hdd_status(void)
   }
 
   if (i2c_io(fd) < 0) {
+    close(fd);
     return -1;
   }
 
@@ -145,7 +148,7 @@ int get_hdd_status(void)
 
     g_read_tmp[2]=g_read_bytes[2];
     g_read_tmp[3]=g_read_bytes[3];
-
+    close(fd);
 }
 
 int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {
-- 
2.8.1
