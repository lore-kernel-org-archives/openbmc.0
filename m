Return-Path: <clg@kaod.org>
X-Greylist: delayed 1014 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:44:09 AEDT
Received: from 8.mo1.mail-out.ovh.net (8.mo1.mail-out.ovh.net [178.33.110.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmPj2hFszDrSK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:44:08 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 540D411E5B
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:37 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 2AB9D2A0067;
 Thu,  6 Oct 2016 23:27:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 12/12] aspeed: remove hack loading ramdisk in memory
Date: Thu,  6 Oct 2016 23:26:45 +0200
Message-Id: <1475789205-19618-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13963692121670257410
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:09 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 common/image.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/common/image.c b/common/image.c
index 64e5c668f52a..7ad04ca19b80 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1151,17 +1151,6 @@ int boot_get_ramdisk(int argc, char * const argv[], bootm_headers_t *images,
 				return 1;
 			}
 		}
-/// TODO ... Check Why ..................
-#if  defined(CONFIG_ARCH_ASPEED)
-		/*
-		 * We need to copy the ramdisk to SRAM to let Linux boot
-		 */
-		if (rd_data) {
-			memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
-			rd_data = rd_load;
-		}
-#endif /* CONFIG_ASPEED */
-
 	} else if (images->legacy_hdr_valid &&
 			image_check_type(&images->legacy_hdr_os_copy,
 						IH_TYPE_MULTI)) {
-- 
2.7.4
