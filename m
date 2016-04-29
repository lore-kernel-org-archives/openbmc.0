Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwyqq5lg5zDq5d
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 12:50:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461898239285166.9452027675428;
 Thu, 28 Apr 2016 19:50:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-event] Limit logging
Date: Thu, 28 Apr 2016 21:50:37 -0500
Message-Id: <1461898237-16355-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461898237-16355-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461898237-16355-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 02:50:48 -0000

From: Nan Li <bjlinan@cn.ibm.com>

1. Change open/tellg/close to a single stat.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 message.C | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/message.C b/message.C
index 1bf7d8b..2a5e530 100644
--- a/message.C
+++ b/message.C
@@ -180,13 +180,17 @@ inline uint16_t getlen(const char *s)
 
 size_t get_file_size(string fn)
 {
-	ifstream f;
-	size_t len=0;
+	struct stat f_stat;
+	int r;
 
-	f.open(fn, ios::in|ios::binary|ios::ate);
-	len = f.tellg();
-	f.close();
-	return (len);
+	r = stat(fn.c_str(), &f_stat);
+
+	if (r < 0) {
+		fprintf(stderr, "Error getting log size: %s\n", strerror(-r));
+		return 0;
+	}
+
+	return (f_stat.st_size);
 }
 
 
-- 
2.8.1
