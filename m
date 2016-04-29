Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x22d.google.com (mail-pa0-x22d.google.com
 [IPv6:2607:f8b0:400e:c03::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qww0X5nb6zDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 10:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=kASMmzO/; 
 dkim-atps=neutral
Received: by mail-pa0-x22d.google.com with SMTP id zm5so43070203pac.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:subject:date:message-id;
 bh=BOwWXefxIrAFrJmWzzUPYT1qO2WoMwdN5IwOLkEsb6g=;
 b=kASMmzO/7VeAKNoPXgqHHIlLqf4uHvdsgy/dEJdEWCaaJKbemfIjQ4q64jxdoNCJx5
 gVaMP46UHeywU4IoKXUFdaK7F0yqkmdE4t9JiCS3nM1MbQJF0VVS6h3CKTpQ9lSiXhL8
 dgvrUy+2H95e/o6IqeCcQ0EE7PdQxQ28HrhCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=BOwWXefxIrAFrJmWzzUPYT1qO2WoMwdN5IwOLkEsb6g=;
 b=Ma/6Gfm00wzQdrHbs8ews2XD7q5at5WFTki+HUaI50Nssym6nF6gJl9THadY/JVaZn
 s1fmlI57AYXk92g3qObIPlCx3Vm3RKopJ4h/ENFLqYcIaXY6pTia4PDrJWA4/JUmJdmK
 Cv7ItQxCnl2++krJUr3ME8CDNHPwtraYILXU3ZZj3GOITVdIP7J+WyuFUU5R03DQLYsC
 kolw8fUbMS7nVHUxUT9roShUGOiXnB8tlDSy4tSvk0Ig7Wsx9Dy8rBm+FNFPpVX6TECl
 AK4Pe0wN9SdU8/NFE4x2I5qS/C1/hQULWwyeGXMulHH9NNeFKACInzglklgOxsF/poCl
 S7BA==
X-Gm-Message-State: AOPr4FXKhSzmRBS4kdEodkahKsuQGuDMbz3MOatPZp8Em0DqnQd5A6Z6wLqCZxb6EHO4Ng==
X-Received: by 10.66.80.1 with SMTP id n1mr16666013pax.152.1461890585770;
 Thu, 28 Apr 2016 17:43:05 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:dbb:a970:cef7:c600])
 by smtp.gmail.com with ESMTPSA id x184sm18099802pfb.53.2016.04.28.17.43.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 28 Apr 2016 17:43:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [qemu 0/3] watchdog model and ast2500 scu
Date: Fri, 29 Apr 2016 10:12:49 +0930
Message-Id: <1461890572-30636-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Apr 2016 00:43:10 -0000

Hello Andrew,

Here are my changes to add some basic SCU state for the ast2500. It's mostly so
I could test my kernel clock driver.

There's also a watchdog driver. This compiles, but it's not complete, as I
haven't calculated what the conversion between the register value and the
Qemu timer ticks.

They apply on top of your ast2400-scu branch.

Cheers,

Joel Stanley (3):
  hw/arm/ast2500: Integrate SCU
  hw/misc/aspeed_scu: Add number of regs define
  hw/watchdog: Add Apseed watchdog device model

 hw/arm/ast2500.c                 |  23 +++++
 hw/misc/aspeed_scu.c             |  30 +++---
 hw/watchdog/Makefile.objs        |   1 +
 hw/watchdog/wdt_aspeed.c         | 193 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2500.h         |   2 +
 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/watchdog/wdt_aspeed.h |  33 +++++++
 7 files changed, 271 insertions(+), 13 deletions(-)
 create mode 100644 hw/watchdog/wdt_aspeed.c
 create mode 100644 include/hw/watchdog/wdt_aspeed.h

-- 
2.7.4
