Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmjKq5fznzF0p2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 03:16:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2018 08:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,543,1511856000"; d="scan'208";a="29617858"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 21 Feb 2018 08:16:26 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
 andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 8/8] [PATCH 8/8] Add a maintainer for the PECI subsystem
Date: Wed, 21 Feb 2018 08:16:06 -0800
Message-Id: <20180221161606.32247-9-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 16:16:51 -0000

This commit adds a maintainer information for the PECI subsystem.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93a12af4f180..f9c302cbb76b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10830,6 +10830,15 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI SUBSYSTEM
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/
+F:	drivers/peci/
+F:	drivers/hwmon/peci-*.c
+F:	include/linux/peci.h
+F:	include/uapi/linux/peci-ioctl.h
+
 PER-CPU MEMORY ALLOCATOR
 M:	Tejun Heo <tj@kernel.org>
 M:	Christoph Lameter <cl@linux.com>
-- 
2.16.1
