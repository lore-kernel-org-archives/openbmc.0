Return-Path: <openbmc+bounces-2492-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED9C5DF9C
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 23:44:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTSDL52Vlz2yCv;
	Tue, 25 Aug 2026 09:44:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787584465;
	cv=none; b=d7NjlimyVYrINNgRFjTf4KW4x/GLIrYP3zr867D8htNAzlttZ9CYHyWeyM2A3kK1u4tS7KBGeH2aElUkDnYGl1hfbbn0duR4nlKTv5bhE5amMkOowhWpYj8oeZVQBE41EmKepeTkWHAbfYh/e/mFpm7fTqEfZVPgmmy/tsZx/sLzosAbINkvY3AammQW7dogiQCWUSR9YCdxs53mIvA/Fs+7fyr2gUR2Wun0N0cSm8lQjQwVobDTO9b9QM209uWEBhD1CwErams1ZtA/7CwWMNAGhjmcHHwrSnh2wlS7kOIsCf7uMZyFpriVZ1fcnKI3TvHhDG04ZdsnsTD14jjwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787584465; c=relaxed/relaxed;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FyA9fel+ScFRlV0QfgiqqZQhD6VLnr8E1UrGB/1CpTK38DEarq0rle2wrYBRqHzuU0gUAv5JF74R7VlR2JYpaOQnWcMPllx9+uDHkOligMIJgLickXY04MBJfQso3eKu2QZ99MY46PDl6XkLQX1rFTY/GTF1GderMEwtq6t9h8Re6IUufZwgbfDFWZvT3KfAKAdXgQhsoWuN1CDxZdITHbkDrCJ5flolb6gYqAk+IsKCH6/wS9fwHW6cOpNrboz1/jxDRJnNIO6mZd5GEreJIqphPbVk/9a/y7b5kabDu/UEIjb6l+VPY3uz4E/gq8H6ZsMA94cLJ4HIXuxyn5O5aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQ1ywwYh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQ1ywwYh; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQ1ywwYh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQ1ywwYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTDwJ5ccKz2xpv
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 01:14:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-OkWBvBlqPlW2313N6hj6gw-1; Mon, 24 Aug 2026 11:14:18 -0400
X-MC-Unique: OkWBvBlqPlW2313N6hj6gw-1
X-Mimecast-MFC-AGG-ID: OkWBvBlqPlW2313N6hj6gw_1787584458
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so386705885a.2
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 08:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584458; x=1788189258;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=gqKR1ySsBDEwpb8zt4zyHpKPBEb62HqnSYZMpk0mqstiHRSTvPiF8zKkp93wCj0U/k
         Fl32P3HWkSr0AL2ubUYj0qzbRXMoSROVXR6vg165RhoNjBUjgTvD3IXcSnAus8VXSxx6
         G4OJ8ZFapLvQvYa5GmFayPjoOHLe5SdSBByBtKxHX+Yrp0MutBJjTy50htlMaOATz/M5
         mylQcK9enOdbHKr97pXdcrlehNMQW4APoXXQGXiRWypLqEWcpCPGoUj9blgzpuLKEC6J
         EHE79TYFaOgZiEg8/v+ugVqjxpMZN4wTufwMWuwwMnfUvKd4xuBBLIx/3dyYVy38q7No
         bpRg==
X-Forwarded-Encrypted: i=1; AHgh+RrM3hCd4PpjrysDZX+RX3ZPKpNJQhwY0eaVPiahK0mZOGSKvJyoTxkOzH4mtrMHkpSt2uuTJP1P@lists.ozlabs.org
X-Gm-Message-State: AFuF++knkgYn6o5IaPgHphFxJ303qpibHk8JVGMwse+9NvCTi/+VIcpx
	gwN7UOP6HPPyjpi/vXB0kTYtXw0mRBBaWsMY8+bEo6JsQBFx3yJxU9IgRlHC7hYD8Aq14dvb1Wl
	rKBy16ArrY116tZn8MZ/AOJLomyNIaZLKXqJEe5LETST/awk+VVgdFEIuDE5h
X-Gm-Gg: AR+sD10KkssWk04SQroZXd9VZ37yqbrMIxZPApJkNRTENBKF5iy94lW+/vgii9eO78X
	P6NNKhfy0keN54xGTgZWMjDbwQvywJKIZ/Ualk7rVhXoThyyRIoS+H4i3JK49V/QtjUThB6OLUC
	ZZF+Bh0LBkO0QkeK2vAY7bThjftmIk/EWl738WimGaTxgminAgo7u0t1EDgfbaJLILnpYlWWuqb
	+y/f09StpK+O6W4TK2+g9v03kLoMyXotUEBGxfqFtmC0iWCj7OWBVhZWI3fx27t+GU93LWqYZZu
	Tcy51UertKSorGSrPGGxEtuVebSl+7wDw1C2BculT/XuOtwnFXed95UT/8FHmreFTILXTd8QyiS
	YHDEWTp3yXLRTuWp4rZGnG+7Plogo9PWnblI=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260846666d6.4.1787584457493;
        Mon, 24 Aug 2026 08:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260845166d6.4.1787584456812;
        Mon, 24 Aug 2026 08:14:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a82554sm64013126d6.45.2026.08.24.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:14:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:14:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
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
Message-ID: <aoxfwycOmEzLzhEU@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
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
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2-MJ-HEyk9tnvDGBKSRhXTkeetuNkOCuqsjaWHXBNwg_1787584458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Thanks for cleaning this all up! For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


