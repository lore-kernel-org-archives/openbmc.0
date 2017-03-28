Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsrqZ6VMCzDqC2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 00:10:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 0/2] ARM: enable bmp280-iio
Date: Tue, 28 Mar 2017 09:10:36 -0400
Message-Id: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 13:10:51 -0000

Enable the bmp280 IIO driver.
Enable the hwmon-iio bridge.
Use them on the Witherspoon system.

Brad Bishop (2):
  ARM: configs: aspeed: Enable hwmon-iio bridge
  ARM: dts: Use IIO version of bmp180 on Witherspoon

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++--
 arch/arm/configs/aspeed_g4_defconfig             |  1 +
 arch/arm/configs/aspeed_g5_defconfig             |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
1.8.3.1
