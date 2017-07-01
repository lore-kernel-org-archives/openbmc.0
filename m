Return-Path: <venture@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x0J9w2rVCzDr51
 for <openbmc@lists.ozlabs.org>; Sun,  2 Jul 2017 02:04:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Crs3t++7"; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id e7so80865567pfk.0
 for <openbmc@lists.ozlabs.org>; Sat, 01 Jul 2017 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tbgJFy5zfS8CIBHt6ytH2ziIpWbc8i6Ow0zZb/DIzcg=;
 b=Crs3t++7YfhhyYOcMqZHYXN9ujF7xckeLU/yVq/oSA1uwJSIZuStalwofnhyGW+/zS
 oP09aTRLn77gSnC3T03soaI7MKF55+ct+tSf/g3WgugOvAVtEHfhJLZ5kvJ4ThJBWeNh
 FyXCluXQE84iZ6kElm6xFwUjKNFg3rcCQI9HoHdfHtwqgMYzvA8IEZupM+e8bZZwYbUB
 U69LdVwxFJFPeD3lXFRqOHAhjEmv5Wjze9e/dDqLYkY5NjJqUKh/uI7HKQ6/Go1/L4UK
 YNjNDrhbB7vbn35zj+AAgalRBher1+8dMG4nAqgbmVRyvHbTqaDmZ4KZMJvKY7qhUo/M
 wzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tbgJFy5zfS8CIBHt6ytH2ziIpWbc8i6Ow0zZb/DIzcg=;
 b=aWp0qqpgPxx9ONtVOqtjHxtXqCBUHEkn2IWFsWyQk6ge5zxLLsxgfsagjpP8LrrCjN
 fWZYwFtUnM6WAwOogZf1er/995VypVK+4o6PHIL6XQvQiW08xbKZxaDoIfpt98muaVhz
 AOdsVjKrQk36TGaGJVmp15R4I6Ibknga8XUvcxGtJ2SQWLtR4mUx6f2Xs7P0kBUT1+Hy
 LFX+qYBU1DE5j5D8A+eJ0VcGoQE8hC4FJakFOALS8ETLm0JsWOcgbnNjNxQN69+JwC0k
 E1cnlDTdVq9PR7rlAIBFUxrvquXngUPeIGPT3qlQY88F+jP4Xdtjn5jb5Wi8iyJuCD/n
 aKcg==
X-Gm-Message-State: AIVw113ZOpMjvi7/iXpyXfomDXpZlS1XMUKYidrLaeZxs5+G5F0nPUet
 afIOPLKdOelFiT4C
X-Received: by 10.99.122.3 with SMTP id v3mr1395378pgc.98.1498925056448;
 Sat, 01 Jul 2017 09:04:16 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id l4sm22418909pgr.21.2017.07.01.09.04.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 01 Jul 2017 09:04:15 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	roblip@gmail.com
Cc: openbmc@lists.ozlabs.org,
	raltherr@google.com
Subject: [PATCH linux dev-4.10] drivers/misc: (aspeed-lpc-snoop): Add ast2400
 to compat
Date: Sat,  1 Jul 2017 09:04:12 -0700
Message-Id: <20170701160412.45558-1-venture@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
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
X-List-Received-Date: Sat, 01 Jul 2017 16:04:21 -0000

This driver can be used on the aspeed ast2400.

Tested: ast2400 on quanta-q71l

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/misc/aspeed-lpc-snoop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/misc/aspeed-lpc-snoop.c
index 593905565b74..0647cff6280a 100644
--- a/drivers/misc/aspeed-lpc-snoop.c
+++ b/drivers/misc/aspeed-lpc-snoop.c
@@ -241,6 +241,7 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
 
 static const struct of_device_id aspeed_lpc_snoop_match[] = {
 	{ .compatible = "aspeed,ast2500-lpc-snoop" },
+	{ .compatible = "aspeed,ast2400-lpc-snoop" },
 	{ },
 };
 
-- 
2.13.2.725.g09c95d1e9-goog
