Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4E6D41A0329
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 21:10:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144827341355293.86262085754743;
 Mon, 23 Nov 2015 02:10:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 8/8] Makefile: Allow specifying kenrel header path
Date: Mon, 23 Nov 2015 05:10:07 -0500
Message-Id: <1448273407-11474-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 10:10:17 -0000

From: Joel Stanley <joel@jms.id.au>

Helps with doing builds on systems where the kernel headers are not
installed.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 9d1f5b9..733511c 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,10 @@
 CFLAGS	= $(shell pkg-config --cflags libsystemd) -Wall -O2
 LDLIBS	= $(shell pkg-config --libs libsystemd)
 
+ifdef KERNEL_HEADERS
+	CFLAGS += -I$(KERNEL_HEADERS)
+endif
+
 EXE = btbridged
 
 all: $(EXE)
-- 
2.6.3
