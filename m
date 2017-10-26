Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rRUjtRUy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LwpPFEYx"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMxhQ1xfnzDqYv
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 17:20:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A1CB1208B2;
 Thu, 26 Oct 2017 02:20:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 02:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HESL/gZw9h6j44GDA
 v2Q//pE3XTBaYmh+Hl+Nb/1fTk=; b=rRUjtRUy7hIdcyV32ejpyNOTm8nv6K+2c
 cQAvMEB0dXmOYgXsENb2Ev4Rc9oKsboOUDnCUiZuQBCiaBVMnvkwi9Q0IU6mUU/m
 FoJxXQo5I3N2YJpgN4czBCSNogkNKqJkNQkHDXIsi+sOfpZ9GkZFTkurpcgPCsrx
 /OTQ0jukUg3+klNWasCr6pLRFLW92QRZKsY6juNL8PQJrYMw/l+/ot7Kx5ckSWy+
 3bOvB8x7/SwXo8j+BB4QszFqfl3Lx7qmkQbC0f/2LMOMZmpbfoRPLuqQTCExfkpv
 i1KEpbEW99sGZRzaXzz00O1lVIgLlBeNdMq7hOGTIL5nSdSXLVn7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HESL/gZw9h6j44GDAv2Q//pE3XTBaYmh+Hl+Nb/1fTk=; b=LwpPFEYx
 scHaJOkB1NHHe5xzOTayJ1JkDO5ObzpuebLVuOao+yU8MZCOlgfnOuuzgdNTI1Rw
 Vb5DZ7MFhWH/a3SBWu+BvrOOOghYHym0w759GBILSESpucDzNSc95gM73Hy4Xh6N
 jAu63zp038FYzp32A0ZfxhR1kAW+BiAY5QcdUgmIw3mmICIPq3xulxB5n4c8iIse
 h1x3AnrhpGQy4CcyhCBPNAnnxzn84n4+HkBMEWL7Stx4kUWdefEdPbIviwO6bstH
 swTsfsSLHnDEO/AMSOcJ5STDipnjiBS1Cb7Mp9Vth89Hk60oyBlqVJd2+fo9IT1+
 xrwV3a+vUEhqMw==
X-ME-Sender: <xms:s37xWUTI9FDmCZuvqX7hIF_FLhMgGzDde7pKSBjFEpw4lNrOyNSIAg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B251B241D9;
 Thu, 26 Oct 2017 02:20:33 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au,
 Eddie James <eajames@linux.vnet.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 1/3] hwmon: pmbus: core: Add virtual page
 config bit
Date: Thu, 26 Oct 2017 16:49:38 +1030
Message-Id: <20171026061940.25364-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 26 Oct 2017 06:20:38 -0000

Some circumstances call for virtual pages to expose multiple values
packed into an extended PMBus register in a manner non-compliant with
the PMBus standard. We should not try to set virtual pages on the
device; add a flag so we can avoid doing so.

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index a863b8fed16f..fd422cd76452 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -367,6 +367,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 
+#define PMBUS_PAGE_VIRTUAL	BIT(31)
+
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f72f966f5251..390a7b02b836 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
 	int rv = 0;
 	int newpage;
 
-	if (page != data->currpage) {
+	if (page == data->currpage)
+		return 0;
+
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (newpage != page)
-			rv = -EIO;
-		else
-			data->currpage = page;
+			return -EIO;
 	}
+
+	data->currpage = page;
+
 	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
-- 
2.11.0
