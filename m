Return-Path: <SRS0=7r8K=NI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0646C4338F
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 00:04:53 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1042260F22
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 00:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1042260F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWVq2V27z30G2
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 10:04:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H/LgA0e0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H/LgA0e0; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpWV26bb0z2xZS;
 Tue, 17 Aug 2021 10:04:10 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id e15so22598288plh.8;
 Mon, 16 Aug 2021 17:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8OcYoQrjOQIm/iOfn/qGg5WXk6OnAW5qFwcrs/rMErI=;
 b=H/LgA0e0aRuTUYHHg7c8649E/r5biZOpoBg7KtUO38aR75LQrqKye4P6cMEfwu1L7W
 SBx12BW7i+wEh9nBFnKidZ2L3P1aKg7lWLx8Bj0H8InXsT2eCkjIpyrCXiUeehllATnV
 pTmPzGF7O9Y8nNyeoan4jkhMCmJI8Ld60Dxdc2LBRmaxonfZjkz1EM+gHGfbbwzu+nbC
 eBt7HfmcSqtsWnPjC8XebqAigfK/YsYZDA+22jz1RmFyCVT1s4s0x/cMVib3WZCupllg
 hCBAvki+G4wr4ttmBMf1CllKVXOmRDE1x2yYK6Xi1cwOhzCxgd96e1YAljeFBr7qzYwu
 wLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8OcYoQrjOQIm/iOfn/qGg5WXk6OnAW5qFwcrs/rMErI=;
 b=rFRaD9TVKmDW+ipzufrBVVIrXmoakwKb5AI1vx9nqVeUxPAD5iUJJg7tYZ7y5G10PO
 4hUord5rMO/h7y00BtKf+MNXWshDROu3x435DgFWeSpYz0k2BsXxDYd6EvSWZtHd7RYk
 rrkTWSkl7zCrnBp8r7OVLThWpEWqDmn+mqHrhBZZG/1zcD20zHWBXB7PtHAoSB3rjsh3
 A0YBqsqoAA+OovnGHzEAZ7Fr5BRRj8ZPkcRVhOCgcka3uJAiA3rCoge4RgpGO5carhV5
 3EoNIddGeW1d9OCHhtrS66jeYT8UKiBdTjhlqL97v5fAWGCzEDiMmMAliAepWGIcTagW
 VKtQ==
X-Gm-Message-State: AOAM533DPEdYGoA2QydZfSGCYhCB3Ajj9YZ7avv6W6cyrJBd1ihLbHQ+
 GmuIVSLeDeBISqxBaGzFf5Y=
X-Google-Smtp-Source: ABdhPJwtLYKDhsKinpch6hw0rT/vGFaK/Jdkg0IXrY1PiIgMwHhRyJEkvRLLKb+Bsf7366YwpdXaRA==
X-Received: by 2002:a62:6242:0:b029:3c6:5a66:c8f2 with SMTP id
 w63-20020a6262420000b02903c65a66c8f2mr667349pfb.59.1629158647726; 
 Mon, 16 Aug 2021 17:04:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id u190sm282154pfb.95.2021.08.16.17.04.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Aug 2021 17:04:07 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:04:04 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Update flash partition table
Message-ID: <20210817000403.GB7547@taoren-ubuntu-R90MNF91>
References: <20210720002704.7390-1-rentao.bupt@gmail.com>
 <20210813062435.GA24497@taoren-ubuntu-R90MNF91>
 <CACPK8XcAqU3KASespqS3dPterpzyqD4wYH=qOS8Ok2yUrB_F+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcAqU3KASespqS3dPterpzyqD4wYH=qOS8Ok2yUrB_F+Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Aug 16, 2021 at 02:11:40AM +0000, Joel Stanley wrote:
> On Fri, 13 Aug 2021 at 06:24, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Looks like the patch is not included in "dt-for-v5.15". Any comments? Or
> > should I send v2 if the email was not delivered?
> 
> I had missed it. It's now applied for 5.15.
> 
> Cheers,
> 
> Joel

Thank you Joel.

Cheers,

Tao
