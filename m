Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0DjN2qZPzDrKs
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:26:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=OS+qJLsH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=McFT3YGJ; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9DF641C34;
 Wed, 27 Jul 2016 21:26:45 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 21:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
 mesmtp; bh=QJKnHusoX48rujdRtBMR9Y6Si8I=; b=OS+qJLsHiSd2+3NzwIW4z
 Oa3Q15s+3QczHOxJ0EUB/eV5Jyf9WQ9tFf7HdIFRW5KB4JIvG8ivaB4MjH3tIYmZ
 PNODcarMJ/WtGWQ9tUBCVqOOlNHRWrC+p/bioMnkpByb3qyBZ5K2+VawWWvETmj1
 c0lj7EfoXXHJhiW/Io6pkw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-sasl-enc:x-sasl-enc; s=smtpout; bh=QJKnHusoX48rujdRtBMR9Y6Si8
 I=; b=McFT3YGJgSRADDaM5tf3xrH1RmXPF2H8Du/JP7ml0tCTOxZzl15H0ZOakI
 ZQ3xOmHPkC3TFvJnoVu2QKVkSf3J0rZyEzeUZ2US84T8vWM+pQZXvywN4qPio/bO
 zvmkbg/eFZnS6oxXc1FFp3oMaZ+EHn8al9HID/oE2J35s6trc=
X-Sasl-enc: mnjmIfUMtWe69FNyQVmddYs8hN6ENKW6Lckdu0wUA3FS 1469669204
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C040F29FB;
 Wed, 27 Jul 2016 21:26:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] palmetto-bmc: Add ast2500-edk HW strapping value
Date: Thu, 28 Jul 2016 10:55:32 +0930
Message-Id: <20160728012534.29447-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.2.597.g66765a4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 01:26:49 -0000

The two patches are trivial*: A whitespace fix and a patch to configure the
hardware strapping value for the ast2500-edk.

Cheers,

Andrew

* Though apparently sending them isn't.

Andrew Jeffery (2):
  palmetto-bmc: Cleanup whitespace to make checkpatch happy
  ast2500-edk: Configure HW strap register

 hw/arm/palmetto-bmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.9.2.597.g66765a4
