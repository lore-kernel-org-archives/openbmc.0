Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9pkY08D0zDqCT
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 10:30:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463704239198524.2740917020676;
 Thu, 19 May 2016 17:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Bump pyphosphor version
Date: Thu, 19 May 2016 19:30:37 -0500
Message-Id: <1463704237-26655-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463704237-26655-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463704237-26655-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 May 2016 00:30:45 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This picks up a new enum for dbus - UnknownService.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
index a44f19a..22f059e 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
@@ -10,6 +10,6 @@ inherit setuptools
 
 SRC_URI += "git://github.com/openbmc/pyphosphor"
 
-SRCREV = "1b3c05c1f44185f8176f46829a26ad6e50d0831f"
+SRCREV = "7c8263573fb5ed25001db9c78eb4a149c057358a"
 
 S = "${WORKDIR}/git"
-- 
2.8.2
