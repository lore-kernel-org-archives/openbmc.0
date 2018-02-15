Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MXe04SiW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hql8U442"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkW1dhHzDqBf
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 886B320D61;
 Thu, 15 Feb 2018 07:36:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=kHju4DolHIvsOF1fbePiXBnUw7vXToScbTGkLjBH9
 w8=; b=MXe04SiWdp2FECeokuhqnWTZZ90N+I0rM498MFdlPefBfPb91ebil3cN6
 Ye1M+qOeWjO+VTJQwpHLbXnYED9uXdF7YHjiucE0WOUmBPYOKXjjg0HNCJ9dd1kB
 Jed1eVN40uUJkMiHbDs2M7f9BxAJiKHwCLGwW86cksxLtKKCLNtHx7ukoBvIvUMO
 OAFxcyMCrNDq/3QuOKwtUMvsu9GnpMlUCmgBNYpFOwE6A2AAfz/ujMuLm2jckkMP
 I6axIIi37qJFPYHSa5lcl2oXjCg3ktLDhnXxTHwlB72nQ2Ym7bjMHQ8jc3EVnHeu
 hGOzUD8LDZPAcegoWUoiIaCWKbBnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kHju4DolHIvsOF1fb
 ePiXBnUw7vXToScbTGkLjBH9w8=; b=hql8U442OS4DZ8UmLeDfompTI+BzZ73g8
 vaHa+V1gwpYBde7d29trWO/jhpxjx3rkvSeZvya7fT7GUJxNBJH3nb4YwUOceF7v
 Z6cX/HFFY19sb5yRqD5hSOK9Tj1xml3TmGZO/oJxh3/9XudEM4AcOrQoL1Ftab6/
 3P/YBd4lbi8FokPx9zWioJuO0pauWxvk1JXoq0P3G7oYziZud1SzesYgWkgDpKfW
 +VHswo2jVpVYZgy5Pv5toYTkDHBsbAOCnJF2AtwzP8pXMSIJ8Uf8xh0b0KNXBfDL
 GfO/SUUT1b57g7LrR7km+QJv6Hbx3+ktarG5gsKMZyTq82ql6Vb2A==
X-ME-Sender: <xms:zn6FWiX-M5JANDCrky6PsdCl1hbw1m2uZU0x7A6_MW9D3IN6hjtjNw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFC697E5CA;
 Thu, 15 Feb 2018 07:36:27 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 00/16] Locking fixes for FSI, SBEFIFO, OCC
Date: Thu, 15 Feb 2018 23:05:50 +1030
Message-Id: <20180215123606.25777-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000
X-List-Received-Date: Thu, 15 Feb 2018 12:36:39 -0000

Hello,

Yes, this series is against 4.10, and I realise where we're at with that.
However, this addresses problems in P9 systems that are shipping OpenBMC with a
4.10 kernel, so I'm sending the patches to the list to at least document them.
I hope to port this all to the dev-4.13 branch in the near future

This series is mostly built on the work of others, particularly Eddie and
Jeremy. It aims to resolve the performance issue of seemingly ever-increasing
latency when reading the OCC sensors, which implicates the SBEFIFO and the FSI
bus.

The patches are roughly ordered by controversy, and can be picked in order up
to any given point. However, to resolve the performance issue we need to take
up to and including patch 9, and even then we ideally want to take the
subsequent three patches as well.

Patches 1-4 rename some internal functions and expose tracepoints that were
used in analysing the performance problem. They are not consequential but also
not intrusive. These tracepoints will be useful for debugging future issues
across the OCC, the SBEFIFO and the FSI GPIO master. I'm not opposed to
re-ordering the series so these come later (and are therefor "more" optional).

0001-fsi-sbefifo-Rename-sbefifo_release_client-for-consis.patch
0002-fsi-sbefifo-Add-tracing-of-transfers.patch
0003-fsi-gpio-Trace-busy-count.patch
0004-fsi-occ-Add-tracepoints.patch

Patch 5 is Eddie's fix for FIFO corruption where cancelled transfers leave data
in the pipe. It's included in the series simply because it caused less
headaches for testing. It should be applied.

0005-fsi-sbefifo-don-t-delete-canceled-xfrs-in-write.patch

Patches 6-8 work towards fixing a bug where we allocate GFP_KERNEL memory under
a spinlock. It is resolved by switching to using a mutex in the P9 SBE OCC
hwmon driver.

0006-hwmon-p9_sbe-Rename-context-variable.patch
0007-hwmon-p9_sbe-Rename-lock-member-of-struct-p9_sbe_occ.patch
0008-hwmon-p9_sbe-Convert-client_lock-from-a-spinlock-to-.patch

