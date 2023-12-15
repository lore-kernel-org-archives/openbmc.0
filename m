Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DFBC4332F
	for <openbmc@archiver.kernel.org>; Fri, 15 Dec 2023 01:43:54 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IZCEXQo6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrsSn2CQKz3cYL
	for <openbmc@archiver.kernel.org>; Fri, 15 Dec 2023 12:43:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IZCEXQo6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrsRh41NRz2xm6;
	Fri, 15 Dec 2023 12:42:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1AC43B8225F;
	Fri, 15 Dec 2023 01:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC62BC433C8;
	Fri, 15 Dec 2023 01:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702604571;
	bh=WpAhXUDP0156J7Qod8uxjWkADmlPCIE00X7Adp2r1e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZCEXQo6pawTJBvo7W+kRFb/WNCmOGU/PI7DgARIcNi17ISz65nVpcg4f/pPzcJ5E
	 CNucasQGiaQe1/TWSM66jhPq+C4TpAgHr5mL5mo7ppCSbbSGjHc+UVmI4d2RPGj8ZJ
	 U20wj/8qiYQ0LaH3BpSL943jq7ESdoaqfM/UG/XrzhkOmoY+6THBgc6jxD4pMIUwEN
	 RisdElPzjsEUTLYYyLUp55lEMxUG+h0+1np7mcn8kPnr/xYPPmzmWCGrIpsFtnwzpR
	 827xHxZmmH7Cjzu/hpZ2b+C+xbhP+Wd69sFaWcHDtwMkQpmWVXTpq3D39QNkvrNCHj
	 x7qBkKncgHTqQ==
Date: Fri, 15 Dec 2023 02:42:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Message-ID: <20231215014248.6f7sqh6n4kmhe4js@zenone.zhora.eu>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211102217.2436294-2-quan@os.amperecomputing.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Quan,

On Mon, Dec 11, 2023 at 05:22:16PM +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
> 
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
> 0x00000086, but was 0x00000084"
> 
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
> v4:
>   + Add an extra empty line before the comment                        [Andrew]
> 
> Note: I'd like to keep adding Reviewed-by Andrew and Andi for this patch
> eventhough there is an extra empty line added before the comment as mentioned
> above. Thanks for the review.

that's OK and you should. You would remove the r-b/a-b only if
you do some major changes. Besides, this change was asked both by
me and Andrew.

Thanks,
Andi
