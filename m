Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfc3q9QzDqKl
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="O1RQM52s"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YcNehTVN"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CFE2920852;
 Fri,  2 Jun 2017 02:23:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6GhawP
 0wt/2lXGXdROum6SYzNmCSFL72rhW6zEzazus=; b=O1RQM52sGfF+bBdhIRebvs
 GgHaXLSTecbsZgx77UjGQ7t4PZHO6u7w02rRsducG2dSFouIrU8KWX19E+Z0MTVX
 FXfIduR0BBra7cmlCb6b/Zaa7lTIm6jaFRiwFgcHNeKlxSdJg5tz0tP9tD073z5S
 KPTY2X/xV9+TX7SFIPZTbSrqiGCgzjZsE1WdSAAouXbJqZF7ol37cOHCveTwKTCe
 rsCzmTclHSGddp8NFWPnsxDSdlRY8BwF49IgklJehiYyPNg5Plz3YsosZMCDuqhm
 GdCKlT5mPXfrtVZwXcR9POL4MAMcmGd0eDsBu5sTGq1rhx0VGFdHzDgueAr7pDRw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6GhawP0wt/2lXGXdROum6SYzNmCSFL72rhW6zEzaz
 us=; b=YcNehTVN6US4E5bcxuvgAKM+mo/ctTBclq7VVt9BslajBoAPq5ukfUWMp
 FW/HXvaRuDuu7M9pISrTNEajGZdfsUY132nxw2Tk6T+YKFbznVAmwZLG4WGddrwe
 IUgoUTp6StL4XfVz+hgRzb91zdPklx3pSF97Jx9Coubo72ys3PEz5KtrSALgihkN
 mdvZe1TvtpWwd+BpX8uI5u56HHOUaqtCNIuUyxD7JC98PitRkJfYr4yk0sDjNUwH
 b2Z+O5s4y4eq0/75wUulYTo2H93r+B+HS2GY09uu3pwXCfc9uN4gXjQKnjaRCfmI
 7tFamrc49nidE9h1siG9AlbZI4NPQ==
X-ME-Sender: <xms:RQQxWfXFtvP0vuzqMG5wIXNMjpaLGcBXxFC2ydLMJ6vSyzA7fqsfvw>
X-Sasl-enc: hB+kV94xI9Evnn2raqrg1TJFDfPM0EtSkZwHF2Yu7KtT 1496384581
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42005241D3;
 Fri,  2 Jun 2017 02:22:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 2/7] arm: aspeed: Add MAX31785 to
 aspeed_g5_defconfig
Date: Fri,  2 Jun 2017 15:52:02 +0930
Message-Id: <20170602062208.15999-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602062208.15999-1-andrew@aj.id.au>
References: <20170602062208.15999-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jun 2017 06:23:05 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 3fc3eb0e8867..1ff53ca48a31 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -134,6 +134,7 @@ CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
 CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_MAX31785=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_PMBUS=y
-- 
2.11.0
