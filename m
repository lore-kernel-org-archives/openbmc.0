Return-Path: <openbmc+bounces-2499-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF831C61DBD
	for <openbmc@archiver.kernel.org>; Wed, 26 Aug 2026 00:01:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hV4YP41mnz2yYf;
	Wed, 26 Aug 2026 10:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787670725;
	cv=none; b=Skqg3sTh0USuZBGyX5prohxpvliKkYCjC6Mvs+I2irmdhTAiAFv1g71mJjbe2dvOcaGLQjxmuoK/Vo60S+NdUCgxYsPsA2lmRDItiTjuLIukENs7pfjcfxCUkZNFxRhlPIWNTEPZ2sq1G8ggZaiESlbEG85F09lV7iQMARk/9k27JUG8G/N6Or3Qiu24fNdjmMJvUHeTVVbo48GljEpVokJGMsWCpQIBuNedAYgIarLxK3gf/e4txOxG7c6udKCosTZlyytCwXX+msmocDdWzXfQNTQcG4MhJmNP9wS964UpzbMta+f0KVOwxXVJ5daDTwukx1btS3PZ6fNNaSRtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787670725; c=relaxed/relaxed;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lsean25q+p0Vov9PbmDVtgDFkyhtS7+z8e6pMbj/cXBr2Di5QKi+EuuyG2jTdIv1eXEghcncwS+/v98R8rs/YAgyvwk2LUlpFCWjRYUaj5EVrWOurArb0VGXjPVQfI6MzK8P8yYqRhUMm0R/hqS8JjpUCXvm7d4DZTQI/PphbAzV3DEBTbWVOeoTqno8Lt8mETuVsVCVJRx0Jn5FzzmEUe8IRGE8EHGAPQg8LMIUcppd/my/wY1Qpn3hU+QCddO5BK0pXG3H361hXLozDwoKUM/agmlYVleqwMrFAs4gziG45j5pDQ+WXTXBGoygAheVyue4GvyFyl5ceHb5im8Yew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cmNwOCPW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7kHfZG9; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cmNwOCPW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7kHfZG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTrq71gKnz2xVq
	for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2026 01:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	b=cmNwOCPW0pCLo1vgxbiI8024BSzxbFhi3JiPy5Bv8SJO4i3CWLe8pnJoGKFUOrad+B/b/+
	ss0febDjN34CvxqR7kDJPsYhRohx65REzsx6IYHVayw4b9b70DhLTuDcUesPRiEXiPUqHm
	uTFVlFozsf2xG5Uyv+HbX3OiX5QSvDo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
	b=a7kHfZG9CHSuEt5tU7D9/dNs6DcMpO2X9NODfhn20GrkNRZ7deIRFrVxnVkOocfmI36qam
	wKeewJjoObefUMPIXWktYYZUBAoVQuP+In0BsT5wRhgtYhLdNNQiES3aJ+Am7ICp1nD+Ic
	HE6roksquYLhwANIxq6T3KBH5jyF+ak=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-217-pCl4PWKG65wSKV1W7Q-1; Tue, 25 Aug 2026 11:11:53 -0400
X-MC-Unique: 217-pCl4PWKG65wSKV1W7Q-1
X-Mimecast-MFC-AGG-ID: 217-pCl4PWKG65wSKV1W7Q_1787670713
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d33c89a29so66867301cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670712; x=1788275512;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2TAxOwHRDlM6cSmZF0xTyxxMoyKXBFa/St1ecjf+fY=;
        b=tYCiL5qe3JfPyASpn1mDj03dvV165j8E2ioj49J913dsopu7MjZRlrQM80RXc5Rc9g
         FzMqkj/4SkEHNGLHQ69q/ZyhDDk8MGAOzA81WgmEGsCjZSexA1xA1nuwT1frMdy8jMI8
         6uXZU2ZWLDz9vOuOt0i1y3L4Oraa795HscQuGIcb7vMbhxOSx2lObrhjPo7gGqNFbirF
         EfbQDM4rRJGBkZJa3ifhbLqWErZ0XhRPNXg3ysXWEV8XFov3kmWMHUIMz5JyA38+/N30
         /UME+xAGABg1pdaC4xl5cleYwWpD9U4fc2v8oql4dKaFL5DTsy0UgHtp1M2s6cW8TMmP
         d9+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrfncIJxBYGC2eLb7hd+Sw6QhFuo2GHS4cagqcBNN7QxZ76ssGfL5NIGkFDyU5wXZPY2A5q94uK@lists.ozlabs.org
