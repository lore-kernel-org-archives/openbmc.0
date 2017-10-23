Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="wewYlLbe"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dUIcUn7Q"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5412N01zDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:08 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 724F720C8D
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:message-id:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=UuF4fRm8AneB55vQ5QlW0nS4fXaNd
 Svp+RY4mv47RE8=; b=wewYlLbeUoFK6b8d47wzK6F77NVdLyiolLru/S6zB+Aet
 LPQGKT5RBJ9d9uYjW9rj7yWGTMbBdguAk2FcKFsxQrRmG10AZiQiFrLqrnP4A0qN
 fhLhfhUvyUSumXrNAiv2Z4pYzjr0r0UgEuJcFGXhAKEblgkY4nxtTT9TqfvN8CSD
 MB88Od9Dg8vuZBR5SiMJt5Q1dLGkcoTrp9SkSIOV7F3rH0WIB3gih/3zuGyRObls
 nkTW+6Ts5vR4GUOQO/d9HcJxe4Z312Hvxuh+Om2hUER47al9ZaAVcCZ5jLA5XG0P
 J9IZVenqPEMxyTDvJAJ0LVGWkzvbVGJ7FW9+65CZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UuF4fRm8AneB55vQ5
 QlW0nS4fXaNdSvp+RY4mv47RE8=; b=dUIcUn7QtV+1yA+wQVzkuZe4pH6TYQWLQ
 o/cz+982ZWOLgZ1p7l9ZT9qq4cBL7s6v4glc7se8tVu9jo50UP/mBfAaGXDVIQqd
 tdnz0ngB8fySSDsFUnybTvOJaowt3I0w0WVM7oYOm9hC+MKQVJKGcejfcih/ti9V
 I9EGnAocQSoeIEHNJVH0z36099Wxpa68JFihh0AmtGbfZ8Yabh2GW9o8g3gZWRpy
 vd6xTbDIxwn/LSJFy+dWHu8pSVBZLyjiTfsYfkcTrRhIg999YqsGm4VSiVGUiQDD
 wHz5593LXm8TPOOfS8UsKqwipiMkzNpV6GFd86Ja/bA9BGV+nOCUA==
X-ME-Sender: <xms:HoLtWaYwTpn6UTUsKJ6Q6Y7UBtUk8eV3KrAtI0wgVqyUxSbDa45Isw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9703C7F9BA
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:05 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/7] Backport upstream NCSI fixes
Date: Mon, 23 Oct 2017 16:45:50 +1100
Message-Id: <20171023054557.29013-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.2
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:10 -0000
X-List-Received-Date: Mon, 23 Oct 2017 05:46:10 -0000

This backports a few useful NCSI fixes which are upstream, as well as replacing
"net/ncsi: Don't assume last available channel exists" with the actual upstream
version.

Gavin Shan (3):
  net/ncsi: Disable HWA mode when no channels are found
  net/ncsi: Enforce failover on link monitor timeout
  net/ncsi: Fix length of GVI response packet

Samuel Mendoza-Jonas (4):
  Revert "net/ncsi: Don't assume last available channel exists"
  net/ncsi: Don't limit vids based on hot_channel
  net/ncsi: Fix AEN HNCDSC packet length
  net/ncsi: Stop monitor if channel times out or is inactive

 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-aen.c    |  2 +-
 net/ncsi/ncsi-manage.c | 59 +++++++++++++++++++++++++++-----------------------
 net/ncsi/ncsi-rsp.c    |  2 +-
 4 files changed, 35 insertions(+), 29 deletions(-)

-- 
2.14.2
