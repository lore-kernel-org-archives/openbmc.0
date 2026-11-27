Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E147606B419
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P4cLnxvE
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbbWL21sLz30VV;
	Sat, 28 Nov 2026 01:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795790013;
	cv=none; b=QfnArMPWbjV1+dmQ+WQaC0dc3c20YJR5dkAyIOnp1KYxJLguZEry+EIQmZdLdTLQLKdN4vDMiaX70wq2sq3T/a/5KHfQRbvd9nS3eZbJN55b8vV0XJMXWbVRf0CE5Izpb/vazztgToeN/opKLO65kdkP1LJPvfvQYANLP/YMXlhu5e8cb7JBzTGZcYpFachNK2jGuVFn4stngahxyKN8RzotHJsoAxp67jMviYO91POVC5f1EisnCy4yc4wricsmci0Rtioip5WCoyHCoyBtnYo7PX4vT2UklfMJe7saoUXFLsmAA8tarBW7F+Ueajsbaml75LsQ4UF4CxUH2sf46w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795790013; c=relaxed/relaxed;
	bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FBGoawkykhwVILCBI/PvrBO3zXQB3BZAUDmpou4Ufj9efNqP3+v5ZfI/lanQitmEgr51/09kRYJ2vhj0xMVtI9ppKZ0UNLdSPm0QUi10Mgp7PDlbCmQTOUVQSC80pD1EWzMvWwQlN9agQtauSYBOOT+qhQMHGnbGQ2K8awWYFEb85V0/ZFTmP9rgcyWD+ZmkkuuUbazQhTZsM8Piq0IXqAYvhZwcFyGAUCoU6Qi28e37wyhtfnd66dUVQrkvl1ZhidT3RFURud1cIycj63fI+ilr6AK/xt9pYl9WQEIAqQAlL6f8geJTiRVi5mZR0B4xT8HphhQQH7GbbIdqL6/8CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P4cLnxvE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P4cLnxvE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=jbrunet@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbbWG34Nlz2yS4
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:33:28 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso11721041a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 06:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790004; x=1796394804; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=P4cLnxvEqa3KE+1akJ+BxOKitAX3rswxzEgrSGGipBSg5ATm6miNCzGoje6njJOEHA
         QESMckGgAJs3S4EFElt0oGklrbpFNA23Y+Ju+cXHceaUSOOgVTqtniI1fOXpZcoyQNcn
         4pO215ofQY5H7b/mvCeNR19hHvp7T9vnew+IEguMlY0a7toWqAd/eaSADlglegdT6AWF
         7ZRm5MO6ufdg19zsQbUht5FK4uM3zCTazsVeLcAh4R/SoOWYoA8SqRsOT18qlIdQVSI1
         pjWuW7mjlRN6LpPh4czE/2tbYbtptN+LzPw0V5rjRBBZo3r0I0zFZDyZUIoUqBCf/1DH
         MtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790004; x=1796394804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=kqvCu2PmaMdO72wDlZqDdpr9+CLZY9bg+6bNrHZgfsDDE3As0P7wMGzBy6Do3nwWGJ
         W+gDn6dm5IfDeRW0RUwCwQmVyb1oot6Zx617gzonqqmz6vaaqJdmqhCQTzLdfM5Gu2yE
         /AnrzR1qhWZo/Aw8tfpfwcobIOx6381d+2p8qpbyJKVdRIzDLG9YzuqAkQYCo6tiLrck
         ruPvgS4rj1ArlxYpZRXpMBLaqkWcbSlCXltROicNW3k6oM98HOJcwG5yxtcyAi0/kZvh
         VcnNj9u1jPCqnqOF9aeA0JbTuzMglcX8xQTv8fBHYDHL1p2ahXOUjylBCS5yed4rPPiD
         D7MA==
