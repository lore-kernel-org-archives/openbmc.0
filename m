Return-Path: <openbmc+bounces-1426-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF041EB7ECF
	for <openbmc@archiver.kernel.org>; Wed,  4 Mar 2026 12:06:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQrxP6xY6z3c2R;
	Wed, 04 Mar 2026 23:06:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772625993;
	cv=none; b=NvU2AFya+SvCOpKeJi0O9UU9BWf9IR4L4fmPCp0FyB1tW4ocUd6wlfu524fkH6w9VeNqbtwhPonPDdwSOMXG0V5OMZ+2tZYeUWrHa8Op96cQqcol+uGEiqGZrOBvUkUzI4C2JZKXrU8utVD6uPYtU2r2wqTqj0WL/mADcw74cawajFfQYA3Aaj2mzk+0NeyikArYGss7yqgoss++beAjPFvozwYzWX1M71DFvOTppEuUJvM+TFs34i9NuW+2Le5x+tw/tnIgy8J5Hai90ZwthGymzEgc3qmm4IGzwbJFEZ6jxdOc10leFbD7hXFGwW5jH89h+lID36ZhSXNUmYi/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772625993; c=relaxed/relaxed;
	bh=2NaXXDV1tJIB0Dp9DIhsU+WPRj8uTu2ysRvhlaplcIo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S33/SFzAitsDLKwXkpJJIwmsRLfc28OwQrvOAJLG7kh2AO2VKAwTzwJwTyF5bFNqi4AyLn+pB1qVNzYtJWXHGMdvxldRzgDmgfvDeUb8wzGQ+aucqwla7gJVbScskJ8+xdwG6SBUY3QsJr5Lm6NXTpKW0RLXCBltgiXGHu4MyNc4dAgX9L7p94ZryJDB2ZbkKZNbOfykPS+xjQXJA9xLSFCjUAnX4vkNOiQH4BUcvpE1XJ/uomuD1v9eAEEGALm65gdLWSMXok7EkORd27UYf4wnfrbSKh6GCx4BpVcZ9PknuMTbk8C09A8s6sWqfTPmr7P3sqceH8Pp5jHIdIvl3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQrxP24Pbz2yY0
	for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2026 23:06:33 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhP-0007OA-Q0; Wed, 04 Mar 2026 12:47:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhO-003hsl-0p;
	Wed, 04 Mar 2026 12:47:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhP-000000009W6-2CCc;
	Wed, 04 Mar 2026 12:47:31 +0100
Message-ID: <ceb3f2715e85a922c8122229c843ca79219b4433.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] reset: intel: Use devm_register_restart_handler()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky
 Huang	 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian	 <qinjian@cqplus1.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 12:47:31 +0100
In-Reply-To: <20250813214138.477659-3-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
	 <20250813214138.477659-3-afd@ti.com>
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
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org

On Mi, 2025-08-13 at 16:41 -0500, Andrew Davis wrote:
> Function register_restart_handler() is deprecated. Using this new API
> removes our need to keep and manage a struct notifier_block and to
> later unregister the handler.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

