Return-Path: <colin.king@canonical.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=colin.king@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wHzK22bPzF3Jr
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 08:42:52 +1100 (AEDT)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1gN2vv-0002uo-Ah; Wed, 14 Nov 2018 21:42:47 +0000
From: Colin King <colin.king@canonical.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: npcm: fix u32 csgpio being checked for less than
 zero
Date: Wed, 14 Nov 2018 21:42:46 +0000
Message-Id: <20181114214246.15591-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Nov 2018 14:31:18 +1100
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
X-List-Received-Date: Wed, 14 Nov 2018 21:42:54 -0000

From: Colin Ian King <colin.king@canonical.com>

The u32 variable csgpio is being checked for an error return
from the call to of_get_named_gpio, however, since this is unsigned
this comparison will always be false. Fix this by making csgpio an
int and fix up the %u format specifiers to %d accordingly.

Detected by CoverityScan, CID#1475476 ("Unsigned compared against 0")

Fixes: 2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/spi/spi-npcm-pspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 51777515c83f..6dae91091143 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -329,7 +329,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	unsigned long clk_hz;
 	struct device_node *np = pdev->dev.of_node;
 	int num_cs, i;
-	u32 csgpio;
+	int csgpio;
 	int irq;
 	int ret;
 
@@ -417,12 +417,12 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to get csgpio#%u\n", i);
 			goto out_disable_clk;
 		}
-		dev_dbg(&pdev->dev, "csgpio#%u = %u\n", i, csgpio);
+		dev_dbg(&pdev->dev, "csgpio#%u = %d\n", i, csgpio);
 		ret = devm_gpio_request_one(&pdev->dev, csgpio,
 					    GPIOF_OUT_INIT_HIGH, DRIVER_NAME);
 		if (ret < 0) {
 			dev_err(&pdev->dev,
-				"failed to configure csgpio#%u %u\n"
+				"failed to configure csgpio#%u %d\n"
 				, i, csgpio);
 			goto out_disable_clk;
 		}
-- 
2.19.1
