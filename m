Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9247D1A0562
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 16:20:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453440021668673.8642563938729;
 Thu, 21 Jan 2016 21:20:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Antony Messerli <antony@mes.ser.li>
Subject: [PATCH openbmc v4] Adding Fedora 23 requirements to README
Date: Thu, 21 Jan 2016 23:20:20 -0600
Message-Id: <1453440020-25508-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453440020-25508-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453440020-25508-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 05:20:26 -0000

From: Antony Messerli <antony@mes.ser.li>

---
 README.md | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/README.md b/README.md
index 0df0ad4..7f9a2a7 100644
--- a/README.md
+++ b/README.md
@@ -4,19 +4,21 @@
 
 ## Building ##
 
-OpenBMC uses Yocto/Open-Embedded for a build system, which supports an 
+OpenBMC uses Yocto/Open-Embedded for a build system, which supports an
 out-of-tree build.  It is recommended that you create an empty directory
 somewhere to hold the build.  This directory will get big.
 
 On Ubuntu 14.04 the following packages are required to build the default target
-```
-sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrpath diffstat
-```
+
+    sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrpath diffstat
+
+On Fedora 23 the following packages are required to build the default target:
+
+    sudo dnf install -y git patch diffstat texinfo chrpath SDL-devel bitbake
+    sudo dnf groupinstall "C Development Tools and Libraries"
 
 To start a build:
 
-```
     cd <builddir>
     . <repodir>/openbmc-env
     bitbake obmc-phosphor-image
-```
-- 
2.6.4
