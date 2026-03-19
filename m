Return-Path: <openbmc+bounces-1663-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE610109192C
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:49:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLV16FVgz2y7r;
	Fri, 20 Mar 2026 09:49:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773960553;
	cv=none; b=HzQH50bUp/BWqv5baE78a/wCZSV9yLRnyvgjyd3I04OlYdnHoX/4VKI9kVXwfYESJkwpE9CYZOhrOYo2l84sQ1GsaHwc4/AFBjzFUVpTrV5XqZbafAL0KgtMz1/evasvLZJFQK83YFqN74ujd2Uy1D0b8tTn/XwnHn4YG0DkBO8D4x7A5pxrsXHTRtvw8Tuc8djgb1/ugYVpXFnbkqcnDS1OMtCo2LKvrxsmZYDBO0UDOPK2t7c33F8geRNnBiqlxhpl8x/SqeiDrIhqhMGxk5j0sYGKfJ3VsilUGlZpQ1JVEVB3ghLxa1aUAH8oE6iUUgDqLhC2UdsMKCJBwCd1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773960553; c=relaxed/relaxed;
	bh=Pmsva/xzAVb50u8kg7yeZ//wi3MiP7LDFDhpFMh3/QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkEl/ZGMfWiYYNLwxRwhafsz/+EJHRDg5JXp9z75mg0sw9cffet/F1TUejg0Bp8ksV3BvBUuJ6fWzDgGXwr2Ua06sWYZbjhmg7IN/JCImmSlZVFNSOK4Y2RcEp1t7LsHZtnXF4RhEaMhbKOAHBQEv3sB3J3JgXjq/Wbmg1SxY1vggEKhgSuAaPicc08Z1BYIoQMuFX8E+jCLsP90U9XSQfW91bOods6X8lT5bsdNmf1Pso5PFdliMV1fFGzBF+ELRhhF2UHAV5sMFjFxbvsYcHK31lmMlpw3gzu363DYV4UB4DfTUF/woexp+/l+NAIB7Ctp1w+6MSPX4STonphYTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rjo3mK12; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rjo3mK12;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcLV06k1pz2xm5
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 09:49:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03087441D2;
	Thu, 19 Mar 2026 22:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE52C19424;
	Thu, 19 Mar 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773960549;
	bh=+KQ9l/0fKSkXlJr4dq5Lw/z2OMO4oTL9bBT0gqKkj8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rjo3mK12gW3axC6wJOCI+uhqCqE9aifc06DNdZCIsdYS1y6UcOc2XSgn/QMRcY/l2
	 /1YTeiw8TeL9o+Y9tnn5Y4uOhdXqN4xMMmSnN2tlfhT1M5g2hzNKUznP6DSiLIUvrP
	 pOU5YMsy9RZQQ+JjzN/pnuiT5cN9BdXPfmuq2LXbTFt3d1/WlBD4XXyNxgjllUHtvo
	 f6GZy89lmU6/rL5FSvSHuRv1QwidOjHAecpNmYvBNleWHJ0ZkuaXusKkvmCSC1XdJY
	 JeEkSdV/kRzxAR/k4Fc3/fR9VqIhDQl/gdIT/G98qQIkuzWpW3Glr2DuNGgRwIFTqk
	 hH3dSXEWJls1Q==
Date: Thu, 19 Mar 2026 23:49:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Eddie James <eajames@linux.ibm.com>, Wolfram Sang <wsa@kernel.org>, 
	Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] i2c: fsi: Fix a potential leak in fsi_i2c_probe()
Message-ID: <abx8qZLy4oeiiSqn@zenone.zhora.eu>
References: <fd805c39f8de51edf303856103d782138a1633c8.1772382022.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd805c39f8de51edf303856103d782138a1633c8.1772382022.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sun, Mar 01, 2026 at 05:21:01PM +0100, Christophe JAILLET wrote:
> In the commit in Fixes:, when the code has been updated to use an explicit
> for loop, instead of for_each_available_child_of_node(), the assumption
> that a reference to a device_node structure would be released at each
> iteration has been broken.
> 
> Now, an explicit of_node_put() is needed to release the reference.
> 
> Fixes: 095561f476ab ("i2c: fsi: Create busses for all ports")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

