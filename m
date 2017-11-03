Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VmCI/3M2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KiTgaUA5"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySqP10225zDrCZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 15:54:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B811209ED;
 Fri,  3 Nov 2017 00:54:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 03 Nov 2017 00:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pm1Q/ksItrGaYfm55
 fEspoFZh8USTbVMSgCM2js/kk4=; b=VmCI/3M2gHZRQ+PDCqlFqn7aV8p9TcsOl
 /FO4GyttH6wLWME18kstLnDSMT6+SZ0NdV1eoywbQbI0U9qwfKbqJevAhUi6CXWJ
 /ivNGmd2m23B37ONuWc0OzyszIVvEgJ1IxCloOTW+ZSzc/Rtz0Ta7ta8OIG/fk4h
 LI6tHNPvBNHY1rWtD6rplCnb32BC9edQjYq3oQPYHFUtttW+cBmlbQLZ6fl0lJLd
 iomKqYnA60o+oLcOAUrWVKSvp+0/iBNXIn7YfdVU1/4Y7Ok8LOJTvhGsRulaiVf3
 Lew3cf3FE2JCQsBc/IJEMSYNd5oHOy/8kmjaiEemueWsirxz0JAMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pm1Q/ksItrGaYfm55fEspoFZh8USTbVMSgCM2js/kk4=; b=KiTgaUA5
 QtcgbLWvWfzFW8ToI7nAvrMEGBxAraBkljJU5YrIo1zO2Iu/nFlVjRHB1Njrlm4W
 5UA3Ok7gVsUjILaM0bwZfLNduaqPD/xU38AtD0zyuxPSMEBkVUwCxyPyktZodueo
 GBSe9DrLzVkp7dM3V3rt5IEhyLdmXU/fYsmTWqqIX7MRCM69MDwHLBWjyGnqQCuH
 94cs2+vs0xJZeaQ9TSnnUhH1NEJ0RP1tK7y7QwZZ+hRav/LtEbZMTKybITg0dX+o
 BphY7KTdGQoeJ8+stBNEGluNa5wAXtfjJb+T809WKP3t8YzdSOCL5mHJWPBekIfB
 MjwgQvQgalVYfA==
X-ME-Sender: <xms:cvb7WUhAPG0OFZSKyY17kyCdvfKhgVp3YaaSu714tcyM4p_qASAjwg>
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A4C624009;
 Fri,  3 Nov 2017 00:54:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v4 5/6] pmbus: core: Add virtual page config bit
Date: Fri,  3 Nov 2017 15:53:05 +1100
Message-Id: <20171103045306.26448-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171103045306.26448-1-andrew@aj.id.au>
References: <20171103045306.26448-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Nov 2017 04:54:13 -0000

Some circumstances call for virtual pages to expose multiple values
packed into an extended PMBus register in a manner non-compliant with
the PMBus standard. We should not try to set virtual pages on the
device; add a flag so we can avoid doing so.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index cdf3e288e626..0560a8dbcee0 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -367,6 +367,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 
+#define PMBUS_PAGE_VIRTUAL	BIT(31)
+
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 55838b69e99a..af7362de405d 100644
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
