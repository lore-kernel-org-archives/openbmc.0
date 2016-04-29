Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qx6qB3kQ8zDqB2
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 18:50:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461919839267406.81808067183283;
 Fri, 29 Apr 2016 01:50:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-event v2] Limit logging
Date: Fri, 29 Apr 2016 03:50:37 -0500
Message-Id: <1461919837-834-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461919837-834-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461919837-834-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 08:50:47 -0000

From: Nan Li <bjlinan@cn.ibm.com>

1. Change open/tellg/close to a single stat.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 message.C | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/message.C b/message.C
index 1bf7d8b..87fb856 100644
--- a/message.C
+++ b/message.C
@@ -178,15 +178,23 @@ inline uint16_t getlen(const char *s)
 }
 
 
+/* If everything is working correctly, return file size, */
+/* Otherwise return 0 */
 size_t get_file_size(string fn)
 {
-	ifstream f;
-	size_t len=0;
+	struct stat f_stat;
+	int r = -1;
 
-	f.open(fn, ios::in|ios::binary|ios::ate);
-	len = f.tellg();
-	f.close();
-	return (len);
+	r = stat(fn.c_str(), &f_stat);
+
+	if (r < 0) {
+		fprintf(stderr, "Error get_file_size() for %s, %s\n",
+				fn.c_str(),
+				strerror(errno));
+		return 0;
+	}
+
+	return (f_stat.st_size);
 }
 
 
-- 
2.8.1
