Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SHMriWIo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D85fZQFA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQFgc5GLdzDqlM
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 11:27:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 563A1209E6;
 Sun, 29 Oct 2017 20:27:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 29 Oct 2017 20:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mdGxvKaQmOsFoE9WYb6TUIkBklIUm37OdIckwkO9T
 uo=; b=SHMriWIoCP8eskHJwFab3AVfPeYULeb7Z/B+n/Iw3e2zubVcKCYY8P6Cd
 04RrAqxkL683QoahJqzl6XKYHbgO6wOcR02fF2/A41DwxZVqLMIwgkxaZnq+F76w
 ShM9PvDWH7iMvT4AM7PMNESWPGvX0U5MebrcqBVsR7INLyAzYkFPv5gtZTkBTEwe
 l/VWh3Lal3Y9Q10XoUnpnOulusIaQyHXl7eiAyawG5bkxSWObEdXCnngsmKzPpsC
 IFcIknpNfeWytiyQzKqPaGoFmtEhyzpttsefo6Jkb7+4zSoWqN6enk03z2SE34j7
 Zp0EqahLUZOCyizTjDEIOhvGkWu/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mdGxvKaQmOsFoE9WY
 b6TUIkBklIUm37OdIckwkO9Tuo=; b=D85fZQFAsBCqj2hFOQKxqI801Mf0/NV/o
 Mne/QZfn1NbaCiu1iBtr1MA6AJyCx54Cy5mxhcSJEzWe4/vT3zIvBnPAkc41qaIu
 pSUSt8266yGU8hv+DS1MgJGDthJBmT6Rp1oEzSW94tseq3QD/HqVG5wdpxaAWlkn
 KeB/geTnHhG5bsm/wjdgEe79zR9WlPnflEtn116smQ9sBLq2jj0eesvHV8Te+Fs5
 QQK8CEjyBApgLDw27Ehw7xJGE5+/zYO0MBbQ7lSXVeZej/+HGZ9K68hBHlBAzH+i
 jCINq6DUBDw8Si/e63f4u+dOWanjZf3fBYwQPyVztjGvJG478zwzA==
X-ME-Sender: <xms:CnL2WS5vUrTj5BviV4NQUwE8BJGaD1gDCq_ZFq-Mz40AQHU3J8_yWA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E43E7FA81;
 Sun, 29 Oct 2017 20:27:52 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au,
	andrewg@us.ibm.com
Subject: [PATCH linux dev-4.10] pmbus: core: Switch PAGE failure dev_warn() to
 dev_dbg() for serenity
Date: Mon, 30 Oct 2017 10:57:07 +1030
Message-Id: <20171030002707.30557-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 00:27:57 -0000

Reduce kernel log spam from PMBus core failing a PAGE command to the
MAX37185 (and any other device). It's a hardware-design or driver
related fault, and is not anything the user can fix. Therefore reduce
it from warn to debug.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d4e959bda491..c4b551b9226c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -175,9 +175,9 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
 		if (rv) {
 			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
 						       page);
-			dev_warn(&client->dev,
-				 "Failed to set page %u, performed one-shot retry %s: %d\n",
-				 page, rv ? "and failed" : "with success", rv);
+			dev_dbg(&client->dev,
+				"Failed to set page %u, performed one-shot retry %s: %d\n",
+				page, rv ? "and failed" : "with success", rv);
 		}
 
 		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-- 
2.11.0
