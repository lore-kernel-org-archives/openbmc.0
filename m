Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4A41A0118
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 05:50:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457376627086452.36289401300303;
 Mon, 7 Mar 2016 10:50:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Yocto cleanup
Date: Mon,  7 Mar 2016 12:50:23 -0600
Message-Id: <1457376625-657-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Mon, 07 Mar 2016 18:50:29 -0000

Commits were incorrectly applied into the yocto-poky tree.  This tree is intended to be a mirror of the original yocto/poky repository.  Move the content out of the yocto-poky tree and into meta-phosphor.

https://github.com/openbmc/openbmc/pull/203

Patrick Williams (2):
  Move systemd patches from yocto-poky tree.
  Move glibc-cross-localedef patches from yocto-poky.

 .../0001-add-support-for-Power8-LE-mode.patch      |   26 +
 .../glibc/cross-localedef-native_2.22.bbappend     |    2 +
 .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 ++++++++++++++++++++
 .../common/recipes-core/systemd/systemd_%.bbappend |    1 +
 .../0001-add-support-for-Power8-LE-mode.patch      |   26 -
 .../glibc/cross-localedef-native_2.22.bb           |    1 -
 .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 --------------------
 .../meta/recipes-core/systemd/systemd_225.bb       |    1 -
 8 files changed, 1238 insertions(+), 1237 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
 create mode 100644 meta-phosphor/common/recipes-core/glibc/cross-localedef-native_2.22.bbappend
 create mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
 delete mode 100644 yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
 delete mode 100644 yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

-- 
2.7.1
