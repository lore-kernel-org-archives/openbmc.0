Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV3jS4mghzDq6X
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 07:10:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458677444379737.4438729359177;
 Tue, 22 Mar 2016 13:10:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/4] update phosphor-event recipe
Date: Tue, 22 Mar 2016 15:10:37 -0500
Message-Id: <1458677439-17628-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 20:10:53 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Update phosphor-event to the latest revision including support
for limmiiting the size of the event log DB.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 5ce5818..06422cf 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -13,7 +13,7 @@ TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "127c8cf513ba9ed6bcc460fbea29b36eb8d23bac"
+SRCREV = "b7ea1b9f322f705e4f1a086367733f8a6d46eb96"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
-- 
2.7.1
