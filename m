Return-Path: <SRS0=AK83=EI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE482C00A89
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2020 23:15:31 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA76F2225E
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2020 23:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0hNRf4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA76F2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ80J6mP0zDqQW
	for <openbmc@archiver.kernel.org>; Tue,  3 Nov 2020 10:15:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=e0hNRf4G; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ7yk0BSMzDqQV
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 10:14:05 +1100 (AEDT)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8950C2225E;
 Mon,  2 Nov 2020 23:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604358842;
 bh=JYSJsk17G/MkDcAF1hgrNHR3iMIcUkYlqTo410ke1SE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e0hNRf4Gy/3O1b/Lg5jPwAWiON9MUDBnK6zdlMK/beuHGOcdtc26eEhvFxfSF54nW
 LmuhX8vY7TmIf5kfAP2Qx9U9i7uFyWC12b53zm+0yI6r+o4wo5IwNPW9WX0CIV2jD1
 RmAuLcQaqrV+EF1mUxUfaCPWOK0TpILmqEfsdiFs=
Date: Mon, 2 Nov 2020 15:14:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v3 0/3] add ast2400/2500 phy-handle support
Message-ID: <20201102151401.71fbe7c4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201030133707.12099-1-i.mikhaylov@yadro.com>
References: <20201030133707.12099-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Po-Yu Chuang <ratbert@faraday-tech.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 30 Oct 2020 16:37:04 +0300 Ivan Mikhaylov wrote:
> This patch introduces ast2400/2500 phy-handle support with an embedded
> MDIO controller. At the current moment it is not possible to set options
> with this format on ast2400/2500:
> 
> mac {
> 	phy-handle = <&phy>;
> 	phy-mode = "rgmii";
> 
> 	mdio {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		phy: ethernet-phy@0 {
> 			compatible = "ethernet-phy-idxxxx.yyyy";
> 			reg = <0>;
> 		};
> 	};
> };
> 
> The patch fixes it and gets possible PHYs and register them with
> of_mdiobus_register.

Applied, thanks!
