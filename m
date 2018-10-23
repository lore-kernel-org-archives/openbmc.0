Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="lzp14NQ/"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="R+MSuVgn"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42fnDb2X67zF37S
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 08:52:30 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B81921D19;
 Tue, 23 Oct 2018 17:52:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 23 Oct 2018 17:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm1; bh=P5EpFRJSM5stO
 UdO6srmDnCXnVhw6GpIO0051el5Efc=; b=lzp14NQ/OwwCOvgr9G8pJVYGUdwTY
 XL2j0pzaaEnVCp7OPZoeBP2KaBeT8EA7NTvuZGhnsNesRHTESm6Nsmz7Gh7W6TQB
 HpveoUqmnwtqltZm8MK9l+dS5fQMxth3HeFusiL3EA661RVAPQXEDcuDNEkXQBHB
 CgLdf1pRkM6NPG0d1b4rH2TbdtF18OFCEkzOPm0oJX5wMDmtgMPVlzFxjllWOTEY
 VGqTE3K0t05hyQp7/jNuuUMiOPCxPby7VhrsbNofv3gAoi89zNESNCIFtwd5K+fc
 b4fxDADUa7oMWSNCM3NdDT8WNKN6A3k9DabOXtJMwRhhDCPVGVrEs45Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P5EpFRJSM5stOUdO6
 srmDnCXnVhw6GpIO0051el5Efc=; b=R+MSuVgnKT3j1BYA51a6AQdlENtj3GszT
 zl+1dDHKWXr/PRbHjxYSO3wF2/LmPQU4/JU70of0K86UTq69NH1RTWTuI1OFqLqv
 BelyNY7MW6A8214W1vtTjheUNQohrJEuipoI+2nXXQEaPAPx/nAxBkoG0pRLe1vd
 hHEIxAXFYZhh9ajxDYVpWwoX93l0Rks2Q50zfcy710NcDNN/N/2uzrPmZPs/KMxN
 0cCJa5Ci4Fo45LxUKNOEbsu7G/iSpD91vvwXiJxRfVHM2+nK54IOIaUqlCrz3AgV
 n68EY7dVtH6qZBWh5KqWgAh+7lakXVrlKDQQw2iGwaFvcmmSIeH+w==
X-ME-Sender: <xms:GJjPW5b1Qw7rsrpNrUACaavuS18GUhcktFKIFkAsSFBUTKotuzoIwg>
X-ME-Proxy: <xmx:GJjPW9EPbt3mGmYiYTm1LOVNKbrk-psmW8VlvZpb0HHGk3fPhxuEjQ>
 <xmx:GJjPWzkDmJhI66YlVwyr_ySfXW8YpNELMBqKXNltU407LhdCy6hzuA>
 <xmx:GJjPW0dQyj8r_I235BBRoYf6INUFSAYd02ETENX64OOs4eXRgSDVoA>
 <xmx:GJjPWxCK8E_zjRwqlV7TOwgcsL3pblyQ7J39sR6iRHCFaa1XwbBl8Q>
 <xmx:GJjPWzz1XB4xcV37WZvCA8QJT63J_9mgiP2xjEHV0Bn0fdeyPYx5vw>
 <xmx:GZjPW300wFeM3H6cdyx8cTT7bHTNIKv7u9d4Nnv_S-MU3okQrADuvg>
Received: from v4.ibm.com (unknown [158.140.225.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60710102ED;
 Tue, 23 Oct 2018 17:52:21 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v2 0/6] net/ncsi: Allow enabling multiple packages &
 channels
Date: Wed, 24 Oct 2018 10:51:55 +1300
Message-Id: <20181023215201.27315-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.19.1
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
X-List-Received-Date: Tue, 23 Oct 2018 21:52:35 -0000
X-List-Received-Date: Tue, 23 Oct 2018 21:52:35 -0000
X-List-Received-Date: Tue, 23 Oct 2018 21:52:35 -0000

This series extends the NCSI driver to configure multiple packages
and/or channels simultaneously. Since the RFC series this includes a few
extra changes to fix areas in the driver that either made this harder or
were roadblocks due to deviations from the NCSI specification.

Patches 1 & 2 fix two issues where the driver made assumptions about the
capabilities of the NCSI topology.
Patches 3 & 4 change some internal semantics slightly to make multi-mode
easier.
Patch 5 introduces a cleaner way of reconfiguring the NCSI configuration
and keeping track of channel states.
Patch 6 implements the main multi-package/multi-channel configuration,
configured via the Netlink interface.

Readers who have an interesting NCSI setup - especially multi-package
with HWA - please test! I think I've covered all permutations but I
don't have infinite hardware to test on.

Changes in v2:
- Updated use of the channel lock in ncsi_reset_dev(), making the
channel invisible and leaving the monitor check to
ncsi_stop_channel_monitor().
- Fixed ncsi_channel_is_tx() to consider the state of channels in other
packages.


Samuel Mendoza-Jonas (6):
  net/ncsi: Don't enable all channels when HWA available
  net/ncsi: Probe single packages to avoid conflict
  net/ncsi: Don't deselect package in suspend if active
  net/ncsi: Don't mark configured channels inactive
  net/ncsi: Reset channel state in ncsi_start_dev()
  net/ncsi: Configure multi-package, multi-channel modes with failover

 include/uapi/linux/ncsi.h |  15 ++
 net/ncsi/internal.h       |  19 +-
 net/ncsi/ncsi-aen.c       |  63 ++++--
 net/ncsi/ncsi-manage.c    | 453 +++++++++++++++++++++++++-------------
 net/ncsi/ncsi-netlink.c   | 229 ++++++++++++++++---
 net/ncsi/ncsi-rsp.c       |   2 +-
 6 files changed, 578 insertions(+), 203 deletions(-)

-- 
2.19.1
