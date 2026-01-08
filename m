Return-Path: <openbmc+bounces-1108-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CF3CF6A86
	for <openbmc@archiver.kernel.org>; Thu,  8 Jan 2026 09:28:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn01v3gNPz2yG7;
	Thu, 08 Jan 2026 20:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767864483;
	cv=none; b=gimhkL8zRqeaHwQGJzRMA+JpzMoY9TZHRSWe8E2ZAMHDd0ulUUTsCwd87On5OnO0h27ZFuwm5iG8AsOMiw4ETNOGI2MwRVtkb7pU+akwmSbYZcbzuN6jRRBhqTephOlnjxG8P6ybvFALilmAAc74hGZhlnk1nbOL0XBBqfPQj8cW1dRwpw/B6wJVq1HYIs7MIhDDAiqCKmAZkGMPuW9pt4Fiy2ffKG+Ac436NUQYsBdZ7HZmko2g8/dxNVIh/UA073SGgM6TpVvSvbmh8T6AhSl1synL1CO+eaQJ7hEMYI06iyt4zf5Uvn1UiITGXwzvO2qJDhZVNJrxZu3zm+4znw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767864483; c=relaxed/relaxed;
	bh=FE+L30L0H8RDFKh/Oav05wiWWScdi0XVlDCLg/MsHRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jD3ETOY0E08JvLiQcFChHVLEgL3HemO4aObQL9GoN/He+HHGiy5Lr7WdFR+9+4zKqA4B0ApJAaciIIdEVueyeT30bxzB5aRh8Sr/DMiDRXptr9vD9kwTrjDUBbPTA/cDR8vuHyB/aTnUWBAa5yrHtBM7FCBY/SRbIaHh1Q0yycLQsRBwpGlYYxLfeQeOV49zFNQRWS1KJlRczhic9mkAsm2AyBukipsNSBHvUQDh/3msOtMQYdC5iSu/nMxccfQTyAH/P5oXzXRJdtqc42rw7p6XnwQdex3z2gsAl/yZ8+WzWdonKf07Vy9XPSpK5u0altsUWHRFbLtktG55t31G+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eipOvj08; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eipOvj08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn01t5T7fz2xZK
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 20:28:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767864482;
	bh=FE+L30L0H8RDFKh/Oav05wiWWScdi0XVlDCLg/MsHRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eipOvj08YILeckF4Cwiu02vaCgzZWbtg5KyqKBzEPjH2QHn2Yw/flUCkTJaE1uaqp
	 TqK/tPUMjZxJ8YFmZP44Ru7unPdHf8d+k3PqbxcUkMqEMRPCQ8C0OZKSC+yfWOF2qz
	 ua835exe8Wzty5vScr9Jg6LsjERrFjvQVY1JqQXCxWQd2U67980dH1pxXXUKkYkYXq
	 ZHpWDJT2KVL9pDgSz+4sTEQDARiFt71iEqfUEue2pkYWzt+IY7NyH8BBjtEksGKj69
	 M79jpssoirFHM/AZTfzu45jj86zRRM+v4wRIp9uPF9jv9sAo21ridBIhYXkq6Vav2I
	 BZOZLEvQ0i87A==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AFB5F79F8C;
	Thu,  8 Jan 2026 17:28:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260105193232.3167128-1-robh@kernel.org>
References: <20260105193232.3167128-1-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add missing "device_type"
 property on memory node
Message-Id: <176786448160.1407469.7623777355686519631.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 19:58:01 +1030
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 05 Jan 2026 13:32:31 -0600, Rob Herring (Arm) wrote:
> "device_type" is required for memory nodes, but is missing on Nuvoton
> npcm845-evb.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


