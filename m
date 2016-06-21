Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYzPf1qQjzDqFh
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 06:11:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466539856829123.23014867066354;
 Tue, 21 Jun 2016 13:10:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH skeleton] rules.mk: Fix parallel build for 'make install'
Date: Tue, 21 Jun 2016 15:10:54 -0500
Message-Id: <20160621201054.31720-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621201054.31720-1-openbmc-patches@stwcx.xyz>
References: <20160621201054.31720-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 20:11:03 -0000

From: Patrick Williams <patrick@stwcx.xyz>

install-bins was missing a dependency on the binaries themselves.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rules.mk b/rules.mk
index 758e9f2..fb6c000 100644
--- a/rules.mk
+++ b/rules.mk
@@ -19,7 +19,7 @@ all: $(DEFAULT_ALL)
 $(BINS): %: %.o $(EXTRA_OBJS)
 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@$(BIN_SUFFIX) $^ $(LDLIBS)
 
-install-bins:
+install-bins: $(BINS)
 	@mkdir -p $(DESTDIR)$(sbindir)
 	@for b in $(BINS); do \
 		install $$b$(BIN_SUFFIX) $(DESTDIR)$(sbindir) || exit 1; \
-- 
2.9.0
