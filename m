Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2QhQ4fBZzDrZN
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 20:05:06 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBL8lF9R029942;
 Thu, 21 Dec 2017 10:47:15 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id CA3395A93E; Thu, 21 Dec 2017 11:04:54 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] serial: add NPCM UART driver
Date: Thu, 21 Dec 2017 11:04:50 +0200
Message-Id: <1513847092-6304-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Thu, 21 Dec 2017 09:05:11 -0000

This patch set adds UART support for the Nuvoton NPCM Baseboard
Management Controller (BMC).

The NPCM7xx BMC contains four UART blocks and accessory logic.

Tomer Maimon (2):
  dt-binding: serial: document NPCM UART DT bindings
  serial: npcm: add NPCM UART driver

 .../bindings/serial/nuvoton,npcm-uart.txt          |   24 +
 drivers/tty/serial/Kconfig                         |   15 +
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/npcm_uart.c                     | 1592 ++++++++++++++++++++
 4 files changed, 1632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
 create mode 100644 drivers/tty/serial/npcm_uart.c

-- 
2.14.1
