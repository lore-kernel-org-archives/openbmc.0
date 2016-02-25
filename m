Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BA0651A0007
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 14:20:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456370427687679.2420735420757;
 Wed, 24 Feb 2016 19:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
Date: Wed, 24 Feb 2016 21:20:25 -0600
Message-Id: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 03:20:32 -0000

Should fix #8 and #54 

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

https://github.com/openbmc/linux/pull/55

Cyril Bur (1):
  net/ncsi: Fix possible deadlock caught with lockdep

 net/ncsi/ncsi-manage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.1
