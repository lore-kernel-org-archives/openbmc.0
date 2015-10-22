Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0224F1A0312
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:18 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536754767324.1801363421041;
 Thu, 22 Oct 2015 10:59:14 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 00/13] Openbmc/bt host
Date: Thu, 22 Oct 2015 12:59:00 -0500
Message-Id: <1445536753-14352-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:20 -0000

https://github.com/openbmc/linux/pull/6

Jeremy Kerr (13):
  misc/bt-host: Fix compile warnings
  misc/bt-host: remove unused members of struct bt_host
  misc/bt-host: fix whitespace issues
  misc/bt-host: use explicit u8 type for bt registers
  misc/bt-host: remove chrdev_region, use module_platform_driver
  misc/bt-host: unify device name to bt-host
  misc/bt-host: use a more explicit compatible string
  arm/dts/aspeeed: Fix unit address for ibt
  misc/bt-host: Use a dynamic miscdev
  misc/bt-host: Avoid global bt_host
  misc/bt-host: Add ioctl to assert SMS_ATN
  misc/bt-host: remove bt_host->ctrl
  misc/bt-host: read bt ctrl state after poll_wait

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   4 +-
 drivers/misc/bt-host.c                        | 164 +++++++++++---------------
 include/uapi/linux/Kbuild                     |   1 +
 include/uapi/linux/bt-host.h                  |  18 +++
 4 files changed, 90 insertions(+), 97 deletions(-)
 create mode 100644 include/uapi/linux/bt-host.h

-- 
2.6.0
