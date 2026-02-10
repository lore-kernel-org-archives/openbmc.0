Return-Path: <openbmc+bounces-1342-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071CE94625
	for <openbmc@archiver.kernel.org>; Tue, 10 Feb 2026 01:30:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f93sj73x5z309C;
	Tue, 10 Feb 2026 12:30:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770687033;
	cv=none; b=ZwxM0ipex3Ekvf3sh1YARMFdfLCE+Vx5zbi8JSXCOSFBDOXais0n2Q1AkCMZG0FBo5iAQVCbg78hnmqdsCSO30rMjYCXXF3luMS5Qq6y56PMDN8jwbsBGkdoDmKC3QZixecopaQWToPmO2L0qoxfaE/LJrQZCQwq6jsIXZ0o4/K7dssW4962xqcQEv712rJRYeCsxlCAz6CumC4nnFZD9TSBPOQo3KhZlUPpvZAwh/8/2citF7JOjpSepGEJ+FlLT5BNj0vrKUzkUwT7dIVQgRsIa+I7OZWURXh9nioHOD8mEPDDQk2JdFuLLGd95QKGME76p8nmWnB1R9AJnCjKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770687033; c=relaxed/relaxed;
	bh=Tdo0p9iBsMfTh7ALH7mex/M3S8aQYGr61IWEE+eNsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDBiAgDMtJc9lBppiaUgCJ7YAisSoZ3jPdIcNINGqA8qbF+kLYL28OnhGJPjECi9LJsCVBvO4/BDwflxmaFyYVXYXfxEWuQNxxLVtOWOscQDOP3pGcpGp/3g9FSIjkdGEpAWolBY8Xck6K4ddC+oqurcAkniaX112uxbpgv1N1x9L3sErdlSV6u6caSi47FoJZtVBzjgYdlRED/eM0841oJksXb1tdyBHeqYLv7DTNC75KNDRklKLeYB1YyOfrLDUEXXK4MHMS4+y3UWTReI2NQ3Pe+3dyELTelPyfsMApoq22ka7DQVic7iUflylZY2Fw+j8yGv0/C/8/RhPg5kOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b17xXxT1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b17xXxT1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f93sj0wTHz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 12:30:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6119160137;
	Tue, 10 Feb 2026 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB022C116C6;
	Tue, 10 Feb 2026 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770687030;
	bh=Uo2Pfl6hyhMXQD3RE7rk1AAawAsayGOyRKqwMxrRElI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b17xXxT1qROJYRtlyi8CwFU78ehZFBEo28RsXAmTsu9gdxHALE9ZCjcX9ZE0RYhFW
	 F2vCeOHxWJc6XJcNQeBH4PcKnMc9/Og8gyYkTWb9rBTmo9CXytP7fQJwXnJTaXcOAp
	 vnwtVvqj5+R3U1YQ/4A9Ti9tHqIQI0wYkeAnCsGLNCTMEa449PT6MXaWdh1/HrXdeA
	 43wR/K90+CWDebSF03rDGdsltgK6Xgr5h6ElWRKdbB+g72Sr4yyLzayUxsmI9Q+dIk
	 DEGSMqafLv2cBjLTmNsIEn6VXcKm7ksdd7NKxBK1WQx99QaRerEZRiDsoPOhNKKA2x
	 8iFXDu70A/7vw==
Date: Mon, 9 Feb 2026 19:30:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: openbmc@lists.ozlabs.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
Message-ID: <177068702757.2279882.2179431241227360532.robh@kernel.org>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
 <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>


On Fri, 06 Feb 2026 16:22:08 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC host controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


