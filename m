Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405ZDf6yQVzF1ZS;
 Wed, 21 Mar 2018 13:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="T3uZQPSc"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405ZDf4CX9z9s12; Wed, 21 Mar 2018 13:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521600946; bh=AeZq3y3qCvcXbczCWD5eJryM2TmuIk83hMWg+wikwIo=;
 h=From:To:Cc:Subject:Date:From;
 b=T3uZQPScEqyr8DZ55HVFy9shkTnGy+7hog79cPNKWPuqFhHXjdGXO+aUvkgdjjcCe
 /aTKtyjNBC5feDrzqIOW1MMdM/7k8WxGM6KfOEHFKgedbe98KHJ+XQHLDwGBSmoBye
 Z7geGOY/derl8BuWFKHBURnjjjIoKFr6uB+57EhY4wQZPts/Z3AcIxwIjMCkrfbkns
 bt6VrJYXAtTEoGkVl/99vd15ikJp/nKoRszMzHTvqHnvwyWFlLhlKoGWwQio167EnR
 eonL6YfOVOlRZBdA8BYpOVE2dYnjSkc0mjrVEyYAeLDP4VYdPuRc6L4zbQyWaWsAjc
 i0G8jZVtjYyig==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 0/5] serial: implement flow control for ASPEED VUART driver
Date: Wed, 21 Mar 2018 10:52:36 +0800
Message-Id: <20180321025241.19785-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Wed, 21 Mar 2018 02:55:48 -0000

This series implements flow control for the ASPEED VUART driver. This
hardware is slightly unusual in that the RX data rate can quickly
overwhelm the flip buffer code, so the ldisc-driven throttle/unthrottle
mechanisms don't entirely solve the problem.

To do this, we have a couple of minor changes to the tty core, as well
as an update to the tty proc interface to display buffer overrun metrics
(entirely optional, but does allow us to see the problem).

Then, we implement the standard throttle mechanism, and augment it with
a fast-path to throttle if we overrun the flip buffers before the ldisc
has had a chance to run.

Questions and comments most welcome; I'm fairly new to the tty layer.

Cheers,


Jeremy

---

Jeremy Kerr (5):
  serial: Introduce UPSTAT_SYNC_FIFO for synchronised FIFOs
  serial: expose buf_overrun count through proc interface
  serial/8250: export serial8250_read_char
  serial/aspeed-vuart: Implement rx throttling
  serial/aspeed-vuart: Implement quick throttle mechanism

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 122 ++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c         |   3 +-
 drivers/tty/serial/serial_core.c            |   6 +-
 include/linux/serial_8250.h                 |   1 +
 include/linux/serial_core.h                 |   1 +
 5 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.14.1
