Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KFT94kZkzDqbk
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:02:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 16:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; d="scan'208";a="128987507"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2018 16:02:53 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.19 12/12] Add maintainers for the PECI subsystem
Date: Tue, 18 Dec 2018 16:02:36 -0800
Message-Id: <20181219000236.30812-13-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 19 Dec 2018 00:02:54 -0000

This commit adds maintainer information for the PECI subsystem.

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e9b19ecf6f7..b98a5763f6c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1294,6 +1294,14 @@ F:	arch/arm/mach-aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 N:	aspeed
 
+ARM/ASPEED PECI DRIVER
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+M:	Jason M Biils <jason.m.bills@linux.intel.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/peci-aspeed.txt
+F:	drivers/peci/peci-aspeed.c
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Rob Herring <robh@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -11380,6 +11388,20 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI SUBSYSTEM
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+M:	Jason M Biils <jason.m.bills@linux.intel.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/
+F:	drivers/mfd/intel-peci-client.c
+F:	drivers/peci/
+F:	drivers/hwmon/peci-*.c
+F:	drivers/hwmon/peci-hwmon.h
+F:	include/linux/mfd/intel-peci-client.h
+F:	include/linux/peci.h
+F:	include/uapi/linux/peci-ioctl.h
+
 PER-CPU MEMORY ALLOCATOR
 M:	Dennis Zhou <dennis@kernel.org>
 M:	Tejun Heo <tj@kernel.org>
-- 
2.7.4
