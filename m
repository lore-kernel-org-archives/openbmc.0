Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRFhz4jW4zDqjb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 17:30:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14582826403808.669959625651359;
 Thu, 17 Mar 2016 23:30:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH obmc-console 1/2] Add travis CI configuration
Date: Fri, 18 Mar 2016 01:30:27 -0500
Message-Id: <1458282628-8978-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458282628-8978-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458282628-8978-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 06:30:44 -0000

From: Joel Stanley <joel@jms.id.au>

Just builds with clang 3.8 and gcc 5.3 for x86.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .travis.yml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..c58cbf6
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,20 @@
+language: c
+
+sudo: required
+dist: trusty
+
+compiler:
+        - clang
+        - gcc
+
+install:
+        - sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test
+        - sudo apt-add-repository -y ppa:h-rayflood/llvm
+        - sudo apt-get update && sudo apt-get install -yy gcc-5 clang-3.6
+        - sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50
+        - sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 50
+        - gcc --version
+        - clang --version
+
+script:
+        - autoreconf -i && ./configure && make
-- 
2.7.1
