Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24775C636CC
	for <openbmc@archiver.kernel.org>; Sun, 19 Feb 2023 07:44:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHcL4Lpwz308w
	for <openbmc@archiver.kernel.org>; Sun, 19 Feb 2023 18:44:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cX/+nSzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cX/+nSzR;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCwCK1ct1z3cBL;
	Sat, 11 Feb 2023 00:52:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676037133; x=1707573133;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=r4w/CErbxaJzMbH7832T/6D/ahn1FgUG57ZITj5IzaQ=;
  b=cX/+nSzRmZaEuU+GasHSoCdHasn/AwCS+Oc2nKWKMd4VJ2tO0oSdlNKE
   PLwWV9lJ8rnHgi1Bi6LP/hFlhwkTy21axNEUsPr5MwwFrSF44r+ghXMSq
   nVRi0x98ETr4c3ZPjSvuVCsBTyQUHPUamAsux4QD6XZ7komjb4agc9qPF
   x7JTvj88EdX+PqD1UhyVeOmfT/BY784sMoCqvUrEg+kLMvLd4vEu+UA/w
   /p/fAW4UE3m/mzeP0qh6BUlTa3o0WilY+vzDJT4A4faoq6u24W+kDbxWF
   UgWCpBbG8RppDSU4LId+ec6qpAxNi8Ze51ZdXv3T/SjF34FMJXcXgxgtm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392826851"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="392826851"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:52:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="736748179"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="736748179"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:52:06 -0800
Date: Fri, 10 Feb 2023 15:52:03 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
In-Reply-To: <20230210072643.2772-4-chiawei_wang@aspeedtech.com>
Message-ID: <2d389fc9-0d5-42a1-b6d7-695c70dcf0fe@linux.intel.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com> <20230210072643.2772-4-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:41:14 +1100
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
Cc: devicetree@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 10 Feb 2023, Chia-Wei Wang wrote:

> Add the driver for Aspeed UART/VUART devices, which are 16550A
> compatible. It is an wrapper to cover the generic 16550A operation
> while exetending DMA feature for the devices.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/tty/serial/8250/8250_aspeed.c | 502 ++++++++++++++++++++++++++
>  drivers/tty/serial/8250/Kconfig       |   8 +
>  drivers/tty/serial/8250/Makefile      |   1 +

Hi,

Before I look any further into this, could you please explain why this is 
made to be entirely separate from what we have in 
  drivers/tty/serial/8250/8250_aspeed_vuart.c
?

I quickly went through some functions and they've significant parts in 
common with no variations at all in many functions and you're defines 
are 1:1 too (except for the DMA buf sizes). It would seem much better to 
add the missing functionality into 8250_aspeed_vuart.c rather than 
creating something from scratch with large overlap with existing code.

If you intend to keep it as a separate one, you should have a rather good 
justification for it.


-- 
 i.

