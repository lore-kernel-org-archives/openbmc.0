Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 81A121A00BF
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 15:30:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448339424056274.32332875242275;
 Mon, 23 Nov 2015 20:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm/mach-aspeed: Remove UART prints & early_init printks
Date: Mon, 23 Nov 2015 23:30:22 -0500
Message-Id: <1448339423-15983-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Tue, 24 Nov 2015 04:30:30 -0000

These were useful for bringup, but we don't need them currently. This
allows us to remove most of the udbg code, and rename it to something
non-powerpc-specific.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/linux/pull/21

Jeremy Kerr (1):
  arm/mach-aspeed: Remove UART prints & early_init printks

 arch/arm/mach-aspeed/aspeed.c | 57 +++++++++----------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

-- 
2.6.3
