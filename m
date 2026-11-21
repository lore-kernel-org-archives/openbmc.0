Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2503606A320
	for <openbmc@archiver.kernel.org>; Sat, 21 Nov 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jWmY52wmxz2xqr;
	Sat, 21 Nov 2026 20:06:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795252009;
	cv=none; b=bmLEK6jPE3OdAqp37K9OMmG/l59J3tlvX76fYv45NQnzLuaYT/kgbVov9/bwrxcJipRhXHBX5G8qLGdG01w6dyf50B90X2A0FSN60+hPVSaEzumU8fhD2+j8pK0370LQW73XQ8YEy8IRzKRSj/jSfuSZUiVPbxPD9uXkFJ90QhyCWVnmitMYNBkZLGXbW+eyN/FBomHoUijlkTmKmCTWxFr3dNQG1OGQnNKk1h3PgGvax5ALLxZlTn29mokNVmb81DxbdqMOkYVeY7WH1+nkjyrZowTNsRjCAGMAna1/7hcTJR5LrL9JwT8aMDT8kgR2NU/rR+XZcSIPueJCjzdoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795252009; c=relaxed/relaxed;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdTiAE8WzceZDk1Co643P2MK3gmXgLwjyiZSSCd84RiTG/kEqAGzBIthK3E+46EjHpAhbXDhskN1Dm7IrpXCVAOEKYiYH8NZ4vMB53BM1bXtI+NEY9atiTWhPoPuzxpDCPIGu088kbR/DKxJ0CUGbZJxKT+XdTqVoazy+JGUFDOCMlmTFu+F82N7b1Rj9GzAEv22RI3XSg52j7QPTzOncUh8mcRZqkGvqBKbYKz863CPBDHjzwlpYLaYfC3g9g0jgO6s7AmqvXExDGlyKe69SUNoJqjD5BAJ+E+c8Vuzzh+9C0mJ52CG2FwY2FjdDJPsc+McktZd3moTscZf32whEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jWmY34JtKz2xXB
	for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2026 20:06:47 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D8844308;
	Sat, 21 Nov 2026 09:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0A31F000C4;
	Sat, 21 Nov 2026 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252005;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Km7+OJVjqlWJjhhxB+m+sVOS4VxAaJo1rT7yEmeirJFPAMkgmsKR/yqnXQEYPBq1P
	 ib4JFrWFs0MeDTgnBXuw2XQqA9fTZSJJwiVSplQFSwUXv5LqsWjap7hf6fRT+qpc54
	 qz+WkXPWGNUCoTpAhsn/G+NpmjtIecNS7z7gzb9SUICaMTj61DHDAb0PvHWCjgR0y3
	 Gtb77qQ5k6aDqfTYC2tRKZlie5F5e2fSz2uSEwOWOk8vcn9djSld9nbpKfWZ2YG+3O
	 PpdvtQczrrRTukJ6NfPWpzb7kccJ438II5tvTXQrsOreXScofjwCVZ37XzwsxS6vfM
	 JPIcMpJWZ0+IQ==
Date: Sat, 21 Nov 2026 10:06:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
Message-ID: <20261121-ruddy-neon-rooster-a24f5c@quoll>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 05:59:10PM +0100, Miquel Raynal wrote:
> The whole clock list is supposed to represent the clocks provided by the
> main MA35D1 clock controller. Yet, the comment at the top is wrong by
> definition: it lists both external and internal clocks, which does not
> make sense. HXT and LXT are on-board oscillators which are now correctly
> described as independent fixed clocks with their own DT node. The clock
> controller is a consumer of these nodes and a provider of all the other
> clocks listed in this file.
> 
> A look-up towards the HXT or LXT index through the clock controller is
> always wrong, yet possible (even if totally useless) with legacy DT, but
> should not be made with a recent DT describing HXT and LXT oscillators
> as individual nodes, hence mark them both legacy.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


