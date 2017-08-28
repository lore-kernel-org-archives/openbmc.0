Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgXRJ2yf6zDqYx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 10:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WYtPAlCV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ikBlw5LM"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DA14120994;
 Sun, 27 Aug 2017 20:18:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 20:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=NHWPJE5y0biqHmckWZt7ru6+hYVUgf
 JXDcJNWstFj+Q=; b=WYtPAlCVBgP4IfwfLOAyjAvgbZ9/ua9raagHhNxLXTb0u4
 PwR8pM8ot2bYjnXhP6f5KOSzTyujMNBl9yCJLSaOTqwchb4YSFWyf9gHXQZY55OX
 UONjrEdS/prB0u5QDC1S5sN7042eSkgiDQ/S5aUffjyoZJtdSv/6TOj4grn0rKcR
 MgkVfAFGEQO3T5V0HHyI6M/OuWmVQUhF9Yj8dFcbrrAZ6Q3KArlN4cgJjgWlwxJg
 HoPuvHGnYx3VUHuIJHugB40hVovLDtI4V56tRk4mUQQvXZBcoitHbFTxNnpNHa1L
 TI+SMwtX/XiYg3eRHscGMMO0+ce3UUWVaYJGY9pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NHWPJE
 5y0biqHmckWZt7ru6+hYVUgfJXDcJNWstFj+Q=; b=ikBlw5LMRLOve+a7SBXF98
 KPk0gGN4cU33rhgQaRt038B6NyDLxRZN1Ri+obta34skknMsR5yBzxLGOpBAuY3u
 jwvebqCL/nF8FgCG9yYctygl/KWej9DkFqr/O3v1qUVikcuTTomJOX8t/3bBqT+n
 K3mGLgzm1thcIJeGT/OLDidpv4E8jhfpWdLlfUXivGVLwQP7BOPOB2czY0a6uOQ3
 euFL92Bj8OLuN7W376IIuYdyOOD7Hp0x0rGNsM3j2RvyHXWWQNkgLgtZJHvK0FBW
 zn5mwhSh4BDadAInZoriWyaPFNG3qKVdAZ2wpwXxaCK4mhMlFegHs+lzbbzDecpg
 ==
X-ME-Sender: <xms:OWGjWSmjefckk8lxbKAZfJD-COuxQs6JTxGrUlgDmZnDmiLgVVS9XA>
X-Sasl-enc: VZL0cJQmTyDYKPAEeiQJHAguttWAwiUZZ+w14K8wuwUN 1503879481
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id C5668248E6;
 Sun, 27 Aug 2017 20:17:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/2] leds: gpio: Allow retaining state on shutdown
Date: Mon, 28 Aug 2017 09:47:09 +0930
Message-Id: <20170828001711.19662-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 28 Aug 2017 00:18:04 -0000

Hello,

LEDs controlled by Baseboard Management Controllers (BMCs) are sometimes
required to retain their state across BMC resets. BMC resets may occur whilst
the host is alive, thus the chassis and host system remain powered up. In these
two patches I define an new devicetree property to describe the behaviour for
GPIO LEDs and add support to the leds-gpio driver.

Changes in v2:
* Expand BMC to Baseboard Management Controller at least once in each commit
  message.

v1: https://lkml.org/lkml/2017/8/25/44

Please review!

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: leds: gpio: Add optional retain-state-shutdown property
  leds: gpio: Allow LED to retain state at shutdown

 Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
 drivers/leds/leds-gpio.c                             | 7 ++++++-
 include/linux/leds.h                                 | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.11.0
