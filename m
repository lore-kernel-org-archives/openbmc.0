Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41D9C1A035A
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 06:30:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455737428479973.8560662546404;
 Wed, 17 Feb 2016 11:30:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: KennethWilke <kenneth.wilke@rackspace.com>
Subject: [PATCH openbmc] Added systemd as build dependency for skeleton
Date: Wed, 17 Feb 2016 13:30:26 -0600
Message-Id: <1455737426-32597-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455737426-32597-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455737426-32597-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 17 Feb 2016 19:30:32 -0000

From: KennethWilke <kenneth.wilke@rackspace.com>

---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index a48f5b5..ba873aa 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -12,7 +12,7 @@ inherit obmc-phosphor-policy-mgmt
 inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-system-mgmt
 
-DEPENDS += "glib-2.0"
+DEPENDS += "glib-2.0 systemd"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-- 
2.7.1
