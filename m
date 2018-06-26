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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Fhr70X99zF1Hw;
 Wed, 27 Jun 2018 09:21:26 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNLC6A022529;
 Tue, 26 Jun 2018 18:21:14 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org-v2
Subject: [PATCH 00/14] fsi: Fixes and Coldfire coprocessor offload 
Date: Wed, 27 Jun 2018 09:20:55 +1000
Message-Id: <20180626232109.10944-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Tue, 26 Jun 2018 23:21:27 -0000

(This is a resend, apprently only the first 2 patches ever made it out
 last week ...)

This series implements support for offloading the FSI protocol bitbanging
to the ColdFire secondary core of the Aspeed SoCs. The result increases
FSI performance by a factor of 4, and on systems that don't support async
FSI clock, provide much more regular and continuous clocking which helps
reliability.

Patch 1 may go a different route and was already posted a few weeks ago,
I included it for completeness.

Patches 2..9 add some infrastructure to the FSI core to control some
of the FSI protocol delays and adjustements/fixes to the existing GPIO
bitbanging master. They are "mechanical" dependencies

Patch 10 moves some protocol definitions to a common place where the
new master driver can find them

Patch 11 is the DT binding for the new driver with comes with patch 12

Finally patch 13 and 14 update the Romulus and Palmetto board device-trees
to use the new driver.

There's another dependency on the Aspeed GPIO driver changes for handling
with GPIO lines ownership and handshaking. The patches have been submitted
and can be found for reference there:

        https://github.com/ozbenh/linux-ast/commits/gpio

Finally, the driver needs a machine specific firmware file. The firwmare
is open source and available at:

        https://github.com/ozbenh/cf-fsi

I will submit it to linux-firmware if there's enough popular demand ;-)
