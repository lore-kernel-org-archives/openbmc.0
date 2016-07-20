Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rvs7J70fczDqfJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 08:30:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469053833386655.3768115204886;
 Wed, 20 Jul 2016 15:30:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 3/3] contributing: Add style for C++
Date: Wed, 20 Jul 2016 17:30:16 -0500
Message-Id: <20160720223016.9424-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160720223016.9424-1-openbmc-patches@stwcx.xyz>
References: <20160720223016.9424-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Wed, 20 Jul 2016 22:30:37 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 contributing.md | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/contributing.md b/contributing.md
index 5d64b32..070f63c 100644
--- a/contributing.md
+++ b/contributing.md
@@ -71,6 +71,29 @@ This style can mostly be verified with 'astyle' as follows:
 
     astyle --style=linux --indent=tab=8 --indent=force-tab=8
 
+### C++
+
+Being an extensive and complicated language, there are often differences of
+opinions on "good" and "bad" C++ code.  The following are the approaches
+favored within the OpenBMC projects:
+
+  1. Favor syntax and techniques from the latest available C++ standard,
+     currently C++14.
+  2. Rely on well-recognized opinions on best practices:
+       1. C++ Core Guidelines - https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md
+       2. Effective Modern C++ - http://www.aristeia.com/books.html
+  3. Give preference to style decisions from the Google C++ Style Guide -
+     https://google.github.io/styleguide/cppguide.html
+
+In order to meet the chosen style for C++ code, files should pass through
+'astyle' unchanged when called as follows:
+
+    astyle --style=allman --add-brackets --convert-tabs --max-code-length=80 \
+        --indent=spaces=4 --indent-classes --indent-switches --indent-labels \
+        --indent-preproc-define --min-conditional-indent=0 --pad-oper \
+        --pad-header --unpad-paren --break-after-logical \
+        --align-pointer=type --align-reference=type
+
 Submitting changes
 ------------------
 
-- 
2.9.0
