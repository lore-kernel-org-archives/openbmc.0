Return-Path: <clg@kaod.org>
X-Greylist: delayed 427 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:34:12 AEDT
Received: from 10.mo1.mail-out.ovh.net (10.mo1.mail-out.ovh.net
 [178.32.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBD4gg3zDrSM
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 254CF11F59
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:34 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id EFBB02A0067;
 Thu,  6 Oct 2016 23:27:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 11/12] bootm: fix ramdisk relocation
Date: Thu,  6 Oct 2016 23:26:44 +0200
Message-Id: <1475789205-19618-12-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13962847694876084994
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 06 Oct 2016 21:34:13 -0000

We are working on bringing to mainline a set of changes adding support
for the Aspeed SoC and we have a couple of work around we are trying
to elimitate first. This is one of them. The ramdisk is not relocated
and Linux fails to boot. The current port does not use a device tree
(yet) so that might be the most obvious culprit.

Thanks

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 cmd/bootm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cmd/bootm.c b/cmd/bootm.c
index e02a1c54b70c..9184fd379f95 100644
--- a/cmd/bootm.c
+++ b/cmd/bootm.c
@@ -126,6 +126,9 @@ int do_bootm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 	return do_bootm_states(cmdtp, flag, argc, argv, BOOTM_STATE_START |
 		BOOTM_STATE_FINDOS | BOOTM_STATE_FINDOTHER |
 		BOOTM_STATE_LOADOS |
+#ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
+		BOOTM_STATE_RAMDISK |
+#endif
 #if defined(CONFIG_PPC) || defined(CONFIG_MIPS)
 		BOOTM_STATE_OS_CMDLINE |
 #endif
-- 
2.7.4
