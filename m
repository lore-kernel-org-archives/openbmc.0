Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 189511A06BD
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2016 02:30:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452353422360416.65336318357606;
 Sat, 9 Jan 2016 07:30:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Antony Messerli <amesserl@rackspace.com>
Subject: [PATCH openbmc v2] Adding Fedora 23 requirements to README
Date: Sat,  9 Jan 2016 09:30:20 -0600
Message-Id: <1452353420-26955-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452353420-26955-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452353420-26955-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Sat, 09 Jan 2016 15:30:26 -0000

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
2.6.4
