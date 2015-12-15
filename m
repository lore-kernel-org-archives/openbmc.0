Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 91E2E1A0513
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218026455415.25821907407123;
 Tue, 15 Dec 2015 14:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] barreleye: Add gpio LEDs to device tree
Date: Tue, 15 Dec 2015 16:20:24 -0600
Message-Id: <1450218025-11821-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:34 -0000

This change exposes the LEDs (which are connected to GPIOs) on
barreleye and palmetto machines as led-class devices. This allows
us to use the full trigger support.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/linux/pull/32

Jeremy Kerr (1):
  barreleye: Add gpio LEDs to device tree

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 19 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 18 ++++++++++++++++++
 arch/arm/boot/dts/ast2400.dtsi                 |  2 ++
 3 files changed, 39 insertions(+)

-- 
2.6.3
