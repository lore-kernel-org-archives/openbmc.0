Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXRf4PzQzDqDH
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 12:00:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464228039197721.5973632092943;
 Wed, 25 May 2016 19:00:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Fix i2c-tools SRCURI syntax
Date: Wed, 25 May 2016 21:00:37 -0500
Message-Id: <20160526020037.1136-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160526020037.1136-1-openbmc-patches@stwcx.xyz>
References: <20160526020037.1136-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 02:00:47 -0000

From: Rick Altherr <raltherr@google.com>

Override syntax (FOO_append, FOO_prepend) doesn't insert spaces to
separate the append from the original value.  This caused the two URIs
to be incorrectly merged into one and caused a download failure.  It
happens that the fallback in that case is to use the Yocto mirror so it
kept working other than emitting a warning.  Using =+ prepend syntax
correctly adds the separating space.

Change-Id: I36f48cb53aa29ea9a4bde738c975784f6ce24250
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
index bdbdc67..599394d 100644
--- a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
+++ b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
@@ -1,4 +1,5 @@
+# Prefer the Yocto mirror over the direct lm-sensors download.
 SRC_URI_remove = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2"
-SRC_URI_prepend = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
+SRC_URI =+ "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
 
 RDEPENDS_${PN}_remove = "${PN}-misc"
-- 
2.8.3
