Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B9606F46A
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eiyfybd+
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j8DCL0jxVz2y7M;
	Wed, 21 Oct 2026 00:43:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792503821;
	cv=none; b=RuQZNT9/ugYZWCqyxGint4rf7AkJTueBf6PZGlfdBW+ppqpGjZv11Gs/4fGB74Qg6J47P/q4GHZPcMcSlOmQkQ8ua0vu7VvQx+LrDm07azIrya8fQfpWPsZ+/LJKJPdS2Mq3wnayVeQrrlZ+cMOLFu7E78p5vXaTrMOiQO+LjEwKl6P9Pc0YUkvNYymh6C6tJc4qVHYhxoUVd9g2wsD+2ohl93oyQHT+kGpXrYI/fkAMi6aHFylApZQZEu2B4AOBruRYMrV5/1d6sRghzYWVjAO4fMKLTfvOom1DK7tBHWj32zudbt7ot/kI77KJHsSCHybGHZq4wE59UlmogA1IxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792503821; c=relaxed/relaxed;
	bh=a7evs3c83W1K0F5zxXLeZ2sMhNgoUa3W9M3ODO/7lLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHO0xyNuR5nrHsBORuE5FjZ03ZGsN+M1US9HtnxmqmBNE402eJXA5z+RUeVnOsh4O5NL5pFuSClTUH7TtP0YVPUXhIJ1XETYMiEYlfgBt3WjQhLt33S0YfH3TboyH+GKv4NLcI6HkmjcSVwB/WAjxw8n1lraFUU+ntedQxrYakrYXZ8HE80QOizkPG7CBPv83zD0ntKKBAlRP9gM63F/Tu/GSmwbrbR6lEyQaNzQu9tJidSJQjvTglgVnqeGNMqZCAEtw9zic7GIrXfzRKJa1gAtqBEsLunhcYdUe8i9uKifmTiZa9T39vyrVo3z6klmqdGLOztPtj2BG2vVSiwDDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eiyfybd+; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eiyfybd+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j8DCJ3QPmz2y2B
	for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2026 00:43:38 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 303601A11F7;
	Tue, 20 Oct 2026 13:43:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFC6860393;
	Tue, 20 Oct 2026 13:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76C6210328DD2;
	Tue, 20 Oct 2026 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792503807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a7evs3c83W1K0F5zxXLeZ2sMhNgoUa3W9M3ODO/7lLQ=;
	b=eiyfybd+X2pk32UqSIsmjeuQkMNAyn1C43i1jHY9+4kFLJdeoDlggreSvd+5vcMkXl39iW
	iLLNJex4YdZGn17yHAlSqd5o3I4wOR/IMu1nGk/tq4tOTx3XybVBz1U5ujwFH6MSKRD9sF
	NqJP8pVV6pMBdGmx2MPd+vskXq/Nj/cuC6dUbtpkliYL1FVHw34t3DaiZZ+yLkgC4W6fGI
	9+kgdZ64ns+/vKP/GFVmjCrT3WZ9P/cnLIgBLwwacQtxgQg/a0mXyTJx3j45ZejpnP+fUf
	tYdSpSIOKpNLLMsPfMcSiTM5twNqauwBorU1eLPJpDCZWvYDc+8dfHXvJZPgOg==
Date: Tue, 20 Oct 2026 15:43:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eric Liu <liuer@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Guenter Roeck <linux@roeck-us.net>, Mia Lin <mimi05633@gmail.com>,
	Medad CChien <ctcchien@nuvoton.com>, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: nct3018y: report chassis intrusion through hwmon
Message-ID: <179250379387.320906.7689435596822345237.b4-ty@b4>
References: <20261001054108.3346426-1-liuer@nvidia.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001054108.3346426-1-liuer@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 01 Oct 2026 14:41:08 +0900, Eric Liu wrote:
> Add an hwmon intrusion alarm for the chip's chassis intrusion latch.
> Reading it says whether the chassis has been opened since the latch was
> last cleared; writing 0 clears it and re-arms.

Applied, thanks!

[1/1] rtc: nct3018y: report chassis intrusion through hwmon
      https://git.kernel.org/abelloni/c/c1c260266abf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

