Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Gwd9Bpca"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sEoMD3G0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmdd22tL6zDrFq
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 17:29:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4633520C41;
 Tue,  5 Sep 2017 03:29:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 05 Sep 2017 03:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=pF7JkI
 ViaZ9xOsYXarz0N75Pbg+BspjOVEhaZVuG/FE=; b=Gwd9BpcaSprNn0ZXCCWa/H
 0cJJlOvYaWUY1/GluOW/sg+ZrCB8DFcbFMOG4l4FfqnSxpXGIG59qxC8I/guTnSD
 7yFs4DwRtvr8HjnQ7WT3ZSPkx2GrrSC5KKypsgUpf4R7czN3CaZ9Gm45py72LFJr
 t191gVvqZK7AZxWZzV8sc/1fvnjirALQzce0pZJ70HvnKKdXrjCA8OcQ5WztHLMQ
 mY5c/HMUMEThYeefGRtqX/bQGTTgejkhiyIeV8zjiumYP5XIs/61l0pxc8zuC41q
 oWFqFlFqLwuvdg0bzWxv7j/+5+h7n88/oopvJBWvAvkqOwRqcbJDRCucwowgdnCg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=pF7JkIViaZ9xOsYXarz0N75Pbg+BspjOVEhaZVuG/
 FE=; b=sEoMD3G0wiABDToTh3xYAomixCRp8It+CeJtw/0GXMb4SnLhSIIQQA2Yx
 gG9y2MyXNI8BfsFsiCLckODo+o0XuvVigYO0qjlhmAPUUGozUa1JnKL1eAVVLoQN
 0ruPckbcOgClUtHotXxZdp6uITYYb0/aDa/IYp+yjx1hbUaS3JwFYb9e+yMAqKIT
 Jro0JfDZCEEp+4Vet7GTxpXZAfxKEdKo5x1r6k8W5PMPqXbSbqZsqfuyMURhkC8V
 i5bhpTtDTp7Vh4Y3l2pcwMEVMewAb2n+I1kbNXZXOdixX6qWIR9wkWKsuzAoqi7q
 CVACJETKgsGC3o+DjaL4DiFzuXReA==
X-ME-Sender: <xms:RFKuWX8VHBuob5dT3d1UsY2NkktEzXewqe1q-5xu8bBfL42WlOD7rA>
X-Sasl-enc: wBJHzAmvqSzAsusrHAMOiT/oVV5p/dEOg5C2exnZuhig 1504596547
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D4377FA75;
 Tue,  5 Sep 2017 03:29:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH 2/3] hwmon: pmbus: Add set_page() callback
Date: Tue,  5 Sep 2017 17:28:27 +1000
Message-Id: <20170905072828.8749-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170905072828.8749-1-andrew@aj.id.au>
References: <20170905072828.8749-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 05 Sep 2017 07:29:11 -0000

With the improvement to error reporting in the PMBus core, issuing
CLEAR_FAULTS now propagates the error up the call chain where in the
past it was swallowed. This error propagation affects the 'virtual
pages' implemented in the max31785 driver: In some circumstances
pmbus_clear_faults() is issued unconditionally against a device.
pmbus_clear_faults() eventually calls pmbus_set_page(), which may issue
a PAGE command to the device. pmbus_set_page() issues
i2c_smbus_write_byte_data() directly, not routing through any of the
existing write path hooks, leaving the driver with no method to
intercept it.

As such, add a callback so we can intercept it.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index f8d7a7e0dce0..ed15d3b92f76 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -394,6 +394,7 @@ struct pmbus_driver_info {
 	 * register does not exist, and that no attempt should be made to read
 	 * the standard register.
 	 */
+	int (*set_page)(struct i2c_client *client, int page);
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
 	int (*read_word_data)(struct i2c_client *client, int page, int reg);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b71d214d1510..5411b0af363d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -158,7 +158,7 @@ void pmbus_clear_cache(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 
-int pmbus_set_page(struct i2c_client *client, u8 page)
+static int _pmbus_set_page(struct i2c_client *client, u8 page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int rv = 0;
@@ -174,6 +174,21 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
 	}
 	return rv;
 }
+
+int pmbus_set_page(struct i2c_client *client, u8 page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->set_page) {
+		status = info->set_page(client, page);
+		if (status != -ENODATA)
+			return status;
+	}
+
+	return _pmbus_set_page(client, page);
+}
 EXPORT_SYMBOL_GPL(pmbus_set_page);
 
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
-- 
2.11.0
