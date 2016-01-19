Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 321341A0E50
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 08:00:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453237229005186.20307429135585;
 Tue, 19 Jan 2016 13:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] uboot tftp can not handle noise
Date: Tue, 19 Jan 2016 15:00:27 -0600
Message-Id: <1453237228-21013-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Tue, 19 Jan 2016 21:00:31 -0000

Pull in the fixes that allows netbooting to work well
Without this change netbooting was impossible due to
timeout problems downloading images for netbooting.
Sometimes I would get timeouts right away, other times
it would take longer but every time it fail to copy
the file completely before timeouts would hit.

https://github.com/openbmc/openbmc/pull/138

Chris Austen (1):
  uboot tftp can not handle noise

 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  6 +-
 ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch | 74 ----------------------
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    |  7 +-
 3 files changed, 4 insertions(+), 83 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch

-- 
2.6.4
