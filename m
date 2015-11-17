Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D14EF1A0CED
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2015 13:50:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144772862131371.77284650326794;
 Mon, 16 Nov 2015 18:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 2/2] Enable new rest interface at boot time
Date: Mon, 16 Nov 2015 21:50:19 -0500
Message-Id: <1447728619-12561-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447728619-12561-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447728619-12561-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 Nov 2015 02:50:25 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
index eb1c47e..9ef9b21 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
@@ -4,7 +4,7 @@ Requires=obmc-mapper.service
 After=obmc-mapper.service
 
 [Service]
-ExecStart=/usr/sbin/phosphor-rest
+ExecStart=/usr/sbin/obmc-rest
 
 [Install]
 WantedBy=multi-user.target
-- 
2.6.3
