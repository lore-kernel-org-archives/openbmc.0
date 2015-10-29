Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 88BB61A0BFD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:16:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446146178504961.7850516447032;
 Thu, 29 Oct 2015 12:16:18 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] uboot updates
Date: Thu, 29 Oct 2015 14:16:15 -0500
Message-Id: <1446146177-30186-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 19:16:25 -0000

turn off kernel debug messages (all systems)
Barreleye fix for network hang.

https://github.com/openbmc/openbmc/pull/47

Brad Bishop (2):
  Turn off debug kernel debug output by default
  Turn off u-boot phy probing on Barreleye

 .../u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch    |  2 +-
 .../recipes-bsp/u-boot/files/u-boot-barreleye.patch         | 13 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend             |  3 +++
 .../meta-rackspace/meta-barreleye/recipes.txt               |  2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/files/u-boot-barreleye.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes.txt

-- 
2.6.0
