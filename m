Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4CAC3DA6E
	for <openbmc@archiver.kernel.org>; Sat, 23 Dec 2023 05:07:17 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nXVc4lpZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sxsbm1NZMz3cYL
	for <openbmc@archiver.kernel.org>; Sat, 23 Dec 2023 16:07:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nXVc4lpZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxsZc2Hk9z2yk8
	for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2023 16:06:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OZOlUsxrrXNdqAMZKTaQepb6DY2WWkW6Umtrr7fI2VM=; b=nXVc4lpZbsXXpqvimX2TKybLPv
	6tp/leHzdn6LWCqrP3eSsXZY1nmUSb09wKdf5O8FCUPe8+yj82E9DajCBD5BOL530lNURBBmNB6IA
	x17tMBoW4Wp9mo+5SiUdUQJnXj8ibwW8qRswtivqo/2U2cqE28osNMNlPqTIm6IHTEgLyrWVtfILq
	0k+gnQqO/dT6BhPWIcGR6H1Ybw1o+4hwK9vULGPCM07WD9nHAE0EH17Z7hRAQA8S3vv8ZEUZnekbm
	cNhAKfW8zal4uZz4JB96rG27nPCTTr1x+ZGzl931HaPHqqO/ihbeqoFF1fpxpnoT/wbTc04hwZibO
	wbSCR6nw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGuD8-007Ofm-0W;
	Sat, 23 Dec 2023 05:06:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] peci: linux/peci.h: fix Excess kernel-doc description warning
Date: Fri, 22 Dec 2023 21:06:05 -0800
Message-ID: <20231223050605.13961-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Remove the @controller: line to prevent the kernel-doc warning:

include/linux/peci.h:84: warning: Excess struct member 'controller' description in 'peci_device'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org
---
 include/linux/peci.h |    1 -
 1 file changed, 1 deletion(-)

diff -- a/include/linux/peci.h b/include/linux/peci.h
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -58,7 +58,6 @@ static inline struct peci_controller *to
 /**
  * struct peci_device - PECI device
  * @dev: device object to register PECI device to the device model
- * @controller: manages the bus segment hosting this PECI device
  * @info: PECI device characteristics
  * @info.family: device family
  * @info.model: device model