X-Forwarded-Encrypted: i=1; AL+hErEplCpTnngbJoNYUDxK4+Ecb2yClPxZ8QC0UaE4pSVJEUrjzwBsZENipcZL2fS19gyF17w4XAWr@lists.ozlabs.org
X-Gm-Message-State: APuU4Z92eX5z0n8+3eG2H/IYEm0hOsUcrmOHiHvtMBwNpAkibQvfIk58
	TVZc5qBEDNRccgxghK3XGygxGOopp7jqKI+88V97gbKNDTQfo7rIlQ7OW5ickCL2MY8=
X-Gm-Gg: AZFdTZcvYxbed6VBCZAfyaBpto+bFK4GMirPj6iNOVng+z48ByS3ieoLPW1RSV3SLwE
	9rcL56ROn4wjQ4ci+qhQmvwT10R/lPEx3ABDoZU6APFjlyy6k+X59lENZYTAGetDIIthb3oQpjg
	+YD8zPt1PuMD2Pqa5/7WmfC+LH1K8pZVCgHwDBAmKGU6aogDjk0wTPYPRsWH2HQ/1PXauyTxLga
	xaNUQTCRPZNxBuIFUhDOkSs9E5DyABLNDau0ZL10lKkctfTgGVN/2j+wZpk9RKollP9lQ9Le6Bg
	mF48dBlfR14857+vhcRdLk9LqrzUjOXJ60AwzQpFFoqb7XTh/88Z1C5UwxtQ4ydGJ5KBdsbOG6H
	RVYnaH2lwEx8/dLjVuzbttTFZ2n6YY11b36ZXpVrjhDrV2Czb/zQskwPS9v6sWvQDk6/6Mt5xtB
	DaDThnvyoKPaDKEqXdonxma3D2bc/nUHGR8ozuVtaGwZsEbx3ow/RTkLeNiLw7WkB6kqA95EGqE
	Vg8zxG5v5QmFLODuaXbVW5Psd2exubhPkEBGpetydVyDYhJKHeISAEvZzU5qTwZlgyhFy0GVkOS
	615OTPn276W4p3u0ql1ZmhGRTULLA1MvGWSxwc8RNRYQMKKX
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr13284812a12.6.1795790004077;
        Fri, 27 Nov 2026 06:33:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb9f8160ecsm72961a12.15.2026.11.27.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
Subject: Re: [PATCH v13 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Message-Id: <179578999837.3130490.1321256774164046797.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:33:18 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kkh+STkW16bo61fnrALXUXLopXwJUn8icTeFUDyuzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcUzaJnLvllxStGv1dWD2t2zaPaXOLj2dHvMC8gu0yX
 moGSbc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBGnfkaG06uzPxgxWazev9T8
 nBznBSb/J5mvX23n5H1avOdw6kn1AEaG219YnyTk+92QXLDoc8rr7wv2Lb6115HvlPH6mBXGqbP
 SmQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-nuvoton), thanks!

[01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT legacy
        https://git.kernel.org/clk/linux/c/5cb3fcb3a35e
[02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
        https://git.kernel.org/clk/linux/c/4df94650b44a
[03/10] clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
        https://git.kernel.org/clk/linux/c/88997515be60
[04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
        https://git.kernel.org/clk/linux/c/4154c8b3d3bc
[05/10] clk: nuvoton: ma35d1: Reparent the gates correctly
        https://git.kernel.org/clk/linux/c/1c2214475dce
[06/10] clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks
        https://git.kernel.org/clk/linux/c/c31aa10b3ca6
[07/10] clk: Create devm_clk_hw_register_fixed_rate_parent_hw()
        https://git.kernel.org/clk/linux/c/5093f6f2543f
[08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
        https://git.kernel.org/clk/linux/c/107caca779a5
[09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
        https://git.kernel.org/clk/linux/c/6f6ef44a950a
[10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock controller maintainer
        https://git.kernel.org/clk/linux/c/350f54ff5b92

Best regards,
--
Jerome


