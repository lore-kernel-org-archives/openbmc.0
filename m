Return-Path: <arnd@arndb.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 323 seconds by postgrey-1.36 at bilbo;
 Thu, 08 Mar 2018 03:30:27 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxJz71l7BzF1lQ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 03:30:26 +1100 (AEDT)
Received: from wuerfel.lan ([95.208.111.237]) by mrelayeu.kundenserver.de
 (mreue102 [212.227.15.145]) with ESMTPA (Nemesis) id
 0MLPHO-1eu9pb2i1a-000diG; Wed, 07 Mar 2018 17:24:33 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
Date: Wed,  7 Mar 2018 17:24:12 +0100
Message-Id: <20180307162430.2664523-1-arnd@arndb.de>
X-Mailer: git-send-email 2.9.0
X-Provags-ID: V03:K0:gF4p6j0gPbam+NfziKqkjnu+VOTwdO/aps9Yi7frysR07No0cTc
 +Po/5P481l8d7yS9r96L4/klx2J3ocLNVc7/w7kp5nCQe3TXikv8SKOUVlKDua+V6hGuxBp
 OK4rAwYg6PzT05Tyd7+MXuflbZPHeP8SjtmlNx+fDkQdN/3q5Ie+L2bW9qMHsN9cvOVHqcL
 tNbygrzwVPwpVy3KWKMVA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:kPVpzMv0TEE=:OyEf6OZXW0z+bwmbjqlizc
 UyPmlqOXMEnjGr83kRm0Zvb8xnet3UeMt2bu50qphgxYw9CkbC/tFkEu29rGRpp/8U6FhOj5c
 oQzVCrmAZb9vvFy5Z4gH+5qa8tM36/TQ2MAgcLE7VO4B67x5NvEuuVlqJANd7KCMJ1n+mPWxY
 Etr/rBvkBbEd9tc1odjyL5b41bJnAM+U3YMpZQySoXxr6lMBzNiyPQzuMjZypBi0Q26rwashV
 xr5d5oAJnG5u0ehM4Xq18huTI69Kap5KUVvt7urDi1vqrJw8ibJ8bM3ryksx4oZhSioCckY/J
 ZuKJ1VIodNd8pgZJw2SVRqyHwZFNMGLL2s6Cw0ARxfG+Z0njmIH82mFcbLHXrspp4mwTbi6r8
 HGBnkrnLYhI/DHyeyE07SkScT27xNFFA9XeXZqBb3phJC0KnPqtaFYDw8UGbIEnxMgzH9aCG+
 mwDEG0NXl55JbV1OGFY6UTLMBVhkbj3VqRdwlX3QvpR/Xl4YSiVpc0eLZM8SI+/pUbiOiKb7P
 dIpXV5EMPcq+450ehLFbz8muxmO5QVrNJF7HrgWl90FmytG3VPdVRjdxj8p04mpHQmvhs3cTp
 WxTvMQLwXMeDZEtO0C2Y5PjuV13Fgv3SKB8GBiui5maHKsgwawEzpAIjXc7UU3nO5mglgmvLb
 1siBtO+/P5pil4ZBAyMhwv7pdEv+5O6w7NOlR43c+nhzbb97yQ0aiL8Ro4GaXHregyEaMZGvl
 7fkI+4BLQHf34T92A49fEio5qKofGypjCfqiBg==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 16:30:28 -0000

The top-level CONFIG_ARCH_NPCM symbol is not guarded with a
dependency, and can be selected for builds of traditional
(non-multiplatform) builds as well, where it causes a build
failure:

arch/arm/boot/Makefile:17: arch/arm/mach-npcm//Makefile.boot: No such file or directory

This moves the dependency to avoid that particular condition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-npcm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 6ff9df2636be..2bc6697c8d97 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -1,5 +1,5 @@
 menuconfig ARCH_NPCM
-	bool "Nuvoton NPCM Architecture"
+	bool "Nuvoton NPCM Architecture" if ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select USE_OF
 	select PINCTRL
@@ -10,7 +10,7 @@ if ARCH_NPCM
 comment "NPCM7XX CPU type"
 
 config ARCH_NPCM750
-	depends on ARCH_NPCM && ARCH_MULTI_V7
+	depends on ARCH_NPCM
 	bool "Support for NPCM750 BMC CPU (Poleg)"
 	select CACHE_L2X0
 	select CPU_V7
-- 
2.9.0
