Return-Path: <clg@kaod.org>
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkjqN2BWBzDqLG
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:31:11 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 00694E3112
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:42 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 5E4ED600078;
 Fri,  9 Jun 2017 15:12:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 0/5] leds: pca955x: add GPIO support
Date: Fri,  9 Jun 2017 15:12:24 +0200
Message-Id: <1497013949-8786-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11441957804004117250
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 09 Jun 2017 13:31:12 -0000

Hello,

The PCA955x family of chips are I2C LED blinkers whose pins not used
to control LEDs can be used as general purpose I/Os (GPIOs).

The following adds such a support by defining different operation
modes for the pins (See bindings documentation for more details). The
pca955x driver is then extended with a gpio_chip when some of pins are
operating as GPIOs. The default operating mode is to behave as a LED.

The last patch adds the pca9552 bindings on the witherspoon.

I should send to mainline after some review.

Thanks,


Cédric Le Goater (5):
  leds: pca955x: add device tree support
  leds: pca955x: use devm_led_classdev_register
  leds: pca955x: add GPIO support
  dt-bindings leds: add pca955x
  ARM: dts: aspeed: witherspoon: Add pca9552 device

 .../devicetree/bindings/leds/leds-pca955x.txt      |  88 +++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  85 +++++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/leds-pca955x.c                        | 263 +++++++++++++++++----
 include/dt-bindings/leds/leds-pca955x.h            |  16 ++
 5 files changed, 418 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

-- 
2.7.4
