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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vhdv52vvzDqGp
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:58:27 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x2SNSAxk000523;
 Fri, 29 Mar 2019 01:28:10 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id EA27E63000; Fri, 29 Mar 2019 01:58:06 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joe@perches.com, avifishman70@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, brendanhiggins@google.com,
 tali.perry1@gmail.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 2/2] MAINTAINERS: Add maintainer and replacing reviewer
 ARM/NUVOTON NPCM
Date: Fri, 29 Mar 2019 01:57:52 +0200
Message-Id: <20190328235752.334462-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190328235752.334462-1-tmaimon77@gmail.com>
References: <20190328235752.334462-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 28 Mar 2019 23:58:28 -0000

Adding Tali Perry as Nuvoton NPCM maintainer
Replacing Brendan Higgins Nuvoton NPCM reviewer with
Benjamin Fair.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b305d2f2a8a..4ece87fcc166 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1893,9 +1893,10 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 ARM/NUVOTON NPCM ARCHITECTURE
 M:	Avi Fishman <avifishman70@gmail.com>
 M:	Tomer Maimon <tmaimon77@gmail.com>
+M:	Tali Perry <tali.perry1@gmail.com>
 R:	Patrick Venture <venture@google.com>
 R:	Nancy Yuen <yuenn@google.com>
-R:	Brendan Higgins <brendanhiggins@google.com>
+R:	Benjamin Fair <benjaminfair@google.com>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm/mach-npcm/
-- 
2.14.1
