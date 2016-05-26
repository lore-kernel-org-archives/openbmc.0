Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rG0rr3fB2zDqVr
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 06:20:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464294039212633.9551515403912;
 Thu, 26 May 2016 13:20:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Pin host-ipmi-hw-example to a specific Git SRCREV
Date: Thu, 26 May 2016 15:20:34 -0500
Message-Id: <20160526202034.7196-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160526202034.7196-1-openbmc-patches@stwcx.xyz>
References: <20160526202034.7196-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 20:20:45 -0000

From: Rick Altherr <raltherr@google.com>

AUTOREV assumes you can reach the remote repository to lookup the most
recent commit.  When setting up a hermetic build, that will fail even
though a local mirror tarball exists.  Pinning the recipe to a specific
revision skips the lookup and just checks out the specified commit from
the local mirror tarball.

Change-Id: I05cfa67dfcd321ff28a93453df5ce1c82666e6c1
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 .../common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
index ac901d3..13b07ad 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
@@ -11,7 +11,7 @@ inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
 SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
-SRCREV="${AUTOREV}"
+SRCREV="2f9ee83356fba3f6f843bf2584f3e7e95763ec98"
 
 SCRIPT_NAME = "ipmi_debug.py"
 INSTALL_NAME = "host-ipmi-hw"
-- 
2.8.3
