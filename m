Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhp4QW0zDqxt
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:50 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id E2B68FF9788
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:47 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id AE8AE44006D;
 Wed, 29 Jun 2016 18:10:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 8/9] aspeed/ast-g4: add a force
 saveenv config
Date: Wed, 29 Jun 2016 18:09:50 +0200
Message-Id: <1467216591-8616-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17511965676521229058
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 16:10:51 -0000

That was a feature in the previous Aspeed branch which is was left out
in the v2016.05 port. So let's use the new aspeed Kconfig to add it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig     | 1 +
 board/aspeed/Kconfig | 6 ++++++
 common/env_common.c  | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index bfbeb4842380..b2c19b912834 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -756,6 +756,7 @@ config TARGET_WITHERSPOON_BMC
 config TARGET_AST_G4
        bool "Support ast2400"
        select CPU_ARM926EJS
+       select ASPEED_WRITE_DEFAULT_ENV
 
 endchoice
 
diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
index a92b9bc0c934..fca65d0206f6 100644
--- a/board/aspeed/Kconfig
+++ b/board/aspeed/Kconfig
@@ -1,3 +1,9 @@
+config ASPEED_WRITE_DEFAULT_ENV
+       bool "force  write of default environment"
+       help
+	 when the environment CRC is bad, force a saveenv to update
+	 the flash with a sane default environment
+
 source "board/aspeed/ast-g5/Kconfig"
 source "board/aspeed/ast-g4/Kconfig"
 source "board/aspeed/witherspoon-bmc/Kconfig"
diff --git a/common/env_common.c b/common/env_common.c
index af59c72e1fd7..5d6aac551b26 100644
--- a/common/env_common.c
+++ b/common/env_common.c
@@ -262,6 +262,9 @@ void env_relocate(void)
 #else
 		bootstage_error(BOOTSTAGE_ID_NET_CHECKSUM);
 		set_default_env("!bad CRC");
+#ifdef CONFIG_ASPEED_WRITE_DEFAULT_ENV
+		saveenv();
+#endif
 #endif
 	} else {
 		env_relocate_spec();
-- 
2.1.4
