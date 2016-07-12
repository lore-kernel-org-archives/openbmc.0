Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpwct5cNZzDqNR
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 07:50:38 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468360233071873.4347016326914;
 Tue, 12 Jul 2016 14:50:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Wenzong Fan <wenzong.fan@windriver.com>,
 Joe MacDonald <joe_macdonald@mentor.com>,
 "Edward A . James" <eajames@us.ibm.com>
Subject: [PATCH openbmc] python-ipy: update 0.81 -> 0.83
Date: Tue, 12 Jul 2016 16:50:30 -0500
Message-Id: <20160712215030.30847-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160712215030.30847-1-openbmc-patches@stwcx.xyz>
References: <20160712215030.30847-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jul 2016 21:50:39 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

* update SRC_URI checksums
* remove PKG-INFO that is not in 0.83

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../recipes-devtools/python/python-ipy_0.83.bb     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-ipy_0.83.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/python-ipy_0.83.bb b/meta-phosphor/common/recipes-devtools/python/python-ipy_0.83.bb
new file mode 100644
index 0000000..b2a9739
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-ipy_0.83.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Python module for handling IPv4 and IPv6 Addresses and Networks"
+DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \ 
+in a fashion similar to perl's Net::IP and friends. The IP class allows \
+a comfortable parsing and handling for most notations in use for IPv4 \
+and IPv6 Addresses and Networks."
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/haypo/python-ipy"
+DEPENDS = "python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebc0028ff5cdaf7796604875027dcd55"
+
+SRC_URI = "http://pypi.python.org/packages/source/I/IPy/IPy-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7b8c6eb4111b15aea31b67108e769712"
+SRC_URI[sha256sum] = "61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8"
+
+S = "${WORKDIR}/IPy-${PV}"
+
+inherit distutils
+
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+	install -d ${D}/${datadir}/doc/${BPN}-${PV}
+	install AUTHORS COPYING ChangeLog README ${D}/${datadir}/doc/${BPN}-${PV}
+}
-- 
2.9.0
