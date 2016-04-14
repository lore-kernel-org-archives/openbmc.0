Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qm54j1hHZzDq64
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 02:01:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460649662033232.2168675864135;
 Thu, 14 Apr 2016 09:01:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton 2/5] Add gitignore file
Date: Thu, 14 Apr 2016 11:00:52 -0500
Message-Id: <1460649655-15109-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Apr 2016 16:01:10 -0000

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
2.7.1
