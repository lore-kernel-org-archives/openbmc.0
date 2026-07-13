Return-Path: <openbmc+bounces-2270-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54760C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 07:37:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0SgF1fmzz3080;
	Wed, 15 Jul 2026 17:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783929077;
	cv=none; b=aPAnLawmTLcssGcMTRqvdSM4mcpDmoNHhXI4ZILkgVKh+CRdgQP0lenmni/7xPM2/1IMYiB0ATzzzrfzyzCLhA9R5s8PoNVHreo7SQeW0SFXJTPFqh0dZPRtFRbAY/M9IsecDDICKuEI7yLj5h3ktbcYvUNsWI/z99rQQiuqef79jSOZ1YrTa51qh4p/viD22eX7prIXfj6rKcVZkjM4L5aZOAjvRsOADGGf2x9O9hFop393DBj2LQ8RQRKXo/qyc6rYZRhl2H/oBt+zfNNuJKT0dH9R+WK7ALTWmNPP4aHMcl/ScZlcN0VjcJ1f8UeqOo3RrUs8PEZIHvjF8lk9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783929077; c=relaxed/relaxed;
	bh=Oo4rIyniLa3IrOryYngEBRNx17hUDRIHRdfHv96/rA8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=CkVHG8n3HaIZgk4n1ExPPozKFpYEm1voJxeq74vL2c8IKa/o78ISVRDJ8KqWNy0R1leuXbVYnIOs36M2eYzKxig88uLDQgJUCZR1EoasWHVuwB7I21HPc0QwtVM9SSdCq3POpBgpqLYsmvTK+bnjKijK+x9iN7cYxgljx2DC3gDYy6LWgnGf/TYBBV7/PPup6IQfqSkh1rYu33/Zufctvk/c3noStUcRFuYn96SYoDbzp0W9tCzTHdKYV4PEtvkFi8CUPdpM6giZdPoeh7r1U9uMCL/Lgsy5lGznAkXxcOXpN+Dgjbx663uRM75vhlV1yFi5pA62S0VxH2RxsgUvJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rwZx25YC; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rwZx25YC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 530 seconds by postgrey-1.37 at boromir; Mon, 13 Jul 2026 17:51:14 AEST
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gzF4L4z9Rz2xMW
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2026 17:51:13 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4F294E40D82;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FB2460341;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C3BB11BD3A38;
	Mon, 13 Jul 2026 09:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783928536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oo4rIyniLa3IrOryYngEBRNx17hUDRIHRdfHv96/rA8=;
	b=rwZx25YCNBbEgGMtX75PvBzTlm1s61DtQzrE3ZeCtVUl+HzTfcVlC1R3kee22hR6JxcP4E
	S3NHkHLMPJkNknT6TwRDk8lYb4JH7a1Gdt1aeoUKgZdr8pu6BKAzBxidM8F5cVbGcq5+7k
	sBHcdsSB3CSzMIehKZC2UhNhCuFMt5mrMe38z8O//+6o7W0BYRgTBrB08dKDhhVO3FMlRs
	lvZiq1KqYKZPN1TYbDcDrG2ReR90cWcSpHcDMr1qND8rUhSB0k6qIbt55eV+gS0JZrfimE
	mMqD4zYxC3rJjeF0zrGAf5Pv8MhPZy8xWXc1dZwt2LxqIGaHiLW6uL3CLbRkXA==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 09:42:05 +0200
Message-Id: <DJX9VUXFJBJ1.3SPE0QKF0528B@bootlin.com>
Subject: Re: [PATCH 1/5] arm64: dts: freescale: Import optee node from
 u-boot device trees
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Wei Xu" <xuwei5@hisilicon.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Avi Fishman"
 <avifishman70@gmail.com>, "Tomer Maimon" <tmaimon77@gmail.com>, "Tali
 Perry" <tali.perry1@gmail.com>, "Patrick Venture" <venture@google.com>,
 "Nancy Yuen" <yuenn@google.com>, "Benjamin Fair" <benjaminfair@google.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <openbmc@lists.ozlabs.org>,
 "Tom Rini" <trini@konsulko.com>, "Peter Robinson" <pbrobinson@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Frank Li" <Frank.li@oss.nxp.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com> <20260710-mathieu-uboot-dts-import-v1-1-ffe0210e50c9@bootlin.com> <alFfeOFz2UA7hAbK@SMW015318>
In-Reply-To: <alFfeOFz2UA7hAbK@SMW015318>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 10, 2026 at 11:09 PM CEST, Frank Li wrote:
> On Fri, Jul 10, 2026 at 05:31:34PM +0200, Mathieu Dubois-Briand wrote:
>> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn=
 why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> U-Boot is importing kernel device trees for these platforms, but adding
>> a firmware node to enable communication with OP-TEE. Importing
>> changes here will allow to remove these additions in U-Boot.
>>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi                | 7 +++++++
>
> Please split soc dts change to new patch.
>
> Frank
>

Sure, I will split the changes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


