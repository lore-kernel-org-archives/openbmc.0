Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I+Tz5sCA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b/BNHcJO"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQPYR6KFZzDqmt;
 Mon, 30 Oct 2017 17:23:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6927220AC6;
 Mon, 30 Oct 2017 02:23:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 02:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=L7eMDOCKX61dH0S5r/CUQMEKSR7PSiCxtzSno6/1D
 cM=; b=I+Tz5sCAiEZnMf4+l/VgdOnAGDhlzsDbuMud54FjxdMmCIqsNQ4Lzkol8
 H0dQVMlFwJ7mA1qdaydF8BjxvIixa+sercgpNVP78oW/PTkGjjQ7CWeOXoUsDRkW
 RDSGO2ZosKxo9lfsg47akhsWdM5F0CnaEsV022v2F7Iz2kGWbP6n+RFT7qb6XxGm
 jZR7HFuwBCrWroMoytBfvA2OkOjhlmKK3lvEYZfp+AzFihOsjMrtkZXvVFf/AvCG
 YAT9EimvZj+zE3ZxPeuoqgb+oS1Qw08vCEnnrimy4+pBMzOIfuGxZ6+/IDjLckse
 6Lsr4UEkGvhQthctF3gFdA5vCOVKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=L7eMDOCKX61dH0S5r
 /CUQMEKSR7PSiCxtzSno6/1DcM=; b=b/BNHcJOctkuzJEZ7ArzNXresGLLNlOWS
 XAdYnF0m2gD4g67EZ7wjIpGLo6cDEqRAozp0CQkh/Ms/FU4FGcagY1SAAkf5exs1
 u+WYv2nCfEx5CvjnHX0Ul59R3uwIMDhCCohKLgwDO7wfa9GmBwnGtwIM0YPJyG8u
 7+Y9q+1I8XR+7C6W2q9bTWKqXMLr7cit49cKZipK/wxPbKtbESP0LokHYzdQtnFC
 fuv3ChQpRBAGfCSgd+kZKh0Ig5Vg+ZcsMd0NYPD1GLwAwKuqD5to3f3DqYPkLOSV
 UR6cMiM/Kcpsan3c/ziajI4I00Z1otR9B0GwmT7SzNFKOGvAsAxKg==
X-ME-Sender: <xms:ScX2WcMkEscgstBsMPJVXuWhKTqRuLVk8Z13HdlZERh5G-UqOF8QLg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94A79247F0;
 Mon, 30 Oct 2017 02:23:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 0/2] gpio: Generalise state persistence (was: Expose reset
 tolerance capability)
Date: Mon, 30 Oct 2017 16:52:16 +1030
Message-Id: <20171030062218.27005-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 30 Oct 2017 06:23:08 -0000

Hello,

This series provides an API to configure general GPIO state persistence in
gpiolib. Previously, only sleep persistence was considered, but controllers
like one found in Aspeed BMCs also support persistence of state across
controller resets. There is some prior discussion on v1[1] and the initial
RFC[2]. The only change in v2 is to rename the new pinconf property to convey
the concept of state persistence rather focussing on reset tolerance, based on
feedback from Charles Keepax[3].

Please review!

Andrew

[1] https://www.spinics.net/lists/devicetree/msg200027.html
[2] https://www.spinics.net/lists/devicetree/msg199559.html
[3] https://www.spinics.net/lists/devicetree/msg200040.html

Andrew Jeffery (2):
  gpio: gpiolib: Generalise state persistence beyond sleep
  gpio: aspeed: Add support for reset tolerance

 drivers/gpio/gpio-aspeed.c              | 39 ++++++++++++++++++++--
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 58 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 10 files changed, 121 insertions(+), 20 deletions(-)

-- 
2.11.0
