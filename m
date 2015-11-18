Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 08FB31A04C1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 15:10:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447819820227457.8261676619709;
 Tue, 17 Nov 2015 20:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 0/2] misc/bt-host: Add facility for interrupt-driven
 BT messages
Date: Tue, 17 Nov 2015 23:10:17 -0500
Message-Id: <1447819819-21180-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Wed, 18 Nov 2015 04:10:26 -0000

This change adds a facility for the bt-host driver to use interrupts
rather than polling via a timer.

If we find an interrupts property in the device tree, we'll enable
interrupts on the bt device.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/linux/pull/18

Jeremy Kerr (2):
  misc/bt-host: Add facility for interrupt-driven BT messages
  misc/bt-host: Use devm_ioremap_resource()

 arch/arm/boot/dts/ast2400.dtsi |  1 +
 drivers/misc/bt-host.c         | 77 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 70 insertions(+), 8 deletions(-)

-- 
2.6.3
