Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9530C1A0456
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:43 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536781062406.99395939473095;
 Thu, 22 Oct 2015 10:59:41 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] Openbmc/wdt
Date: Thu, 22 Oct 2015 12:59:36 -0500
Message-Id: <1445536779-14516-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:44 -0000

https://github.com/openbmc/linux/pull/5

Jeremy Kerr (3):
  watchdog/aspeed_wdt: Unify register names with the doc
  watchdog/aspeed_wdt: Move watchdog reset to a separate function
  watchdog/aspeed_wdt: Set system reset mode to 'full chip'

 drivers/watchdog/aspeed_wdt.c | 44 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

-- 
2.6.0
