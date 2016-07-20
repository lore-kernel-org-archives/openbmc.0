Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rvs7H1KLtzDqfM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 08:30:32 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469053830161487.05630289353644;
 Wed, 20 Jul 2016 15:30:30 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 1/3] contributing: specify Python style
Date: Wed, 20 Jul 2016 17:30:14 -0500
Message-Id: <20160720223016.9424-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jul 2016 22:30:35 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 contributing.md | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/contributing.md b/contributing.md
index db485a0..674dcee 100644
--- a/contributing.md
+++ b/contributing.md
@@ -42,7 +42,18 @@ If you need further details on any of these issues, feel free to add comments.
 Coding style
 ------------
 
-Components of the OpenBMC sources should have consistent style.
+Components of the OpenBMC sources should have consistent style.  If source is
+coming from another project, we choose to follow the existing style of the
+upstream project.  Otherwise, conventions are chosen based on the language.
+
+### Python
+
+Python source should all conform to PEP8.  This style is well established
+within the Python community and can be verified with the 'pep8' tool.
+
+https://www.python.org/dev/peps/pep-0008/
+
+### C
 
 For C code, we typically use the Linux coding style, which is documented at:
 
-- 
2.9.0
