Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddM051pqzDqmm
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:24 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053477367351.000420962611;
 Mon, 27 Jun 2016 11:51:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 8/9] bin targets are rebuilt every time
Date: Mon, 27 Jun 2016 13:50:53 -0500
Message-Id: <20160627185054.12379-9-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:25 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Address an issue where the targets specified in the BINS variable
are rebuilt every time.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 rules.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rules.mk b/rules.mk
index dec78b8..fcb7b44 100644
--- a/rules.mk
+++ b/rules.mk
@@ -8,18 +8,18 @@ ALL_CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -fPIC -Werror $(CFLAGS)
 
 BIN_SUFFIX?=.exe
 
-all: $(BINS)
+all: $(BINS:=$(BIN_SUFFIX))
 
 %.o: %.c
 	$(CC) -c $(ALL_CFLAGS) -o $@ $<
 
-$(BINS): %: %.o $(EXTRA_OBJS)
-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@$(BIN_SUFFIX) $^ $(LDLIBS)
+$(BINS:=$(BIN_SUFFIX)): %$(BIN_SUFFIX): %.o $(EXTRA_OBJS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
 
-install: $(BINS)
+install: $(BINS:=$(BIN_SUFFIX))
 	@mkdir -p $(DESTDIR)$(sbindir)
-	@for b in $(BINS); do \
-		install $$b$(BIN_SUFFIX) $(DESTDIR)$(sbindir) || exit 1; \
+	@for b in $(BINS:=$(BIN_SUFFIX)); do \
+		install $$b $(DESTDIR)$(sbindir) || exit 1; \
 	done
 
 clean:
-- 
2.9.0
