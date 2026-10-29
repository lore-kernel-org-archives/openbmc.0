Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F140606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FzU0WxJN
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG0Jr24pkz3048;
	Fri, 30 Oct 2026 10:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793315307;
	cv=none; b=ISupBBuIT6FEuXtmQ2lVHCTKExfdfeHNOmPK8I93niHQSQz0J5yEKwlrlQcjDDEkJZSyypGlarIs6tYNZnzr3wDnNlzuPUYd7OPdq9BgC/Ok0rjOaQ0vtYYCgqlgBERBQN9h44kJKwCoL8XC4UHRdbvU0NlNypGVLMO/1k6T26HaTsuq9UPA5DTZ1UD2WFxBmsj+9QFmqg/XTsHBXd0gv4/QO1/LIHfRBS1F1rEKan+XLHau1Ebt4xNs+7zA3jkds+szNyxsB9khXOjSGmUZU9EzPPRIeLVAOwmqNKH53Uxe1sl9jU7yC7yL/vqhFRg8FhFi27PUSYP/+DukUc2TXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793315307; c=relaxed/relaxed;
	bh=eqc29U5/HOjLKM13Rve2Bn5kLnqioH7fF+FsLmWpeXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o30oSVo1wyAgCqfeZK9f3guFPceeDOonEKRoxZV5SeaHALTu9fQXaJwf07g4S7NTqwObpHIGkT+sYKuH+J8ed25AQgiVOYpm6aGt4ylZ06R4+q8t/doZCMVnAoJS39RCVwsers4wBMRctp+nCyYrmGh16tKD2aoNME2bG1lQMu+zs5QwvSIcMv3P/bFgpv6n1oY8L28nBcL28y+IN7GFm4PFw9l5FisS3wLdKo/+cZv77fx2b6tEZtM+FZVK9mCQs7T0JWQzXOTFfnnbQHDvxxRqCy/KKr+buHAQZpwRuI+dAhzT2z6QgD5t/t8jasNkHsJp0NkDfle4GGWWN/Faug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FzU0WxJN; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FzU0WxJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG0Jn5qxqz2y2R
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793315303;
	bh=eqc29U5/HOjLKM13Rve2Bn5kLnqioH7fF+FsLmWpeXo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FzU0WxJNiG1g967MlG7dCGGRgbxx7vcyZ4ShwhLP5PjutR+iNWTcme5sHwofDllC7
	 3D2u2+CdzLLi1d5eeOv8tJih8nI0Iz2HdwlJfGEQSWjgTuN3LWL9tSckBstsofQnja
	 R9/Rp2q8gadPhuHbdvt3cRBnTsOEUvFVFeCPWZezWMYTZAswjy6oQvwKxpCCOceDqJ
	 hE2Zlr59QCRlI0C8/8Q8QBMgZV10S+LAKmyL4ZLQtlEonuazXR9gucXiAUymSk9tDU
	 9I3sp2Q7149R8XvgJqYZI3lxg7mWDsHCbbkudozn1YVtcuj6bWk7NXEctCMpMZYQv7
	 z5CpXYa+y+ODA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1E8276F74D;
	Fri, 30 Oct 2026 07:08:21 +0800 (AWST)
Message-ID: <5d65e31e642d19d774981747d1a27cf30f6b1472.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/3] pinctrl: aspeed: backport AST2700
 SoC0 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Fri, 30 Oct 2026 09:38:21 +1030
In-Reply-To: <20261029031552.515601-1-vince_chang@aspeedtech.com>
References: <20261029031552.515601-1-vince_chang@aspeedtech.com>
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
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 11:15 +0800, Vince Chang wrote:
> Backport three upstream Linux ASPEED pinctrl and SCU binding commits
> to OpenBMC dev-6.18 to provide AST2700 SoC0 pin controller support.


Applied, thanks.

Andrew

