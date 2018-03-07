Return-Path: <arnd@arndb.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxJzH3BGgzF1m9
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 03:30:35 +1100 (AEDT)
Received: from wuerfel.lan ([95.208.111.237]) by mrelayeu.kundenserver.de
 (mreue102 [212.227.15.145]) with ESMTPA (Nemesis) id
 0MFLHA-1eqKcs45kS-00EP5u; Wed, 07 Mar 2018 17:24:47 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
Date: Wed,  7 Mar 2018 17:24:13 +0100
Message-Id: <20180307162430.2664523-2-arnd@arndb.de>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20180307162430.2664523-1-arnd@arndb.de>
References: <20180307162430.2664523-1-arnd@arndb.de>
X-Provags-ID: V03:K0:nU2rZ+Wml/8E+9GxQtEn7StbOIsGHQSOb1gZPPg5n8LkDIxZMUH
 tA0mPmE/YAjJ2v2rsmIE9KeNtSghCfoEw7dmoNhdsHpubT0ZHxisOfpRv7sFCiMoQ6EejU+
 ARNbxhBIOjTUPHqfkf7y+RddFLYW3WVMkSL4boOsu8e+LOqEx625mUPOQ3wJ2j31zVridYk
 seetRZWfncMKJpTL2lU3A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lXcWeyzmYTM=:Tc0Sb83ChFhgr/2QJYl2xY
 mBrPFlnUjlEYjTs5cjXLUn/1bxCXZKUHWx+LikPiJ0blqJKmyZ7rb5t/2YqRoMPCugg7ErZen
 T2QxAFZyDmj3jAQnn8EUs8DQg97VNh7+RSUN15H/z76Ob0EBE1wGXanHuJPMR77t7Y+7QKG5l
 2H6d3sJyqiRZ1x4bM7NVp7rd0MMC2hdGSzDQe5kueWGc8Wgh8XWQFUU7rFzOrY3Q+9RoTTJHr
 8tpmGYZw+ZPwXKJ4KA74VG+eI+xU/FENC2GXjc0N20pqeuzFWXXlVxOuBufZQUhOJtFBFi/wo
 cR9/Xoj5eAjhhKfmQuIsd83PXDxYVkOOivoinRZsls218RVplVNOgRljhX82x/KnvpnzYZPhb
 hqRwjEJmZfOzJxT306f322HvaPmJheW3/sAMzTCJ96F/exRFOQnWSr4zzRylz9NRjTU/yCZzI
 qhKA85DIDr2QaEu4J1/JNMw8KqpYH2zLNy9CBRnctOIG7qJ6t3mteJa3B2tA7qBQ/eVai9Rgb
 BISlzxkvC5suVd4OwyE6qMv/h2EK+0Ah3iKVX6K5Ehywr8rTIczmA6tKjtZijBPKEwrSTTFL9
 mF/NpThoV+qZ/KiUvDNdyy+mLojwwZwGQYThNsxv5PtjxraAOE7K8Mncj7042pCrVD+RgwR1G
 6V/Fgl27My2nH0tqUa11mlISzNe7gZO/AiMGJCVCgmQNrjN12+L9S+QuDevHYiP4DcaRF/FTX
 rNCf91k/726UtchOYFjF0TBdlYHDphuRtTf8AA==
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
X-List-Received-Date: Wed, 07 Mar 2018 16:30:36 -0000

While looking at the build regression, I noticed that the
platform selects a lot of other Kconfig symbols that it really
should not:

CPU_V7, ARM_GIC, HAVE_SMP, COMMON_CLK, GENERIC_CLOCKEVENTS,
and CLKDEV_LOOKUP are all implied by ARCH_MULTI_V7, so they
can be dropped.

CACHE_L2X0, SMP and USB are meant to be user-selectable, we
want to be able to turn those off for testing purposes.

CPU_USE_DOMAINS looks completely misplaced here, we should not
select that for an ARMv7 platform.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-npcm/Kconfig | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 2bc6697c8d97..c6a16230e8ef 100644
--- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -12,12 +12,6 @@ comment "NPCM7XX CPU type"
 config ARCH_NPCM750
 	depends on ARCH_NPCM
 	bool "Support for NPCM750 BMC CPU (Poleg)"
-	select CACHE_L2X0
-	select CPU_V7
-	select ARM_GIC
-	select HAVE_SMP
-	select SMP
-	select SMP_ON_UP
 	select HAVE_ARM_SCU
 	select HAVE_ARM_TWD if SMP
 	select ARM_ERRATA_720789
@@ -26,18 +20,6 @@ config ARCH_NPCM750
 	select ARM_ERRATA_794072
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
-	select USB_EHCI_ROOT_HUB_TT
-	select USB_ARCH_HAS_HCD
-	select USB_ARCH_HAS_EHCI
-	select USB_EHCI_HCD
-	select USB_ARCH_HAS_OHCI
-	select USB_OHCI_HCD
-	select USB
-	select FIQ
-	select CPU_USE_DOMAINS
-	select GENERIC_CLOCKEVENTS
-	select CLKDEV_LOOKUP
-	select COMMON_CLK if OF
 	select NPCM750_TIMER
 	select MFD_SYSCON
 	help
-- 
2.9.0
