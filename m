Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrLX04ymLzDqdm
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 00:21:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146124845696796.30595371572599;
 Thu, 21 Apr 2016 07:20:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton v2 2/5] Add gitignore file
Date: Thu, 21 Apr 2016 09:20:50 -0500
Message-Id: <1461248453-8652-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 21 Apr 2016 14:21:05 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .gitignore | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..28e70be
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+lib/*
+obj/*
+bin/*.exe
+bin/pflash
+*.swp
+*.swo
-- 
2.8.1
