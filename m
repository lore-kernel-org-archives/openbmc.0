Return-Path: <openbmc+bounces-2490-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53209C5DF9C
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 23:43:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTSCX2wcCz2y8p;
	Tue, 25 Aug 2026 09:43:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a62"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787604183;
	cv=none; b=cs+5W3tqgkL0/3owdopEuooI9p3p2nG4d8/JQrpEpr8zN+DGpYD9WHhLvc77BQg3fjXh9FmVCu6YH1pzEFPfzSW+1UWN85nX4Bz22SLFnOL+jodra6fMphyJ0y3em2l0p1M+J8+NIMwpaOT0BIu4PD4K1bh50SxpI120vpLKRmnaBz6FuHcPFzDzI7JREh6+wosfZlKwaN3MM9hQ3o/oUsanENnwcqOWYCX2poraSCQKK//J3EGNwPyxWfr0+SaX+7A3tYktoVBWWHlmyd07XJPpmIgjL1WJUwynI5RMqozpuAvW165Gekm5prIOOt7WPwdJyTKjlqLSQhD087Il+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787604183; c=relaxed/relaxed;
	bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VR3iuKZjPFocqTylid+ire3ymAI4Xhhkg4ZD/Gy+NCvDJHsxC/feM4b6xIk/S1AtZiCZjn7sZZv93UWNbKW+m7OEevtKa5fMBce1Rzy40YPCqBX3obQWyBhJpr7rbufAIxglf/rBjXzXHTdxE7YCvv9JbFLFBy8qo1vyDOUGRiJgfQ/hSPvSQMr2gP6nUslFMuNJM592s2nJrG0vyjp5g2MeGlLLYhyJLarNNOE9kbpLYIjYYE9zmVInresBC9hqZ+OWwMNsODR9dVxp6HrHu8SpP4U7AroMWlW/fd5T1PYZE7wkHJU5107QUWQLD8itrAOwzGYX95FaOxGj2jlG/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hsyT8FbC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a62; helo=mail-vk1-xa62.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hsyT8FbC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::a62; helo=mail-vk1-xa62.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa62.google.com (mail-vk1-xa62.google.com [IPv6:2607:f8b0:4864:20::a62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTNCV1Lb0z2y2c
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 06:43:00 +1000 (AEST)
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso1468196e0c.0
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 13:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787604177; x=1788208977;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=riF+PjJB1ZYnIXGOPQB81i7NETJMH6JAxC6FRNUVFpm1YEI2sWTOuZilBiK/UdIAaM
         aZPj+HEeaSma/llnOmZ30b4qh2SHvbGTG1hd/e/BT2gybAndpPaTgR0P4yGe2yUlPuSs
         WtGmyqWW7wbTv/UA5+WOMCdGVkasxKnRQVMERr+nzofOKXfAIvnJnRZTtLjnVTLuzS9v
         XiBREy4MJv9fXtb69tvtC1wuG3uLnq/90r9XEBJ++gK4rZPZdn2FjbDYyeuaIACsnYsG
         ArckxgTVbZfsGykDfZH/Ld2Sv1e4rdUXLf5bo24VtGIvaxyIN9TM1/KC70VkCKQ41w2s
         OTfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmXxDUejtZYOdhF6y3t+Gb604dGOn/ZSt9IkrK+m03lvaDCE8ix35/Wmjl9JSCa2O/p7mOYsZs@lists.ozlabs.org
X-Gm-Message-State: AFuF++liDsPCb4EmqjiX8YY4FZdhxgSt3NCzweJCbWjiMAvgtfJRzVV+
	+t/7JHLWVGf30PGlD2GF1IMuBOqjZExdjDRNBHnSJQhDX9IlxOfofb3GxMW/g4o0USQGyu6ZwBe
	3LAG02YUbyu3c/diBpXHsM8lyUBpUieBNjXzCTV5HSHQGaHWsJDiw4oFFziX9zuWXlnuRF2hYAa
	PfC/JfXqyAgdItwx2DtJR4eZVzfJEDk3O8uZ9AVA5zwrLJLsS7aNE2MK43qNc4W5Gh6ylhQnfi6
	g0OGC2MQ1wX3YEd0pA=
X-Gm-Gg: AR+sD13NlOXinIADrqtzqRoGmQf+rQLo+EGqZCFjafjFhB23EoedldIZEVJXlsnOUEB
	l3ZC+kb/buNJrmT7L455S+bFGibg+t1fBqmOhwNT3+Z3EsDIHvs/BL7+JLGMkpdufQxy7x25jmr
	eNS4cwHVoZgoDYrMqEeFsZw3JKOw55T8HCawdIj/ZqIBR/NoWk7p9RFj7bmSXnA6iS44didJwaw
	aQPfgwtKnpeMnWZ59uWqqQa281lLD/ttHbMDK8jvV9erHd7nJR1odafwXxt0Y6YM6AHHs9W6gc0
	V11gO63cEH5m9bmv1OvWteCLKCAuaZgrYjRRFxqHtKWqOqfLz4wrZIzXfD8V0wVudYif3mA553x
	WW/THiftOFIrxkkwDuDB0e7iG6963T9ZOszSPhVLAGvsdQnbyITLqjmOSUO0MisU8R9At3YvRLd
	zdD39XE7c2I6O/3ya8m5ksGLft08GNNXJUCbdcpBuS
X-Received: by 2002:a05:6122:4b01:b0:5c1:2b9a:7cae with SMTP id 71dfb90a1353d-5c5ff821cecmr10562148e0c.6.1787604176969;
        Mon, 24 Aug 2026 13:42:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c6238a2f08sm1493079e0c.0.2026.08.24.13.42.56
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso5150679a12.0
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787604176; x=1788208976; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=hsyT8FbC04JerDhRAivv1IjI23XNjcM2ks3A8uA1ajfbBjqIUZKO/YiDgaiSAsvEzX
         agP9ATsOFs72O0fd3wYuq2RNFzwdJd2IP326JETrrzssQNrtJOHmdjHiBW4B7+MJRtar
         uGfaHCWyZqmXqG1jGet3rYGAungXp1Mglxt2o=
X-Forwarded-Encrypted: i=1; AHgh+RoWzZJfeRcSnoOpCeW7jswEu0YbC0kzGvxiHrPb5yuDdD3N39nrDtBljXXqev9teiMS5L3+/GWe@lists.ozlabs.org
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303166637.3.1787604175708;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303100637.3.1787604175256;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm26738210eec.4.2026.08.24.13.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:54 -0700 (PDT)
Message-ID: <e3f0202d-8bf6-49c7-a27a-7c6986772d37@broadcom.com>
Date: Mon, 24 Aug 2026 13:42:51 -0700
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/45] clk: bcm: iproc: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/21/26 01:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

