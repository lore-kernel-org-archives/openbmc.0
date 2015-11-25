Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 577D01A0368
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435430881433.1693975652571;
 Tue, 24 Nov 2015 23:10:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 7/7] Makefile: build with -Wall
Date: Wed, 25 Nov 2015 02:10:24 -0500
Message-Id: <1448435424-9067-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:34 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 1851c9f..57ad6fe 100644
--- a/Makefile
+++ b/Makefile
@@ -27,6 +27,9 @@ LIB_APP     = libapphandler.so
 INSTALLED_LIBS += $(LIB_APP)
 INSTALLED_HEADERS = ipmid-api.h
 
+CXXFLAGS += -Wall -Wno-unused-result
+CFLAGS += -Wall -Wno-unused-result
+
 INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
-- 
2.6.3
