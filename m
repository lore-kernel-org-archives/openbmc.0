Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvg8240j6zDq60
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 10:00:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461715214478752.6755459260584;
 Tue, 26 Apr 2016 17:00:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH docs] Added steps to build barreleye image
Date: Tue, 26 Apr 2016 19:00:12 -0500
Message-Id: <1461715212-14524-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461715212-14524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461715212-14524-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 27 Apr 2016 00:00:19 -0000

From: Adi Gangidi <adi.gangidi@rackspace.com>

---
 cheatsheet.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/cheatsheet.md b/cheatsheet.md
index 2f9fc15..2a77481 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -33,6 +33,17 @@ $ TEMPLATECONF=meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf
 $ bitbake obmc-phosphor-image
 ```
 
+## Building for Barreleye
+
+The Barreleye target is `barreleye`.
+
+If you are starting from scratch without a `build/conf` directory you can just:
+```
+$ cd openbmc
+$ TEMPLATECONF=meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf . oe-init-build-env
+$ bitbake obmc-phosphor-image
+```
+
 ## Building the OpenBMC SDK
 Looking for a way to compile your programs for 'ARM' but you happen to be running on a 'PPC' or 'x86' system?  You can build the sdk receive a fakeroot environment.  
 ```
-- 
2.8.1
