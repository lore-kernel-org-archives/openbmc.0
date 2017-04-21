Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8LZh27D2zDqKy
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 13:19:55 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.7 v5 0/2] enable gpio-keys
Date: Thu, 20 Apr 2017 23:19:21 -0400
Message-Id: <1492744763-29872-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 03:19:56 -0000

v5:
    Revert back to a single device.
v4:
    Describe GPIO function in device path.
v3:
    Drop phandle and flags from linux,code.
    Assign gpios to their own evdev.
v2:
    Use gpio numbers for keycodes.

Brad Bishop (2):
  ARM: configs: aspeed: Enable keyboard-gpio
  ARM: dts: Enable checkstop and cooling gpio keys

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 ++++++++++++++++
 arch/arm/configs/aspeed_g4_defconfig             |  8 +++++++-
 arch/arm/configs/aspeed_g5_defconfig             |  8 +++++++-
 3 files changed, 30 insertions(+), 2 deletions(-)

-- 
1.8.3.1
