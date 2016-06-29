Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfjTx5ynjzDqwH
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 23:01:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467205265541500.63583845326764;
 Wed, 29 Jun 2016 06:01:05 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 2/2] hostcheckstop: Fix missing header
Date: Wed, 29 Jun 2016 08:01:00 -0500
Message-Id: <20160629130100.25673-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629130100.25673-1-openbmc-patches@stwcx.xyz>
References: <20160629130100.25673-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 29 Jun 2016 13:01:10 -0000

From: Joel Stanley <joel@jms.id.au>

Fixes the following error:

 host_checkstop_obj.c: In function ‘is_host_booted’:
 host_checkstop_obj.c:46:10: error: implicit declaration of function
 ‘strcmp’ [-Werror=implicit-function-declaration]
      if ((strcmp(system_state, "HOST_BOOTED") == 0) ||

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hostcheckstop/host_checkstop_obj.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hostcheckstop/host_checkstop_obj.c b/hostcheckstop/host_checkstop_obj.c
index 74c940e..c6eab2f 100644
--- a/hostcheckstop/host_checkstop_obj.c
+++ b/hostcheckstop/host_checkstop_obj.c
@@ -1,3 +1,5 @@
+#include <string.h>
+
 #include <openbmc_intf.h>
 #include <openbmc.h>
 #include <gpio.h>
-- 
2.9.0
