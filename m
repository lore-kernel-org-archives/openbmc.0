Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9482606A31C
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2026 04:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMg2XDQR
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jTBHl6KhNz2y8p;
	Tue, 17 Nov 2026 15:16:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::563"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794870794;
	cv=none; b=a0ju5vR854cav48k5vkXZVmYJn+yLj8DdXolfLbEWbuhqwcgPT5p0geYmdnMoRpVnLb20/XGyM9bPLPaUW5cySE9eZmf2a/pHPwBUqYWAtouhxmWb9ZusW1zfo+07qMYco0PMfUv5OGf8TBzioIJOtufpmh3dyqPWswo323cC5Cx61fBKst/35fwJrssPOpXZarPyWAuE3bJ5EQdBdQxv7Pq+xSmXEYR/dVlbn3Y7T8+QdqksWY/r2zC3xXH6F55bYWsu1+kR+4HWjecC4kpo9vlIbrbr5BVyfaCltfuv2moXr9kn10hvZBvpL044OZWPUlQjWNYrAZGcrEMU5J/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794870794; c=relaxed/relaxed;
	bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1TmiWAubkqZMiksrOiFKcbzVR4bWd49suO/ZLFZt/JI5YbbU4XGf2USQWLe6bKOnOjSTUfstKOzMa8mto8btkTsI5nkhBWxHiHD5spRgv8wCgWuvU5VXKCGJ5VrTAEbxuwr5JP5AiB9o/Xrm0wADhhYgk9DDEonhgIwxt777MxJ1ZqyBSGUMpfsXq1yXLRDCQUzO/yqMe9KXUY9EpxkV7HVoRTU90Tgl57K7I8IIgHAdaCsH6LMj6FXeeFCdVmfyz/LiekLBJHMpS3IM6xQhEdiP8KX2FbUXURjPdfevd8EqCwDBQJPr07RljQr51T83D7dF8Nf1c3YjDsWSHRtJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMg2XDQR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMg2XDQR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com [IPv6:2607:f8b0:4864:20::563])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jT3Z02kLJz2xqL
	for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 10:13:11 +1100 (AEDT)
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3136229a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2026 15:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870788; x=1795475588;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=s2q/gYRZdZ6mUMZXyRkyhnLn3jsW5YWqz9cJDFjSi32Bzq26Uk65RGhAf+Q6kQurn4
         8Mr22X3deP+NfhmV4mbTpmQTHL8WKsAsogD0Z3zbwqbanQFjqalEhWeDE8A+etT+JMoM
         vSuuhiSlwQCOmyapHb/k6zUeme8ufc9WJxJpew+U5h70wmygJeIWlQh+4hODafO/ZdQQ
         +ALL0Fn3j8H/WZ6BCwnTsS2xlncnIHi6gBX5rzTaREk3m6TSVWrIbvZR+SqE9pVZ8ZTu
         Brgvwx6ZsoQNAIDCkfJ38YGHCcdrRkciVOehUnAmQupu5OEUosHwY6hd2V10WVsY6Eav
         c9MA==
X-Forwarded-Encrypted: i=1; AL+hErG7oet2joOvuxZfuk40nmSDDeg3d533miipBprBywasVIMZHV3d9BvQjn0Cu1djPv/JU4JeBZfj@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/aZ9iVEuJsUyPKg6GDf1P0wFALZBS+EDy1R/tLZoEk7N3kAx4H
	hQna47Ovhfy+0HA5U8YWRzL9LNp1yHCFivTnTosYVQM6fsr3HfAYyj5QohUrzZ7J2gOwryzfXua
	Nr7AgRqQI5xdiDI40QojloT/+Q63U/xI4Hpwih47x4f7xI7ulpcPtgLmFhK+PWBEjBf3wJNjyq4
	zFu3wb51tjQXm5W4MvKzu8bAv0/8R05L3uOk9PJ7sUbIkI9p+DYXcdPHGBE5NlZkpjFdtruqE+R
	+vIZch3A+++Ppdzf3s=
X-Gm-Gg: AZFdTZfleYWGW8oNDz8Va8QgMIGOKoDhhFagtT4KL0ThfuH0NxXt/6kKhfL2a/T4j2r
	gEY32g5V8Qz1F/aQPxHwKQA/zc4OQ1KtCy+RW6bi5l2i7IrvuXy2CNVFLpnSd2KSuXEYdzFS6zB
	Xt59aemMQZMyedvrUeP99503hgw7y9kvvkaCk1DBX7R7UfL1tAtyyRgNDgVGHnUxig/skynBUf9
	cJ63Q7i5DmDP9Gf8HYgkIHTtL5ZzWppF0DHSmYlNigGtLRBhLLJa3RSs9ccHNDsSYIbWrznEmZY
	Y2VKgP6UpAN3a4H2Oxm1RWobjYRdVFHwpu9eJnYFhgmDB8RG09Cd5/BV6l5MY9LXb+hTqQ14Z3l
	shLqjJ9F+0QYU68wpDGJzPbmIcrQxk8019Z3/Glp1m+pHQ1rnKExaEj7r2xPHLL492K12tftMGX
	gFBP9b4MQY+Lm0Hzbb338dI/JBMWusZrdLhfOgMej6
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b1b0d3420fmr13619992a91.55.1794870788444;
        Mon, 16 Nov 2026 15:13:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe1c098sm569588a91.5.2026.11.16.15.13.07
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ebb902eebso33214576d6.3
        for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2026 15:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870787; x=1795475587; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=HMg2XDQRBh1xrlukTnuk+yXjno5crSBivSYoWsiJtU78L9bbR8TyEFr+T75Wqgr2cY
         KBYJ54bMxIW2Ku+XaYe01S92rqAyBfNUW/lrcxmABW+sRLYZklSBfBADLrAzkCRhByzf
         gHR1wrEEPPCjVvMIyUkQPn+PzfO27mVddnglU=
X-Forwarded-Encrypted: i=1; AL+hErGpHhffZsYXdYU8+J05X/FBqjtQd/mIQPhpXA57IXw/sPM5eTw1fIIwGJEUjdZl8+bzYyPCJkLs@lists.ozlabs.org
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2038196d6.27.1794870786556;
        Mon, 16 Nov 2026 15:13:06 -0800 (PST)
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2037266d6.27.1794870785971;
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm96715216d6.28.2026.11.16.15.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Message-ID: <2ad1cc65-0381-478c-959e-9bee1a597110@broadcom.com>
Date: Mon, 16 Nov 2026 15:12:57 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
To: Peng Fan <peng.fan@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Tan Siewert <tan.siewert@9elements.com>, Eddie James
 <eajames@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Caleb James DeLisle <cjd@cjdns.fr>,
 Marc Zyngier <maz@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Qin Jian <qinjian@cqplus1.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Tushar Nimkar <tushar.nimkar@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
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
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/14/26 07:06, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> With [1] now merged in irq/drivers, convert the chained IRQ handlers in
> drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
> chained_irq_exit() calls and the gotos that only existed to reach them,
> reducing boilerplate.
> 
> I use a script to do the job, and after that, do mannual checking.
> 
> No functional changes.
> 
> [1] https://lore.kernel.org/all/179417458323.2093942.14330197609841896598.tip-bot2@tip-bot2/#t
> ---

>   drivers/irqchip/irq-bcm2836.c              | 4 +---
>   drivers/irqchip/irq-bcm6345-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7038-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7120-l2.c           | 4 +---
>   drivers/irqchip/irq-brcmstb-l2.c           | 4 +---

For those drivers above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

