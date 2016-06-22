Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZT823VJJzDq66
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 01:30:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466609453406280.7326209410876;
 Wed, 22 Jun 2016 08:30:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc 2/2] pyphosphor: update package
Date: Wed, 22 Jun 2016 10:30:47 -0500
Message-Id: <20160622153047.13620-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622153047.13620-1-openbmc-patches@stwcx.xyz>
References: <20160622153047.13620-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 15:30:59 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
index 435c4c5..fedc6e6 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
@@ -10,6 +10,6 @@ inherit setuptools
 
 SRC_URI += "git://github.com/openbmc/pyphosphor"
 
-SRCREV = "93aed45f230befa01c947173a908b120cfbe7017"
+SRCREV = "1cc1e46792cc0f6daba3a8eb460dd2cb8907ab72"
 
 S = "${WORKDIR}/git"
-- 
2.9.0
