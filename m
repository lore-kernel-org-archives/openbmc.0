Return-Path: <openbmc+bounces-2500-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55277C61DBD
	for <openbmc@archiver.kernel.org>; Wed, 26 Aug 2026 00:16:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hV4tj6x4fz2yd7;
	Wed, 26 Aug 2026 10:15:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.180.131 arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787644853;
	cv=pass; b=Rz+xcYmgXJj0m+9afigJhgGOrTLi2GEa7q2k0YGPJ7gp8GVZJlpEsM1D/RTgxnUK9l13knmVpyWDE1K9uv+EZGIAViedLXg3neSZKPueO1KO3gh3M2HvzBLSYofEYoFevI5CYNVGqWEWq83lP8Sk+1OGgTuD+SYKLBakcpe8U41f1zzCZ21Y3KkR0NnbIpdJj+/abcgboqOooDNVjwt/zj6WDQpoei2ujM8+ona1dlNFA1qWOqnKiWUNYY7asekvQNSRZTxGvKnVYm5RimNw7P8TIbt1YOuDxx0EYx5W6Q6iQePNUnsnfOfO6v23hrkO6f3k6+Z5KIVHPR/XRDjLTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787644853; c=relaxed/relaxed;
	bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgPL42eA1LdjC8QyBk+3+CQHWC+gAikCRsuPMjozPRjXMdnzBEmWjAqtcGiRguw0pzhhXvjw4+tmcSflQUEJXaC/lyyOCugtglFkF8X+dvXmGeOvksc19MtuxrPIlczuSbljUL/g2oDjVIdq7HGMy0crO0mbZ5RVwG4pWvKQeWcVtVbJYv+0DRnj/vxhMAnU5FKbmElPC+ZpdSI9smYMCx6aLeXQqL3m83P32cy1AyijdccAr8SgS+PNGXPxTChIdUrp1Vd0CcAQ074XfY08j9v1y7QytNHYPp3zca7+J/uB8yNNBvVu+4C06u9IEUw7sGZA3hHGFhheUQ1iZ3+gOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW245yiu; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arbXaHWi; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ulf.hansson@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW245yiu;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arbXaHWi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ulf.hansson@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTgFb5DDHz2xGr
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 18:00:50 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3vrG11149211
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvrtg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 08:00:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so8813402a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 01:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644845; cv=none;
        d=google.com; s=arc-20260327;
        b=pWZLwKi6C80oLQGi7Zf90t4t+M/OxFa/7jIHZluZBwe33nilyXb1JUEj3xQI4hXcDd
         fS3qzadwjJblM6voQxdwdl37og5tTcDmQmbdOIFponR98ZwrkjBM5rVWLukLhdsdqlYD
         JxI2b/ViIgoYRtyc6KmfBwB7UUKKTHePSJGBM49P3HFIWTaGYycz1zuLvcR2bAjYuEp7
         TPY31ClLtZTbLZoZafk5yqoAsAntgxlET5AXJBvSYV91WNfaq6EsAcIb6D97jciPRmeA
         rumuN6LtqDMTBMH2fGCA0NObbMtHycyVfBhAoulSnXlZB25vcRPr1lhK2yn3u5zzqO/S
         5I6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=E+tZAS7IxURa+oUuBRU3vQrJLq8iQ6hVrnrrscljJys=;
        b=tDnYd7Tu4eH0nPzMysre1yM/jgCxubqrdL9fPpva7vwLCjf4DfBug4JSj1f/YkzBdc
         CiQLoDwtubhlwSgjWc4QCVuacFgf8r/Lgd/iwGnp2+mvtqep2/eBmIoeLfKyZO23xUci
         U1HIfjT/EF6gXYB5lThrf3tyj9lQFpth9YHHocAYWjovCEK/mC+6ianmHe/L0yUqJzhx
         CtBfC+WzLevV4Gl2A7UDqDMV1IHsaJuKvZiK/VZbUSQLcQHd2FVCG9rj5VJd1fWHNAR2
         PcYyxK+K6i85uwXy4gHUcHS6/Z4J/iS5ybgVOvZR+lDA/bvWy2lChpjP0kWU5e9G7zZ4
         44Hg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644845; x=1788249645; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=arbXaHWiYtzlPAvBzvdJsJdivfhaV405aBnU4NBOI6uEs9850kP8BGTFsvK/OFw43Y
         OG4Pt7vzVem03ylFxTOJyh/PmQORzWpALeQbTg+EVevgPOoxUEQp6isV0RaLckIZHEmd
         3tuZ0EDED7LLPs+VZi+RGhh1JRSuQDniK/475ZmcuRd9huqOGtD9wcbWU6BSryNmauYO
         6H0XtNB0PWH0rPFlipXBmVt41oECTtwl1vW6Xv6kAquW58CHQwDWwrJhStkuiA+VULKX
         gzP4l//l5b/9+tULPDXc0suZoSk1tyKG1nGNTTYbYN8pvkMBN/vbOhEq6thzpB+OlsQT
         yi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644845; x=1788249645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=CuRm1j7l8NwldruB2I8eR9mU3aXPChUYvGjrfOAkcOpEPzIkDIcpzzBQCqABkxXo1z
         AjingR4DJDeg+/gM14o99H6ynhRA6goZBW2M1133hdngl3R53AJOqQQpwKPqGs05hRGS
         7NbgZiIJxKJJdPIig36bTa86HHBEBw0v25Z6bXSYtpCeHdmFxtThxV2ZK3uEsXjl3uKc
         EzwN7a/vk68Tav2UWZwqeh3a87liR8h18OElib1Ee1melv+HaKj+D57qGv/5BL2k17aa
         K8zjV9CqKmAAvtn2AS+p6FY6K74ta+QE9GjbKI2S+473w5oFWEoYip0DHU8IO/s+295m
         48uQ==
