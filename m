Return-Path: <SRS0=dr2a=OF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96378C433EF
	for <openbmc@archiver.kernel.org>; Wed, 15 Sep 2021 16:36:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E082361029
	for <openbmc@archiver.kernel.org>; Wed, 15 Sep 2021 16:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E082361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8m7w2JDDz2xg5
	for <openbmc@archiver.kernel.org>; Thu, 16 Sep 2021 02:36:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=d3163UFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=d3163UFi; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8m7837g2z2xtc
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 02:36:02 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so2481331wms.2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vf4rpu6Na9DDJfZym/9wNx8QqG0ucbdAEST+aEdR0TQ=;
 b=d3163UFiLjjYK76Oy+pw6fB/n2q0j98FpYHA4ZlD8B/uht9kq/DPpZCIMka/4qvBcm
 A/SyOwA/fl6gZW5zk3TDLr4x7e7l5w7QD/i9a8k4gKje4/CjBrNd8uAniiBX0nPn0wfx
 PrvLHQ7+y8h3O/mtos6RSov+moJAVwmQkkUdpKyJmKmpsIVTTdzqzq0USonU7iUJh4nQ
 29DudRfPbzwAW/iAz88KnAe1tj+P8jepPd98UiVzopJoeHVKV+5m/PKMAkDRLeHvRK3O
 6o+XkfvXITYa5ze+4TdK3Aw2BKlB25U1WE1QLgw8UDHZKalOLoeiXlbnK5hhbd2zw5Rq
 xGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vf4rpu6Na9DDJfZym/9wNx8QqG0ucbdAEST+aEdR0TQ=;
 b=KkA8ktnN+Ug+qwL4nPrR56++JGKyXDsxTT1x0rA/Jd2S0yWYM7Gdh0OMnbjvoSjU3d
 +sXXCp5GZp3J1gYzaFkG0eCam8FUf0n9EFJpSr40psARLrfas56GfniQ/+347iJdzOeJ
 ZdWtk7OtgvSvUjotieRH9Bybv9x+SRNP8QoxR7HqmvQMNm7lqrX4pvnbHH7VHjZAgXAe
 fs9SbzxZI3/ZbnsHFXLOJlKrSbGX+BQk9hiMD1pBy+P5EyzmFL9esa65jAIFw9rWo5I5
 lJhXYO9WU16lnPA3IVYFAuCzlIXDzBYn6KKDY/x/NXZCnIHIELQXMvoTLZFC1YmpHCd1
 16cQ==
X-Gm-Message-State: AOAM533Dk/Bg78Vg7xxPLpgRL3x6VrP5TCAFXvQGcCPuNEWOxOgHj7FE
 cXskfN404fzwe84bWVf6wMrsZxpzOTJzKdh6hWrIIw==
X-Google-Smtp-Source: ABdhPJxyMFzjeM5qe5eZvTVB2lWvB/js/qNV+OUlNBbYveTJMZFNARmNR5SLjIjvQ8iMRMEos6Dw36OOuj+H4YqfoXc=
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr5375691wme.160.1631723754334; 
 Wed, 15 Sep 2021 09:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
 <CABoTLcTznKtVLT1LdXKiGRO0Gnov=kSJfTDTe2bfeVGHCRdPHw@mail.gmail.com>
 <YUId8mvBHn6DOzHu@heinlein>
In-Reply-To: <YUId8mvBHn6DOzHu@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 15 Sep 2021 09:35:43 -0700
Message-ID: <CAH2-KxB9aW7Aj6JjrAAZLPW=OVJe4FTUoAXszR6dTBCF7LYK4Q@mail.gmail.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Tom Joseph <rushtotom@gmail.com>, Heyi Guo <guoheyi@linux.alibaba.com>,
 Oskar Senft <osk@google.com>, Johnathan Mantey <johnathanx.mantey@intel.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Sep 15, 2021 at 9:23 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 15, 2021 at 09:54:47AM -0400, Oskar Senft wrote:
> > +1 to using something more explicit, like %20 instead of "_" for
> > replacing " " for D-bus names.
>
> Ed had previously added code to sdbusplus to consistently do conversions like
> this, in the same way that systemd tends to do conversions.  I think we just
> need to convert the affected repositories here to use these sdbusplus
> object_path types rather than creating their own strings.
>
> https://github.com/openbmc/sdbusplus/blob/master/src/message/native_types.cpp#L53
>
> If paths are encoded this way, we are able to clearly differentiate between a
> desired space and an underscore because the spaces become encoded as something
> like `_20`, similar to the proposal here.

For what it's worth, I added this code to solve this exact problem
(although in my case I wanted to use dashes in sensor names) I just
haven't pushed the final sets of patches yet to turn it on.  I'm glad
to see all the interest in this;  I think the bulk of the hard work is
done, and all we should need is changesets pushed to bmcweb,
dbus-sensors, and ipmi-dynamic to use the operator/ and filename()
methods to construct the dbus paths.  Keep in mind, IPMI will need
some escaping, as IPMI SDRs assume ASCII, and bmcweb will need to be
flushed through the urlencode method to ensure we're encoding our URIs
properly.

If this is important to people, feel free to push and test the
patches, otherwise it's still on my list to get done and I'll CC this
thread when any new patchsets are pushed.

>
> --
> Patrick Williams
