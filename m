Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT3662n1pzDqdG
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 05:40:30 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465846819529959.2280424075076;
 Mon, 13 Jun 2016 12:40:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH ipmi-fru-parser 1/3] Added gitignore
Date: Mon, 13 Jun 2016 14:40:13 -0500
Message-Id: <20160613194015.23561-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613194015.23561-1-openbmc-patches@stwcx.xyz>
References: <20160613194015.23561-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 19:40:31 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .gitignore | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..85c8dc9
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,5 @@
+*.o
+*.sw*
+*.so
+*.so.*
+phosphor-read-eeprom
-- 
2.8.4
