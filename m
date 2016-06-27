Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLy2Zn4zDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053473398911.8760738005893;
 Mon, 27 Jun 2016 11:51:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 6/9] Create a libopenbmc_intf symlink
Date: Mon, 27 Jun 2016 13:50:51 -0500
Message-Id: <20160627185054.12379-7-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:23 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Create a libopenbmc_intf symlink in the build target to
enable things like:

 -L ../libopenbmc_intf -lopenbmc_intf

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 libopenbmc_intf/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index 156767a..f82bce5 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -8,6 +8,7 @@ INCLUDES=openbmc_intf.h openbmc.h gpio.h
 $(LIBOBMC): %: %.o gpio.o
 	$(CC) -shared $(CFLAGS) $(LDFLAGS) -Wl,-soname,lib$(LIBOBMC).so \
 		-o lib$@.so.1 $^ $(LDLIBS)
+	ln -sf lib$(LIBOBMC).so.1 lib$(LIBOBMC).so
 
 install-headers:
 	@mkdir -p $(DESTDIR)$(includedir)
@@ -20,5 +21,6 @@ install-lib:
 
 clean-lib:
 	rm -f lib$(LIBOBMC).so.1
+	rm -f lib$(LIBOBMC).so
 
 include ../rules.mk
-- 
2.9.0
