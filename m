Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ckMh3s9JzDqDd
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 03:37:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: how to get pci config space
Message-Id: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
Date: Tue, 17 Dec 2019 11:37:46 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Dec 2019 16:37:53 -0000

Is anyone already sending information from the PCI config space down to =
the BMC?  Does anyone think exposing that kind of information via the =
BMC would be an interesting OpenBMC feature?  How would you do it?  =
PLDM?

thanks!

-brad=
