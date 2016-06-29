Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rflTL2rMVzDqxP
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:30:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467210642187939.9390005651459;
 Wed, 29 Jun 2016 07:30:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 3/3] Remove BUILD_ID from os-release vardeps
Date: Wed, 29 Jun 2016 09:30:36 -0500
Message-Id: <20160629143036.30291-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629143036.30291-1-openbmc-patches@stwcx.xyz>
References: <20160629143036.30291-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 14:30:46 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This addresses taskhash mismatch errors in the os-release package.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-core/os-release/os-release.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
index 3dd203b..f9befa6 100644
--- a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
+++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
@@ -17,3 +17,4 @@ python() {
 
 OS_RELEASE_FIELDS_append = " BUILD_ID"
 do_compile[nostamp] = "1"
+do_compile_remove[vardeps] = "BUILD_ID"
-- 
2.9.0
