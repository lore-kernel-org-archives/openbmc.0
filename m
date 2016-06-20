Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rY8Zq3Q9bzDq60
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 22:01:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466424061923584.062332458428;
 Mon, 20 Jun 2016 05:01:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update recipe and service file for phosphor-networkd
Date: Mon, 20 Jun 2016 07:00:58 -0500
Message-Id: <20160620120058.16763-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160620120058.16763-1-openbmc-patches@stwcx.xyz>
References: <20160620120058.16763-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 12:01:08 -0000

From: vishwa <vishwanath@in.ibm.com>

Commit c69c3d3 for phosphor-netword introduced DNS support.
This change will update the bitbake file to point to correct commit
and also creates the service file to start DNS updater.

Fixes openbmc/openbmc#134
---
 meta-phosphor/common/recipes-phosphor/network/network.bb       |  6 +++++-
 .../network/network/network-update-dns.service                 | 10 ++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/network/network/network-update-dns.service

diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index 7129898..d35f26c 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -5,17 +5,21 @@ PR = "r1"
 
 inherit obmc-phosphor-license
 inherit obmc-phosphor-systemd
+inherit obmc-phosphor-sdbus-service
+
+SYSTEMD_SERVICE_${PN} += "network.service network-update-dns.service"
 
 RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-networkd"
 
-SRCREV = "fbf7d68e78684739ff860f20f6cbdd0932003912"
+SRCREV = "c69c3d30fd7d5fd04ba990788b6d75b19f275fc8"
 
 S = "${WORKDIR}/git"
 
 do_install() {
         install -d ${D}/${sbindir}
         install ${S}/netman.py ${D}/${sbindir}
+        install ${S}/netman_watch_dns ${D}/${sbindir}
 }
 
diff --git a/meta-phosphor/common/recipes-phosphor/network/network/network-update-dns.service b/meta-phosphor/common/recipes-phosphor/network/network/network-update-dns.service
new file mode 100644
index 0000000..ad14aab
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/network/network/network-update-dns.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DNS update handler
+Requires=network.service
+After=network.service
+
+[Service]
+ExecStart=/usr/sbin/netman_watch_dns /run/systemd/netif/state
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.4
