Return-Path: <SRS0=EFpz=I6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA1DC433ED
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 03:54:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B337600D3
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 03:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B337600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9q6y6rnTz302x
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 14:54:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k28dPf9+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=k28dPf9+; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9q6S53Bsz2xxg;
 Thu,  1 Apr 2021 14:53:36 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id o5so1085769qkb.0;
 Wed, 31 Mar 2021 20:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynRSJXMe9xUcg10OAWzr/tvimnliI6ylqTuryl124LU=;
 b=k28dPf9+9ZWLitCLxO/Y4duFpo/NPIr6ux8Dj0VU+cTkuGaDXgSxKXEb8ulHzl2EJ1
 iLkBIsSjajBqW2NXH6miRAsqy9P1X7NoEzMih5e070JakakYXniZ9B2dpQoZdwdyvhal
 XsiJliB4xNFudomEk0/ZpwJBn1t2mAMG2CD+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynRSJXMe9xUcg10OAWzr/tvimnliI6ylqTuryl124LU=;
 b=UVcOuq1MZcCxfdQ2T4RYSi1Zj0FTjuQ//yJkrRh1aowcMPfvjEK3SXkM6aaCE0rf8v
 endtt4QtkexaTUXG7VLvYQz+LcAaOwRTPtvrHzybeY+w1YSfElcUVSAQ3VPd7zb5/dcb
 j6Y3cC5phIj92FeVaVXdV8yLB3HbvJCQ+B+bBgH7rvkzoYgloLZvVaGX3bDhGzMXPVAa
 Cf50vnUPLH6FhL2A0RIg4Au58R5CKHDK6RHtpeTGCOThl9muf7dleGXNH4pTM00VGzKp
 VwHjnOpsQvy7tRWbmcSFVhFkb5doRGqIAZvixVV7Yf3pA/5taGYKujQVozKullQLralC
 VFpw==
X-Gm-Message-State: AOAM530dS1EOfusrz3oVjCiACwg9f9fi65Y6GHKLJFpqU7ISjrLwX8/z
 A+iILhIxeMEkO75+BfpWjQ/bky5vPN9X4/4YvFg=
X-Google-Smtp-Source: ABdhPJxaNMdmBWCwd9YGCoGxx/iaWHZVuxoWEevTeG6nQZ2AfTjZP0zBKZX/ucE2hwmt118D2hD7FjWOTGdDe6iREL8=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr6462091qkj.465.1617249213346; 
 Wed, 31 Mar 2021 20:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-2-zev@bewilderbeest.net>
In-Reply-To: <20210401005702.28271-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Apr 2021 03:53:21 +0000
Message-ID: <CACPK8Xeqrvtb4Qku545QcbLeqgbHOZHkpgMp3G332c0aMdMCvA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: 8250: deprecate aspeed,
 sirq-polarity-sense
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: - <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 1 Apr 2021 at 00:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This property ties SIRQ polarity to SCU register bits that don't
> necessarily have any direct relationship to it; the only use of it
> was removed in commit c82bf6e133d30e0f9172a20807814fa28aef0f67.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index f54cae9ff7b2..491b9297432d 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -188,6 +188,7 @@ properties:
>        offset and bit number to identify how the SIRQ polarity should be
>        configured. One possible data source is the LPC/eSPI mode bit. Only
>        applicable to aspeed,ast2500-vuart.
> +    deprecated: true
>
>  required:
>    - reg
> --
> 2.31.1
>
