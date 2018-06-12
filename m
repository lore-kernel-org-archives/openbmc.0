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
 by lists.ozlabs.org (Postfix) with ESMTPS id 414dV75bfxzF4FS
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 15:19:27 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5C5JDa2008698;
 Tue, 12 Jun 2018 00:19:14 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH 0/5] FSI scom driver overhaul 
Date: Tue, 12 Jun 2018 15:19:06 +1000
Message-Id: <20180612051911.20690-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Tue, 12 Jun 2018 05:19:28 -0000

The current FSI scom driver is a bit too simplistic (and buggy). This
fixes a locking bug, cleans a few things up, then overhaul the driver
more thoroughly by providing proper support for the different type
of SCOM accesses (direct and indirect), handling errors properly in
the read/write interface, and adding a lower level ioctl interface
needed by system debugger (such as cronus) that need to be able to
access the raw status register content resulting from the access
attempt and do their own error handling.

I will send patches separately for pdbg and cronus to use the new
debugger interface.

Note: It is unfortunate that the read/write interface does NOT use
the same addressing scheme as the host-side equivalent xscom debugfs
interface. However I didn't want to change the user ABI by "fixing"
this as I'm not entirely sure what other users we might have of
that existing interface.

The patches apply on top of the other FSI changes posted recently
and at this point are meant to discuss the new user API.
