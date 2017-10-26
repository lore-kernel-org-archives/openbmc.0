Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UShEDYph"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q3muzhIo"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMxhN2yQrzDqYv
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 17:20:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 62D2220805;
 Thu, 26 Oct 2017 02:20:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 02:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=5y+A5y88vOneMcz+iiYFk4KRoD+fwsRWp50wkLWdg
 9E=; b=UShEDYphx3EDfnoT/Dw+9TYBLMsvmH1AKGjJKtHzzhrLcDz/99B5jIUqc
 lfMqypi5hInnsz1GtWRTHO71q1TSZBer5K1GxlSV7KmiRMWUZDibf1fXk20+2bk8
 YUV/JdQiP/nH87yZuzE3zTOISXyBALMJcSvK8vI+n7gc0L0kJlltGByK6fMHfBBy
 gfJvZvFdh3RYwbnyXRspiBHz5GnGaX36VreUCfEtdHRBv4Z5tEtKSK79o5fW+3xx
 t2vXNEBOq8OLilbcbHgx/Swcq3+6h4/qE5bpGDxG1Kws5i8FPhZ4Of2i0UJlQI+W
 xNdSvZilWSxV3so4xcGBBu6DRwLIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5y+A5y88vOneMcz+i
 iYFk4KRoD+fwsRWp50wkLWdg9E=; b=q3muzhIossXiA8amfV3phsbO8rTBQZqyD
 CmH1HiVYsiqrbzW/jed+FYAyR5rEMEJYEfncCwD0b44QgSdNkXpMoA6bXWSkGygt
 tfFxVUCDGIiegUBKpdfHqPoOCFhOvc9IuEVVVlM39HMwXGVHKk7rqS9Bz4QGbcbZ
 H6I2uni8yghNUF1e5XyIJIgt+eMSmisrET9GUbIghvpswwSsD5LkEcCikS34r1Xc
 sRbIlthAMXh6M+PzEluNhhlOuL4y+z5zBMU9d0XCkp4aAdt2taeCo8rQy7VEhwxv
 IXeW0ighUKVMaRGNfoNZa6BzUwioAl0zyU3bQj3BsE5YMXrNMfkVw==
X-ME-Sender: <xms:sX7xWd-AelWQ2sIOzbiEiwpvCP7BavwK_sjDGeS-6zwPKVKTraszJw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 10648247A9;
 Thu, 26 Oct 2017 02:20:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH linux dev-4.10 0/3] pmbus: Misc work-arounds for the PAGE
 command
Date: Thu, 26 Oct 2017 16:49:37 +1030
Message-Id: <20171026061940.25364-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Oct 2017 06:20:38 -0000

Hello,

Occasionally the MAX31785 NACKs setting the page on the device. The consequence
is the PMBus core either thinks some functionality is unsupported by the device
or it inspects features on the wrong page after swallowing the error.

The most obvious side-effect is that some hwmon attributes are not created when
they should be, often causing issues for fan monitoring and control in
userspace, preventing the host from booting.

The series introduces a one-shot retry in the PMBus core for the PAGE command.
This is generally terrible, but the alternatives seem worse. Also this is not
yet appropriate to upstream as I haven't succeeded in getting the MAX31785
driver applied there. As a result this dirty secret can live in the OpenBMC
tree until we properly understand the problem.

The first couple of patches help avoid setting PAGE to values that never make
sense. Again this involves a questionable change to the PMBus core, but I think
we can live with it.

Some brief testing of the series indicates that all one-shot attempts succeed
in the face of a previous failure, much like the FAN_CONFIG_* issues.

Let me know what you think!

Andrew Jeffery (3):
  hwmon: pmbus: core: Add virtual page config bit
  hwmon: pmbus: max31785: Mark virtual pages as virtual
  hwmon: pmbus: core: One-shot retries for failure to set page

 drivers/hwmon/pmbus/max31785.c   |  1 +
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 23 +++++++++++++++++++----
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.11.0
