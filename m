Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHSH5W6bzDqLR
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oxvuGMG8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qdIzXH7q"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DEDDC20A66;
 Fri,  2 Jun 2017 04:29:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 04:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=e6N+QAbJw044X2909A5yjECcZKn4nR
 h5nKfDHqdkWd4=; b=oxvuGMG8hct6BMq6OyNx9D4M9qasKiuvBdrSJ7SJTEWDjd
 9j499wKOoOzCoBMwBhkKiDwYU2D6ZQAg4bv+qEdohQWhXnNfEGGzIwiB0VqDh3m4
 QQXWR1xCziMkDfOhH1JEBtgqh8KOJk6u0kfJD85Giid0BaeKoFpP+6dL6qG0L3Np
 nPCjc8/UVUC/uyfdWM6eS/gs+Ao4sgY9AeT6/ccErjmeCAeyXQTlyDT4FuCeRxRT
 TEG8PsKQCizvpFo6cfjxgIdPt7gAWTs9vQ9akNfteIDp9zp/HL7NoDIVbzfvtqrX
 ynetak1asPkQ8/N2GYzYn6P47hpriGM/Bf15Ff8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=e6N+QA
 bJw044X2909A5yjECcZKn4nRh5nKfDHqdkWd4=; b=qdIzXH7qaToSZ3iz+IyAUH
 YrlMngmD8uHoVGVgzZoS6OO+cGf138XBETxddje5b52u+uhcrm6PPMXZTTfWqwTB
 zFe6YykAetz9qZDROyLzypzXsbDELYgr0efgQUVrcJ7uK8yeX0jGDNwgjdWMZ31/
 J0cLJnHl1+1KaLhedYkOyqmfQYD9SWkB9cg52Zj+5bt+bnPLUdnkptxvezmRwR6T
 6m5dSiGBC4IJa1ZNJNaw487OXGFCqAD56BGt7T9DQuI2G+d9z9RKv6LU5iFP37Q0
 BjYv0ZYqt+cfXygDqoUSNjfulUrv0ZWsjkQ/aV7MPxrBn8yjANgUpbMIgHZp6M0Q
 ==
X-ME-Sender: <xms:3CExWbsfO2NMwrjvVFDIJZqaaBkRetcyI5h9M9YemrjyX_7vzuqxVw>
X-Sasl-enc: DnONi81TEw8WP/r9oygVWjGVqIM4rM9XnfTccd1yT6Ul 1496392156
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00C177E7AA;
 Fri,  2 Jun 2017 04:29:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/3] aspeed-g4: Enable mbox and lpc devices
Date: Fri,  2 Jun 2017 17:58:41 +0930
Message-Id: <20170602082844.7370-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:29:21 -0000

Hello,

This series is a small piece of enablement work for mboxd on P8, as requested
by Adriana. The first patch is a cherry-pick of the upstream equivalent, which
appeared to have been missed in the pinctrl chaos.

The remaining two patches simply copy the g5 LPC nodes into the g4, switch the
compatible strings, then enable the nodes (and reserve a small amount of
memory).

Please review.

Cheers,

Andrew

Andrew Jeffery (3):
  mfd: dt: Add Aspeed Low Pin Count Controller bindings
  arm: aspeed: Add LPC devicetree node and children
  arm: aspeed: Configure mbox and lpc nodes on Palmetto

 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 111 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  15 +++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  38 +++++++
 3 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt

-- 
2.11.0
