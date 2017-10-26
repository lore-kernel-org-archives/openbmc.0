Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CgGSJMh/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RMmkUqAd"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMxhR5g44zDqYv
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 17:20:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BA6AE2094E;
 Thu, 26 Oct 2017 02:20:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 02:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OvUuDYeetracdwXim
 lRkMngIKIrGHAH/x0iSsqXlLlQ=; b=CgGSJMh/9uIghGNq/ZS1dqQnmD3Qp19yy
 XloAPg+5GhlohXFIfccmVdPayGCMXItL16FaTyxgJ/HdNYQybX1p7LeJB7UzPGvA
 sVu6/4BuQYX7dRA1J6OMMvJoxitix0o2lkc4a3MAy7T1i2tbuNepANMR1UDcxtiG
 Upxqy8kO4dr5LwN0eIrfonzuo9mv+HmKgYcpNhWOB3j7vAbFSGfmOzoiRgSGIe7h
 QV35HuKM/x21HRDe3+e8SsoShqyNBFOSQJAKkRtqoVcycFvYw6Pd3GClaV+lYR4B
 K8dP80/76zKAvH0Hb9P5OyHckOxd1ZVRk7AC7rFwW3bCK4J8UkCYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OvUuDYeetracdwXimlRkMngIKIrGHAH/x0iSsqXlLlQ=; b=RMmkUqAd
 7rNMfx2qS1PWVZqx9lOdDjZGfd+D+a8yZSWTY2rog59Xr5OsJRTrovuFv3latj5m
 LNg8hD2xxGiJHfkUD9yMljpZK1L/j9BlxnW87ZGDKwkyHqy8onw2T6u7w1g4fJVM
 qjwa2mw6n4TxXnE7M37KopVXEcUSDGaF3GnXHlCtqI1yYl401aCJcL28vifqLPQv
 wBxEJfJkoJFGFZy/f4c0cpdCTbqinnHbQHMyT5Br66SfWHusdCeW2duVf0zYvoOq
 53dvLHyk3ZjGVv8EIwzdyYsx85kAvb6+vlzF6bGEh2KwxcOr3nKceWqMVl/PiKz+
 sDFXfbRXyoiKfw==
X-ME-Sender: <xms:tX7xWRTlNpOctVw-B0U05S8ZR3biuCmADwDo-3Ua5QbRMHMbq7bqaw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4680241D9;
 Thu, 26 Oct 2017 02:20:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au,
 Eddie James <eajames@linux.vnet.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 2/3] hwmon: pmbus: max31785: Mark virtual pages
 as virtual
Date: Thu, 26 Oct 2017 16:49:39 +1030
Message-Id: <20171026061940.25364-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171026061940.25364-1-andrew@aj.id.au>
References: <20171026061940.25364-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 26 Oct 2017 06:20:40 -0000

Avoid setting PAGE to a unsupported value on the MAX31785 to avoid
errors from the hardware in circumstances that we know it will fail.

The virtual pages are used to expose the non-standard tacho measurements
for the second rotor of a dual-rotor fan. Maxim's implementation breaks
with the PMBus standard by providing a four-byte response to what is
usually a two-byte command.

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 6a0d289ad346..c862ab51e3af 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -436,6 +436,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 
 			info->pages = max(info->pages, virtual + 1);
 			info->func[virtual] |= PMBUS_HAVE_FAN12;
+			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
 		}
 	}
 
-- 
2.11.0