Patch 9 is the critical piece from Eddie which reworks the SBEFIFO driver to
use delayed work on a workqueue rather than a timer callback to manage FIFO
transfers. This patch on its own reduces the unbounded wall-clock access time
of OCC attributes to a time in the order of 500ms in the common case.

Most of my time exercising this series was spent understanding why we had such
poor performance with the original approach. A lot of tracing and digging (and
deadlocks) using the series' earlier patches indicate the source of the problem
is in the timer subsystem, which has unexpected behaviour when invoking
`mod_timer(..., jiffies)` inside the timer's callback. The consequence appears
to be a miscalculation of the following expiry event, leading to a saw-tooth
pattern of latency for the FIFO's timer. I haven't found where the bug lies
beyond this but at this point I'm confident that simply changing our approach
to managing the transfers is enough and that we don't have deeper bugs with
interrupt management (at least, for this issue).

0009-fsi-sbefifo-Avoid-using-a-timer-to-drive-FIFO-transf.patch

Patch 10 (again from Eddie) is largely enablment for the final patch in the
series but also continues to break down the atomic sections needed by the
stack. Patch 11 resolves another instance of allocating GFP_KERNEL memory
under a spinlock, and is resolved in the same way as the earlier patch. Patch
12 resolves some outstanding issues with interrupt state management.

0010-fsi-sbefifo-Switch-to-mutex-in-work-function.patch
0011-fsi-sbefifo-Switch-list_lock-from-spinlock-to-mutex.patch
0012-drivers-fsi-occ-switch-to-irqsave-and-irqrestore.patch

Patch 13 (perhaps controversially) improves performance by significantly
reducing sleeps between cycles in the FSI GPIO master. It takes us down to
~250ms in the common case for uncached reads of the OCC hwmon attributes.

0013-Revert-drivers-fsi-GPIO-stability-changes-for-Cronus.patch

Patches 14-16 are probably the most hairy and don't provide obvious benefit in
comparison to patches 9 or 13. Patch 15 (along with the dependency in patch 14)
brings the 4.10 FSI GPIO master into alignment with 4.14, taking into account
the extra patches we have in 4.10. Patch 16 pushes down the spinlock to only
cover bitbanging FSI words and provides exclusive bus access with a separate
mutex.

0014-lib-Add-crc4-module.patch
0015-fsi-gpio-Update-to-upstream.patch
0016-fsi-gpio-Use-a-mutex-to-protect-transfers.patch

And with that, the OCC hwmon attribute access performance problem is at least
under control.

Please review!

Cheers,

Andrew

Andrew Jeffery (10):
  fsi: sbefifo: Rename sbefifo_release_client() for consistency
  fsi: sbefifo: Add tracing of transfers
  fsi: gpio: Trace busy count
  fsi: occ: Add tracepoints
  hwmon (p9_sbe): Rename context variable
  hwmon (p9_sbe): Rename lock member of struct p9_sbe_occ
  hwmon (p9_sbe): Convert client_lock from a spinlock to a mutex
  fsi: sbefifo: Switch list_lock from spinlock to mutex
  Revert "drivers/fsi: GPIO stability changes for Cronus/Hostboot"
  fsi: gpio: Update to upstream

Eddie James (4):
  fsi: sbefifo: don't delete canceled xfrs in write
  fsi: sbefifo: Avoid using a timer to drive FIFO transfers
  fsi: sbefifo: Switch to mutex in work function
  drivers: fsi: occ: switch to irqsave and irqrestore

Jeremy Kerr (2):
  lib: Add crc4 module
  fsi: gpio: Use a mutex to protect transfers

 drivers/fsi/fsi-master-gpio.c          | 169 +++++++++++++++++++--------------
 drivers/fsi/fsi-sbefifo.c              | 119 ++++++++++++++++-------
 drivers/fsi/occ.c                      |  53 +++++++----
 drivers/hwmon/occ/p9_sbe.c             |  56 +++++------
 include/linux/crc4.h                   |   8 ++
 include/trace/events/fsi_master_gpio.h |  16 ++++
 include/trace/events/occ.h             |  86 +++++++++++++++++
 include/trace/events/sbefifo.h         |  93 ++++++++++++++++++
 lib/Kconfig                            |   8 ++
 lib/Makefile                           |   1 +
 lib/crc4.c                             |  46 +++++++++
 11 files changed, 503 insertions(+), 152 deletions(-)
 create mode 100644 include/linux/crc4.h
 create mode 100644 include/trace/events/occ.h
 create mode 100644 include/trace/events/sbefifo.h
 create mode 100644 lib/crc4.c

-- 
2.14.1
