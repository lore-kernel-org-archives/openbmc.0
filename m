Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rw9nR6zX2zDqTh
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 21:01:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469098871454988.8137640124553;
 Thu, 21 Jul 2016 04:01:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] Fix the incorrect debounce setting on power button
Date: Thu, 21 Jul 2016 06:01:09 -0500
Message-Id: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 11:01:16 -0000

PCLK divider selection is decided by SCU08[25:23] and the value is 011b
on Barreleye.
That means PCLK should be H-PLL/8=384MHz/8=48MHz, but the current
debounce timer value was computed by 24MHz.
So the correct value should be 20ms*48000000/1000=EA600h

Signed-off-by: johnhcwang <hsienchiang@gmail.com>

https://github.com/openbmc/linux/pull/97

johnhcwang (1):
  Fix the incorrect debounce setting on power button

 arch/arm/mach-aspeed/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.9.0
