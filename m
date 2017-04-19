Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w77zR3gkGzDq8M
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 14:18:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v3 0/2] enable gpio-keys
Date: Wed, 19 Apr 2017 00:18:15 -0400
Message-Id: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 04:18:43 -0000

Enable the gpio-keys and evdev drivers on ast24xx generally.

Bind gpio-key events to the checkstop and air-water cooled gpios on the
Witherspoon system.

v3:
    Drop phandle and flags from linux,code.
    Assign gpios to their own evdev.
v2:
    Use gpio numbers for keycodes.

Brad Bishop (2):
  ARM: configs: aspeed: Enable keyboard-gpio
  ARM: dts: Enable checkstop and cooling gpio keys

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 ++++++++++++++++++++
 arch/arm/configs/aspeed_g4_defconfig             |  8 +++++++-
 arch/arm/configs/aspeed_g5_defconfig             |  8 +++++++-
 3 files changed, 34 insertions(+), 2 deletions(-)

-- 
1.8.3.1