X-Forwarded-Encrypted: i=1; AHgh+RolZnGSzYEo4Cog6GOJS1lFcHLgdGb7Gs+YrnSdt40pxKtTmfgRU8SSMUUT/smgFCrnnm2a3s3R@lists.ozlabs.org
X-Gm-Message-State: AFuF++n5CcVwm3Y1+rYU20B/v8QlLbJm9nXQo12Dwx7RX6vrW7mQa38x
	qxxheWCAEKgcQumcjHmZhARJBne8PPbFa98taj05y670hpkeTQcWcGP8KKWCran1Vayj06u1VIn
	j0UUAOeovegPBnph/cQhV8LpKZQURq9RkzXBg6BgHpKP//aKmJET2MfQC9vmbbNCOXfg1Mynxie
	NFf6SmbhSUxi64eD6BTsn1c2ymCrapOAzqeErc
X-Gm-Gg: AR+sD12UpV6QHVclf0+SwvVey44KpJJihMV7376VxhS2c5Y3GDvR+Co3YwoujB95SEz
	zRk6t7qiwk7M0RV0pbHYE+OKKiqJ49uzK+kruV9jRUNqE9z4AnxF0+n67l9zmf8qtFtPSbk0nFu
	Ps5ZzrHkKtIRdQS2+TU8xZZJCvqZok6k/67ZfOZ76FH7bBPIkwkEtBWvRDCw==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366327a91.4.1787644844878;
        Tue, 25 Aug 2026 01:00:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
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
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX04uq+PhhHiAj
 jihlCNcXZmU2fP9K6ziohMivZC8BxRD61vuiHHoO/GfFZ1vzmbHGpR2TCJ01Ansb+InDI14wj7s
 FNU/MIS0/t8kFh63X82FIg3YolZVWA4bKPTTw+dBr2fRQ5rTqK2ECoSEfI69fpKmNTz/Vmzk9sU
 KHAMFSRyy7hcIg4DDsEywR4shzEiOsLWsxNLZUoOhR+Zi9Td0SS+YgxVNool73M4mlufALbIVmo
 dZGRAjEmgYa9u4xFyRJTfKlqYDzr4kwYXNPeoL12krPqm0hVlQdGS6POqmFMWt/jDh6WBR7ZmXf
 FuxwWqJsATeNBrRJVUeiuxYSVav9gdPJWs0J+n79M1pTETvH9bpoHAmCRDYaaJ8z6DMx+Cy3boK
 MZ0pkf+KQSR0O8pG9mNGL+vK2iSzmDRDGeyIVyR2I1LY4N1GVEKeyHTxXL8MstpSJa/JYyG6wUD
 qeIrq6NGifZYxcIvICA==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfXzhf9a9YxsG3E
 XC61KGWppw+QsvltGGB0RkYEambbFdpM7vWCLEVpSqMhFbIEL1OF4YCJfO9Dkxcmxhh1Edo4vyO
 V9thSqzwuyV2B7zJtWO0iNcbi+XpyJo=
X-Proofpoint-ORIG-GUID: IDlgNxoLTMSpmRQ1NwRxAHX4scXK8EuC
X-Proofpoint-GUID: IDlgNxoLTMSpmRQ1NwRxAHX4scXK8EuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250067

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
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

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>

