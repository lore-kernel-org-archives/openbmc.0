Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZuxMxvgN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZAAXeW0v"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40krB52cjdzF2JW
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 16:18:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 816E320F8A;
 Mon, 14 May 2018 02:18:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 May 2018 02:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UiRyHyVWxXqplehsgaANg8/i81fChJboP7MH4Nkz5
 Ng=; b=ZuxMxvgNdqtQ9WdD/zKD7uYCUG0NUjk7eDxqGcdvrIMBcPzklCwD0y2Jf
 ZYusjVXinGQ1meuzdnUEnq9yuNlt8y+2e3JBYapl0tX6BMW+MYv6h1aoD9udR6Lp
 Vsu1SMfDsbx9m9RrLX/3eQSGwvBvf67LC5XoYvFFu/E5Z8/KzpgIf5vSlqjA7pQZ
 br0f91PNrlmP4lQieLQDuncMkvNI32kn4/QXVUJcRtpXrCW/wFCK9K37P8RCp9HA
 4dCzsSau6nJgxwkjax6UaP+l72oHNgskUfDZqi1FMUvJ7koiUTUjiyXqzGlUmQdy
 T4eSOa4dgYcJSPgnPx88mkNQBeZwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UiRyHyVWxXqplehsg
 aANg8/i81fChJboP7MH4Nkz5Ng=; b=ZAAXeW0vA/No4NOLbUmSWlcViscv004dr
 Snio8JuLqFUhZjVh7bVwMXVjFJQbItpkpfW7hqIqZgUV5/HWC4CVICCmDSbsf1Ti
 Yu8n6t4zqSQX2FRQ7DxZV3ZVkyRJovS2DtNFY4neFrbpaN9IKabJNvxdPDAoGebF
 9HmlhCuwaqNeT7Xc+HhoMXNgCov06ike19Fyzak4yuo4QFhic9PQpBVAEZbq0rC0
 p1y0YQe/MM7gf5a2pC+2XvwpH3X+SUH9zyTi2IWX5rZlXuOb6fmbFdMDDzMHxjsL
 Uot8edi90sdYjAjTbqt5eI72of8fox84gfKjdW86+b/Y7OX4vc+4w==
X-ME-Sender: <xms:Sir5WiTQ08Q_kHZzFd1QRPcnAz7wVyguExWqCy_ow739F4RsctXNHQ>
Received: from dave.aj.id.au (ppp118-210-26-60.bras1.adl4.internode.on.net
 [118.210.26.60])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ACA410260;
 Mon, 14 May 2018 02:18:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, eajames.ibm@gmail.com,
 benh@kernel.crashing.org, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 0/2] Fix SBEFIFO chardev read behaviour
Date: Mon, 14 May 2018 15:48:07 +0930
Message-Id: <20180514061809.11487-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 06:18:54 -0000

Hello,

read() on the SBEFIFO chardevs is currently unusuable as it will always return
-EAGAIN on a read subsequent to the EOT flag being observed. This breaks reads
using short buffers as we now have no way to know when we have received the
entire message. This is made infinitely worse by the protocol, which as
defined, means we cannot know how much data must be read, and therefore all
buffers are effectively short*.

These two patches help by at least returning 0 for a read subsequent to one
which drains the last byte from the transfer buffer. A read subsequent to one
returning 0 will then return -EAGAIN if necessary, under the expectation that a
write() has been issued.

This is a work-around until BenH gets his alternative SBEFIFO implementation in
shape.

* This is true to a point - it recently came to light that we can expect any
  FFDC to be at a maximum 8K in size, and the maximum size of the transfer is
  defined as:

  * The requested response size, plus
  * The status "header", plus
  * Up to 8K of FFDC

Andrew Jeffery (2):
  fsi: sbefifo: Unpack !sbefifo_xfr_rsp_pending(client) test
  fsi: sbefifo: Return 0 on read() to indicate end of response

 drivers/fsi/fsi-sbefifo.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

-- 
2.17.0
