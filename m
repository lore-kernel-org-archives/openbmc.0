Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 848111A02EA
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 08:40:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448401211326712.1037997953803;
 Tue, 24 Nov 2015 13:40:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Makefile not running install correctly
Date: Tue, 24 Nov 2015 16:40:09 -0500
Message-Id: <1448401209-25969-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448401209-25969-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448401209-25969-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 21:40:16 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07bbf5a..dc66a77 100644
--- a/Makefile
+++ b/Makefile
@@ -66,7 +66,7 @@ install:
 		)
 		$(if $(LIBS),\
 		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid && \
-		install -m 0755 $(HOST_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid \
+		install -m 0755 $(HOST_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid && \
 		install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR) \
 		)
 
-- 
2.6.3
