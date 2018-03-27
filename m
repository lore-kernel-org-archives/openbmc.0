Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409HBc5yWSzF24w;
 Tue, 27 Mar 2018 14:51:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="s64G2bP+"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 409HBb1Pzhz9s1w; Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522122711; bh=h2eSkoZ5ynm2yJJrZNJFSGV8ldIDLvXLYQbWHL5NA1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s64G2bP+JnsQ50wTKyrczVXQCYS6NFwwaICoLTeOaQhMmeq+5m5WQHZeU4q1HvGQV
 h7CE+t6WYUDD8Tqi9ZAZs6aiFRiMgxR2VIEWo4L/IB45glfcrTf3uUtVLEQJ0ifPDE
 IMQA6GK4SaBQjZW+owbu7ucr4UdwQTBRA1fXTH1pZlsPtldpS2UQJG3uGzwW4nsUD1
 tJJ7X0zFmGPnHsbwzMwr0u/7K0L1+RWMcnys1wigV2rpaxSfnu4U2W6Tyce9OPcUOt
 Zq0dwppRtkHXj0LdzhYL+S3ltpgSESN4HO+SsKMaR9RieOcpOguSTz1z0G/2DbPZaK
 pdLJMfuh92fLQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 0/4] serial: implement flow control for ASPEED VUART driver
Date: Tue, 27 Mar 2018 11:48:23 +0800
Message-Id: <20180327034827.20773-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180323155116.GA31423@kroah.com>
References: <20180323155116.GA31423@kroah.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 03:51:53 -0000

This series implements flow control for the ASPEED VUART driver. This
hardware is slightly unusual in that the RX data rate can quickly
overwhelm the flip buffer code, so the ldisc-driven throttle/unthrottle
mechanisms don't entirely solve the problem.

To do this, we have a couple of minor changes to the tty core to allow
tty drivers to do more explicit flow control.

Then, we implement the standard throttle mechanism, and augment it with
a fast-path to throttle if we overrun the flip buffers before the ldisc
has had a chance to run.

Questions and comments most welcome; I'm fairly new to the tty layer.

Cheers,


Jeremy

--
v2:
 - rebase onto tty-next, dropping applied proc patch
 - 1/4 simplify status mask checks
 - 4/4 Use updated timer API, fix text wrap


Jeremy Kerr (4):
  serial: Introduce UPSTAT_SYNC_FIFO for synchronised FIFOs
  serial/8250: export serial8250_read_char
  serial/aspeed-vuart: Implement rx throttling
  serial/aspeed-vuart: Implement quick throttle mechanism

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 124 ++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c         |   3 +-
 drivers/tty/serial/serial_core.c            |   4 +-
 include/linux/serial_8250.h                 |   1 +
 include/linux/serial_core.h                 |   1 +
 5 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.14.1
