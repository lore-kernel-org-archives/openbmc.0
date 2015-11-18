Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CB6C61A04EB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 14:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447818621350412.52039919539527;
 Tue, 17 Nov 2015 19:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] misc/bt-host: Add facility for interrupt-driven BT
 messages
Date: Tue, 17 Nov 2015 22:50:19 -0500
Message-Id: <1447818620-20538-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 03:50:37 -0000

This change adds a facility for the bt-host driver to use interrupts
rather than polling via a timer.

If we find an interrupts property in the device tree, we'll enable
interrupts on the bt device.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/linux/pull/18

Jeremy Kerr (1):
  misc/bt-host: Add facility for interrupt-driven BT messages

 arch/arm/boot/dts/ast2400.dtsi |  1 +
 drivers/misc/bt-host.c         | 73 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.6.3
