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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MRSc2jyXzDqcl
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 12:41:02 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: paths to configuration files in entity manager
Message-Id: <D070EECD-8118-450C-92E7-579F86DFCDC8@fuzziesquirrel.com>
Date: Mon, 25 Nov 2019 19:58:59 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matthew Barth <msbarth@linux.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>
To: James Feist <james.feist@linux.intel.com>
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
X-List-Received-Date: Tue, 26 Nov 2019 01:41:05 -0000

Hi James

We have a number of applications we are looking at converting to getting =
their configuration from EM.  Some of the configuration data is quite =
large and may not make sense to put on dbus.

For example=E2=80=A6

On some POWER systems the BMC is responsible for figuring out which =
board it is running on and selecting one of many host firmware =
configurations to present to the host firmware.  We are considering =
using EM to accomplish this.

This is a large, binary data set and one idea to avoid putting it on =
dbus was to just put a path to a file in the EM configuration.  Is this =
a bad idea?

Thanks!

-brad=
