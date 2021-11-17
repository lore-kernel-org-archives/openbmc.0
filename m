Return-Path: <SRS0=1Y7q=QE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A264C433F5
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 18:23:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C655F619EA
	for <openbmc@archiver.kernel.org>; Wed, 17 Nov 2021 18:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C655F619EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvWXK3HS5z2yph
	for <openbmc@archiver.kernel.org>; Thu, 18 Nov 2021 05:23:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmdKwVZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JmdKwVZT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvWWX5lRJz2yTr;
 Thu, 18 Nov 2021 05:23:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEFD361BC1;
 Wed, 17 Nov 2021 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637173382;
 bh=sWJKe/8SQVs6SgDfWnpRWDalKpe+YyM+HJZGdR1UHtc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JmdKwVZTmueZEXGZMFqJYQfR5/Jy5cmEcFSy6rhizmg6ZYIUgmFfvtRNwgcrQqpiQ
 e6GXRfxT2hL65t9ZAwQJpw2/FbvQOPDvlx5R6yFkyDIYdPJtRSZ0oHUln2byNlzYJF
 l32Kuy/BVJ7bQ/pGUkU6Kz7xFWUf3KDnDEdhuNDlXbypFXeXZjEo4GcuWrI4HE8ZnI
 De1mQ5t/jP+wzG+08eBg3sQcozmBO5FjbZq/T1MecdALHcW5LLtsEOF9HSoq2vsYL/
 SLQrJzJH7GcKgz9w2COMHanpKVUJ3rFl0pYuP1umbgDczpci3NC795DhjCYQwOXWc9
 tTQ2Ek80wOSNw==
Date: Wed, 17 Nov 2021 10:23:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v6] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211117102300.68d00e9a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211117075513.GA12199@gmail.com>
References: <20211117075513.GA12199@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 17 Nov 2021 13:25:13 +0530 Kumar Thangavel wrote:
> +const int padding_bytes = 26;

net/ncsi/ncsi-cmd.c:21:11: warning: symbol 'padding_bytes' was not declared. Should it be static?
