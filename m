Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3x7dCf4WFxzDqk3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 00:16:13 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 13 Jul 2017 17:16:08 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6DEG8cN021603;
 Thu, 13 Jul 2017 17:16:08 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v6DEG0e5005419;
 Thu, 13 Jul 2017 17:16:00 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v6DEFlNv005087;
 Thu, 13 Jul 2017 17:15:47 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Rick Altherr <raltherr@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [PATCH linux dev-4.10 v2] msn: add adc to msn dts.
Date: Thu, 13 Jul 2017 17:15:37 +0300
Message-Id: <20170713141537.4759-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.8.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jul 2017 14:16:15 -0000

Add adc to Mellanox msn dts.

v1 -> v2:
 Pointed by Rick Altherr:
 - Remove unsupported fileds. Make adc node match bindings.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index 0774959..17ad2d3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -139,3 +139,6 @@
 	status = "okay";
 };
 
+&adc {
+	status = "okay";
+};
-- 
2.8.4
