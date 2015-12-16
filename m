Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E12351A0B4F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 09:40:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450305622168776.4582479277562;
 Wed, 16 Dec 2015 14:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Antony Messerli <amesserl@rackspace.com>
Subject: [PATCH openbmc] Adding Fedora 23 requirements to README
Date: Wed, 16 Dec 2015 16:40:20 -0600
Message-Id: <1450305620-17792-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450305620-17792-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450305620-17792-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Dec 2015 22:40:25 -0000

From: Antony Messerli <amesserl@rackspace.com>

---
 README.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/README.md b/README.md
index 49d4f94..fb8b981 100644
--- a/README.md
+++ b/README.md
@@ -8,6 +8,11 @@ OpenBMC uses Yocto/Open-Embedded for a build system, which supports an
 out-of-tree build.  It is recommended that you create an empty directory
 somewhere to hold the build.  This directory will get big.
 
+On Fedora 23 the following packages are required to build the default target:
+
+    dnf install -y git patch diffstat texinfo chrpath SDL-devel bitbake
+    dnf groupinstall "C Development Tools and Libraries"
+
 To start a build:
 
     cd <builddir>
-- 
2.6.3
