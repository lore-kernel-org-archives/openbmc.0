Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbq306HBRzDqly
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:01:16 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466798471392572.9535214955406;
 Fri, 24 Jun 2016 13:01:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v7 08/11] Fix systemd packageconfig
Date: Fri, 24 Jun 2016 15:00:48 -0500
Message-Id: <20160624200051.28156-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624200051.28156-1-openbmc-patches@stwcx.xyz>
References: <20160624200051.28156-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 20:01:18 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

PACKAGECONFIG is typically set with '??=' in the base recipe.  In our
systemd append it was being set with += which overrides the weak
default (??=) so none of the default configure options were used.  This
patch corrects that and then removes all the default options we don't
need.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
index 8b3b25d..9ad6a40 100644
--- a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,5 @@
-PACKAGECONFIG += "networkd"
+PACKAGECONFIG_append = " networkd"
+PACKAGECONFIG_remove = "machined hibernate ldconfig binfmt backlight quotacheck localed kdbus ima smack polkit"
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
 SRC_URI += "file://default.network"
 
-- 
2.9.0
