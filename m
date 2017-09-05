Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UOLDNlrH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q5k5olqZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmdcz2p4xzDrFq
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 17:29:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 872C920B0C;
 Tue,  5 Sep 2017 03:29:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 05 Sep 2017 03:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=7aDJXj3BsiBlTvKVMver+gdkY1yauB
 lLqcTCxFeTNKw=; b=UOLDNlrH5CflGHaadKWZrI1oCiMUFgQaF4gEhtvSIYIy8Y
 dxS2NfsADvGQA/+xHrdhiUh6DH5yTuC7Wy1J1nroQ+5a3+d3x54GeOu1CxP4cIh1
 FfMVwHCVxYRM3HMt3j9PLPtIv//BGTO3VDfFY0GAH0US+47iWlLudHnUf8hMroZ+
 1TCvmx9HFOTQ+x32sGMWg4ULZx0ANcIOXnkrj+IRu+nIS026f3Me38BTQp+2m6k2
 2iHaRV/O2FSg4b5p1WI62QmXMM7ORLx1iMJ0N0rV3CCnmjjQjyoZji/AjOHGMFPH
 0E88jKoQ0yLBqyz4J6v8aILWiJA0LkzNg7NYkaTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=7aDJXj
 3BsiBlTvKVMver+gdkY1yauBlLqcTCxFeTNKw=; b=Q5k5olqZYXZeL1cgBjUcls
 3iN5gpRcitD57xhwcQCcLHXhEoSUOosT4JT7jnmHrbFPSdvMLsliAGHWv2larcq0
 sKC9vgN93MM8dh0njEMnIM3UCp2Uf6Ywlf0IhtorFhZrr3jnI7vUgVhBcD4rkZZX
 JibC3PwhXcItB5H8st9tGf319I/5UyPKTWrCk+Zjoe07nulLlFM7HB9v13GM10Ne
 1Lh7fpoEBGnJGVdpslF9sfAszC0Cl2hN1M4iz71r6LXvfKnB3Q0/PwDhbKNd/kkX
 +P9FIqsWb2XUe2IFtJikpFxSbxy8wgtZbpG9TrihEIYSYaZFUb7WgmepyZb1raDg
 ==
X-ME-Sender: <xms:P1KuWTmfa2Cq_-oATpzU-_S8ihCvD_HKJzsr1cnUYM358MhfRHXiLQ>
X-Sasl-enc: 6249JtleUvKn1l+UUgycdV0+2kUHkJEhFusIeZBgmvHl 1504596542
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0A4E7FA78;
 Tue,  5 Sep 2017 03:29:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH 0/3] pmbus: Fix error propagation for register check functions
Date: Tue,  5 Sep 2017 17:28:25 +1000
Message-Id: <20170905072828.8749-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 05 Sep 2017 07:29:08 -0000

Hello,

This series resolves an issue with pmbus functions such as
pmbus_check_byte_register() not reporting errors triggered by the PAGE command.
Currently such an error is interpreted as the device not supporting the
command, rather than exposing the problem that occurred.

The first patch has been sent upstream:

  https://lkml.org/lkml/2017/9/5/53

The second and third patches resolve fallout from the first patch with the
MAX31785 driver. The fallout primarily surrounds the driver's unusual use of
virtual pages.

Andrew Jeffery (3):
  hwmon: pmbus: Make reg check and clear faults functions return errors
  hwmon: pmbus: Add set_page() callback
  pmbus: max31785: Add handler for set_page() and PMBUS_CLEAR_FAULTS
    virt pages

 Documentation/hwmon/pmbus-core   |  12 ++--
 drivers/hwmon/pmbus/max31785.c   |  13 ++++
 drivers/hwmon/pmbus/pmbus.h      |   7 ++-
 drivers/hwmon/pmbus/pmbus_core.c | 132 ++++++++++++++++++++++++++++++---------
 4 files changed, 125 insertions(+), 39 deletions(-)

-- 
2.11.0
