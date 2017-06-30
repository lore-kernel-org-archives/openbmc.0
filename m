Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wzbYl01fCzDr5X
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 22:34:00 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 30 Jun 2017 15:33:47 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v5UCXlbT007263;
 Fri, 30 Jun 2017 15:33:47 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v5UCXd5s005149;
 Fri, 30 Jun 2017 15:33:39 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v5UCXPPV004844;
 Fri, 30 Jun 2017 15:33:25 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10] aspeed-g5: extend defconfig with thermal.
Date: Fri, 30 Jun 2017 15:33:16 +0300
Message-Id: <20170630123316.4479-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Fri, 30 Jun 2017 12:34:04 -0000

Extend aspeed g5 defconfig with TMP102 sensor
and several thermal configs.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 29206d1..ad121ed 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -149,6 +149,12 @@ CONFIG_SENSORS_LM25066=y
 CONFIG_SENSORS_UCD9000=y
 CONFIG_SENSORS_UCD9200=y
 CONFIG_SENSORS_TMP421=y
+CONFIG_SENSORS_TMP102=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_HWMON=y
+CONFIG_THERMAL_OF=y
+CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
+CONFIG_THERMAL_GOV_STEP_WISE=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_DYNAMIC_MINORS=y
-- 
2.8.4
