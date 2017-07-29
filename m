Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xK6p2498QzDrVd
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 11:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YTY30p9t"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id v190so116997057pgv.2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 18:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=neuYIs0x3YrOmCWjJ40ujFNTeMcMywch5prqiDbC8bU=;
 b=YTY30p9thHlwgb09h2PAkyvUe+QSsOI2EscQBtyZFSLjVCG7lPgEUOhfHr4fPipjKd
 axdcilUwwEMS9/Zn7nLlqkKrVdXir86LCNhRkLQnzt+NPO2hNoo+CIwN7Zlfwo4Boh/I
 wm060YlAW2iiZe2vY1SLYw7cdqauIRnLSpmN+xU/o2AweMv+XdWdza3WP5V3Spk8Yv6Y
 TXZAJvK/O0q98+bkW5Sk/yueXTf4fn8DBOG4WVhLjKtlphW0dQRO9LY2JrVcAJsBryTr
 PT91N0AaHtzchiHi5s4R1Mq7TxOiHnJYpGgA/p4fVfkWwj+XADjoEddDpZNYW5blqCdy
 24Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=neuYIs0x3YrOmCWjJ40ujFNTeMcMywch5prqiDbC8bU=;
 b=BE3Qh4ddam9FIaIyrGLZoh/2JnXDQrtFxexYDun9lVBxnpZ8gL2LwIpG5DRhkwZm8a
 pJZzKdXW807kEb1yjlf3tIZj037ZAAX70SELunA9dUEP2+TDqjocJl1s85fFrtm2NW2p
 qLjcN6zgiccRyNdR8vIRaPtuA2GhMkKfhu6p+rE7J1CjqV6Sc4F36zUaiwr7togVUh9a
 GMlakl1qAg3rqoTw6u07nkIEodEBe9r3H7j/kFDOpY2qZ26VlwVVUAlq0aJvdETK08mQ
 90sLgskXrDXFa4OwtakeFE868sMtTgM4AJny1kcbKbgr23II/5F60uTdnd4baXvMOfOZ
 OV6Q==
X-Gm-Message-State: AIVw112vtBaCUbqiOyKwNaImmpsiq9iywU+ZIOZJv1by79p6mpxdPAjf
 QgXZMaIClVI/U6D1
X-Received: by 10.99.126.86 with SMTP id o22mr8904722pgn.385.1501290023493;
 Fri, 28 Jul 2017 18:00:23 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id r64sm44830232pfj.62.2017.07.28.18.00.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Jul 2017 18:00:22 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, benh@kernel.crashing.org, joel@jms.id.au,
 venture@google.com
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1] i2c: aspeed: fixed potential null pointer dereference
Date: Fri, 28 Jul 2017 18:00:12 -0700
Message-Id: <20170729010012.5032-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc0.400.g1c36432dff-goog
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
X-List-Received-Date: Sat, 29 Jul 2017 01:00:27 -0000

Before I skipped null checks when the master is in the STOP state; this
fixes that.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index f19348328a71..6fdf9231c23c 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -410,10 +410,11 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
 	}
 
 	/* We are in an invalid state; reset bus to a known state. */
-	if (!bus->msgs && bus->master_state != ASPEED_I2C_MASTER_STOP) {
+	if (!bus->msgs) {
 		dev_err(bus->dev, "bus in unknown state");
 		bus->cmd_err = -EIO;
-		aspeed_i2c_do_stop(bus);
+		if (bus->master_state != ASPEED_I2C_MASTER_STOP)
+			aspeed_i2c_do_stop(bus);
 		goto out_no_complete;
 	}
 	msg = &bus->msgs[bus->msgs_index];
-- 
2.14.0.rc0.400.g1c36432dff-goog
