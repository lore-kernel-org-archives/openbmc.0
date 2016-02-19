Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 451761A0791
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2016 06:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455909024476483.1733262398453;
 Fri, 19 Feb 2016 11:10:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Remove GPIO and LPC from WDT reset list
Date: Fri, 19 Feb 2016 13:10:22 -0600
Message-Id: <1455909023-21506-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 19 Feb 2016 19:10:29 -0000

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
