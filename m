Return-Path: <openbmc+bounces-1624-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE7B1088E49
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:44:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkRM62bkz2yqT;
	Thu, 19 Mar 2026 09:44:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773865507;
	cv=none; b=ANOJtj1GhzNsgcoNIqUG8sxZP3IIt/PluSZv5taTQwGOD+Z9+OlFG1t9YbsicXOJbUaA47TB1zpaoa+kIieaGaDencuTcJqh6Hpgr1U/snTZU0XWDyNZFxI4MBLyEk+qnUQ4Nl5xj6hVuO4Ptud7MyYnOWtggM6TIbVf/ZUq1UUy6DVUlNScKurFuP69BKj8PenZKOSh9vY7FaIjC5wADkbhQQVIRt5Vlu5ZlyBvwhtJqpJDN0VVvgxRJqdCUO+s5aOgNO5ECF/LE5qCTG2g63omAQ/XxnBhJpxhORT4qvtTJLxsGd4rsUVtbj8Sj/2iu9OC+BevML/mIVCJb7VYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773865507; c=relaxed/relaxed;
	bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvbUiSR3cSpoWBAV1NL32SwzruozJeECoqoemkKWAfHpsm94dDA6ZWHDNaakyM4WJWBSTa+t319/eBW8cRHTz9V+SCZehZfkI9hmcctzrAhrryLn3w2FqeVaNezKk92kBD1QjGNmpNnq2tRgRz0r+qSKW63SPLdD5RQVTefIlSTP4VDsqevJizovFxfyOVZeLzaWCGgOJbUoNiB0dOLbo2vXPNcVCeCdwMb7m/dCO7iTSapdqycMUv8VHYrHczKkFb2MvpVotX5zK/ksVR4ZXT/BMIAJGKAa3bgGnn9HX2d94UdJNumj9Jmy66+h7GujZaUlfQkxu6VDs1oyBerpcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kdjji2Ol; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kdjji2Ol;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbgLB2VY7z2xYk
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 07:25:05 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82985f42664so237280b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773865503; x=1774470303; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=;
        b=Kdjji2Ol0HLqllEpLhJZL1weV+mJDBHkeKSm0B3XfTLJc2Yi+DU4AZsBhIvXwCGDal
         Mu4BkopHPiOEM6HCaSmSKvD0uPWdvML/4Vt6btmt5VkeIOfHICX8+VC7JhYmWLeuzo0j
         loQKZGRi1vUFsN8E7O66l6vEQ652jJX1YSgHGWeVKbMiu5we+B9CXBeGd7L5pm2EI7s7
         AgmyURzSZGA/Z4hfveDvdPt+rd6iBG13Yidso2c6vrs1TW1BzxmSYdiBtEtGBVY22ejD
         qgIFznLBmUsAd4Fv+yrMa3mbzIzyNIvLtYJBI7vEaswW412I0s/pM/RIWkWzaG7fRPAO
         NLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865503; x=1774470303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=;
        b=oyhCiGsymvvjXhR3Dc/zNbKKJ2JA+bT4zTi7m0FxZpayJ1tfrG60g6eeikuJo3xmMA
         zXBNFQ/8OgzH0WA/TdQXufIqB45L0KIKCZg3K1rxsUUEa/bPJGo72bOKyStZlhrZ1RlH
         ozeGU5eCddvcO0vX1MShWylMH3wyE2kUQ8I10TCBkM4BHxZZseqCXO5B2On0b6q09zGH
         hABq/xEGBAhiiy9xHp+G5McJgqkoT1CfbhbtE9A9YHqL+gsS7hQRG+UJSKgX9hNkjEW/
         AmXK+ecYHdmGdzzl+DhqmWhM8gQmzrL1Pl4biOOzrSeZ7RcPnBow9lnYgy1+Xd1fEA1c
         9W8A==
X-Forwarded-Encrypted: i=1; AJvYcCU++MBqw6foKAQkrzp38JuQb+jbT63/b2M3SapUb8JXEay2iBjJoYCsiWhRnZl8tF8TOmVdtp4a@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/Xz1c2oONMAzkqTCFgOb1PxwBZY8ePROkUZTGSNxfXlwFmkZk
	TYm4XQ8jRdl4JoyLksegXbYXpWsZ+jBUJELq8fpmTmefd3eAqUSXV+qC
X-Gm-Gg: ATEYQzzjaTZ7bDw/4Qc+/QnS3+NFz9ZLv/wV7CQqSS5vNojFJC/4sbKlolD7/1qmBWZ
	aTgd3zJN7Vhbv2bEYP9fJyW+ULjclSVDZKbqvjyFYaCF/kDFQ3xAhZAuU7Tgv7yWYuaRrYnJjgu
	Gk3RiTlVMdM8wxHgORiAbLGrN0hPSxwZX+a3frRuHbF6WAiN0ofCR8MO0x96FZn7VVIHb1NP6Oa
	nVUMVrylFqi3Hc/OpIeSfBdaCk7MHS1wD5SYFFFawqiO/nD8e3Wkf1GXO3BPaAn4dGkI4cdMAZB
	zN9d3Ij73lnjv5rKe9bJky8vde+n85sbmU8kO0nFjbH0wKxnFaLOGKmDz9lwipf3ibrWpNmSxlQ
	sXzlbxh6FqZ0sZyjeHdsPibCaDTQER971/Mz+ORStQNlTUnmgl914+iIA6WlSRXshNfME4S2Kx0
	oMxXCa3qguqWhR9GtbN3uk4Ht4K0qCrVscNevBj1uJJSMC
X-Received: by 2002:a05:6a20:7f90:b0:38e:9220:ebbe with SMTP id adf61e73a8af0-39b99d6f450mr4339851637.23.1773865503486;
        Wed, 18 Mar 2026 13:25:03 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5691b8sm3286559a12.25.2026.03.18.13.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:25:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 04:24:56 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add nuvoton,npcm750-otp
Message-ID: <absKGJbrWX5xtPX3@google.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
 <20260318193538.246853-2-visitorckw@gmail.com>
 <228943f2-8f1a-4da7-8663-7f17f5e2f21c@kernel.org>
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
In-Reply-To: <228943f2-8f1a-4da7-8663-7f17f5e2f21c@kernel.org>

Hi Krzysztof,

On Wed, Mar 18, 2026 at 09:17:19PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 20:35, Kuan-Wei Chiu wrote:
> > +maintainers:
> > +  - Kuan-Wei Chiu <visitorckw@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm750-key-storage
> > +      - nuvoton,npcm750-fuse-array
> 
> Your driver says these are exactly the same devices, so you got only one
> compatible. Otherwise explain in commit msg why these are different
> (current message speaks about purpose, but is not what is needed here).
> 
Thanks for the prompt review.

I will drop the content-specific compatible strings and unify them into
a single "nuvoton,npcm750-otp" in the upcoming v2 series.

Regards,
Kuan-Wei

