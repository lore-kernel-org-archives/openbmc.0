Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iRC6P8Aw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YpgpuLBT"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yf0lP6BHJzDrSV
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 14:26:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ACDF420B56;
 Fri, 17 Nov 2017 22:26:55 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 17 Nov 2017 22:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R/Dw2YXzaD4KXl0H+29GL/6kHc1RzJ3yzxp/bHIpO08=; b=iRC6P8Aw
 wkjT/6baxhIfW4/ja16ARiMs3cu2hj4aQu7bw42BX3GKa+lZz/J0VJoEeflNPyBx
 0QPTiqWkLbF4CnOp5bvRvdRXJLD4veFeX3iNF9KSwIeDpPCDvedke5frYI9QgZFx
 jWEqbRTfKvM32LOo6gO7OCTHViTSnLhs3K/bRNgb8TkMrgesybzSC6dFNFgKLN4Y
 0kupAtmE3xoFPFHs+mmQRFhxl/TFiBMLG07PmJYERD5CDY/fwf+3XfVZXS1yGGKH
 cmC3UHkc2Zb3WF93tke5trhSNrSaytOxFSgbHR+8Mi16ooxee3jKpu5fSZRExyrk
 ffgpYeh+ZKc8kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=R/Dw2YXzaD4KXl0H+29GL/6kHc1Rz
 J3yzxp/bHIpO08=; b=YpgpuLBTpMts7dQxc3qqs7kxX5YHXXFCF2aGTSzpOqCA8
 XqlajGJNfNGzFF4To0XlvZ/6QeyfFKmHnF3LhzU7D2TuEXiC7686t+ukdqssSLIi
 /3hfVhZcDxuD1YecE1aQDTdCTZQXk6rwFgalIKXk8H68iSaETT0yfHEw+UkZpv6q
 obNzUbmH80VEJA6CZLDcFVaDyu60N4yOIm1zAfG+fJj14pciW7q6Nj/8NTs4HuUO
 QLpmoPp/K9lG6KGWlhJ2TD70fv0FOCXyAzHdshIhEjqBtIUwkCn8UzILjCZyauDb
 Wrws+jb+3Cwd8jOghQAmTXpoVZdk05CsYiBPFX0Hg==
X-ME-Sender: <xms:f6gPWj1j5AAw-uQECc5OdIdHuQ3BvHexnqIbOQ3xoyIbhwCRspH0fQ>
Received: from dave.aj.id.au (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88072240F8;
 Fri, 17 Nov 2017 22:26:51 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 3/4] pmbus (core): Add virtual page config bit
Date: Sat, 18 Nov 2017 13:56:05 +1030
Message-Id: <c5ccfeab881181dfbfdbdfb26051bb4cd332f6e6.1510974230.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Sat, 18 Nov 2017 03:26:58 -0000

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
 drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

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
index 631db88526b6..ba97230fcde7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, int page)
 	int rv = 0;
 	int newpage;
 
-	if (page >= 0 && page != data->currpage) {
+	if (page < 0 || page == data->currpage)
+		return 0;
+
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (newpage != page)
 			rv = -EIO;
-		else
-			data->currpage = page;
 	}
+
+	data->currpage = page;
+
 	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
-- 
git-series 0.9.1
