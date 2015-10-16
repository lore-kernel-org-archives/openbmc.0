Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B388D1A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:38 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998035764482.80809518164574;
 Fri, 16 Oct 2015 05:20:35 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/2] Kernel fixes for openbmc
Date: Fri, 16 Oct 2015 07:20:32 -0500
Message-Id: <1444998034-17639-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:39 -0000

A couple of changes required build the current tree with the openbmc builder, and boot on a palmetto.

https://github.com/openbmc/linux/pull/3

Jeremy Kerr (2):
  arm/mach-aspeed: Enable UART clock divisor
  arm/aspeed_defconfig: change CONFIG_USB_G_SERIAL to y

 arch/arm/configs/aspeed_defconfig |  2 +-
 arch/arm/mach-aspeed/aspeed.c     | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.6.0
