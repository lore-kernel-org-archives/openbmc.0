Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1c4w5ZWGzDqHv
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 14:04:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VB9E+gt/"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id o126so7462754pfb.1
 for <openbmc@lists.ozlabs.org>; Sun, 09 Apr 2017 21:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=P8UKeEtCGUgh6lZYo1AcU7syRd6tJ6WJejzPS2lZOpE=;
 b=VB9E+gt/TLc/g6A56adfHXkDeH7+Dj3eFggNtQio8VaepidqmgPsY37h8MKKnykWED
 UcDtgCj8pyEFoSli2D4UeIy6bmOmKzF5jKfwkG4YKTMF78Syk5yWuo+fcEc3INb6DStj
 KOAZx1YmSUbUIFz2eEv4f03wh/d/m83FiuSYBe4JHoqAiNzk2AkMAkkFvGw8QZMRnIjh
 8UXMjXrhYk7Fxv4di8116cpJiSc9ZP8UZplgn2dvdJwgCB2QPVfvKgkJ7GyfAGCcnGf7
 m86bgk/HYQEDQ9oxU+I3TAip/h1shq1VyE9cHhvRdiXJhuq0XGTsaIPKID1cCO0oocpJ
 j+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=P8UKeEtCGUgh6lZYo1AcU7syRd6tJ6WJejzPS2lZOpE=;
 b=skSxZtB1GuRlr4K3YOuo3VcT+w0oZQp1cNYSVO3bvtA1MZSi5I8GTemc0XP1AXk3oP
 l6/h6anoLj1Z0eVELGohgBw+5daQEFx0jpuUfcUzzsuGY3sCd6HzzNdVUGQ72DrPk1l8
 VKyjDbspJDDq6XHrCLL1gr82o9JMs9aIkh5zq8V+tQT+xa1vEYlX6yYOmHqEuHNLJ2fw
 nWjxCOJUabpIcMqMvSVmsoE3TB8GYR3/vU/G2OnmK0EI6ryt3cKigcH2Quo5gLlyvWyv
 hReJAJtDKECD+dXTVEYiSWVDTTlHdqKbvw2OtZcNZXXfgd+RSFLneF93LWWNtSlD+QGU
 oO/A==
X-Gm-Message-State: AFeK/H3q6u66pYQLWWVdNCqY/m0MrMCllb3r85rhHgUsAq4gdT7ltgDwkvvM3jKATKIjfw==
X-Received: by 10.99.5.133 with SMTP id 127mr53291524pgf.8.1491797055001;
 Sun, 09 Apr 2017 21:04:15 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id t187sm21229956pfb.116.2017.04.09.21.04.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 09 Apr 2017 21:04:14 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 10 Apr 2017 13:34:06 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 0/2] drivers: serial: Aspeed VUART driver
Date: Mon, 10 Apr 2017 13:33:58 +0930
Message-Id: <20170410040400.5509-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 10 Apr 2017 04:04:17 -0000

This is v3 of a driver for the Aspeed VUART. This version addresses feedback
from Andy and Greg, and includes Rob's ack for the bindings change.

The VUART is a serial device on the BMC side of the LPC bus that connects a BMC
to it's host processor.

We add a flag to the serial core to allow the driver to skip probing of the
THRE irq behaviour, which could hang due to the host not reading bytes out of
the buffer.

We've been using this on systems for over a year, so it has seen a good amount
of testing.

Cheers,

Joel

Jeremy Kerr (1):
  drivers/serial: Add driver for Aspeed virtual UART

Joel Stanley (1):
  serial: 8250: Add flag so drivers can avoid THRE probe

 Documentation/ABI/stable/sysfs-driver-aspeed-vuart |  15 +
 Documentation/devicetree/bindings/serial/8250.txt  |   2 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c        | 323 +++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c                |   2 +-
 drivers/tty/serial/8250/Kconfig                    |  10 +
 drivers/tty/serial/8250/Makefile                   |   1 +
 include/linux/serial_core.h                        |   1 +
 7 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-vuart
 create mode 100644 drivers/tty/serial/8250/8250_aspeed_vuart.c

-- 
2.11.0
