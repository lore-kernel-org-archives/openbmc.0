Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC7711A0368
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 01:28:35 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446040107408754.9102171634448;
 Wed, 28 Oct 2015 06:48:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 3/3] Patch skeleton.service for Barreleye
Date: Wed, 28 Oct 2015 08:48:15 -0500
Message-Id: <1446040095-14799-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
References: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 14:28:37 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-rackspace/meta-barreleye/conf/layer.conf             |  4 ++++
 .../recipes-phosphor/skeleton/skeleton.bbappend               |  2 ++
 .../recipes-phosphor/skeleton/skeleton/skeleton.patch         | 11 +++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/layer.conf
index 313b8fc..7d1dd17 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/layer.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/layer.conf
@@ -1,5 +1,9 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
 BBFILE_COLLECTIONS += "barreleye"
 BBFILE_PATTERN_barreleye = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
new file mode 100644
index 0000000..c3aad86
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+SRC_URI += "file://skeleton.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
new file mode 100644
index 0000000..b4e9014
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
@@ -0,0 +1,11 @@
+--- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
++++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
+@@ -2,7 +2,7 @@
+ Description=Temp placeholder for skeleton function
+ 
+ [Service]
+-ExecStart=/usr/sbin/system_manager.py Palmetto
++ExecStart=/usr/sbin/system_manager.py Barreleye
+ 
+ [Install]
+ WantedBy=multi-user.target
-- 
2.6.0
