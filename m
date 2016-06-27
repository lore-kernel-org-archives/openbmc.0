Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLk4X0DzDqmy
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053459203647.9000221697977;
 Mon, 27 Jun 2016 11:50:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 2/9] Add force link option to install target
Date: Mon, 27 Jun 2016 13:50:47 -0500
Message-Id: <20160627185054.12379-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
References: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:11 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This allows 'make install' to be invoked more than once.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 libopenbmc_intf/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index 54bef57..048d8c4 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -17,7 +17,7 @@ install-headers:
 install-lib:
 	@mkdir -p $(DESTDIR)$(libdir)
 	install lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)
-	ln -s lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)/lib$(LIBOBMC).so
+	ln -sf lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)/lib$(LIBOBMC).so
 
 clean-lib:
 	rm -f lib$(LIBOBMC).so.1
-- 
2.9.0
