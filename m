Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQqMy6vKBzDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=eEClCF/q; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id EF4B0604076;
 Thu,  9 Jun 2016 21:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=BxskTHQnj9fpgseN4RpJRPH
 k0iQ=; b=eEClCF/qh9xJf9RiUFyaYjBWbJDeD55v8W0vNnHHESjAfP4Y8yCrSY5
 P5sWGC4YKoCcLbz6N+xfad1mFJuqLCO9AkRmbDXyeADeh3m9dGMA+gtHtActBmRp
 wOuCfaLOODHGWsqYKhAkQMyjNJVRpPAOtFAsqNnlbCyXbi4EPS/E=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id C21DC604061;
 Thu,  9 Jun 2016 21:44:43 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 0/4] Enable ftgmac100 driver on Aspeed g5 SoCs
Date: Fri, 10 Jun 2016 14:14:25 +0930
Message-Id: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Fri, 10 Jun 2016 04:44:47 -0000

Hi all,

These patches are already applied to the dev-4.7 branch but hadn't been sent
anywhere for feedback.

The first patch is a work-around that gets the ftgmac100 driver probing on the
AST2500 EVB (or any non-NCSI configuration) in the short term. Longer term we
should probably implement the new MDC/MDIO register interface. Shouldn't (yet)
be sent upstream, but required in some cases around these parts.

Patches two and three had some queries from Joel regarding parameters I've
added to a number of functions. I've done some analysis on whether we can avoid
it, but it seems we cannot. Thoughts there would be appreciated.

Patch four is a trivial one for aspeed-g5.dtsi if you accept the general
approach of patch three.

Andrew Jeffery (4):
  aspeed: Use old MDC/MDIO interface for ftgmac100 driver compat
  ftgmac100: Separate rx page storage from rxdesc
  ftgmac100: Add devicetree option for the Aspeed g5 register interface
  aspeed-g5: Configure ftgmac100s for the Aspeed g5 register interface

 arch/arm/boot/dts/aspeed-g5.dtsi         |  2 +
 arch/arm/mach-aspeed/aspeed.c            |  8 ++++
 drivers/net/ethernet/faraday/ftgmac100.c | 76 +++++++++++++++++++++++---------
 drivers/net/ethernet/faraday/ftgmac100.h |  2 -
 4 files changed, 64 insertions(+), 24 deletions(-)

-- 
2.7.4
