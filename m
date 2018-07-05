Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QzuXazmj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HO+fVo7u"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LkRH0vC6zDqHx
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 13:50:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 120E32104C
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 23:50:47 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 04 Jul 2018 23:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=UkfQrrrGwxnS5hEM9MnB+JDAzKJ69
 /olcIWYjLPLR8U=; b=QzuXazmjtfceJ9YdT14HPTLj0YPoLrGURoEpRCNujGZp6
 OMkzQHzEJHNk0mRHb698+/BS+RzUCgAvzrIZCoBLxlJzGxWpbBKWeho1G/jKTMe/
 FHtcsqnvtdcDgAJtqhPIuvfuTEnPVcnt3UdXCTUOIRtK22kTq8rE8Y/hWkQM92UK
 ZqqtOtKbc04gEpigez9xLRsPe2gvM2L41dfP7ut1KCW83oEvmU1ULMv4PRGsg4HC
 QnqBfB4eeJcOiiY5CQxRK8IO2/Bn3tywUptMK49RK+XLNNwnbF1XGbCq5qDgJdzT
 sPIGWCYGFMSQB+qiTKDCeglrEyHPew2HFxEUl+WAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UkfQrr
 rGwxnS5hEM9MnB+JDAzKJ69/olcIWYjLPLR8U=; b=HO+fVo7uWhyvNjPAgxSWpO
 DIpQ9QvALiVMyXw+Kg9N/Pn8uUiF/cZ+uoTL5KYfGIqZIZ55O7dbEiQeiDOFV5tv
 dabYoDQJgCsgH3mt/64Ft3AkfFa2mKfaDDNYYi0arvNRh2xlsuqXG1Btn6DEKKBO
 vnT2x9Zm/fwGF21qVw+VVuXCeM4ANeprfrLZ6TZZc1CeoAnpdvqIYl4IABwxCKVb
 m2Md0ELhIPhNsm2EgsUpVm2a6Z1wJKpTbDx4IcpdlARjvWmKYZXXqDERKqBp0Dfr
 R2vd3Juwzv9MJnt9Kibulx9VWWl4c2vKbspfYCLjbwtJRWsWl062cuhATPrkB1Dg
 ==
X-ME-Proxy: <xmx:lpU9W-ro3i6bq38sEfPqvIsDEi7CAvQ6AbeAgEdR3mSVeIWVKerydg>
 <xmx:lpU9W6JfVapY1ru-mA5BVinOpRXtIBiI_8AncpHP6vEU2KFmrFellQ>
 <xmx:lpU9W5gEii07QKS8pU-6oncR1DXewV2Tczs_Nr196OFMW7rSeMrLaA>
 <xmx:lpU9W1Cs9JZ7DggJh5gYMHZwVd5mF-DJF0Q0ZK0mxv_8MplV7LJfzA>
 <xmx:lpU9W1Z7KXCWyLnF8AUwN0u7695gK3Vs8y4Up14ZY7Zi67c3gczXkQ>
 <xmx:l5U9W1xRL-DOXkigv2mDbNLV7NV2UlVRCsBHM6T77ASQXlC-0o_S9g>
X-ME-Sender: <xms:lpU9Wxb-ii3bF-h28Bx-4mqjT8dxn1MGFHMjEgf08z8RqOnIw6A7pQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8CFFD9E2CC; Wed,  4 Jul 2018 23:50:46 -0400 (EDT)
Message-Id: <1530762646.2001249.1430352120.23574377@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Subject: Re: [PATCH linux dev-4.17] ARM: dts: aspeed: Enable VHUB on Romulus
References: <20180704070415.32032-1-joel@jms.id.au>
In-Reply-To: <20180704070415.32032-1-joel@jms.id.au>
Date: Thu, 05 Jul 2018 13:20:46 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 03:50:54 -0000

On Wed, 4 Jul 2018, at 16:34, Joel Stanley wrote:
> The Romulus USB bus is connected to the Power9's PCIe USB controller.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-romulus.dts
> index ffe0c991d985..852b552b7c26 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -299,3 +299,8 @@
>       status = "okay";
>       memory-region = <&gfx_memory>;
>  };
> +
> +&vhub {
> +	status = "okay";
> +};
> +
> -- 
> 2.17.1
> 
