Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g7DB6SqnzDqS3
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 03:23:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 10:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,338,1549958400"; d="scan'208";a="141947480"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga003.jf.intel.com with ESMTP; 11 Apr 2019 10:23:50 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH dev-5.0 0/2] i2c: aspeed: backport I2C patches from v5.1
Date: Thu, 11 Apr 2019 10:23:48 -0700
Message-Id: <20190411172350.11956-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
X-List-Received-Date: Thu, 11 Apr 2019 17:23:56 -0000
X-List-Received-Date: Thu, 11 Apr 2019 17:23:56 -0000

This patch series backports changes on Aspeed I2C driver from upstream
v5.1 tree to support multi-master bus environment stably.

To enable the multi-master configuration with this patch, each platform's
dt overlay should have 'multi-master' setting like below example:

&i2c5 {
	multi-master;
	status = "okay";
};

Jae Hyun Yoo (2):
  i2c: aspeed: Remove hard-coded bus timeout value setting
  i2c: aspeed: Add multi-master use case support

 drivers/i2c/busses/i2c-aspeed.c | 120 +++++++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 27 deletions(-)

-- 
2.21.0
