Return-Path: <SRS0=3dQF=GS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C065C433DB
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 02:25:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A2723AA7
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 02:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A2723AA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH4lL1r1tzDsY3
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 13:25:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xSmg4f1v; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH4jg756jzDsX2
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 13:23:31 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id i6so7222610otr.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 18:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=He/+gVR8fVWili6f23wHx/c8qrIGoH5/pXymIBLVZPc=;
 b=xSmg4f1vGzlhRGC62a3noCiOjUOyyU0ck38OxVT/yRIqY+77aORPtandpzpXYeUeYK
 84/jzd6hU5a02LupyNNlXuWeTgcxY/KmZbl5RLmI8hq5ZKVI7C7Q7eA7F1ElbOoBt1Dg
 HEIGP57V4kS83IgB37sL/rH6HrUULAhMdKF91FiPbVEMoMy7wnw8qPlwGUyUq56xrMyL
 8GB7BAtMod1mfwCWtHFm+aBU7r2f6ONt1qN9heGtz+c/ZaWaD8XDugfL8t5DTu7Me4uM
 f4qjukODPNPX/oDFPftCZb6mtuvVYvOMizHlldwgAIewRjmjNDVvNaaGLSdxbvPPA6O4
 Pe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He/+gVR8fVWili6f23wHx/c8qrIGoH5/pXymIBLVZPc=;
 b=ptO695koikRpvVay1wXG4kR5BQKw3GiOdEn+BxcOALvEQCr6Fdcf7FQMxpuSJ6Jq5l
 9OGDuhsNrST0oKl68N4Xqeb7Tg7lf2/ri639dv/+kDF7+VvgZd+EEEKupSOSb/oo7Nq1
 Ol9zDPKdd8VNG3PmBCxtKMrQNIqvnFoWcIFe5RxtuQJ9Aj79k6I/lpmVL/MzictUkmRC
 W7/FA7+s9N8wCbpT+P7A0hEjx+UYyohZMtY40GrHbIR/wT1m9BsvSKDZ3rzpEh5LnTv3
 E9xptt6XYO9wVB9F4WOD+QbQTq14WFJ/54a5rF8i5QJKqsHx68MNCMOcx2oT+whcRaJi
 AmtQ==
X-Gm-Message-State: AOAM530eoFLMbbUWmjaZkQziW8AJwzM//L63ZucCe/EJBIxMs8tC12Ud
 s1OaIzdIPZfVpNbgOtr2vFIpQ66uyQe9QSumm5DS4Q==
X-Google-Smtp-Source: ABdhPJxWW6CZYJ+jFUNpFA1gIeDeEO32X6LDUrwDFrS1gQBI4Up2lsDCP7VJGs/EzPHNaFGiUl2cRogqYsC5hWtl6N8=
X-Received: by 2002:a9d:7746:: with SMTP id t6mr7005905otl.349.1610677404877; 
 Thu, 14 Jan 2021 18:23:24 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114173805.GB45289@mauery.jf.intel.com>
In-Reply-To: <20210114173805.GB45289@mauery.jf.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 15 Jan 2021 10:23:13 +0800
Message-ID: <CAGm54UGtnHK+MsNCbaWSOCxUtoTzOJddn+1h5DKUZy5sPEmm=w@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: Willy Tu <wltu@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "chunhui.jia" <chunhui.jia@linux.intel.com>, Ed Tanous <edtanous@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, apparao.puli@linux.intel.com,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Jan 15, 2021 at 3:23 AM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> I would say that if IBM is the only company using the sensor
> implementation that is currently in ipmid, it would be best to move it
> to the IBM OEM layer. But it is difficult in a project this size who is
> using what. So leaving it in ipmid for now is fine.
>

This is not the case. Bytedance uses ipmid with fixed yaml as well.
In our case, we have all the sensors on DBus created by
entity-manager/dbus-sensors, and only part of them are necessary for
ipmi.
So we specifically define the necessary sensors (and
inventory-sensors) in yaml and use the current ipmid to implement
them.

AFAIK Yadro and Ampere uses ipmid with fixed yaml too.

-- 
BRs,
Lei YU
