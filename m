Return-Path: <clg@kaod.org>
X-Greylist: delayed 422 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:34:10 AEDT
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBB40VLzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:10 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A7F7E11BD8
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:11 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 7AC742A0067;
 Thu,  6 Oct 2016 23:27:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 04/12] aspeed: remove CONFIG_SYS_INIT_RAM_END
Date: Thu,  6 Oct 2016 23:26:37 +0200
Message-Id: <1475789205-19618-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13956373773459950338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 06 Oct 2016 21:34:10 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/configs/ast-common.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 7725c1af173f..a93dc61f3730 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -32,8 +32,10 @@
 #define CONFIG_SYS_SDRAM_BASE		AST_DRAM_BASE
 #define CONFIG_SYS_INIT_RAM_ADDR	CONFIG_SYS_SDRAM_BASE
 #define CONFIG_SYS_INIT_RAM_SIZE	(32*1024)
-#define CONFIG_SYS_INIT_RAM_END		(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
-#define CONFIG_SYS_INIT_SP_ADDR 	(CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
+#define CONFIG_SYS_INIT_SP_OFFSET				\
+	(CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)
+#define CONFIG_SYS_INIT_SP_ADDR					\
+	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 #define CONFIG_NR_DRAM_BANKS		1
 
-- 
2.7.4
