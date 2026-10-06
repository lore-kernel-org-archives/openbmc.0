Return-Path: <openbmc+bounces-2730-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78F5CA5FFC
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2026 22:22:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hzrNT4wt9z30TY;
	Wed, 07 Oct 2026 09:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::329" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791294606;
	cv=pass; b=FTxzWYdvMUJ9OJJkFEo4AkScQWmOGGqXayzinR0AIWa9H1uHvzekGYg+TVu17ZuPaJlsu/FiB610DNaFuhLiUmHlyPeNE4UbvIGl4mnKK9Aj7DW9zZSnenlkeVCt2irSaWy138UhRdPw0u+LZ7JuaLY7Ym5w2TMHC3SeOayyErLV8TI6CIMqPBGCd+nUzt6sYGcWOo5+xPj414ctxB0qKZjs1A6GdDQ0PESnMJJWzc8opwj3yw/ShTx1r7qMig4RwJ7CSqZtCARqgpl9/fnh2HnL2yy61t1lXKu5h+guu0DUoFQ/SpGKvIHBesI7P6/2BY9lZ0+jprhALRCynzPzPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791294606; c=relaxed/relaxed;
	bh=UXuJ8NHrR0lMfUj/nRVQ8uKykof1ytxI9ySrsVXRIfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APTLqdYsSGWscYIpmCai0ln+4/Dtk9Mtb++/oRN2sNEWRrhf1LIj/axXHaHb+BPOgHIjXEIf3gr/4PPEHMJOJtNS4MRbxtV/JMPbVOM5bcJ55j3NINFVtP44XI3e/x1jrorLOYPFFbVk4Vn3yrAq/SJjo3pwFVXRb39vUTK86H0QEar76+6SiXQviv8IrQn4k77OTuQZ8eFxQwwWzdHaHDfS+GAluJfAapr9qbBktLx2O88vOLifJKXuvdBQZenc4KclcDbcTLCh+3omXJAed407/PBfVgZVd3/7xc6yjv6deXXMAx7oft1ah5WzCiwKLaxefJwOXUvkoogvNFv19w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeGeEIqa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeGeEIqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hzd185k5Xz2yjw
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:50:03 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-82109f51565so285473a34.2
        for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 06:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791294600; cv=none;
        d=google.com; s=arc-20260327;
        b=Km6MarHhWMT1UgXQ2N6YHoNM44prkoKNGDvTNW06F3W44RHYnlllMHp0tiYRLKYDUP
         wmGvjm2hZYl3WIAQ1RF8+VTWyw5mQItRQrKrWdOxNabyjRUH0nCDGwQpInyWpBEkf62L
         RwM2jQcbD8R0ZVkP5MNzXq2Eb6Pyt9AZ+ZBcrjg7pLspQbbuPYHgeMF4LMj/29SEy/6T
         u+PTou8GxmzA9b8NSdGweGZclaiu8L6y1FDoNRf46E97lFA04liT6+TQrBYUALqpi4cj
         UR13l66oA5qQtmNxJqfy8ApjodtzGagHkNtSWRwv1GB42qa4IiVUVdXzVSgmYAziJ5oj
         etsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UXuJ8NHrR0lMfUj/nRVQ8uKykof1ytxI9ySrsVXRIfE=;
        fh=2f4MTs5AFY/extZyrtQ/RVyMneMq/hlMKorhC4TL/20=;
        b=aZrNvOzbVQetNaO1wDKeX8ZwZFczo07ne0wWvJfQzsQ/o7x684iUq85D9dowPVQoXG
         e2R9ADBSWvXYkqkorNFz6Gdm3qg+/UrceMVENalN2c9YHqF1sxJSJCe+0SZ5XaNgIh4v
         kK1MdEiilFdK6+GApQiReQY56niC6uZmonnC4vgV9uUr0MpRSJWQUsHEBokO5tP9GyAY
         QP+hwXGd/dwyV2SbT1R69uIDtZdxpfpCrwokHQELP4T0sDNdVZs8n6nOnmuwfXKrC08D
         je/TZ9YZVmHfUSyqAfeJh25aOsWRWH8wCoXNf0K5T/mNsWNsepQq/iwH2FW7c4BXcZgd
         vzXg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791294600; x=1791899400; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXuJ8NHrR0lMfUj/nRVQ8uKykof1ytxI9ySrsVXRIfE=;
        b=CeGeEIqacy9o1jmrprtH2WVSqoKOnPacrHv23AtezBkMrPUN1dL7zuS+IOu5DloHqz
         0s285qPIarf5A49vU6rqGrC5FLfUbvWf5Nk6FFM+y8xtadW/JT7Cp9qjqwJO0h6YjfiS
         X1Qxl0tBrIDXYyI0Dlt876qz4kuFts2GTgrHooZ0F9SCEW5somQtYtSUimkWHWPjJ0/X
         /jECYTbEx9k8JinC+wnzSfJFkqVBrddYIietJV1KX7NZScksgrOodBz+Y6KhNl3C/rIn
         i+B4VWZd9RSYR+qsPomaOf8vPrOGW7bL8h+nsC3kCeP2FmUO2eIg5o/xoQAFdsJqWkAG
         bOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294600; x=1791899400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UXuJ8NHrR0lMfUj/nRVQ8uKykof1ytxI9ySrsVXRIfE=;
        b=02y1OTde4YpIFyE17G/pD5+GKfyF6fiSCdRs3wWOYjyprnJLKTUqeLw/SIE/jj2udu
         9fLx8cjGU7ULBCIjyvUwUXOECzWp1BLVxq78MfkLIdUZL/MgVdCcQ1Nft7UchGkxkm/J
         Tw1tQ5JQsnqhR7oGXsPtjYz11686eVw+xphQr7J0mQeIduF2ZOTKnmtXNTBwJFyjiXvP
         1+4bncKGkLVKcKuhJZD0Es3dCEHugUxKmMKwSNvSoS+lCWRSQR3NYviZhZdGvkP4G99V
         7Vbnz8JEcqKwr76tfh07tAQ/NsPJL9s83JW3nwCP8vRMI+S0DYBMsbR2L6cmUIvo0XXu
         WZHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMIUJW4Q5vfw+D1NjUr3DsueK9FHgLyc5lLJ7DQlOdgqEFTLYpctc3RZAqkx0bJ9puQ6QFMRg3@lists.ozlabs.org
