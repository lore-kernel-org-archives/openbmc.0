Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTYJ44DLVzDqfB
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 01:20:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465917641820704.5615129183935;
 Tue, 14 Jun 2016 08:20:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] Bump host-ipmid version
Date: Tue, 14 Jun 2016 10:20:34 -0500
Message-Id: <20160614152034.7936-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614152034.7936-1-openbmc-patches@stwcx.xyz>
References: <20160614152034.7936-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 15:20:53 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This picks up a host-ipmid update that addresses a bitbake
warning message about missing runtime shared library dependencies.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 00a652f..41435b7 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,10 +18,11 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "2f5a3cfd2412c7e10d128a856ad2c37c8a1b4a10"
+SRCREV = "bf9385f56f715426ff2ac3a1d77af6b6d1575fe1"
 
-FILES_${PN} += "${libdir}/host-ipmid/*.so"
-FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
+FILES_SOLIBSDEV += "${libdir}/host-ipmid/lib*${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/host-ipmid/lib*${SOLIBS}"
+FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug/lib*${SOLIBS}"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.4
