Return-Path: <SRS0=codv=PH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF85C433EF
	for <openbmc@archiver.kernel.org>; Tue, 19 Oct 2021 19:08:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E0B6128B
	for <openbmc@archiver.kernel.org>; Tue, 19 Oct 2021 19:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E0B6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYjv15MCGz3c8K
	for <openbmc@archiver.kernel.org>; Wed, 20 Oct 2021 06:08:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lv4ZuE2d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lv4ZuE2d; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYjt83Hm7z2ypT;
 Wed, 20 Oct 2021 06:07:28 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A4D76101A;
 Tue, 19 Oct 2021 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634670445;
 bh=HaUgFa7ZDveIyObp/cXpK7mjo1xVVWIUnROJaQjyCDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lv4ZuE2dNjZ7BhmzM/CwPcZ1HTJZ0DpCuwSRiGqEfX9gBxoo3yXHirGGg34++hx54
 VL5nIzqRGK+AmEcTwDp9sr+jn/dlNSjjaA3RMXtl16t0rzryHftQHAGSX0D74ktK4D
 cdF0AQAyStQHXno4+ecCMwMW7sgWDyVfW7PGc1U6f9k3pAPpAUJEjPYYCSZkyn36SK
 jwxSvhlZljt0fO4urkF7uZFVkJ2DHpaFt5qCo26PX2RlEiAfjgH/nNlE3AnlyRZLgX
 Aa7qD2G0M8HK1evEUL4qHTMkIMuiCpqoAZrURiZ2G6txLyOKIL+mxkrihNlmiz2BDN
 VMkYKI+Zbz5KQ==
Date: Tue, 19 Oct 2021 12:07:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211019120724.50776b81@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019144127.GA12978@gmail.com>
References: <20211019144127.GA12978@gmail.com>
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

On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:
> +	payload = ALIGN(nca->payload, 4)

This is missing a semicolon.
