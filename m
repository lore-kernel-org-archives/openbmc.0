Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYRfy4PW9zDq62
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:20:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466464837987771.2590777625404;
 Mon, 20 Jun 2016 16:20:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v2 2/6] meta-phosphor: use obmc-phosphor-user for qemu
 systems
Date: Mon, 20 Jun 2016 18:20:30 -0500
Message-Id: <20160620232034.16483-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160620232034.16483-1-openbmc-patches@stwcx.xyz>
References: <20160620232034.16483-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 20 Jun 2016 23:20:43 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/conf/machine/include/sample.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index b499940..e4d70d1 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -30,4 +30,4 @@ PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "obmc-phosphor-sensord"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "obmc-phosphor-sysd"
-PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-userd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-user"
-- 
2.9.0
