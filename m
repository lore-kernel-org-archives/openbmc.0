Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Kz53CHVzDr4K
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WLsEc00m"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id e199so548774pfh.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=55VK/UbVnlnX5qXWF+suU6xyZhAIymAPxPcDJqpHLzM=;
 b=WLsEc00muwMqgZVgdXubebvK3jEpcV6bxEdLzTDu1KqYEBzRDVto18PjRDQVEDs8qT
 ACtzuk2SU9Wc6M03nxuU4LAJH7qn9xbUAB/sa1uSt5m3J2fXhvVmTC56iRYcMdBiULIH
 YzJFFra1W84MdAVeB02Dh4WQAF0MBRaIGf4Y3A3udB6pa3KBJziZkE/V2ExNbnfF51iQ
 4V6/eqZKQpGkvfEKFQ97obH+UCtPwL94Lsms79cO/VmJiHPnWOXRbtip4PAp554VxFfB
 zRgYGO+suhBaF9x9R38ogYalK26XfuXI9lxAH587auEPPcIGuR+x5H4dTzTeCA8EM6qR
 UEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=55VK/UbVnlnX5qXWF+suU6xyZhAIymAPxPcDJqpHLzM=;
 b=L51G8a3ClALf+/hA3DRNt69Z26JKru3MoMvOBwzv2kkwBYmAC37MzqGa1MOJ/16msY
 vaDoy7CtHbwyv0O1s+/RwElgvHaxqkxs7fyVm/7HVzdMnfHUGhAT3xESRXMhwGeC+5nZ
 J+ryQTTzj4Y/6wSB1idjbtzSIbmLSdbgTQxtr9FRsajkeRA8ArZNSt8rAXVNYGWRmH7v
 mJxa4BR2NXCmXJWCDvcj5UiUb/dq1ryOtqZSHidwECbsBbBj95mE8sBySRwRYoXIjS3J
 0xmLS0V1MvgKYZgTVLRCSJ+dU7TRqklib7iB9bZmdqAF0+LNcrff+UF0xDBCQucrT9mJ
 8hpw==
X-Gm-Message-State: AIVw113HhFkR4JGtTDGSQ8i0eEKpwC2fDUgLVpMDUoHgkln9NIoKWiJZ
 y/5SnT2x2rnb8UPcKJ8=
X-Received: by 10.84.131.78 with SMTP id 72mr28060942pld.43.1499351727265;
 Thu, 06 Jul 2017 07:35:27 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id m186sm762203pfc.54.2017.07.06.07.35.24
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 07:35:26 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 00:05:20 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 2/4] i2c: fsi: Dynamically allocate port numbers
Date: Fri,  7 Jul 2017 00:05:01 +0930
Message-Id: <20170706143503.21888-3-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170706143503.21888-1-joel@jms.id.au>
References: <20170706143503.21888-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:30 -0000

The static allocation can collide if there are already devices
registered at the adapter number. Dynamic allocation is safer.

Users who wish to ensure a port appears at a specific number can use the
device tree alias feature.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index da045777624e..349bea0e2a63 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -584,14 +584,11 @@ static int fsi_i2c_probe(struct device *dev)
 		port->adapter.algo = &fsi_i2c_algorithm;
 		port->adapter.bus_recovery_info = &fsi_i2c_bus_recovery_info;
 		port->adapter.algo_data = port;
-		/* number ports uniquely */
-		port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
-			port_no;
 
 		snprintf(port->adapter.name, sizeof(port->adapter.name),
 				"fsi_i2c%u", port_no);
 
-		rc = i2c_add_numbered_adapter(&port->adapter);
+		rc = i2c_add_adapter(&port->adapter);
 		if (rc < 0)
 			return rc;
 
-- 
2.13.2
