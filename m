Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC87606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C9mBf7xb
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG0RX60KDz30Vv;
	Fri, 30 Oct 2026 10:14:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793315656;
	cv=none; b=Ll1lSbKlBIptjG0xBGUs8N8HxETlYNWUo/UA/JV9dXZhJhvMu56QDlT6WO6Op5NFJb8FfNOdb+AneUyaw/Wzg8xzF/7FB5p9VSI9nBkgMAlLnosA1eWg1VZ3ndA7AosTEnxhkKmVBcVNwv+hjlvOy9e4Ga9Y7Zhzf31Z5orwsN0JrACaR1I6zNB4KnqAR+bGBlJKNEHbS833Y4kgCcpqpo/EVp6hr+6vf7d828OoeEROMv2iN3jEEWbf8MzJvvLUOfIMjatLEd0m5/aj2iU+snMXkUD7K8oeSgtbr2yUmmT+WwBlV92kznu4oA8Qzulls60EhkTv44Ac1TmZ9m471A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793315656; c=relaxed/relaxed;
	bh=ZmKcr1TVaOH4zYuCQJNp3qk+4++E+hkc4PsTNG2OJ0M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=np/+1bw3Rd1a/jFSNWateSqTI7UYdn1M+7olESLs2mSbrz+wtDfnFCrIi9tuZruMkVnAtv2lW/V/wBAisJw5v6Q0h3tqul2zwOUZzZSwVYmswb8PPuLymj57/zzA025YpI+Hjh6XiyzixXErjN2p8V2oYltZ6Xj+2eKnBwL35zmmmj/jXTmkuPAmQZL9sDgAucuTx1wy5vRuBtkFrf4gIfdkYjHn+9f1zW4DcMoWP91HK3kTX+YOxvKSi+EESV0oq2T0oc9X8e+lTjCxgy+LAbS17usTCYlR0nESkF+TzhNOR48KA6BGHPetAPJC3jKzWiBMlBqC1zyIfHDyBW73UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C9mBf7xb; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C9mBf7xb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG0RW4HKWz30VV
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:14:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793315655;
	bh=ZmKcr1TVaOH4zYuCQJNp3qk+4++E+hkc4PsTNG2OJ0M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C9mBf7xbK64vTefjEYx9Zyb5lMR7+v8YMt4M1tHSrslBOO2K+AwzQHKDlqdsJGNpW
	 a8j/2Z2qVXwJiXl0pC8tWrSeoLUeDche6f9AWEgXTZiYJ6y2st7pYayNGgRudIk4Hd
	 xDA9T8A7qRh3HgPPvoSs2DViWv62IC0YxSL0xZzH2uzI1aHJt5IJY/qwv+6oJIWEuB
	 Tw91PHdsRUG61II74fxMGEihcAqv6PaZf+3yNbarTlsyK0oI6yqHdeRly6IoQa6Gqp
	 bBsSpdnu1csqLd6cNG12EvFamOVGAxxWdPcxsyxx8mLa0Mtr3Dc8ese+XM5ec8i1f1
	 6+NvMSpXEkowg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E154770E57;
	Fri, 30 Oct 2026 07:14:14 +0800 (AWST)
Message-ID: <a75165ee45be05512580b95603b7bf7af5fb3de3.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/3] pinctrl: aspeed: backport AST2700
 SoC1 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Fri, 30 Oct 2026 09:44:14 +1030
In-Reply-To: <20261029032407.540714-1-vince_chang@aspeedtech.com>
References: <20261029032407.540714-1-vince_chang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 11:24 +0800, Vince Chang wrote:
> This series backports three upstream Linux commits adding ASPEED
> AST2700 SoC1 pin controller support to OpenBMC dev-6.18.

Applied, thanks.

Andrew

