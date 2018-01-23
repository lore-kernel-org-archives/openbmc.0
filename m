Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQsN770g6zDrDV
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 02:16:52 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0NEwhT0011919;
 Tue, 23 Jan 2018 16:58:43 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 435C65A93C; Tue, 23 Jan 2018 17:16:42 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 0/2]  serial: add NPCM UART driver
Date: Tue, 23 Jan 2018 17:16:38 +0200
Message-Id: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Tue, 23 Jan 2018 15:16:56 -0000

Changes since version 1:
 - rewritten the driver, the new driver based on 8250 UART driver with
   modifications to support NPCM UART functionality
 
This patch set adds UART support for the Nuvoton NPCM Baseboard
Management Controller (BMC).

The NPCM UART based on 8250 UART driver

The NPCM7xx BMC contains four UART blocks and accessory logic.

To enable the driver please add CONFIG_SERIAL_8250_NPCM configuration
(except to 8250 serial configuration).

Tomer Maimon (2):
  dt-binding: serial: document NPCM UART DT bindings
  serial: npcm: add NPCM UART driver

 .../bindings/serial/nuvoton,npcm-uart.txt          |  34 +++
 drivers/tty/serial/8250/8250_npcm.c                | 280 +++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig                    |  10 +
 drivers/tty/serial/8250/Makefile                   |   1 +
 4 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
 create mode 100644 drivers/tty/serial/8250/8250_npcm.c

-- 
2.14.1
