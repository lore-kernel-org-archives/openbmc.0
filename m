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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lgVR6D12zDqgZ
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 15:51:11 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w785or1m009669;
 Wed, 8 Aug 2018 00:50:54 -0500
Message-ID: <683a481141c6ee4b85e6128e62ea5131b74bbe3f.camel@kernel.crashing.org>
Subject: [GIT PULL] FSI fixes for 4.19
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Wed, 08 Aug 2018 15:50:53 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.4 (3.28.4-1.fc28) 
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
X-List-Received-Date: Wed, 08 Aug 2018 05:51:12 -0000

Hi Greg !

This adds two FSI fixes to what you already have in your tree

  - Fix a NULL dereference in the scom driver

  - Fix a command buffer size issue in the sbefifo driver that
    breaks some operations with POWER system debugger (cronus)

Cheers,
Ben.

The following changes since tag fsi-updates-2018-07-27:

  fsi: Prevent multiple concurrent rescans (2018-07-27 09:58:12 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-08-08

for you to fetch changes up to 15e2a7218c2788d79c5633336d17cb9428c221e7:

  fsi: sbefifo: Bump max command length (2018-08-08 15:44:47 +1000)

----------------------------------------------------------------
Benjamin Herrenschmidt (2):
      fsi: scom: Fix NULL dereference
      fsi: sbefifo: Bump max command length

 drivers/fsi/fsi-sbefifo.c | 39 ++++++++++++++++++++++++++++++++-------
 drivers/fsi/fsi-scom.c    |  1 +
 2 files changed, 33 insertions(+), 7 deletions(-)
