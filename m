Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::243; helo=mail-ot0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KR2rPyLv"; 
 dkim-atps=neutral
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd38S2HTTzF19W
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:12:07 +1100 (AEDT)
Received: by mail-ot0-x243.google.com with SMTP id q12so6550258otg.10
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=hJLOisWwteL9AJk8mZsoVqgAamFrDP1RPd6ZkfhE0rw=;
 b=KR2rPyLvQBVQvVXdgCJSmAWDbqvSu0WPiu0gz4WaWQHxQkuzfj43FcNVYJHKWPMGZU
 qHsS9YxTIyTm+AxDvrfZ8TzgzL8/Y4isDxIly6uy+vF34Hp90s2sFyU+T/Ap3AAIpAvH
 AZn1Ea5+EDWNKe0uYxfiSVdWN91wZ2ivmZ0nqcKJbOqdjO1SJbIfAfqC0hvXKGgUQIXO
 4la6R3eAwnxIbtcp8TRJrBa2BnFFASg+sT8gBvcKHG13z+37cZdEnrhfxaxUz5awCVjF
 dTG+os+dDiCCHPuI6uUVKqQtcoj4g6j1rJglttoibyFVx+V/LB0y7mun8BoYaSmPbdBj
 q+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=hJLOisWwteL9AJk8mZsoVqgAamFrDP1RPd6ZkfhE0rw=;
 b=EM7o/Nd6Iy2YbrL6r+QEEhBNt6XA7/jmr4tuGtCWcfrGiiTgwRYTuXjPQSdXuJYkxe
 YxFnet2BnpeyLP7CV8krLHi9wNtiv8fpH3GeFRnDrRj4t9sR1Rloh1DE32s6DejOBn3O
 uVKACxxfe7wUaa9Lp4cEGEWEuYGh/vPBeluU9Sbpaym3GYQhCXiVm4lLLvXGZpyIl4lF
 iH6zjQ8XBUw/OyYF+YksCLzSS9Pxa9nKChgdUUQXqohZTOLW00Kj5BsOBFu58nC7AnX0
 qMK3bpH/7BqAWZHXfUobRqRHPffwWIhxwfVXsLdb+E0rXOnN3iPkNPmg7ycW4kiVSpC4
 TP5g==
X-Gm-Message-State: APf1xPCsXJwpfC90xvYvCbsRyLIDBrPMJ3uqFevCL+OkrWVk+ut8s5GP
 zVej9LuLNBlKYI+IPzU9eAq7bR7g
X-Google-Smtp-Source: AH8x225QPdWsnRntoeqDCjwx/hrj7DjqssigeTOV4WiE1XgSoppD/+HLCoPCPjapkcjqv0ZASE21uA==
X-Received: by 10.157.4.108 with SMTP id 99mr1422188otc.185.1518153124604;
 Thu, 08 Feb 2018 21:12:04 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id l15sm628437otl.54.2018.02.08.21.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 21:12:03 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 15:41:58 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 v2 0/4] LPC fixes
Date: Fri,  9 Feb 2018 15:41:54 +1030
Message-Id: <20180209051158.32354-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:12:09 -0000

These patches were developed when bringing up dev-4.13 on Romulus. We
need to ensure the LPC clock is enabled, now that the clock driver turns
off any unused clocks. We also need to enable the LPC firmware cycles
bit as we no longer have the aspeed.c hack.

v2:
 - Set bit 10 and bit 8 to get the LPC mapping working
 - Add bindings documents

Joel Stanley (4):
  ARM: dts: aspeed: Add LPC clock phandles
  misc: aspeed-lpc: Request and enable LPC clock
  dt-bindings: aspeed-lpc: Document LPC Host Interface Controller
  misc: aspeed-lpc-ctrl: Enable FWH and A2H bridge cycles

 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 39 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  1 +
 drivers/misc/aspeed-lpc-ctrl.c                     | 32 ++++++++++++++++--
 4 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.15.1
