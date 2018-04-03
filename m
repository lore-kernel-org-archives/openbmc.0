Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WdpVIS04"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KOQs+1xh"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Frz337mLzF23r
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B9F920FAC;
 Tue,  3 Apr 2018 10:27:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Prib4x/N7HxHPmRr3
 fOfyBawYB0qfhzcqrY22s3y2vU=; b=WdpVIS04MpOeYbhPYbyJE/ENoqHugP5+E
 ebD8O1fPUhUftIHIiU8Dsy2y0FAJQlM8qyxAfBB6+TDqU4OqZWq3i29T2VZdnFdy
 XmvmLZMFVGfORzr3lrtsiO4ene0jkg2qJUClOg3oTF2hZNiePDT0V6nNjgEwuGMy
 D6j8p0Tuuq/h1t+BdvkhTnio0nSBAF4y3Y+bj/mYPhI3/cc31p4StPXw/UCIDqUI
 yr2hbYK+ew78wN2aXVcAcv0iQuyy69LBddwUji0K00LmcBP/wyF/rB9c7qldBBIq
 jhnCIFolSL0VquDFGvS3AZWtfCvAklhg3l1pIkQb1ub/BeAY1FooQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Prib4x/N7HxHPmRr3fOfyBawYB0qfhzcqrY22s3y2vU=; b=KOQs+1xh
 u6MBQt1uoxYIy8bvIQfeAn+rICWkkY1SPADaFcCWC77FtpmbM0IjlVlG3cLnZ0ir
 G+4bALxq80OHlq+ILMGqsMyFOVtyhVI3OTMjjRnmRPqMqswLyUtJGpyWJTvindYZ
 p9f3pAh/xyfFdf/a68IIvFGsJHePBJ/PlhXJLQ0dEICmLgCNeKIFRqs+5u8lT6mB
 i5jTSPqBz5Y6ma2r/2MDa1MRGHwxX31Z5p18tqOvSmljRN3eBQ4LpsUMIG4BEqj2
 RngQISEKAf/RD0q+rjWuirpBwvrwrAnyHk/yU7bNiYATGBVN37KErLRshdaYW5ZJ
 d+VFvYmhff3/xQ==
X-ME-Sender: <xms:XY_DWoYqV5Dz9fJ8UpOjCxHO09b4oA-KUJCQ1MDR0jKwt73T-4TXSw>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8157310269;
 Tue,  3 Apr 2018 10:27:39 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 4/5] pmbus (core): Use driver callbacks in
 pmbus_get_fan_rate()
Date: Tue,  3 Apr 2018 23:56:54 +0930
Message-Id: <20180403142655.16681-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180403142655.16681-1-andrew@aj.id.au>
References: <20180403142655.16681-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:27:43 -0000

The driver may have overridden the pmbus_read_byte_data() callback, so
make sure we use that to achieve expected behaviour.

This helps in the MAX31785 case where we may need to perform a one-shot
retry of transfers in the face of a failure.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ee1bf11c7fc6..d0ffa4b3fcbd 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -453,15 +453,15 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
 		return s->data;
 	}
 
-	config = pmbus_read_byte_data(client, page,
-				      pmbus_fan_config_registers[id]);
+	config = _pmbus_read_byte_data(client, page,
+				       pmbus_fan_config_registers[id]);
 	if (config < 0)
 		return config;
 
 	have_rpm = !!(config & pmbus_fan_rpm_mask[id]);
 	if (want_rpm == have_rpm)
-		return pmbus_read_word_data(client, page,
-					    pmbus_fan_command_registers[id]);
+		return _pmbus_read_word_data(client, page,
+					     pmbus_fan_command_registers[id]);
 
 	/* Can't sensibly map between RPM and PWM, just return zero */
 	return 0;
-- 
2.14.1
