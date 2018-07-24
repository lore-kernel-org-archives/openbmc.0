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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ZRBj5F1PzDqCG;
 Tue, 24 Jul 2018 15:05:33 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6O55JLG028169;
 Tue, 24 Jul 2018 00:05:20 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] fsi: Convert misc devs to proper chardevs and more
Date: Tue, 24 Jul 2018 15:05:14 +1000
Message-Id: <20180724050519.31920-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 24 Jul 2018 05:05:34 -0000

This converts the various FSI devices from misc dev to chardev,
as there can potentially be too much of them for misc devs limited
minors, and because there are some lifetime issues with the current
support.

This provide a common infrastructure to allocate an FSI major and
distribute minors in a way that keeps it compatible with existing
userspace. A new representation grouping FSI devices under a
/dev/fsi directory is optinally provided, which will work in
conjunction with new udev scripts aimed at providing fixed ID
based symlinks.

A side effect of those conversions is to fix some object lifetime
issues caused by a mixup between devm_kzalloc and proper object
lifetime.

This series also adds a /dev{/fsi}/cfamN chardev for raw CFAM
access that will superseed the existing "raw" sysfs file.

Finally there's also a locking fix to avoid horrible mixups if
the "rescan" file is poked while a rescan is already in progress.
