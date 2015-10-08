Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 392ED1A02AD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 09:43:21 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444344198840431.07902815243506;
 Thu, 8 Oct 2015 15:43:18 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/5] First pass at flash image generation.
Date: Thu,  8 Oct 2015 17:43:12 -0500
Message-Id: <1444344197-7122-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 08 Oct 2015 22:43:23 -0000

This doesn't produce a usable flash image!

https://github.com/openbmc/openbmc/pull/13

Brad Bishop (5):
  Add vim swap files to .gitignore
  Add uboot image type specialization
  Backport 2013.07 uboot recipe
  Use OpenBMC uboot image
  Add u-boot for Palmetto

 .gitignore                                         |     1 +
 .../meta-palmetto/conf/machine/palmetto.conf       |     7 +-
 .../recipes-bsp/u-boot/files/config.patch          |    14 +
 .../recipes-bsp/u-boot/files/fw_env.config         |    22 +
 .../patch-2013.07/0000-u-boot-aspeed-064.patch     | 44658 +++++++++++++++++++
 .../files/patch-2013.07/0001-u-boot-openbmc.patch  |  1937 +
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |    13 +
 .../obmc-phosphor-image_types_uboot.bbclass        |    47 +
 ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch |    74 +
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    |    25 +
 .../conf/machine/include/obmc-bsp-common.inc       |     5 +-
 11 files changed, 46801 insertions(+), 2 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/config.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/fw_env.config
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0000-u-boot-aspeed-064.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 create mode 100644 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb

-- 
2.6.0
