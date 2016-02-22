Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 59F0F1A061E
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 13:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456106427967844.4680208254895;
 Sun, 21 Feb 2016 18:00:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH linux v2] Remove GPIO and LPC from WDT reset list
Date: Sun, 21 Feb 2016 20:00:26 -0600
Message-Id: <1456106427-1171-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 22 Feb 2016 02:00:32 -0000

WDT reset mode must also be set to SOC mode.
This must be integrated with u-boot fix to move UART setup
outside of DRAM init.

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/linux/pull/52

Norman James (1):
  Remove GPIO and LPC from WDT reset list

 arch/arm/mach-aspeed/aspeed.c | 5 +++--
 drivers/watchdog/aspeed_wdt.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.7.1
