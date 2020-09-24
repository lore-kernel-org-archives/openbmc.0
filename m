Return-Path: <SRS0=mnE+=DB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A16BC4727D
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 13:47:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D0B206B2
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 13:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ6h+6rK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D0B206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxxFH0YFpzDqjk
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 23:47:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mJ6h+6rK; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxxBX3r8vzDqBG
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 23:45:20 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id x69so3679538oia.8
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Jdi3kkNox8aNKpaCxwH8j+bJ6voUfH2nyEjN7OJgLnk=;
 b=mJ6h+6rKa941kM1wyh8VT8HfYvfm7W5+4z5MeZCSbNl+5iLiMz9uESYN/BxyhJ9L79
 /TfDI+NhhSP5CRenP6f9Z38xLlkyJ+hO/zrharOY/Oe6jwXpohWpzOAuCz2XJqWDKdxc
 1OCrz5CHyvCCRkz0AgwiwdBKCxPFrdGK0DQYpFhsPTl/qn3NTHVwmSCouiJ3i5+d1fMi
 u/TebIsAjYboF/GYnIcBzmxHLS87EanlsbeBBoKodAJGbuVCzVWB0Q0nTFQ0qPjeHg8V
 Dab3WGeAnvoSvRJFBvSDiX1UdqeEBffjvgAM5cAc2OedmCP5AyFF8Hz0hgCI7U9mn2Bz
 WXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jdi3kkNox8aNKpaCxwH8j+bJ6voUfH2nyEjN7OJgLnk=;
 b=YYiYMpiuQe/UDbFy84sWIYbtp8lBvumVZGwBmeheFe165BiwOcB9eHeLJQxrGHx79f
 dRG55gpRjdqw6wV4Zt8DZdehUhgflyg5uHNQGu5dOUCE7DCIwxIIGHn9p076RtGHY0EH
 c3yoY8XG9BYcw0tMDBGm8n+bnT57BK1eImExf9yL9cVkUFHrSs1GDWgWzTIBUVKYu4rq
 4P4IxnxJE21C5Qexw1Z8jXuWGrA7vn2IEvzIQOJiGkBlw6GO86DteFs+mpahBWNjVf9Q
 NSHsbXY5k07jZIgLEhu3xrjIW8ny0w3K2EFlWGZ9p9JNu+UVVDT0tdJ8poTWg6C4ULfr
 1nDw==
X-Gm-Message-State: AOAM533fyzdx4aT2EIUpV8vOZjHMD+Rg5Wxhm5pijswFtBwkM31SacOO
 8hy08b3v+qgEcUfX+S2AqFY=
X-Google-Smtp-Source: ABdhPJyPz9fW+2CAWLzQO0Ay2NeBqP0+VSEu34gKu3yUbLHcjE2Cg7c9zUSHgKsRsbxTGZuLqECf9g==
X-Received: by 2002:aca:5c43:: with SMTP id q64mr2564448oib.18.1600955115957; 
 Thu, 24 Sep 2020 06:45:15 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id r20sm821034ooh.5.2020.09.24.06.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 06:45:14 -0700 (PDT)
Subject: Re: Action: OpenBMC community messaging survey
To: Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
 <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
Date: Thu, 24 Sep 2020 08:45:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
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

On 9/23/20 9:58 PM, Joseph Reynolds wrote:
> On 9/23/20 2:48 PM, krtaylor wrote:
>> Hello everyone,
>>
>> I am doing a survey. If you DO NOT use IRC, would you start 
>> communicating regularly with the community if we used a different 
>> messaging platform? Maybe some other reason?
>>
>> I am not suggesting anything at the moment, just looking at ways to 
>> remove any communication barriers and improve open designs and 
>> development.
>>
>> If you DO NOT USE IRC regularly, please follow this link for a short 
>> survey. It is completely anonymous and will remain open until 12:00pm 
>> Central, Monday September 28th.
> 
> Hi Kurt.  Thanks for trying to improve communication within the OpenBMC 
> community.
> 
> I was confused by the survey and did not submit my answers.  I use the 
> IRC (per [1]) but sometimes go days without reading, and rarely 

Thanks for the question - I could have been more clear about "regular 
use", and in the survey I do say that a bit better.

 From your description, I would say that you are not a regular user of 
IRC. That is, you do your work without periodically discussing it in 
IRC, and are not actively participating in others work and design 
discussions. Absolutely no judgement here, this is a common situation 
that we can hopefully address and facilitate for other developers.

Please feel free to take the survey, the feedback will be very much 
appreciated.

Kurt Taylor (krtaylor)

> respond.  I find IRC setup confusing, but easy enough to use.  And I 
> would prefer to use slack features such as a full conversation history 
> and threaded conversations.
> 
> - Joseph
> 
> [1]: https://github.com/openbmc/openbmc#contact
> 
>> https://www.surveymonkey.com/r/33BVDR6
>>
>> THANKS!
>>
>> Kurt Taylor (krtaylor)
> 

