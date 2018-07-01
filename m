Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41JQBS28JZzF1Hg
 for <openbmc@lists.ozlabs.org>; Sun,  1 Jul 2018 19:31:39 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w619UWmI032429;
 Sun, 1 Jul 2018 12:30:33 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id 817E162E70; Sun,  1 Jul 2018 12:30:32 +0300 (IDT)
From: avi.fishman@nuvoton.com
To: davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org, akpm@linux-foundation.org
Cc: rdunlap@infradead.org, avifishman70@gmail.com, tmaimon77@gmail.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/1] MAINTAINERS: add subfolders for nuvoton *npcm*
Date: Sun,  1 Jul 2018 12:30:27 +0300
Message-Id: <20180701093028.10174-1-avi.fishman@nuvoton.com>
X-Mailer: git-send-email 2.14.1
X-Mailman-Approved-At: Mon, 02 Jul 2018 11:30:01 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Jul 2018 09:31:45 -0000

From: Avi Fishman <avifishman70@gmail.com>


Changes since version 1:
- Follow Greg KH comment to add changelog test in addition to the commit
  subject

 Add several subfolders to look for *npcm* files under
    ARM/NUVOTON NPCM ARCHITECTURE

Avi Fishman (1):
  MAINTAINERS: add subfolders for nuvoton *npcm*

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.14.1
