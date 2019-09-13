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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VNxD1Kw4zF5Wt;
 Sat, 14 Sep 2019 04:11:10 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 11:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; d="scan'208";a="210442620"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2019 11:11:06 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 0/2] media: aspeed: refine mode detection flow
Date: Fri, 13 Sep 2019 11:11:03 -0700
Message-Id: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
X-List-Received-Date: Fri, 13 Sep 2019 18:11:13 -0000

This patch series refines mode detection flow by fixing and refining of
hsync/vsync polarity setting register handling. Please review this change.

Thanks,
-Jae

Changes since v1:
 * Updated commit message.

Jae Hyun Yoo (2):
  media: aspeed: refine hsync/vsync polarity setting logic
  media: aspeed: set hsync and vsync polarities to normal before
    starting mode detection

 drivers/media/platform/aspeed-video.c | 45 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 22 deletions(-)

-- 
2.23.0
