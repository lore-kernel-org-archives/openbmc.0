Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkTVf0FRdzDq5b
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 14:15:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MAz0FfCK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="a9kHZeH2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D71E2090E;
 Fri,  9 Jun 2017 00:15:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 09 Jun 2017 00:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=yrxFtoKKead+zqrrSWcmXFcDTDxG+T
 tOEQ1SP1g4aWs=; b=MAz0FfCKhhmD4s+UPXm6Uw4oejEBywdXYcKrQ2sy5q0EqX
 Daun47I5PngNyQX1U77a1lzsSjNGQsB1d3PrxysSG7XexrAFIxGejSucwQW16Mzy
 A89eQskIWOz1wQC5OcVGfr368/BQWAA3LH45Wa+Fsm8x+ifuClGgGsmQ+XmG5zky
 OA+jE37Tn6HWQeR6/wKGXEaSwr286cEFBjEoN6Bo9B1g8yc3wnuUVhuVFi+eHXPZ
 b4yMymjBMd9OEmFEhh09jkW6qHLympGUo8DG4QkmXi2YQmJWdqkL2BeQilaKeWhJ
 Vec2xL4ZY+uMv+uluD1CravtjdTWi8xKB0jreb9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=yrxFto
 KKead+zqrrSWcmXFcDTDxG+TtOEQ1SP1g4aWs=; b=a9kHZeH2FdAo4AsrBuw74v
 1Fm81RuuXsDUpEg/AnldfxmeYBupxLLFgL8GwV2TdlGkk+qhJpjnrauI1wdiIV6R
 veR0QYMcJpD89JDS4eGKHQFEWAxQn21TMiJ2xIXftIepKv011p91dIFAANXn1CLD
 PkGMw47V3eDH/5TlgQqm44qe3Wg6VoTqbyh95DwsOWgpO8+bNfaIxaa6nmCeJP25
 dF3zt7pqopJlaFgZVGrMIJDNlHkOY+25T8ze4o74ZK/RimDZybIsLp8UzpjlevBy
 COaUatvhs/JQypAYcXmcJgi3Jm5yTybk/NE4ZzRupm5C2GgkTM5GMHgXSrAh281w
 ==
X-ME-Sender: <xms:9yA6WX_MaDn2bl85pm7piE5GxWk2cZ4mh3ZDZv8tGIEJ2NI-ZMFbTg>
X-Sasl-enc: q6o3Iu8Ska5WgnPMGITPE+EdZhkztN3m1EOjPdAgBYvb 1496981750
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26C882486C;
 Fri,  9 Jun 2017 00:15:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/3] hwmon: max31785: Use standard sysfs ABI for fast rotor
 inputs
Date: Fri,  9 Jun 2017 13:44:54 +0930
Message-Id: <20170609041457.31708-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 09 Jun 2017 04:15:55 -0000

Hello,

v2 has a couple of additional patches: it reintroduces Chris' patch to expose
the additional sysfs attribute and another patch to fix some uninitialised
values.

There's still the outstanding issue of the 'fast' values actually appearing to
be the 'slow' values on the machine I was testing against. I believe the logic
I have implements the behaviour Matt has described, so unless the hardware
behaves different to what Matt expects I don't have an explanation. I don't
think it's a significant problem though.

Cheers,

Andrew

Andrew Jeffery (2):
  hwmon: max31785: Clean up uninitialised values
  hwmon: max31785: Use standard sysfs ABI for fast rotor inputs

Christopher Bostic (1):
  hwmon: max31785: Provide config of fault pin behavior

 drivers/hwmon/max31785.c | 210 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 152 insertions(+), 58 deletions(-)

-- 
2.11.0
