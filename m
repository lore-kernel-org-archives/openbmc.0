Return-Path: <SRS0=EFpz=I6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAD_ENC_HEADER,BAYES_00,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE58C433ED
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 04:05:42 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F3261057
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 04:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F3261057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9qNN4dXDz3bc2
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 15:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IrQSKxYQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=flu+nAeG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=IrQSKxYQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=flu+nAeG; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9qMp6Wv0z302H;
 Thu,  1 Apr 2021 15:05:10 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13799580857;
 Thu,  1 Apr 2021 00:05:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 00:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=bM72u7Zut+UqToL176LTPYUWVZDWGgs
 ivmdUNPFKxMU=; b=IrQSKxYQzpv/1jouAp11qxZyIIHeQnXCrcT9S70hS3YFos+
 qX1yamOzq5tRUNluxnpDJJaC4BQsGg0fqnKCBN6Uko4thO9s1rf09dj5P72ybqqY
 T7uJ78Xj/NZvZYnhLXyqUNt7D5uHuG9Yi13uTVI67dfVjwYMUl3ST0wiOUW/zWKs
 yZaA0YYviLCftcX2ZdE1XVPXd4orzokOzolQr6l5Dz8+1T/aQYr4zsYD9LTrFzGZ
 0CH9gBy8eUs87ymtI8RVq7Cwx+bIkj5gGmRczRj6RBg/PHbdAjLJOSswY1bgQKfu
 nLkGdJ5pHimIBU0Fp6k28lBc/sNw9bueam+qvJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bM72u7
 Zut+UqToL176LTPYUWVZDWGgsivmdUNPFKxMU=; b=flu+nAeG56GJ4xCUCWHFAk
 lpu8FXQMkirsiz9hQpRBsMLmpy2uil4XUE30IFWyKX4eG4RZsJoCmoAeiVpo7qmF
 HXaBKvJq2pgVwljWOyLY2bNru499SaaWUx0bV5GHbSYkf/0RK5pa5sW/MMLHZzGj
 I2BQqGF5Xx3Scxz8izYko3o5EWPtPvcOB7wUj8eibny07vGzxqZTFvQJYWhvOWtX
 cZMz9P0u0WZLDiXMtmudcra28kPmPw+ki6woB2lDdFzgCq1N/e5SDXl99XfcNIYd
 xl2FHT7769A8YVD/RQYnkRLNgTbXcMjrCDiyHhUJNLDixSzQJfVe8ZYWO4bRErow
 ==
X-ME-Sender: <xms:cUZlYJAFHOqSxDwnmsOA0a8s57EnBEMLKb1zkJMbKkSZMQ5RvonblA>
 <xme:cUZlYHjaoyP0oCg4CpUtoO0fiT1il4DSkP3YNPxDCK9Ew_V06DZCCHso2q281nWAI
 4UzQozQOep4j_956w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cUZlYEktDNHkVnociacTZn9o_1v1vGrEK6B-J_7z9MLkinn_-CpWhQ>
 <xmx:cUZlYDxKDkUu4S9fKlrpI2gRku7K6cE5wNap_DlMnEsc657fexkrTg>
 <xmx:cUZlYORHW_GgcOHywhUXRNVEczxo1Kj6Xqgkz1MBRmpvURTiy9mlCg>
 <xmx:c0ZlYBH6NEkHP1Z7OxOJv0bSfsi-IUy7ymsHeOje4V9oSQxSlcD2Kw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0A181A00073; Thu,  1 Apr 2021 00:05:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com>
In-Reply-To: <20210401005702.28271-4-zev@bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-4-zev@bewilderbeest.net>
Date: Thu, 01 Apr 2021 14:34:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_3/3]_dt-bindings:_serial:_8250:_add_aspeed,
 sirq-?= =?UTF-8?Q?active-high?=
Content-Type: text/plain
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Thu, 1 Apr 2021, at 11:27, Zev Weiss wrote:
> This provides a simpler, more direct alternative to the deprecated
> aspeed,sirq-polarity-sense property for indicating the polarity of
> the Aspeed VUART's SIRQ line.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml 
> b/Documentation/devicetree/bindings/serial/8250.yaml
> index 491b9297432d..e79bb6ab9d2c 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -12,8 +12,9 @@ maintainers:
>  allOf:
>    - $ref: /schemas/serial.yaml#
>    - if:
> -      required:
> -        - aspeed,sirq-polarity-sense
> +      anyOf:
> +        - required: [ aspeed,sirq-active-high ]

Do you think we could make use of the approach I put forward here?

https://lore.kernel.org/openbmc/20210319062752.145730-18-andrew@aj.id.au/T/#u

Andrew
