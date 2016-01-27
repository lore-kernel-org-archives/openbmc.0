Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A6881A0C85
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2016 11:30:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453854623548272.6239937519281;
 Tue, 26 Jan 2016 16:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ed Bartosh <ed.bartosh@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH openbmc] qemu-native: fix build on Ubuntu 15.10
Date: Tue, 26 Jan 2016 18:30:21 -0600
Message-Id: <1453854621-15030-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453854621-15030-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453854621-15030-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 27 Jan 2016 00:30:29 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Build of qemu-native on Ubuntu 15.10 fails on configure step.
The reason for this is that system dbus version is higher than
oe dbus version and system pulseaudio libraries require newer dbus.

It causes configure to break with a lot of errors similar to this:
  libpulsecommon-6.0.so: undefined reference to dbus_watch_get_enabled@LIBDBUS_1_3

Fixed by building qemu-native with the system dbus on Ubuntu 15.10

Note: This is a workaround. It must be removed when oe dbus is upgraded
to the version >= system dbus version (1.10.0 at the moment).

[YOCTO #8553]

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 yocto-poky/meta/recipes-devtools/qemu/qemu.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
index 738bf2b..f6c0ae3 100644
--- a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
+++ b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,12 @@ do_configure_prepend_class-native() {
 	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
 	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
 		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+		# link with system dbus on Ubuntu 15.10
+		# FIXME: remove below 4 lines when oe dbus is upgraded
+		if [ -r /etc/lsb-release -a "$(lsb_release -is)$(lsb_release -rs)" = "Ubuntu15.10" ] ; then
+			libs=$(PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_PATH=$BHOST_PKGCONFIG_PATH PATH=/usr/bin:/bin pkg-config --libs dbus-1 || echo "")
+			[ -n "$libs" ] && export LDFLAGS="$libs $LDFLAGS"
+		fi
 	fi
 }
 
-- 
2.6.4
