Return-Path: <SRS0=JyqJ=LK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A50C48BE6
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 13:08:58 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5130561356
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 13:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5130561356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4lr9403lz3bvm
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 23:08:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HFaPoVh1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HFaPoVh1; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4lqf6FtLz2xvZ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 23:08:29 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id x196so2443546oif.10
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZCPj98NtI3w2bfLA/1Ln5oPu3F5F4rh6+J6E1GBHNVk=;
 b=HFaPoVh1icbOhCFUkEhqyA94z6Buh8xKMvZDHcW6LkYnTTIUbGIhgZjQFh0F0oR/fd
 IRipCWNX/+g1Yse1GFGR22IS/6B8Uxb6NezE3ypHy/SohMWrSMvmNpHh0cIZh0xXTmsl
 OThTt+lvVxPinS4iBiD9Js0HCMo1qRKTI9br0+gVK6zKMdF9+XesNdTJQft8qp6gjqmB
 E5M1y5B2/472EqkFFbuRWvsP7/qZoTbt5WJrY0bB2k3HI3U/NHndBDqmk/4cawfOoku+
 ABKPbDvYt1yOZsoj6Mk/DUS5YplzQalyHml6NH8TW1SDoTuIfXRZF546oGYa85Qqa4+C
 0CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCPj98NtI3w2bfLA/1Ln5oPu3F5F4rh6+J6E1GBHNVk=;
 b=csGT/3hbnMRtzlsGB4VO4FZDvfZ/9zYh8guc9f3YVzRsPEzo3X5n7/vB1OgRyzUehl
 QYvLsJziR7VwW0EITv79oNB2qyx1EbHdFVfAhD38AXhQEeBYdcaf42RVa+86xTcYIcN9
 1r3/3fGmclpQsXgdafVcL4wVoaTmKvb7BtciIh6+2r3AL2YT4Ig32OPfUt5ePvg+WRLL
 MW1Sxth8P7+aXf7AbJc7BW3BO/bvV5FoBuXTeZ6aLZ60ruYB2jNNndvDlPIz/1HvJ4AP
 ofwcezLml52gxccoxLjsArPzii8WAV+rEmcYVi9ubJx77NdOlJZl0vEgVlpnjN4YAd4c
 DozA==
X-Gm-Message-State: AOAM532dcjLsEorUIrgVoSkAr3FXjw6nAoyJo4YivX2QznxdVXiWY8to
 vnCuzDiYRHgYAZp4JgocbTuVMmaFN2npyg==
X-Google-Smtp-Source: ABdhPJyFK9NhChRCInHXtVBab+vqQ5yv7Si8wjj1ruI1kevhC7/pxapaQcKM2Uv64EcoFhgX9z30Iw==
X-Received: by 2002:a54:4802:: with SMTP id j2mr7144857oij.125.1623848900512; 
 Wed, 16 Jun 2021 06:08:20 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id l8sm456525ooo.13.2021.06.16.06.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:08:19 -0700 (PDT)
Subject: Re: [SecurityworkGroup] Security response team - bug database needed
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <982fc651-53ca-f5b8-825b-881579433569@gmail.com>
Date: Wed, 16 Jun 2021 08:08:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 6/9/21 7:15 PM, Joseph Reynolds wrote:
> This is a followup to a discussion in the security working group meeting 
> held 2021-06-09 agenda item 11.
> 
> 
> The security response team has difficulty tracking reported security 
> vulnerabilities to closure and writing CVEs in a timely manner.  Having 
> a confidential bug tracker would help.
> Per Dick, the UEFI team uses bugzilla and has a restructured corner for 
> the security response team: anyone can write a bug, but only security 
> response team members can see it.
> What are the best practices? How do we get a bug tracker which only 
> OpenBMC security response team members can read?

If I read this correctly, you are requesting a Bugzilla instance be 
stood up to track security issues? Since we have no community project 
budget to fund any type of hosting, nor any community interest to fund a 
trust/budget, this would have to be a donated service. Maybe a 
participating company would be willing to host and care for this service?

Alternatively, can the response team use a service that we already have? 
Just thinking, I have no details, but maybe a new Github group/repo?

Kurt Taylor (krtaylor)

> 
> Joseph
> 

