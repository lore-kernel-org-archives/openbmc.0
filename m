Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9694CE8372
	for <openbmc@archiver.kernel.org>; Mon, 30 Sep 2024 16:48:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHRpZ2GKdz3cWw
	for <openbmc@archiver.kernel.org>; Tue,  1 Oct 2024 02:48:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727714897;
	cv=none; b=FoKs/Jyt+vi25bJco1e19k6X5YYL5t/mc7c1p/nd89Pcozp5QJ56Im4ZVS19sS80u4EciHcCCFaZloUuyWO4H9oCrQH0cvzVmRogj9KAg3MqTl3YqE8KImKjODg7dSHCoRz+EML9KVF0QbRcI1fFRyiQEA/Qao8iDD7pAm+K21E4kcadKg3DxLNVaNQpvYLQTq2ccKYzSkkSoZWUdE2jqRjpBvZYFQXDJi9OtqPzFC8SicPZ8tXehChoqeD+3tebAYgfyuTgFixO9t17uQHg7AKimTBLynlyta2WNnrXS2v5N5HY4eA4hhbjUvCy3fYacTtH9tjh0DMTsgPJtMrUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727714897; c=relaxed/relaxed;
	bh=x8hJSRUE9j8ghtTUefaImfZMPDPyjyyRg2HcWSGM8ME=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jn7cIrSIg09XXAV4CzXb09+NVAPFHRyOXLVVzF5OVQgZThyPW99AsHaNPxIQEnsvmXeFo7A6xgQWS7ItFUlvJn0/8qr6lpkLE9Gfp+JHixQuTUd6x4Tq2kc+l34QhF/1Lkq7ox0lL+dvpEh3dxuJdsDkZNduom0548fmu4ZBveIqCvFt2a0DQi8kO1EpTTES4vmwpx3n/uwRyGobscoy0JX78wbIxnVxgd1o30OBbSnmcxJ0yZmYXKl1W8eXP6NMQhLIE8Z0D7qU7Ge8tpK8Z1891kmftHXbhqaAQEZSEL3Vh7MXI1yso29axb4dHsd9TVpLYMGFwH6j5qJ+A8r+eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHRpS1DfCz300Y
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 02:48:14 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJZ1-0006Ut-93; Mon, 30 Sep 2024 18:47:59 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJYx-002fu7-CL; Mon, 30 Sep 2024 18:47:55 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJYx-000FHA-10;
	Mon, 30 Sep 2024 18:47:55 +0200
Message-ID: <e5e1c13576864c7baec9490af40e880f10934073.camel@pengutronix.de>
Subject: Re: [PATCH v1] reset: npcm: convert comma to semicolon
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yan Zhen <yanzhen@vivo.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com,  tali.perry1@gmail.com
Date: Mon, 30 Sep 2024 18:47:55 +0200
In-Reply-To: <20240909061258.2246292-1-yanzhen@vivo.com>
References: <20240909061258.2246292-1-yanzhen@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: opensource.kernel@vivo.com, benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mo, 2024-09-09 at 14:12 +0800, Yan Zhen wrote:
> Replace a comma between expression statements by a semicolon.
>=20
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Applied to reset/fixes, thanks!

[1/1] reset: npcm: convert comma to semicolon
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3De7b71bf181d0

regards
Philipp

