Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.76.150; helo=10.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 5400 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Oct 2017 01:22:59 AEDT
Received: from 10.mo178.mail-out.ovh.net (10.mo178.mail-out.ovh.net
 [46.105.76.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBK8M4TzyzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 01:22:57 +1100 (AEDT)
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 409D651A6D
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 14:28:00 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice3n7.emea.ibm.com
 [195.212.29.177]) (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 3516754008E;
 Tue, 10 Oct 2017 14:27:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot] Revert "ast-g5: deactivate vbar (for qemu)"
Date: Tue, 10 Oct 2017 14:27:49 +0200
Message-Id: <20171010122749.9124-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
X-Ovh-Tracer-Id: 13605374474946251522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddtgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 14:23:00 -0000

This reverts commit a0ca4ecbeae4ae9632ebc67bf5318dd2ea09c94f.

Support was added to QEMU in :

commit 91db4642f868 ("target-arm: Add VBAR support to ARM1176 CPUs")

The work around happens to crash the guest when the vector relocation
is done, with ignore_memory_transaction_failures=false which is
now the default in QEMU.
---
 arch/arm/lib/relocate.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/lib/relocate.S b/arch/arm/lib/relocate.S
index 33bcff41ac30..475d503dd9df 100644
--- a/arch/arm/lib/relocate.S
+++ b/arch/arm/lib/relocate.S
@@ -35,7 +35,7 @@ ENTRY(relocate_vectors)
 	ldr	r1, =V7M_SCB_BASE
 	str	r0, [r1, V7M_SCB_VTOR]
 #else
-#if defined(CONFIG_HAS_VBAR) && !defined(CONFIG_ARCH_AST2500)
+#ifdef CONFIG_HAS_VBAR
 	/*
 	 * If the ARM processor has the security extensions,
 	 * use VBAR to relocate the exception vectors.
-- 
2.13.6
