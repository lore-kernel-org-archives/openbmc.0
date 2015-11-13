Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AD5AD1A0909
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 01:30:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447425024914197.20254114053466;
 Fri, 13 Nov 2015 06:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 5/5] Pull in rocket and bottle
Date: Fri, 13 Nov 2015 09:30:20 -0500
Message-Id: <1447425020-2483-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 14:30:29 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Will be using the bottle framework and the rocket wsgi server
eventually.
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 0162ec5..941fa90 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -14,6 +14,8 @@ RDEPENDS_${PN} += " \
         python-dbus \
         python-pygobject \
 	obmc-mapper \
+	python-rocket \
+	python-bottle \
         "
 SRC_URI += " \
         git://github.com/openbmc/phosphor-rest-server \
-- 
2.6.3
