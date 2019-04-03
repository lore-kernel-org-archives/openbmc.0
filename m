Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZB276nlFzDq9C
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:13:01 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x33FgmAZ025906;
 Wed, 3 Apr 2019 18:42:48 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 360BA63003; Wed,  3 Apr 2019 19:12:45 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-5.0 v1 4/4] config: npcm7xx: add PECI support to npcm7xx
 defconfig
Date: Wed,  3 Apr 2019 19:12:42 +0300
Message-Id: <20190403161242.38159-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190403161242.38159-1-tmaimon77@gmail.com>
References: <20190403161242.38159-1-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 16:13:04 -0000

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/configs/npcm7xx_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/npcm7xx_defconfig b/arch/arm/configs/npcm7xx_defconfig
index afddb4e88300..62aaffdba4dd 100644
--- a/arch/arm/configs/npcm7xx_defconfig
+++ b/arch/arm/configs/npcm7xx_defconfig
@@ -120,3 +120,8 @@ CONFIG_CRYPTO_LZO=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_CRYPTO_DEV_NPCMX50=y
 CONFIG_ARM_CRYPTO=y
+CONFIG_PECI=y
+CONFIG_PECI_NPCM=y
+CONFIG_MFD_INTEL_PECI_CLIENT=y
+CONFIG_SENSORS_PECI_CPUTEMP=y
+CONFIG_SENSORS_PECI_DIMMTEMP=y
-- 
2.14.1
