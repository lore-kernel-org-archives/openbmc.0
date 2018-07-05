Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LwdC37ZjzF1mq
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 21:30:04 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w65BRqLK013585;
 Thu, 5 Jul 2018 14:27:52 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id 5493662E6F; Thu,  5 Jul 2018 14:27:52 +0300 (IDT)
From: avifishman70@gmail.com
To: davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org, akpm@linux-foundation.org
Cc: rdunlap@infradead.org, avifishman70@gmail.com, tmaimon77@gmail.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/1] MAINTAINERS: add subfolders for nuvoton *npcm*
Date: Thu,  5 Jul 2018 14:27:49 +0300
Message-Id: <20180705112750.197458-1-avifishman70@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Thu, 05 Jul 2018 11:30:08 -0000

From: Avi Fishman <avifishman70@gmail.com>


- Changes since version 2:
  Follow Andrew Morton, Joe Perches and Mauro Carvalho Chehab comment on
  the location of Documentation/devicetree/bindings

- Changes since version 1:
- Follow Greg KH comment to add changelog test in addition to the commit
  subject

 Add several subfolders to look for *npcm* files under
    ARM/NUVOTON NPCM ARCHITECTURE

Avi Fishman (1):
  MAINTAINERS: add subfolders for nuvoton *npcm*

 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.14.1
