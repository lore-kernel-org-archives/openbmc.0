Return-Path: <SRS0=M/wZ=JE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69374C433ED
	for <openbmc@archiver.kernel.org>; Wed,  7 Apr 2021 15:19:04 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDDE61222
	for <openbmc@archiver.kernel.org>; Wed,  7 Apr 2021 15:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBDDE61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFp2Z114Jz2yRT
	for <openbmc@archiver.kernel.org>; Thu,  8 Apr 2021 01:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JJQrTBpe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=JJQrTBpe; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFp260XmLz2yxl;
 Thu,  8 Apr 2021 01:18:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4622A61262;
 Wed,  7 Apr 2021 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617808713;
 bh=wp5Kiq2yK8eQG66G8fRxjJMmHVWTNazhDUY7L57YSKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJQrTBpeIoQ+YMwpTJ0wlDmiS01GPvlhMqYQsItY2fu/k6P0Mmi/0vSVj1mOTn5vh
 xS3mcFK31oRIiMuInhHLr5f3v5VPRLvsqGXZ5onoTjO15t8qeYGGxeKYpdt//CEwWU
 1W0pUxbn5n19WVAV+FBXY4UAhhVXNc8h944gC1XY=
Date: Wed, 7 Apr 2021 17:18:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 1/4] dt-bindings: serial: 8250: deprecate
 aspeed,sirq-polarity-sense
Message-ID: <YG3NR4bGRjIGZhgx@kroah.com>
References: <20210402182724.20848-1-zev@bewilderbeest.net>
 <20210402182724.20848-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402182724.20848-2-zev@bewilderbeest.net>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Apr 02, 2021 at 01:27:21PM -0500, Zev Weiss wrote:
> This property ties SIRQ polarity to SCU register bits that don't
> necessarily have any direct relationship to it; the only use of it
> was removed in commit c82bf6e133d30e0f9172a20807814fa28aef0f67.

Please write that as:
	c82bf6e133d3 ("ARM: aspeed: g5: Do not set sirq polarity")

> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

What changed from previous versions?  That always goes below the ---
line.

Please fix up and send a v5.

thanks,

greg k-h
