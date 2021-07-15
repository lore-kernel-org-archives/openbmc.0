Return-Path: <SRS0=j0/m=MH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B00FC07E96
	for <openbmc@archiver.kernel.org>; Thu, 15 Jul 2021 16:21:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 979AA613F7
	for <openbmc@archiver.kernel.org>; Thu, 15 Jul 2021 16:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 979AA613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQfkn6zcCz3097
	for <openbmc@archiver.kernel.org>; Fri, 16 Jul 2021 02:21:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YDlJnaOO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a;
 helo=mail-oo1-xc2a.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YDlJnaOO; dkim-atps=neutral
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQfkG10kHz2xb2
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jul 2021 02:20:51 +1000 (AEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 68-20020a4a00470000b0290258a7ff4058so1657372ooh.10
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vGDb8OtwwpmVLPOtXSOb7ZHxfbcEPfadapn7b9Fg6po=;
 b=YDlJnaOOkx2dAgmRoaKGiohWYnwL4JrUJy8HgKlnTHLKo5U4GtsP0nDU71n+Yjg46B
 LOBTkiQ0bnvm0JvjhbJ+gXvffbtb4rghhwvPA2JuvWf23lUToOYND426RmZKXFFRLlKt
 kVt3+su2XrTCeeu69WbFBf7dNfIhyPUH2KN4NMlCrZIAFQOTKvdboKXzYAtfwM5UzL9H
 Uo2Q2WkUiy2sQhFfh/xOWhWQdmwPtRx8NYj4PRJgaBnBE4XFt4APTOV6Y00f1gZqHNrS
 SRiuqHIYMv4lrEr7mzabvL98/aizY0vT3t2tQ1+fim+Lzpw+SZvKAFNnsfnogdjuinlU
 QBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGDb8OtwwpmVLPOtXSOb7ZHxfbcEPfadapn7b9Fg6po=;
 b=sRntcF71sikaH2+2qNMZceSKm1dGz0y4y5wytveextYIb7lX/3VwnEGymfk0oPGfL4
 7sfowPlkK17X5jkm5vgm1d2F0kqQ0+/jF4SRJE5cjozVwCzzCG0x72B0TfyTpBW4Noov
 sEiPSgDore9g0yCi/yToo1vzKIZgb7BQK7mnCy00DNtZ7d+mGWv5mux9P1PBvCk55aqW
 3AnxnYHbXWxdqr2ZhwDxw/EAktNpb1MqGi7RrFiecLCpcxIWEDvHnkGJMuBK9CPHBMBe
 bx98ihNMLFL78vepdnp4s7JnS6iivfFaAgMN0hBQ+0H5kbm0AP/jOGPxa4nwX8gode6w
 xZBA==
X-Gm-Message-State: AOAM531BTgbHetLAKddvEaStFFZDgL8+e0pVtKZqqMa2JCV1cxacJwfb
 ck3OzxNEnwpTO6Kzc1HhGOVO5kGs6HmINg==
X-Google-Smtp-Source: ABdhPJzL9O9IEp4PTMH+tuf7tvuPU8zocshL7EmFUAWlArhXn1x8WGHItP08+lZA9V4vJg8loR/mbw==
X-Received: by 2002:a4a:55cd:: with SMTP id e196mr4085360oob.2.1626366046312; 
 Thu, 15 Jul 2021 09:20:46 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id 61sm1128497oth.17.2021.07.15.09.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 09:20:45 -0700 (PDT)
Subject: Re: Update to Code Construct's CCLA Schedule A
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
References: <44c1251efe989a256c2f3ff17f1cfa33b99c9419.camel@codeconstruct.com.au>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <baf48a92-3a0d-304c-2915-95eb11bec30c@gmail.com>
Date: Thu, 15 Jul 2021 11:20:44 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <44c1251efe989a256c2f3ff17f1cfa33b99c9419.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/15/21 4:03 AM, Jeremy Kerr wrote:
> Hi OpenBMCers,
> 
> I've attached an update to Code Construct's CCLA Schedule A, adding
> Matt Johnston as a contributor.

Done! Thanks for the update.

Kurt Taylor (krtaylor)

> 
> Let me know if you have any queries.
> 
> Cheers,
> 
> 
> Jeremy
> 

