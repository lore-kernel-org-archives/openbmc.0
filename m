Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sQodXmZT"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44V57t6sMDzDqPK;
 Thu, 28 Mar 2019 11:18:47 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b12so10755594pgk.0;
 Wed, 27 Mar 2019 17:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AaO63okgZcxEYSegIa/XNkkSFYkTTOsH55NwdYk1vY8=;
 b=sQodXmZTsLa+HwkFmq/eQp8EBrvYXQDGRqu6kQUbxQ8z0nXWrCYYFXonaKKR1GI7wE
 q2KxoTOTD4vH88RqjRKQ7l+bDKmCOBR3s+HnPJnX+M2/s+JeASTmq9x41l7SpsYIfRgV
 CRz4+MV22KaANHbhSVgkwtaQZwyH7NS0nYbLz+ncf0NM8gMC1x7iOGYcnjLf9zXHDxnG
 vm/aiiJCHTB8c9NB3dlZdTv7Zk17K9zMOMB47iyb8uVGgUg6QIqxsP54j5M3iWmchKFA
 rEnoSJM3ZfOUbMbBm48PriXI24/JsIBL/OWp1VL9Ak9+JqxYNVzVWc5MtYvIXiajooEx
 krgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AaO63okgZcxEYSegIa/XNkkSFYkTTOsH55NwdYk1vY8=;
 b=L0QFU8laBmLtc83oYElWzdhCQ9kPLofzCMZCFwnfrXCWEqY3yeyMC3Dmd9ZqRD+AfG
 xyT3OAIWwsCmKLaXO+rWk+4VWvp8coIfEUUK+viSEwPJsp0ujb7amwAkyXXl57O/5XsV
 GxpbUpPsZcNFtp9fR9IJfl/MkGKpCO/8uHcgceXCK4EwluPyBwCxdftN/Jht9yo6UtRv
 lTUA5GRSv+UX3ZGLXoNFnLjXp2tzkc+KdG6pHFGSn+VMQF3+VQyrqQGTRC+ytVE7CWmY
 r8A27KNfJacurZGRypZdW3K+BSGTAlljrGRffDgHel6NwpMWo7BVa+ejVm+ymIO9jtG9
 1N7w==
X-Gm-Message-State: APjAAAX5jFh3bu4yoCp4tSiuhN1FwSOpMyFZN+tiTillT+O77O5seeBb
 3WA38724sZl9g1Ir/8MaykhxOutK
X-Google-Smtp-Source: APXvYqzj3qHnkQDAWsoSEi4dkMwfLdOo4isijAF9AB19JKaa/JoyEehjmMrVwFdVHAxdV92gLc7KwA==
X-Received: by 2002:a63:5460:: with SMTP id e32mr37496006pgm.401.1553732322360; 
 Wed, 27 Mar 2019 17:18:42 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i10sm26332732pgs.26.2019.03.27.17.18.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Mar 2019 17:18:41 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Thu, 28 Mar 2019 10:48:35 +1030
From: Joel Stanley <joel@jms.id.au>
To: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Subject: [RFC linux 0/2] rtc: aspeed: Add alarm support
Date: Thu, 28 Mar 2019 10:48:30 +1030
Message-Id: <20190328001832.11076-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2019 00:18:52 -0000

These are some work in progress patches to add alarm support on top of
the recently upstreamed RTC driver.

TODO:
 - Make rtctest pass. The select() tests fail currently
 - Add locking to the alarm callbacks

Joel Stanley (2):
  rtc: aspeed: Add locking when touching registers
  rtc: aspeed: Add alarm support

 drivers/rtc/rtc-aspeed.c | 109 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

-- 
2.20.1
