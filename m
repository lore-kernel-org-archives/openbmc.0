Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq55r4m2WzDq95
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 12:13:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jGyx0Q/I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y4DUsvAW"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B39E220970;
 Thu, 23 Mar 2017 21:13:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 23 Mar 2017 21:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=zPffN9W9VIFDhpF5C4X+W1R5PMaboq
 1EWYem+Vtl8G4=; b=jGyx0Q/IwyciMGx4CrP8s40ysuNy1fjJ7HdjVkO/tR5lxE
 7n6Tkh0Qfom7DG6zdwhgPHHMwtBctlaZK3roHd5JYMwE7zEsvMsDBqPHcYj0bYt8
 lYywFnIyfG4dm0xutlhG8uT/AUinI8/fI4+CcEW3d2SdsSrcOKlU2k5nUyn8rLoc
 DS+9kXtfYLBElRYpoJNav8GKvxGyhqwgfldvbTKDHzhtswcAUa2y6sZGbZ7ymgUU
 /a2+nJQcW57qy88XAw7vLgmxikz+srtj0fhC0KpZURYCblGY2I0DoPGZAGy3Ul6r
 of5Q3Es494Ln0SbmqNPZPOcpwE7TQJoIbNlnRnMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zPffN9
 W9VIFDhpF5C4X+W1R5PMaboq1EWYem+Vtl8G4=; b=Y4DUsvAWCDJjEwbNoknqip
 lJ6cDo3aKX0zPLO0Nz5/9BEFl6dGPjUxhdE7DI0uxMKDraUZ7++XBeq/1Y7S7yzh
 GhWyBX5YmgUD/6PP28EGf+Dz9C+32PaKwW3qnv88Qbvyt9B415kTvEt39vERIGwN
 8saJZ4+qDgJlcIKlTS++kH2dHmlLjG+ViglJzqwSoj5fj4ZVvNYvrVyBbQK2WGpS
 a3rcozlP4xDsz70D4bKDJ1+zC+1FWyhMXPmIm3VMhLlt5FiA3+AM+9f7qPuMRQBd
 CVEU/UvOk8J/+mSh/uhTl3RljJZlYU+NnU41jdCTZ36DijGvKNwPcCBfPqI6V9iQ
 ==
X-ME-Sender: <xms:vXLUWJAqpp0SzpEIip7zlUtZIuK0IuF12LsQgC0_gGrLsievDPhF0A>
X-Sasl-enc: k9udqfo3N+vGxFkxMKEfzD5jQCY9B5k4nAv4cNEeFrtx 1490318012
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E70307E033;
 Thu, 23 Mar 2017 21:13:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: aspeed: Disable UCD90160 in the Witherspoon devicetree
Date: Fri, 24 Mar 2017 11:43:22 +1030
Message-Id: <20170324011322.31837-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 24 Mar 2017 01:13:39 -0000

This is a work-around for [1]. Binding the UCD9000 driver to the device (and
possibly the sequence of unbinding, poking the UCD90160 via i2cset, then
re-binding the UCD9000 driver) appears to have some negative effects.
Instrumenting the transactions with reads of the PMBus status tree lead to
the following observations under "normal" operation.

[1] https://github.com/openbmc/openbmc/issues/832

UCD9000/PMBus core sending unsupported commands:

         Jan 24 06:42:50 witherspoon kernel: ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Unknown error
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: CML status: 0x80
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
         Jan 24 06:42:50 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning error -5

Reading the status bytes off the UCD90160 gives -EBADMSG:

         Jan 24 06:43:21 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_BYTE: -74
         ...
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Error reading PMBUS_STATUS_CML: -74

"Other comms fault" errors:

         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Unknown error
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: CML status: 0x82
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Other comms fault
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
         Jan 24 06:43:56 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
         Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
         Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Unknown error
         Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: CML status: 0x2
         Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Other comms fault
         Jan 24 06:43:57 witherspoon kernel: i2c i2c-11: Retrying transfer (attempt 1)
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Status byte indicates error: 0x3
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Unknown error
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: CML status: 0x80
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Invalid Or Unsupported Command Received
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Transfer failed: -5, status was 0x3
         Jan 24 06:43:59 witherspoon kernel: i2c i2c-11: Aborting retries after 1 attempts, returning error -5

Reduce our problems by communicating with the UCD90160 as little as possible.
With the associated userspace change, the only communication will be applying
the VCS work-around.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4d26d4702a34..69d5897dbfde 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -253,6 +253,7 @@
 	};
 
 	ucd90160@64 {
+		status = "disabled";
 		compatible = "ti,ucd90160";
 		reg = <0x64>;
 	};
-- 
2.9.3
