Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYPqC4vnRzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 07:57:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146645985826753.80089450127468;
 Mon, 20 Jun 2016 14:57:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/7] Phosphor changes needed for Yocto 2.1
Date: Mon, 20 Jun 2016 16:57:30 -0500
Message-Id: <20160620215737.13107-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Mon, 20 Jun 2016 21:57:44 -0000
X-List-Received-Date: Mon, 20 Jun 2016 21:57:44 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/397)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/397

Patrick Williams (7):
  meta-phosphor: Use obmc-phosphor-event for qemu systems
  meta-phosphor: use obmc-phosphor-user for qemu systems
  meta-phosphor: Remove unused systemd patch
  openssl: run 'make depend'
  u-boot-fw-utils: Update to latest version.
  meta-phosphor: Make image-overlay a machine feature.
  meta-phosphor: Ensure INITRAMFS_CTYPE defined

 meta-phosphor/classes/obmc-phosphor-image.bbclass  |    4 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  |    2 +-
 .../openssl/openssl/Configure.patch                |   15 +
 .../openssl/openssl_%.bbappend                     |    8 +
 .../images/core-image-minimal-initramfs.bbappend   |    1 +
 .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 --------------------
 .../common/recipes-core/systemd/systemd_%.bbappend |    1 -
 .../conf/machine/include/obmc-bsp-common.inc       |    2 +-
 meta-phosphor/conf/machine/include/sample.inc      |    4 +-
 9 files changed, 32 insertions(+), 1214 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-connectivity/openssl/openssl/Configure.patch
 delete mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

-- 
2.9.0
