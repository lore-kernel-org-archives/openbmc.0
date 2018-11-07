Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qnj45wgpzF3Hf
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 00:44:52 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wA7DEbCo011300;
 Wed, 7 Nov 2018 15:14:37 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 8C8F2630CB; Wed,  7 Nov 2018 15:44:35 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: linus.walleij@linaro.org, yuenn@google.com, venture@google.com,
 benjaminfair@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au, kunyi@google.com
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration
 function
Date: Wed,  7 Nov 2018 15:44:34 +0200
Message-Id: <20181107134434.354795-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181107134434.354795-1-tmaimon77@gmail.com>
References: <20181107134434.354795-1-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2018 13:44:57 -0000

Modify GPIO direction setting in pin configuration function by using
generic GPIO functions to set the GPIO direction instead of direct
access to the GPIO direction register.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7ad50d9268aa..b455209382a5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1799,19 +1799,12 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		if (arg) {
-			iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
-			npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
-				      gpio);
-		} else
-			npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
-				      gpio);
+		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
+		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM, gpio);
-		iowrite32(gpio, arg ? bank->base + NPCM7XX_GP_N_DOS :
-			  bank->base + NPCM7XX_GP_N_DOC);
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
+		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
-- 
2.14.1
