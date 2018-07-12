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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R2422tLMzF35P;
 Thu, 12 Jul 2018 13:49:05 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6C3mnNS020207;
 Wed, 11 Jul 2018 22:48:50 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] fsi: Coldfire coprocessor offload
Date: Thu, 12 Jul 2018 13:48:42 +1000
Message-Id: <20180712034847.12878-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Thu, 12 Jul 2018 03:49:07 -0000

This series implements support for offloading the FSI protocol bitbanging
to the ColdFire secondary core of the Aspeed SoCs. The result increases
FSI performance by a factor of 4, and on systems that don't support async
FSI clock, provide much more regular and continuous clocking which helps
reliability.

This series is much smaller than the previous submissions as I already
merged all the "preparatory" work into the FSI tree. This is now strictly
the coldfire support and is now only waiting for ack of the DT bindings
(and whatever other review comments might come my way) before I put it
into the FSI tree and sends it to Greg.

There are two dependencies to be able to build/use this. The above
prep work:

      https://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git/log/

And the Aspeed GPIO driver changes for handling with GPIO lines ownership and
handshaking. The patches have been merged into the GPIO tree and a dedicated
immutable topic branch and can be found here:

      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-aspeed

Finally, the driver needs a machine specific firmware file. The firwmare
is open source and available at:

	https://github.com/ozbenh/cf-fsi

I will submit it to linux-firmware if there's enough popular demand ;-)

v2. Fix misuse of devm_kzalloc for objects containing a struct device
    in fsi-master-gpio and fsi-master-ast-cf (similar fixes for the
    various FSI drivers will come later a part of rework to move away
    from misc devs).

v3. Sparse fix and updated DT bindings as per Rob's comments.
