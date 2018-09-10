Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428M6l3ZxGzF38b;
 Tue, 11 Sep 2018 07:45:50 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2018 14:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,357,1531810800"; d="scan'208";a="256062306"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga005.jf.intel.com with ESMTP; 10 Sep 2018 14:45:33 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [RFC PATCH i2c-next 0/2] i2c: aspeed: Add bus idle waiting logic for
 multi-master use cases
Date: Mon, 10 Sep 2018 14:45:17 -0700
Message-Id: <20180910214519.14126-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.18.0
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
X-List-Received-Date: Mon, 10 Sep 2018 21:45:52 -0000

In multi-master environment, this driver side master cannot know
exactly when peer master sends data to this side master so a case
can be happened that this master tries to send data through the
master_xfer function but slave data from peer master is still
being processed by this driver.

To prevent state corruption in the case, this patch adds checking
if any slave operation is ongoing and it wait up to the timeout
duration before starting a master_xfer operation.

Please review this patch set.

Thanks,

-Jae

Jae Hyun Yoo (2):
  dt-bindings: i2c: aspeed: Add 'idle-wait-timeout-ms' setting
  i2c: aspeed: Add bus idle waiting logic for multi-master use cases

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 10 ++-
 drivers/i2c/busses/i2c-aspeed.c               | 70 +++++++++++++++----
 2 files changed, 62 insertions(+), 18 deletions(-)

-- 
2.18.0
