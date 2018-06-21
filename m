Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BXCH17KpzF10W
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 05:42:02 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 12:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,253,1526367600"; d="scan'208";a="51222151"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga008.jf.intel.com with ESMTP; 21 Jun 2018 12:42:00 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>
Subject: [PATCH linux-next v6 13/13] Add maintainers for the PECI subsystem
Date: Thu, 21 Jun 2018 12:41:59 -0700
Message-Id: <20180621194159.21160-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 21 Jun 2018 19:42:03 -0000

This commit adds maintainer information for the PECI subsystem.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fd5e8808208..12005d7aed8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11137,6 +11137,18 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI SUBSYSTEM
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+M:	Jason M Biils <jason.m.bills@linux.intel.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/
+F:	drivers/mfd/intel-peci-client.c
+F:	drivers/peci/
+F:	drivers/hwmon/peci-*.c
+F:	include/linux/mfd/intel-peci-client.h
+F:	include/linux/peci.h
+F:	include/uapi/linux/peci-ioctl.h
+
 PER-CPU MEMORY ALLOCATOR
 M:	Tejun Heo <tj@kernel.org>
 M:	Christoph Lameter <cl@linux.com>
-- 
2.17.1
