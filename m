Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oWe3bXjh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="U2bg5XL/"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygGLJ5RgfzDrTr
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 15:43:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 855BB20B97;
 Sun, 19 Nov 2017 23:43:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 19 Nov 2017 23:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VfEoyMMmXZnsMn5+2KP7q4zObb2txS69vOFeEuWbuac=; b=oWe3bXjh
 c6v7GIW1VENdCUHXCrH8d586Lge//W0+++svaOMmuNQBJdTDpS/Mdwi5Zh4C2uoV
 jtB8wVQBfcEguVsJ6I7qQ9AmDgFi2TlZ61rUgX/0jcUSI0NKTpjixqOpaiDb1QgL
 iIT84vnFATe0nDQRY/61wd/skYyNICQWGH6tVfphmvv4QMQB2dfb+0CC+VWM3ify
 McVFoGo03sANzYAUX6KH9d/uU0K5R2CYk9r0d9OikZNhmjPfWaCOCU/ewNjp+hEP
 KFm3Hf+Tn8L+budfhGOiow1dy+R3IpSeersTOXQb6e4F6khjs4SXG752SKx2INaQ
 nATwNROUMwM9+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=VfEoyMMmXZnsMn5+2KP7q4zObb2tx
 S69vOFeEuWbuac=; b=U2bg5XL/gH/D0MAV55mMkmV/0yQqjrGa2VSAYgD92I39I
 x3p/AvTeGG+v1oPnFogUgv/j7qioLMpR1bhgn5v4ZtdKxGTZSph40ypSIv2mfqnT
 DGB55melVsZ4nYk695G08/+6Y6JZCGfNdsz8nN6dUaiX+XMRjn3ETf1iTE+AxDfk
 0D5P5lug8ZYpihgvE5WR3Cv+OIcoFaDpHJAWRED/aJrqnKyfLDToHkfVNshl3ltV
 sXUi2PHggoWTOkC9Ct4vtb+Uk5xgOuR9S6fIh7OegKURiT2F5p0n3jOg1nPisVmc
 zgUvQifKiaS7olW+JJZ3amt29zOMg9x1bgpd1ZZNQ==
X-ME-Sender: <xms:Vl0SWsPCrniXgP41jGfLPv-Z0nHH0WaMdR_quwANnMvjHTrE11NExA>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70DFF2486D;
 Sun, 19 Nov 2017 23:42:58 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, jdelvare@suse.com,
 corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v6 3/4] pmbus (core): Add virtual page config bit
Date: Mon, 20 Nov 2017 15:12:05 +1030
Message-Id: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
References: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
In-Reply-To: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
References: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Mon, 20 Nov 2017 04:43:06 -0000

Some circumstances call for virtual pages, to expose multiple values
packed into an extended PMBus register in a manner non-compliant with
the PMBus standard. An example of this is the Maxim MAX31785 controller, which
extends the READ_FAN_SPEED_1 PMBus register from two to four bytes to support
tach readings for both rotors of a dual rotor fan. This extended register
contains two word-sized values, one reporting the rate of the fastest rotor,
the other the rate of the slowest. The concept of virtual pages aids this
situation by mapping the page number onto the value to be selected from the
vectored result.

We should not try to set virtual pages on the device as such a page explicitly
doesn't exist; add a flag so we can avoid doing so.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 27 ++++++++++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b54d7604d3ef..d39d506aa63e 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 
+#define PMBUS_PAGE_VIRTUAL	BIT(31)
+
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index edc25efe7552..e215bbd403a5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -161,18 +161,27 @@ EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 int pmbus_set_page(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	int rv = 0;
-	int newpage;
+	int rv;
+
+	if (page < 0 || page == data->currpage)
+		return 0;
 
-	if (page >= 0 && page != data->currpage) {
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		if (newpage != page)
-			rv = -EIO;
-		else
-			data->currpage = page;
+		if (rv < 0)
+			return rv;
+
+		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		if (rv < 0)
+			return rv;
+
+		if (rv != page)
+			return -EIO;
 	}
-	return rv;
+
+	data->currpage = page;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
 
-- 
git-series 0.9.1
