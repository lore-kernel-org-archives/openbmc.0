Return-Path: <SRS0=kPZh=JF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3735C433ED
	for <openbmc@archiver.kernel.org>; Thu,  8 Apr 2021 15:59:33 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E0760FF1
	for <openbmc@archiver.kernel.org>; Thu,  8 Apr 2021 15:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E0760FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQtq4Nlrz3bSj
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 01:59:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.175;
 helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQtS436yz309k;
 Fri,  9 Apr 2021 01:59:11 +1000 (AEST)
Received: by mail-oi1-f175.google.com with SMTP id a8so2638946oic.11;
 Thu, 08 Apr 2021 08:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jtoAw95rvXg1r6cke0J3PIsrEjdw50dBNfyvcmHc460=;
 b=aGQOAPhmDtum07P3uLCBUBOaoYxu+WQlrSF8+Xczgkyzb5m8EHjMdW1eAXgoCMKifN
 N+TNx0tcNXIiZtqD0SLXVHpnLYVD6/SD2DlWFrBVJZBmyl+ipizMHOWSIt5dZVKG4Cqu
 zyJDq2j5SFXhIHdrGFI4GzgUIoUhTv8fQR4Fh/yaFeW/rUCW+wjSoTNpXuvTWM+wIcCO
 pq0+jUqydFYx3GLtE3r4Er9aUXXUDdMEJZ0OP7DlwoE+Fg8X7R61zVfln1C0l5pyidh/
 JNlAVuG2dE97g4pO8RByUgxd9ctPGrUWe1kvVa+3jvad1p0PX09AM3RtLjBJaPa1PPg+
 evyg==
X-Gm-Message-State: AOAM530svueG7eekOWYhBpSYABNn++/ve8rSm5Dilg+WfTLSjB7RiDiL
 S+49suhjffgnUKdqxtejoA==
X-Google-Smtp-Source: ABdhPJx+JWT72oKSZA+LWx7PNFVqKo3fxY81eBJG9HzWXkLOF9mbK8ZbLh65asfWyyJWKv4Ts+ehVQ==
X-Received: by 2002:aca:da04:: with SMTP id r4mr6652760oig.123.1617897548115; 
 Thu, 08 Apr 2021 08:59:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f12sm282199otf.65.2021.04.08.08.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 08:59:07 -0700 (PDT)
Received: (nullmailer pid 1553733 invoked by uid 1000);
 Thu, 08 Apr 2021 15:59:06 -0000
Date: Thu, 8 Apr 2021 10:59:06 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v5 1/4] dt-bindings: serial: 8250: deprecate aspeed,
 sirq-polarity-sense
Message-ID: <20210408155906.GA1553685@robh.at.kernel.org>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408011637.5361-2-zev@bewilderbeest.net>
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
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 07 Apr 2021 20:16:34 -0500, Zev Weiss wrote:
> This property ties SIRQ polarity to SCU register bits that don't
> necessarily have any direct relationship to it; the only use of it was
> removed in commit c82bf6e133d3 ("ARM: aspeed: g5: Do not set sirq
> polarity").
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
