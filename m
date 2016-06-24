Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbrb45rBHzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 07:10:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466802634811734.9607111584052;
 Fri, 24 Jun 2016 14:10:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump versions for skeleton, IPMI, obmc-mapper
Date: Fri, 24 Jun 2016 16:10:32 -0500
Message-Id: <20160624211032.30550-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624211032.30550-1-openbmc-patches@stwcx.xyz>
References: <20160624211032.30550-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 21:10:41 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Pick changes for:
Encoding firmware version in BCD format
Handle floating point sensor values
Performance improvements
Extend the mapper service startup timeout

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service        | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index c53e687..3c3208d 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "0bdc22a259720ee3a7ca78ee3aa07ab83bb39743"
+SRCREV = "067db7287a647789e7d5d5dbccc514c5c835a944"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
index f57da02..05d1e80 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
@@ -6,6 +6,7 @@ Restart=always
 Type=dbus
 ExecStart=/usr/sbin/phosphor-mapper
 BusName=org.openbmc.ObjectMapper
+TimeoutStartSec=300
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 23728cb..2a761de 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "092360e55605c205aedd2ab40044c42e64b7d38c"
+SRCREV = "b7bcda57ee39616e8937194d281e2476e6ea8df2"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 4402227..77a2980 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -26,7 +26,7 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
+SRCREV = "fa8f6166a05410472e8a3ef6a2f2e3b9b5f8d8e4"
 
 S = "${WORKDIR}"
 
-- 
2.9.0
