Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHCyY5Yt1zDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:45:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IEdMpz92"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id g23so31275862pfj.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=QA7vRRjjphNL9mltYQQKNoM8opMKfUUp9ApP0LcAgvU=;
 b=IEdMpz92M8+jYYs8RCnV/f6voZuo6dyAQtyIjQQqa0M61yXUBYW8of1OQGJGfyErlS
 SMCQGjliM3CguDMYMvF5wJ/X6/De5fqaxhmcU9l0pR+kA3fjnaIRaOgfjc5fHbuEGE1W
 B+RVjwkHtcLHpzLhRryL228fb9I7OexIhwzgI5g4gUMLNXxP1GNNiQfcTHlc2zauKCQh
 scF8t/8XYE/UuxtBJcy0OdOU9aK7o+Bur/eOMGrcM46WvVBcnZXObOc++r9yI7zzr5aO
 lbVssxJOIkkd4QaHyfgKcukczsoh5+9MhnzFHZYW7i1eb5/aEHCR22Ao4t5ZjHEhv+aH
 LI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=QA7vRRjjphNL9mltYQQKNoM8opMKfUUp9ApP0LcAgvU=;
 b=SZJ+Y+FomI/m3PCrwhTsI3Dpn87RjV3yTymEMS9HrgHD1FyPCCakTgRK32q0Ye4qYS
 TkjAwA3Z37qxHWEeSgXh7XR2isdsr5sxOgDfroVU7zxW9vAfHWAOOmfjwpQ8IaBIQI6h
 CrYMaFo2nq8f76yspdeDmwvQHtJV5ahrGUb5fe2eQYCnsTXtSAnc+H8uY61zILA7N2mq
 pmciriXw3BKpat0D9PvABG2DlM/kiO6muyPalKfjiN5AQ5RU5slE7kMEbUtXK/EhX5fD
 UJzQXXuSdwIfYroX4Vca3GejdFnlQXC/7Ynnvx4JwPoTkWSVcN2h1b1boP8/o8P7ZING
 dAFQ==
X-Gm-Message-State: AN3rC/5hWhzfOCAzoGa1blB4/WW1pDiA5V6mzK3lMVj5WjQFGUQNsCLG
 B+ugNRQLPTmTrA==
X-Received: by 10.84.198.3 with SMTP id o3mr38600540pld.45.1493711155401;
 Tue, 02 May 2017 00:45:55 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id e5sm33992743pga.13.2017.05.02.00.45.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 02 May 2017 00:45:54 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 17:15:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/2] drivers: serial: Aspeed VUART driver
Date: Tue,  2 May 2017 17:15:41 +0930
Message-Id: <20170502074543.1380-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 02 May 2017 07:45:58 -0000

This is v4 of a driver for the Aspeed VUART. This version addresses feedback
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
