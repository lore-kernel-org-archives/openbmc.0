Return-Path: <a.soldatov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.soldatov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="H+fGURbN"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rjnB58bPzDqnw
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 20:51:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 90C75411F8;
 Thu, 16 Aug 2018 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1534416097; x=
 1536230498; bh=Ca1aGlm5fmu/fMImsgEBNCfjMJBKa7O5vj96IF8UDYg=; b=H
 +fGURbN2f/ztvAZuIX7Et+LOWMeJ2QbolYucLGkVLdjsvhE1hmWoipZmRrlD0VQH
 SOwaKjFUuZpDtHSedzvSRQ10jRQ/4djTDq2h3tyvtfBFJs65HoWHYtoPL3P/m7+6
 6IHqXtRdR9cvRb2QlL5LRZ2jtTfMZq0N/EM5TeFttY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYwwIWZkS0Q4; Thu, 16 Aug 2018 13:41:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C6E9E418F9;
 Thu, 16 Aug 2018 13:41:37 +0300 (MSK)
Received: from NB-207-Ubuntu.yadro.com (172.17.4.249) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 16 Aug 2018 13:41:36 +0300
From: Alexander Soldatov <a.soldatov@yadro.com>
To: <linux-mtd@lists.infradead.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
CC: Alexander Soldatov <a.soldatov@yadro.com>, <stable@vger.kernel.org>
Subject: [PATCH linux dev-4.17 2/2] mtd: spi-nor: fix spi register address for
 AST2400
Date: Thu, 16 Aug 2018 13:40:55 +0300
Message-ID: <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.4.249]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Fri, 17 Aug 2018 00:59:51 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 10:51:27 -0000

According to AST2400 datasheet v1.4 the SPI Flash Read Timing
Setting register is at offset 0x14. There is no register at
offset 0x94 (unlike FMC controller and AST2500).

Cc: stable@vger.kernel.org
Fixes: aad58eba7209 ("mtd: spi-nor: aspeed: optimize read mode")
Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index c9cd20f199d9..9ddf24b042f1 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.hastype = false,
 	.we0 = 0,
 	.ctl0 = 0x04,
-	.timing = 0x94,
+	.timing = 0x14,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
 	.optimize_read = aspeed_smc_optimize_read,
 };
-- 
2.7.4
