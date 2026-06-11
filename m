Return-Path: <openbmc+bounces-2083-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD11CD8C9D
	for <openbmc@archiver.kernel.org>; Thu, 11 Jun 2026 04:41:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbVNJ31l9z3bqD;
	Thu, 11 Jun 2026 14:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781152896;
	cv=none; b=TVDZEY20JhMSkyw8Bm7DyiJK+/O21FGbp4iY+/tjSFPvISlNhrkvFHjqNIjCXqlhpDMBd3/wk1Pxs/GH06QFGavYvZtUAEjqYupcTSEqCGAdfCRYvhfIG0V0hMaW0kYtI5ZjNZEqf10LlTD+ENkb7fumrNbS397Jng2Yv+iVWjWlOpXTPV4e+VdMc9yYDuxUuMnALfib7BrFEdO/42GmW2RHXD7AgBd+CBVQvz8mtPnq7jNvgh3Oski12ClBMNv12OqqKbsdo+TukXCMMmi3pb7IJo2QrRbAIbJ+dxbEZvwAnKUmMN58mcBBOFF39zEgbPfG2ZQPnLWFliSRR53zZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781152896; c=relaxed/relaxed;
	bh=eiWLnSSU4F3awHVV3u2QFSYxQvFnUPM+p2QcVcY5/5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HZzcK3JTmn15LaENprx1Y/rW4s0ptPR1ILzmOw/LYyCPi1DtUEzeZtfKNN3Y2qy1Sim9soe3CMUn6HuWLHqYx1guYj7u2mkOP78zn7DooPPnmg+TwoO81HrvNiobYrtLUx/v8Vs4YU2OSUAyKwCw0E3yLmWdc4h7qSP/p37W1SJxYe/asW1b9UC8ASjw4foghYY9l5t3apqIHW9iQSu/29WmIjpebiDL3X5vVE62/C6kNed4HsAC+CfVERP2vSaPGzRic63jN/l5uHeilS+HXxUVABWhv2myylpBdyPFNxwVn7QAF6KlW8zmFFlyZAc5+KBNwryARTjw0G9Q3MECVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b8MYOE3Z; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b8MYOE3Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbVNH3c42z2xwM
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 14:41:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781152894;
	bh=eiWLnSSU4F3awHVV3u2QFSYxQvFnUPM+p2QcVcY5/5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b8MYOE3ZN+SFjNp6KT/5fHfj4AojvYFBsSCBKVSlU6Uc1Sr14LmGgTDs6AE+ZHiNi
	 NSEfp48voioC4dUce+kF2tyeXgaQ1cPhlNmR64/UkPcu0T/Y4FrMS6qbjBwrpiD4Dz
	 ynKRVzVUcCWah7kDmj3teMHO7sO/NcUo0igkT7DVBFLxcPqohgGYImxxiuWrAaygwk
	 8redMbewx4PisQ6NRWwjXi6Qv7sCyLfppXuzc2FiFMH7yX4wk69gohZdmYUQWS+Rl9
	 AUkjdRHzczNwej4SjcAHM9Dm0ON1j3AKhAh2wZMv1pCx4l2ob2JIKGJS5gJ2pyasBk
	 JDXPqYl0M0Luw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3B13C60A0C;
	Thu, 11 Jun 2026 12:41:34 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com
In-Reply-To: <20260610121822.2524634-1-tmaimon77@gmail.com>
References: <20260610121822.2524634-1-tmaimon77@gmail.com>
Subject: Re: (subset) [PATCH v5 0/3] Nuvoton NPCM FIU DTS fixes and binding
 conversion
Message-Id: <178115289418.1513794.15361783177002818407.b4-ty@b4>
Date: Thu, 11 Jun 2026 14:11:34 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 15:18:19 +0300, Tomer Maimon wrote:
> This series fixes the in-tree NPCM7xx FIU controller nodes so their
> resources match what the DTS actually describes, and converts the legacy
> Nuvoton NPCM FIU binding to YAML DT schema.
> 
> Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
> nodes.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


