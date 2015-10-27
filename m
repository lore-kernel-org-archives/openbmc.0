Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9E13A1A045F
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:13:36 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951602098715.5965881986538;
 Tue, 27 Oct 2015 06:13:22 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH linux 0/3] Openbmc/gpio-irq
Date: Tue, 27 Oct 2015 08:13:17 -0500
Message-Id: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Tue, 27 Oct 2015 13:13:37 -0000

This series reworks the GPIO driver to handle all banks with one instance, then adds interrupt support.

https://github.com/openbmc/linux/pull/7

Jeremy Kerr (3):
  gpio/aspeed: Pass struct resource directly to devm_ioremap_resource
  gpio/aspeed: Expose entire bank as one gpio chip
  gpio/aspeed: Implement interrupts for GPIO banks

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  30 +--
 drivers/gpio/gpio-aspeed.c                    | 342 ++++++++++++++++++++++++--
 2 files changed, 331 insertions(+), 41 deletions(-)

-- 
2.6.0
