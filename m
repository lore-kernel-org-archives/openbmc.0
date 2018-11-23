Return-Path: <dan.carpenter@oracle.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="NbVsT5xY"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431SQR1nCFzDqC9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 18:20:40 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wAN7IumO193364;
 Fri, 23 Nov 2018 07:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Xht/WA5LvsBqwb6utVvq4dyoAmrrFhMqjBLoTss8nrc=;
 b=NbVsT5xYD6I58AhAgbQ2Y5uQZxtwA3kPvVPOFlP67Upb/kMbLet20BFRYuYq5uDVjl7K
 mePZk33bUyka+v0N+0GBS/iPtygoFG9BYRO1zhScA/y7SBKHxLE2FozW2t5iWtPgQSoG
 U9QXNJRux9YLCHxo/Zkyok8KRsx0IvzRJQQSmxNYUpmWDrfLq5fFDfgwEhjuvuuZv0tV
 hE4omAId+a3aG9iFfw3+Bj/P0AbtwfLhFXymyhk2GeGEhYyk5VbyEPupYo4LQHEZtkGi
 d0bT+9Wa5gpvmi4DxIe5wz9+6NrtCHEZ5yX0xSaIT5FhgcwokYIVpFu8WUe6C9cKpk7k 8w== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
 by userp2120.oracle.com with ESMTP id 2ntbmr1bmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Nov 2018 07:20:33 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id wAN7KWiS025311
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Nov 2018 07:20:32 GMT
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id wAN7KWS0025962;
 Fri, 23 Nov 2018 07:20:32 GMT
Received: from kili.mountain (/197.157.0.30)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Nov 2018 23:20:31 -0800
Date: Fri, 23 Nov 2018 10:20:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] spi: npcm: Fix an error code in the probe function
Message-ID: <20181123072024.5vtjzta4rcmqtyph@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9085
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=875
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1811230058
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
X-List-Received-Date: Fri, 23 Nov 2018 07:20:48 -0000

There is an IS_ERR() vs PTR_ERR() typo here.  The current code returns 1
but we want to return the negative error code.

Fixes: 2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/spi/spi-npcm-pspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 342178e282bc..fed05b02007c 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -381,7 +381,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
 	if (IS_ERR(priv->rst_regmap)) {
 		dev_err(&pdev->dev, "failed to find nuvoton,npcm750-rst\n");
-		return IS_ERR(priv->rst_regmap);
+		return PTR_ERR(priv->rst_regmap);
 	}
 
 	/* reset SPI-HW block */
-- 
2.11.0
