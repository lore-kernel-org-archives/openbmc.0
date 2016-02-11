Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 10EC31A003D
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 18:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455177022389848.7042865355361;
 Wed, 10 Feb 2016 23:50:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Updating packagegroup recipe to include user service.
Date: Thu, 11 Feb 2016 01:50:20 -0600
Message-Id: <1455177020-18588-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455177020-18588-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455177020-18588-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 11 Feb 2016 07:50:29 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 .../recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index cac7b1b..945a105 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -27,6 +27,7 @@ RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
         rest-dbus \
 	obmc-rest \
         host-ipmid \
+        user \
         "
 
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
-- 
2.7.1
