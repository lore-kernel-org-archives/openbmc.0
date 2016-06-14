Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTWlL5t6XzDqfV
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 00:10:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465913441737764.3508475182139;
 Tue, 14 Jun 2016 07:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 1/2] Bump pyphosphor version
Date: Tue, 14 Jun 2016 09:10:34 -0500
Message-Id: <20160614141035.5170-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614141035.5170-1-openbmc-patches@stwcx.xyz>
References: <20160614141035.5170-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 14:10:55 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This picks up a fix that addresses non-standard DBUS naming
conventions.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service      | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
index 461b8d8..f57da02 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
@@ -5,7 +5,7 @@ Description=Phosphor OpenBMC DBus service management daemon
 Restart=always
 Type=dbus
 ExecStart=/usr/sbin/phosphor-mapper
-BusName=org.openbmc.objectmapper
+BusName=org.openbmc.ObjectMapper
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
index d90c8e5..435c4c5 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Phosphor python library"
 DESCRIPTION = "Phosphor python library."
-HOMEPAGE = "http://github.com/openbmc/pyobmc"
+HOMEPAGE = "http://github.com/openbmc/pyphosphor"
 PR = "r1"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
@@ -10,6 +10,6 @@ inherit setuptools
 
 SRC_URI += "git://github.com/openbmc/pyphosphor"
 
-SRCREV = "362fb80c081e114236cc5d29b166f45fd4539041"
+SRCREV = "93aed45f230befa01c947173a908b120cfbe7017"
 
 S = "${WORKDIR}/git"
-- 
2.8.4
