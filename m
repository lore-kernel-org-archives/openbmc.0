Return-Path: <openbmc+bounces-1427-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE97EEB7ECF
	for <openbmc@archiver.kernel.org>; Wed,  4 Mar 2026 12:07:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQrxT0P9Mz3c5f;
	Wed, 04 Mar 2026 23:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772625996;
	cv=none; b=MGgUZDnKpMwpfkumgx/ZJXg7Tk6jVWjB93YOmj405yEW0+zDV7rSuacNrPK3e8wtew1fIyanYTEE9RZI4rgHTk8o+L//q5uo4mMRTAmsaEuvv6fMq6v+TAZZGEgJ6Wjjjtds5FsiVD9wURvneS66EnHVeb4coS8pdYHemKKnGQQeqr7jXZXE5An9452za6dLtYjI9XgR7fHRjleZ21S5dLTvYJ4+C/svQ0Ao6svS34vGyGEv8ltnNcp+jdHMaDcjmPRJlPXA+PPTHTYj26OyASiaGY3b4TuBgkZadOQKl9jomyGDGoS6+T/pAOpSFx8nwPuXdaQ7xcZ9Snf3lnKwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772625996; c=relaxed/relaxed;
	bh=2NaXXDV1tJIB0Dp9DIhsU+WPRj8uTu2ysRvhlaplcIo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UestjzfjDt9tWgb7eCeu7jjFFakGffGzTtte9VFCLVP5cWQ0qRcnDtvdiYV5kuMWubTt4y6niCzvcps7aqa5dcGyArB+JuyuKRWdf3+etz4aeAewGycd1lXCH0kHq+TSZ6xwInDyN+3a2ZU+au/eaVcIoOyuLpriyEZiy9Ipk/qUvWx4vcuAujtiOHXpr11IWs4FvzHa2K59giSNC+x2lYa17fFp4484z5XUZeNdwW7X8R1A0RGJbMjD48Lb1nD5u3FeHKowIqV+eBDlUFRLUu9nmiI7oKjOIsgrJBKZflsIMhdDGKX6Q01OlXD/R3Ua0oMnzpfHeFz9LZoWq5Yavw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQrxS1bJ0z2yY0
	for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2026 23:06:36 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhj-0007XJ-Tx; Wed, 04 Mar 2026 12:47:51 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhi-003hsv-1D;
	Wed, 04 Mar 2026 12:47:51 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhj-000000009Yy-2gel;
	Wed, 04 Mar 2026 12:47:51 +0100
Message-ID: <3d214eef3d8d0816a296facbfe6ec997af6a5402.camel@pengutronix.de>
Subject: Re: [PATCH 4/6] reset: ma35d1: Use devm_register_sys_off_handler()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky
 Huang	 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian	 <qinjian@cqplus1.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 12:47:51 +0100
In-Reply-To: <20250813214138.477659-5-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
	 <20250813214138.477659-5-afd@ti.com>
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

