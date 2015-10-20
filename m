Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 239821A0702
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:34 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368831407604.1456816116421;
 Tue, 20 Oct 2015 12:20:31 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 15/20] Add skeleton to phosphor image
Date: Tue, 20 Oct 2015 14:19:53 -0500
Message-Id: <1445368798-31274-16-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:35 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index 4dbcdd3..02fb8d4 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -26,6 +26,7 @@ SUMMARY_packagegroup-obmc-phosphor-apps-extras = "Extra features"
 RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
         rest-dbus \
         host-ipmid \
+        skeleton \
         "
 
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
-- 
2.6.0
