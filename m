Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjshT5d01zDqZC
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 11:20:57 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460337654140143.26648424094606;
 Sun, 10 Apr 2016 18:20:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v5 03/19] fix info memory leak
Date: Sun, 10 Apr 2016 20:20:32 -0500
Message-Id: <1460337648-30919-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460337648-30919-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460337648-30919-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 01:20:58 -0000

From: Ken <ken1029@gmail.com>

---
 objects/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/objects/info.c b/objects/info.c
index ab2d98c..76c17d9 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -145,7 +145,7 @@ int get_hdd_status(void)
 
     g_read_tmp[2]=g_read_bytes[2];
     g_read_tmp[3]=g_read_bytes[3];
-
+    close(fd);
 }
 
 int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {
-- 
2.7.1
