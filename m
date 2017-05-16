Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wRlRF3r4yzDqNs
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 14:51:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3wRlRF2j1Qz9s84; Tue, 16 May 2017 14:51:53 +1000 (AEST)
From: Jeremy Kerr <jk@ozlabs.org>
To: devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH RFC v2 0/2] Proposed device tree bindings for FSI bus
Date: Tue, 16 May 2017 12:51:23 +0800
Message-Id: <1494910285-20856-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Tue, 16 May 2017 04:51:53 -0000

This series adds a binding specification and implementation for matching
device tree nodes to probed FSI busses.

Version 2 includes feedback from Brad Bishop, Eddie James and Rob
Herring, and introduces the implementation of the matching in the FSI
core.

Note that the FSI core (on which patch 2/2 is based) is still pending
upstream acceptance through lkml, so I'm mostly looking for a first-pass
review of DT changes at this stage. Once that's done (and the FSI core is
merged), I'll submit upstream via lkml.

Cheers,


Jeremy

---
Jeremy Kerr (2):
  Documentation/devicetree: Add specification for FSI busses
  fsi: Match fsi slaves & engines to available device tree nodes

 Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
 drivers/fsi/fsi-core.c                        |  99 ++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c                 |   4 +
 drivers/fsi/fsi-master-hub.c                  |   4 +
 4 files changed, 251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt

-- 
2.7.4
