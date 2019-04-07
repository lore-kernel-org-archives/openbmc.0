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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44cRLt6jjkzDqLL
 for <openbmc@lists.ozlabs.org>; Sun,  7 Apr 2019 18:20:19 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x377nY46006873;
 Sun, 7 Apr 2019 10:49:34 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1F71763000; Sun,  7 Apr 2019 11:19:31 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: gregkh@linuxfoundation.org, jic23@kernel.org, knaack.h@gmx.de,
 lars@metafoo.de, pmeerw@pmeerw.net, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 joel@jms.id.au
Cc: linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] iio: adc: modify NPCM ADC read reference voltage
Date: Sun,  7 Apr 2019 11:19:28 +0300
Message-Id: <20190407081928.72250-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Sun, 07 Apr 2019 08:20:23 -0000

Checking if regulator is valid before reading
NPCM ADC regulator voltage to avoid system crash
in a case the regulator is not valid.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/iio/adc/npcm_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index 9e25bbec9c70..193b3b81de4d 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -149,7 +149,7 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
 		}
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-		if (info->vref) {
+		if (!IS_ERR(info->vref)) {
 			vref_uv = regulator_get_voltage(info->vref);
 			*val = vref_uv / 1000;
 		} else {
-- 
2.14.1
