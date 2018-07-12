Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R13r3Bm4zF36P
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 13:03:51 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6C33iDd018485;
 Wed, 11 Jul 2018 22:03:45 -0500
Message-ID: <6b3728c37095b54666827d61d0540dddf0187a80.camel@kernel.crashing.org>
Subject: [GIT PULL] FSI updates round 2 for 4.19
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Date: Thu, 12 Jul 2018 13:03:44 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 03:03:53 -0000

Hi Greg !

This is the second round of updates of the FSI stack.

These comprise of:

 - Some build fixes detected with COMPILE_TEST when
used on "other" archs

 - Sparse warning fixes

 - Some object lifetime fixes

 - A new feature to control some of the protocol delays

 - Overheaul of the "SCOM" driver used to access the POWER
processor internal SCOM bus.

 - Preparatory work for the new ColdFire coprocessor based FSI master
work which, along some other newer work is still going through the last
few rounds of polish and DT bindings reviews.

The following changes since commit 9f4a8a2d7f9d71093f41c4bb0ef8707e8145bad3:

  fsi/sbefifo: Add driver for the SBE FIFO (2018-06-12 14:05:39 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-07-12

for you to fetch changes up to fea9cf321c916e9372874e6f2af1bf0b5beb89fb:

  fsi: Move various master definitions to a common header (2018-07-12 12:06:02 +1000)

----------------------------------------------------------------
Benjamin Herrenschmidt (17):
      fsi: sbefifo: Remove unneeded semicolon
      fsi: scom: Add mutex around FSI2PIB accesses
      fsi: scom: Whitespace fixes
      fsi: scom: Fixup endian annotations
      fsi: scom: Add register definitions
      fsi: scom: Major overhaul
      fsi: sbefifo: Fix checker warning about late NULL check
      fsi: Move code around to avoid forward declaration
      fsi: Add mechanism to set the tSendDelay and tEchoDelay values
      fsi: master-gpio: Rename and adjust send delay
      fsi: master-gpio: Add support for link_config
      fsi: master-gpio: Add more tracepoints
      fsi: master-gpio: Remove unused definitions
      fsi: master-gpio: Remove "GPIO" prefix on some definitions
      fsi: Don't use device_unregister() in fsi_master_register()
      fsi: master-gpio: Add missing release function
      fsi: Move various master definitions to a common header

Eddie James (1):
      fsi: sbefifo: Add missing mutex_unlock

Guenter Roeck (1):
      fsi/sbefifo: Add dependency on OF_ADDRESS

Joel Stanley (3):
      fsi: sbefifo: Fix sparse warnings
      fsi: master-hub: Fix sparse warnings
      fsi: core: Fix sparse warnings

 drivers/fsi/Kconfig                    |   1 +
 drivers/fsi/fsi-core.c                 | 215 +++++++++++++++++++----------
 drivers/fsi/fsi-master-gpio.c          | 170 ++++++++++++-----------
 drivers/fsi/fsi-master-hub.c           |   5 +-
 drivers/fsi/fsi-master.h               |  35 +++++
 drivers/fsi/fsi-sbefifo.c              |  15 +-
 drivers/fsi/fsi-scom.c                 | 433 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 include/trace/events/fsi_master_gpio.h |  59 ++++++++
 include/uapi/linux/fsi.h               |  58 ++++++++
 9 files changed, 813 insertions(+), 178 deletions(-)
 create mode 100644 include/uapi/linux/fsi.h