X-Gm-Message-State: AFuF++m6oyh1EtIF8jMRwzvJbUIv4txFpZLKtMmV1hXLVtXm/YTHzwhS
	GTYS0eOZqYA5MGPMwvUt+gQfaZJOtVWiigEGHdm4WkZx58+cJk4clCPoO71y0smIP/9K88IWFQt
	vUCb+Zz/DJAfNimJ64zB1p7Yyc7hq5KsrB4bgL4ZRr7jY1YBRbe8m6xMeOO9/
X-Gm-Gg: AR+sD11E3NPaCKnYLHp8btIzZvgwfLkzPf9WMGF4XbcUUP/do1nOwCxgWBN27zicxBt
	yfUT+d2KCBcJ+JOdt7A2rKpUPf0Q8r0nysaPSmaxp/+zP/RFz+Zi6tqaHFO+Uh8gtGKQfN6Ur81
	x4tS4Q72MC11eLwq440U8NGNm/9D/GVWOtnSKSAllhpNVLYyhSIzpQffQ8fK+1MIcjo9nftNe8h
	1rQSoBuXlMmMSP3tNC5MV3/sC7/qtg65hEA9oxJy1qtXeRx02bpumEJNCf8p3uOLs788xqVk6X9
	w6hdl3X1yDf5NFNKCm6HSbVeKjUlQHbZuXRBxI+nMZtBjban781KlHonKaliQAZC31pK3Yyitdv
	E4uVSJzA88JaBR2SNOL0oNJutNIfaLoDVgf8=
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343136041cf.32.1787670712366;
        Tue, 25 Aug 2026 08:11:52 -0700 (PDT)
X-Received: by 2002:ac8:7d13:0:b0:52d:3d46:bfd0 with SMTP id d75a77b69052e-52df5a4a41emr343134781cf.32.1787670711664;
        Tue, 25 Aug 2026 08:11:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm71209161cf.15.2026.08.25.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:11:50 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:11:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <ao2ws3ZA-o8ZVjTh@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <3074509.irdbgypaU6@diego>
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
In-Reply-To: <3074509.irdbgypaU6@diego>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vdadwx_zzP5jBPWuM3G2uXnT_ddExuQ79CB7Gn4-cKg_1787670713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Heiko,

On Mon, Aug 24, 2026 at 11:11:32PM +0200, Heiko Stübner wrote:
> Am Freitag, 21. August 2026, 10:53:10 Mitteleuropäische Sommerzeit schrieb Geert Uytterhoeven:
> > 	Hi all,
> > 
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> > 
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> > 
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> > 
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.
> > 
> > Thanks for your comments!
> 
> I guess more a handling question, how do you expect this series to be
> applied?
> 
> I.e. each clk-arch-maintainer, or in one big thing by the core clock
> maintainers? Just wondering if I should pick the Rockchip patch
> or just let the whole series get applied by the clock maintainers.

Before you pick up anything, let's see if Stephen picks up this series
the next few days before he sends his pull to Linus.

Next development cycle, Jerome Brunet and I will be clk co-maintainers
[1] and will start collecting patches then. If Stephen doesn't pick up
this whole series this week, then pick up the patch(es) relevant for
your tree and send Jerome and I pull as usual. That's just in case
there's other patches that come in during the next development cycle to
these files and to avoid merge conflicts. I don't have a strong opinion
about this though, and could be convinced to take the whole series for
simplicity.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=8bc7ceadce1f362a8b0e88075ef3d926b286c01c

Brian


