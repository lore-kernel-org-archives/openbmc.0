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
 by lists.ozlabs.org (Postfix) with ESMTPS id 414mx42Bk5zF4Jq
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 20:54:48 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5CAsdAu029497;
 Tue, 12 Jun 2018 05:54:40 -0500
Message-ID: <5c7f9044fefed8bc0e4ca5688801ffa379f38f62.camel@kernel.crashing.org>
Subject: [GIT PULL v2]  FSI updates for 4.17
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Date: Tue, 12 Jun 2018 20:54:39 +1000
In-Reply-To: <7c268f5bb58cb45a2868020b3c5b8f48ac6844ea.camel@kernel.crashing.org>
References: <7c268f5bb58cb45a2868020b3c5b8f48ac6844ea.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 12 Jun 2018 10:54:49 -0000

Hi Greg !

There are a first round of updates of the FSI stack, aiming at reducing/removing
he gap with the OpenBMC tree and a first step in getting dependent drivers
upstream.

These changes significantly improve the FSI bitbanging driver performance
and reliability, and add the new "sbefifo" driver for communicating with
the POWER9 Self Boot Engine (which will be needed for some upcoming
additional drivers).

These were posted to the list as patches a couple of weeks ago and were
prior to that tested in the OpenBMC tree and CI. Some subsequent driver
work depends on some of these, so merging early is probably the best.

The following changes since commit 8efcf34a263965e471e3999904f94d1f6799d42a:

  Merge tag 'armsoc-late' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc (2018-06-11 18:19:45 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-06-12

for you to fetch changes up to 9f4a8a2d7f9d71093f41c4bb0ef8707e8145bad3:

  fsi/sbefifo: Add driver for the SBE FIFO (2018-06-12 14:05:39 +1000)

----------------------------------------------------------------
FSI updates and sbefifo driver

----------------------------------------------------------------
Andrew Jeffery (2):
      fsi: gpio: Trace busy count
      fsi: gpio: Remove unused 'id' variable

Benjamin Herrenschmidt (8):
      fsi/fsi-master-gpio: Sample input data on different clock phase
      fsi/fsi-master-gpio: Add "no-gpio-delays" option
      fsi/fsi-master-gpio: Reduce turnaround clocks
      fsi/fsi-master-gpio: Reduce dpoll clocks
      fsi/fsi-master-gpio: Delay sampling of FSI data input
      fsi/fsi-master-gpio: Implement CRC error recovery
      fsi/fsi-master-gpio: More error handling cleanup
      fsi/sbefifo: Add driver for the SBE FIFO

Eddie James (1):
      fsi: scom: Remove PIB reset during probe

Jeremy Kerr (4):
      fsi: gpio: Use a mutex to protect transfers
      fsi/gpio: Include command build in locked section
      fsi/gpio: Use relative-addressing commands
      fsi/master-gpio: Replace bit_bit lock with IRQ disable/enable

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |    1 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |    1 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |    1 +
 drivers/fsi/Kconfig                              |    7 +
 drivers/fsi/Makefile                             |    1 +
 drivers/fsi/fsi-master-gpio.c                    |  349 ++++++++++++----
 drivers/fsi/fsi-sbefifo.c                        | 1005 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-scom.c                           |    8 -
 include/linux/fsi-sbefifo.h                      |   33 ++
 include/trace/events/fsi_master_gpio.h           |   43 ++
 10 files changed, 1362 insertions(+), 87 deletions(-)
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 include/linux/fsi-sbefifo.h
