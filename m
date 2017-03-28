Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsrqZ6b1DzDqY4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 00:10:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 1/2] ARM: configs: aspeed: Enable hwmon-iio
 bridge
Date: Tue, 28 Mar 2017 09:10:37 -0400
Message-Id: <1490706638-5782-2-git-send-email-bradleyb@fuzziesquirrel.com>
In-Reply-To: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
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

Some OpenBMC systems will be using iio-hwmon so enable it
in our configs.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/configs/aspeed_g4_defconfig | 1 +
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 45dee41..552297b 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -127,6 +127,7 @@ CONFIG_I2C_ASPEED=y
 CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
+CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 69d51f2..c5e7295 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -126,6 +126,7 @@ CONFIG_I2C_ASPEED=y
 CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
+CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
-- 
1.8.3.1