X-Gm-Message-State: AFuF++k/XylX/q+sjBzHV/PUWGR8VvfLUF/FWu7Mt1VIA8xWzF7K67Cx
	g9RRdpDyl4T2MHXB0z4Ve6GRHmPyU8jD77rwMouNNBXM0N4gb8EI5G/iLu6IWBTpWQmjh1pju6/
	WElrq6LHAMHeJJrShk/Conm9p4d0MRF0=
X-Gm-Gg: AYBFou3JBPTdtTwObZH2M0UYnF29s27IBIzrNb3OJPMkROoKQu1QTXrvTy0izh4BF2w
	fST1DuPjxxZ8VbiXxQGcQYUkaLQwxfh1ngQw28oYs2wk7ahJcGD+Jjr0LUEkdA+BZ9+GKJiOJTw
	YoFuLLtj4mjpesy4Q6qjhep6JrRtrjQS/4YIiTqhrJZYDkEJjccv9c2yxrUl0qKZkledF+s0qMk
	qH8ADnh5mhoz3+pVgwhMmrhzvmCrHOImZZsQwdXoyGSUh4stLsv4J3YjsLaZWUQi0rsEseuMRoC
	GfrkDumObCPikI76s+BYXq+g7hDtxuabjRvdUp7uzEdSYr0zIoo7TTtQD65831RDskx5OCKf7aZ
	dxiRb0H/lMT+MsnLPL+mYuZkXbPGS36JduJHNrD+EiOtzk+PyIYUXju+UyTbE6TnHSmjqrskF
X-Received: by 2002:a05:6808:159e:b0:4d6:90f3:74b1 with SMTP id
 5614622812f47-4fb417cc5c0mr1524899b6e.49.1791294600312; Tue, 06 Oct 2026
 06:50:00 -0700 (PDT)
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
References: <CACwt7EbP_LJ1070N9xyPK2YHe8uwEZ2Wn_Jpqf26JMqbN+wOhA@mail.gmail.com>
 <CACwt7EYM8zS2xZJyCNSDek2EMsWwY9LJ9qn7Zde-EJ=czAwkCA@mail.gmail.com>
 <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com>
 <CALLMt=o4dtC34DHbRjCML0z-1wXkkWpMdMsbXmB3oR5SEXUxqA@mail.gmail.com>
 <CACwt7EbTtDs=Mt9gyPBHV-hw6fok=sFA1jw3B0wVt3_Sm_mVNQ@mail.gmail.com> <CALLMt=oSTZ06PkP5URUZC3T9Kwnr8ZNf-=im8tcN7oJG_w6yBg@mail.gmail.com>
In-Reply-To: <CALLMt=oSTZ06PkP5URUZC3T9Kwnr8ZNf-=im8tcN7oJG_w6yBg@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Tue, 6 Oct 2026 21:49:48 +0800
X-Gm-Features: AclHuK--T10JQ8puLwNrSKGrtja0EnWhi4ZMbn-5T0BJqXydkiqTB6ihL7cKKqc
Message-ID: <CACwt7Ea71Y1-tkHH6Jc45yYqwDMugHLrLjnwY9izREenr+cD=Q@mail.gmail.com>
Subject: Re: Signed Individual CLA - OpenBMC Project - Hung-Chun Tseng
To: Andrew Geissler <geissonator@gmail.com>
Cc: "manager@lfprojects.org" <manager@lfprojects.org>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2026 at 12:36 AM Andrew Geissler <geissonator@gmail.com> wrote:
> Hung-Chun, there is no documentation within the project on exceptions
> to the above rules so no, unfortunately I don't think this would be
> acceptable.

Hi Andrew,

Understood, thanks for confirming. I'll go the CCLA route.

I've sent the CCLA to my manager at MediaTek and asked for it to be
routed to our legal team for signature. Once it has been signed and
sent to manager@lfprojects.org, I'll follow up on this thread.

Thanks,
Hung-Chun Tseng

