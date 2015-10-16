Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC2341A0928
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:38:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444999097176229.63381296794353;
 Fri, 16 Oct 2015 05:38:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/2] Add 'make install' directive
Date: Fri, 16 Oct 2015 07:38:13 -0500
Message-Id: <1444999093-21163-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444999093-21163-1-git-send-email-patches@stwcx.xyz>
References: <1444999093-21163-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:38:20 -0000

From: Patrick Williams <patrick@stwcx.xyz>

---
 Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 73cefc6..cf1d9cb 100755
--- a/Makefile
+++ b/Makefile
@@ -8,11 +8,18 @@ LIB_APP_OBJ = apphandler.o     \
               dcmihandler.o
 
 LIB_APP     = libapphandler.so
+INSTALLED_LIBS += $(LIB_APP)
+INSTALLED_HEADERS = ipmid-api.h
 
 INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
 
+DESTDIR ?= /
+SBINDIR ?= /usr/sbin
+INCLUDEDIR ?= /usr/include
+LIBDIR ?= /usr/lib
+
 all: $(DAEMON) $(LIB_APP)
 
 %.o: %.C
@@ -26,3 +33,12 @@ $(DAEMON): $(DAEMON_OBJ)
 
 clean:
 	rm -f $(DAEMON) *.o *.so
+
+install:
+		install -m 0755 -d $(DESTDIR)$(SBINDIR)
+		install -m 0755 ipmid $(DESTDIR)$(SBINDIR)
+		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid
+		install -m 0755 $(INSTALLED_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid
+		install -m 0755 -d $(DESTDIR)$(INCLUDEDIR)/host-ipmid
+		install -m 0644 $(INSTALLED_HEADERS) $(DESTDIR)$(INCLUDEDIR)/host-ipmid
+
-- 
2.6.0
