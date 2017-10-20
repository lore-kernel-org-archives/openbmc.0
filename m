Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="t3rRi87Z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qUtMClsq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBNR5fShzDqJl;
 Fri, 20 Oct 2017 14:38:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C436520DA7;
 Thu, 19 Oct 2017 23:38:45 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Qkjt7F+1bNzgCEoXu
 /43rmDfStMrzLff3C9TeEgV/+Q=; b=t3rRi87ZusR07ccmkZ63KNPfjnwfqJk66
 aeEbbTQMvoDk/5ptk5EYo7wTFmG7Rc9MnOhSWo/DgWdPyN0w84z9SOWdrkZ1STfF
 wNPbsQA+4CJF8eELHQpE3WiuMFljoN0ByjkuWdh5P7rNkK+zsKYvXviDe4DEPKCK
 0+ej39RmGMmGMpLQs3xd82p1pxQUrUMaqNmPd/FDK3xyprQ0oPcwYVSEvTUgyB0C
 ggbPA+D8/WhgKTbZc/Hz0hmVGOVxKkWdv9kPK5UP5Svuvva36mX0Vscd9LvtKzYE
 OUbunE3E/lL1KPVBNp4+Crqn40FrutFNT4mwETa2fglLCh+jGqR6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Qkjt7F+1bNzgCEoXu/43rmDfStMrzLff3C9TeEgV/+Q=; b=qUtMClsq
 WLiCDYZgOg1WozCR8DdtM6w53zhGzfWMQpnABF1OKRfIoWPOJX7kHROhjJQPgcdL
 U+Q1DfJYpZa1v6siC7rd/PzBZCXLv69TwUzruheiQppvRFh8tIkJ+61zOV5F5os+
 KWt1uepOQO8SdPJwCbGkwiCT8OzXz74phcPI7Wd/SbsI4b4lKz71tMZpIFvGIZ8O
 rX0C9X7m3DEXmEeiubojwghm3UDarscSqCfCu5OF/1sKn6wrVAKrm0IcgAu4Nf73
 GttSqhZuVoZUoW+Qa0xlJW23xQ2wyFNnzBlLJXaHQDXQC+ayNnS7OzNhbW65ZAZ/
 sNn9hR5/WyoSqw==
X-ME-Sender: <xms:xW_pWW_BRKY4pyTcTcZeT3vDBLPi5trPO6TGuU72pXSZ1LuI7N0vkw>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C582248B1;
 Thu, 19 Oct 2017 23:38:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for maintaining
 GPIO values on reset
Date: Fri, 20 Oct 2017 14:07:25 +1030
Message-Id: <20171020033727.21557-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171020033727.21557-1-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 20 Oct 2017 03:38:48 -0000

Similar to devicetree support, add flags and mappings to expose reset
tolerance configuration through the chardev interface.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpiolib.c    | 14 +++++++++++++-
 include/uapi/linux/gpio.h | 11 ++++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b4c5df10e84..442ee5ceee08 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -357,7 +357,8 @@ struct linehandle_state {
 	GPIOHANDLE_REQUEST_OUTPUT | \
 	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
 	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
-	GPIOHANDLE_REQUEST_OPEN_SOURCE)
+	GPIOHANDLE_REQUEST_OPEN_SOURCE | \
+	GPIOHANDLE_REQUEST_RESET_TOLERANT)
 
 static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 			     unsigned long arg)
@@ -498,6 +499,17 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
 		/*
+		 * Unconditionally configure reset tolerance, as it's possible
+		 * that the tolerance flag itself becomes tolerant to resets.
+		 * Thus it could remain set from a previous environment, but
+		 * the current environment may not expect it so.
+		 */
+		ret = gpiod_set_reset_tolerant(desc,
+				!!(lflags & GPIOHANDLE_REQUEST_RESET_TOLERANT));
+		if (ret < 0)
+			goto out_free_descs;
+
+		/*
 		 * Lines have to be requested explicitly for input
 		 * or output, else the line will be treated "as is".
 		 */
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 333d3544c964..1b1ce1af8653 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -56,11 +56,12 @@ struct gpioline_info {
 #define GPIOHANDLES_MAX 64
 
 /* Linerequest flags */
-#define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
-#define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
-#define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
-#define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
-#define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
+#define GPIOHANDLE_REQUEST_INPUT		(1UL << 0)
+#define GPIOHANDLE_REQUEST_OUTPUT		(1UL << 1)
+#define GPIOHANDLE_REQUEST_ACTIVE_LOW		(1UL << 2)
+#define GPIOHANDLE_REQUEST_OPEN_DRAIN		(1UL << 3)
+#define GPIOHANDLE_REQUEST_OPEN_SOURCE		(1UL << 4)
+#define GPIOHANDLE_REQUEST_RESET_TOLERANT	(1UL << 5)
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
-- 
2.11.0
