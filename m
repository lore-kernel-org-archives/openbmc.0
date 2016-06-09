Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQJ4M6831zDqFJ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 18:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=UhMjRiPS; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 5FE5B31A078;
 Thu,  9 Jun 2016 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=t9o0PQ3dpsNB+FjrPhO70NF
 xtcE=; b=UhMjRiPSUi34Psbn3A9bw/zSaeZbs73yfYr9idLz6NRXknFApiM4OUA
 76XBf/5K+CRlncwIhtw1n7ZOexCzE1PeRRfQ1G1A/97ok5SmP4Oygb++w/eNnjDh
 9iGheHCniHUC7cgrhBEk92rognhGPi5HWXdpMiznzF0vCFLZ79eo=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id EE85231A061;
 Thu,  9 Jun 2016 01:14:23 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu 0/2] Add ASPEED SCU device
Date: Thu,  9 Jun 2016 17:44:04 +0930
Message-Id: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 09 Jun 2016 08:14:29 -0000

Hi all,

These two patches add support for the ASPEED SCU to the AST2400 as intended for
upstream. I intend to send them there shortly but I figured I'd see if I could
get some quick feedback here. The use of object properties by the SCU model
feels slightly abusive, so if anyone has suggestions there that would be
appreciated!

Cheers,

Andrew

Andrew Jeffery (2):
  hw/misc: Add a model for the ASPEED System Control Unit
  ast2400: Integrate the SCU model and configure reset values

 hw/arm/ast2400.c             |  47 +++++++
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 295 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h     |   2 +
 include/hw/misc/aspeed_scu.h | 105 +++++++++++++++
 trace-events                 |   3 +
 6 files changed, 453 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

-- 
2.7.4
