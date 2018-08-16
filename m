Return-Path: <a.soldatov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.soldatov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="fn6tK1B3"; 
 dkim-atps=neutral
X-Greylist: delayed 582 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Aug 2018 20:51:26 AEST
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rjnB5BnszDqp5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 20:51:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EC68C41904;
 Thu, 16 Aug 2018 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received:received; s=
 mta-01; t=1534416097; x=1536230498; bh=DxzWnylAdYYq6e6yR7M7vhJUt
 wCK4cUoNwY+zWrge00=; b=fn6tK1B3krTKrAQsN1j35qXzqUYvVthkvPgF4E8Q/
 0r7p0/vg/lTa312Ef3bEjLASa3fgQ/x7eVGF/cMAhdF/C0HWI0P5rDaTnvJnELf0
 nAowXkyHm98Lao/Td51qQpJhRma/dDz9QYmc1f4HM7txpzfhtmgfX4DoU5sQh079
 vQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fox-a8YbqI1; Thu, 16 Aug 2018 13:41:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 042C7411F8;
 Thu, 16 Aug 2018 13:41:36 +0300 (MSK)
Received: from NB-207-Ubuntu.yadro.com (172.17.4.249) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 16 Aug 2018 13:41:36 +0300
From: Alexander Soldatov <a.soldatov@yadro.com>
To: <linux-mtd@lists.infradead.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
CC: Alexander Soldatov <a.soldatov@yadro.com>, <stable@vger.kernel.org>
Subject: [PATCH linux dev-4.17 1/2] mtd: spi-nor: fix options for mx66l51235f
Date: Thu, 16 Aug 2018 13:40:54 +0300
Message-ID: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
X-Mailer: git-send-email 2.7.4
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

Currently in driver spi-nor there is a line for mx66l51235l.
According to Macronix site there is no such part number.
The chip detected as such is actually mx66l51235f.

According to the datasheet for mx66l51235f,
"The device default is in 24-bit address mode" (section 9-10).
Hence we removed SPI_NOR_4B_OPCODES option with this commit.

Cc: stable@vger.kernel.org
Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e95f35..e9f44475571a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1068,7 +1068,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
-- 
2.7.4
