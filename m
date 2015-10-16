Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 71D261A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:52 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 14449980474481000.2053152972431;
 Fri, 16 Oct 2015 05:20:47 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Build & boot fixes for kernel & u-boot
Date: Fri, 16 Oct 2015 07:20:44 -0500
Message-Id: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:53 -0000

A couple of fixes to get the current linux tree building with poky, and set the default bootargs in u-boot.

https://github.com/openbmc/openbmc/pull/19

Jeremy Kerr (2):
  linux-obmc: Remove unnecessary config patches
  u-boot: Fix u-boot default bootargs for console

 .../u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch      |  2 +-
 .../recipes-kernel/linux/linux-obmc/initrd-source.patch       | 11 -----------
 .../common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch |  8 --------
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb   |  1 -
 4 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch

-- 
2.6.0
