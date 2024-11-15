Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE9AD68BC8
	for <openbmc@archiver.kernel.org>; Fri, 15 Nov 2024 15:24:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqgmY4kdlz3cZ6
	for <openbmc@archiver.kernel.org>; Sat, 16 Nov 2024 02:24:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731684264;
	cv=none; b=TpKZ09dYCIjuKXlf/mRH+xAh6AeWotNXMfQvJ6FSof4Y8jlSHTPfMgR3pf229bWb3b4ILPCzlLc0DzdHmjQxCsV24w9TvhgIGo1TVoFkVampFy11m2AbnvVrsQB2FDi5abRMq7UKcHrF9DWKpiVkWztPgM6AVvhUTFiHxVDLXjPxZRz+aIvtn8ugLXZr+UPBiBjHKxKzJcBqLwyqhzil/wC9qiK8cl4y8jlwxfkhsgQsTLKB9t5mJeWI6c1PjI7o2fmfTdkl2Ji7M9LcBWU98GlGoZd4ZMyX0DAB0oY0N65Y3eTjfO0ASppMNfAwuIlcQuvOl174MXXblSZWFvPcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731684264; c=relaxed/relaxed;
	bh=6CbonmGIEt1LytS/5LcyBBLPi6YyB8nOYoG0UOl1eSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ErOsqqXmf/Q9epVl9YBWN1MihfnDg4ySRAPLWceDPwlRWbGEjkkJPZOAKfjeoBD+5klswtTr71bbkDjv6f5+Zvf3Bb3nLmx2csSZRvjET0E/AVBSplGRQo/lHxtTr8h+WPzS/M5aaR8+KIPAcDbBG9qk7c10RMPmWRplnPU+IXxIu8Y9fuxdRvgbDUHBovtt91LhsphsX1wpZjGhctMOyKeDxg/JnfHmiX5VurRdGZQXslOQpmgcEdyv0dHAGRhPWWk9KtBp+pn0lFlrj1suYg6wnwgT0n6st/k4JHapSONPNSLTNQfdbAJgkVT675yCvj5CiwyB5StDxjScF94y6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dpL+bT6Z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=brendanhiggins@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dpL+bT6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=brendanhiggins@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqgmQ6qz7z30Sx
	for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2024 02:24:22 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cf6f5d4939so8398a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731684258; x=1732289058; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CbonmGIEt1LytS/5LcyBBLPi6YyB8nOYoG0UOl1eSo=;
        b=dpL+bT6ZwPL/F55EgQQi7iwxD1rRbDk4tjz3y9qiz2vL0QkucRgbTzk7kMVNqMz88M
         xIX8FHHB2FXruKj9viX8Jg7K4bE1nsnWLYF1XuZIxf6TMS7wiC44X8EqxOlWkFF0nrW/
         MrXGOcb43wC0Jvj0RtjXQKuqBLhxuZNckg1w1deSmr1ZjkCzDwJlUEreM9dCrpAFVvB4
         LShFU8ySkOX3+m76XmFN/nKB+qs5Y0iVOEkKQPuMqAdPki3caHRVw6SNRJAH/JJfQ7vV
         n2aXYykCAQhOjqCt46Ne/qLvv38YBd24v5XELUdmGwBVIgTZ/m0A6g3lx5AD9OBrSDkE
         IXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684258; x=1732289058;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CbonmGIEt1LytS/5LcyBBLPi6YyB8nOYoG0UOl1eSo=;
        b=c75xDGOWwswphvj6PBunrwse/ZxBzwF6WP00fEg3mCy9FGaYVsF0sp9A6a9XkCvWUJ
         7DBKNpJuVLp466yo4FT2iJryE+eI50axUMVVzNDtAjmQN2QaLIaijjJbEGpAZENOeSxm
         bSqkg/eS8LqYYGxzIYHSvr4bb6LirP08/LYfgulQO7etusxnkLjl72z6qYz2WLgQKxzf
         wDTiDMtSl+p6U1mSvpQKim7BDrP33otTli5djq+1BW/fuEmOiFNzE8XZiBgGb2xIcCER
         Hlrnise3P6jR5zONwHvarhkV+/zgaOiJOwJAplsIdkubBVj0+/7vdvoOQFjoj/lOis0V
         Qszw==
X-Forwarded-Encrypted: i=1; AJvYcCVBRUbuiH/kfzApiyHnLn8ADvhCDb/8QVW46OVJUW+OYLy3iwUv/GWS0eZ76XTq4OtUSBXQ30w8@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziQ0XT783f9hIYhMa145QH/u+Shxq9RVtsOjWRzAIrfUpwxkeT
	pjY9o7d6gbuhuaZcG8QLIlwgopFveUwFDpGypF7f3sZ+rt1vP9GU31eSinNovKHsAdYqP5mikQb
	nbiZXYR/fn6R2V0X+RuRWNeAUpKZ+qsq1Mpv9
X-Gm-Gg: ASbGnctg0VC25xUqgfDm3iRl4nW6aC1zA64knmo4gmqnPxCgvUDLliRWe12SIPWpWdU
	EKkpPAjVDPEB9OlSFU62ZQGTvabklNoQ=
X-Google-Smtp-Source: AGHT+IE0eFPESw33JfWkreHkpBmuXVgMQWpYruE4CtoQxvuEgukCXd5q+5EAuID/wRomZNlf7jXpJVGQwrxqMyn7stw=
X-Received: by 2002:a50:8e51:0:b0:5cf:968d:f807 with SMTP id
 4fb4d7f45d1cf-5cfa069dcddmr30a12.6.1731684257447; Fri, 15 Nov 2024 07:24:17
 -0800 (PST)
MIME-Version: 1.0
References: <20241115044303.50877-1-brendanhiggins@google.com> <ZzcPJ9sweqxLZOGf@ninjato>
In-Reply-To: <ZzcPJ9sweqxLZOGf@ninjato>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 15 Nov 2024 10:24:05 -0500
Message-ID: <CAFd5g47+y0JH4StoKRTwJTQ2TsUCqmjdxqg=3cxY64Kous73=w@mail.gmail.com>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Brendan Higgins <brendanhiggins@google.com>, tommy_huang@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	andrew@codeconstruct.com.au, wsa@kernel.org, ryan_chen@aspeedtech.com, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	BMC-SW@aspeedtech.com, brendan.higgins@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Nov 15, 2024 at 4:06=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> > Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed entr=
y
> > and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> > I am leaving Google and am going through and cleaning up my @google.com
>
> Thanks for your work on this driver.
>
> > address in the relevant places. I was just going to remove myself from
> > the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> > then I saw Ryan is adding a file for the I2C functions on 2600, which
> > made my think: Should I replace myself with Ryan as the maintainer?
> >
> > I see that I am the only person actually listed as the maintainer at th=
e
> > moment, and I don't want to leave this in an unmaintained state. What
> > does everyone think? Are we cool with Ryan as the new maintainer?
>
> I am fine, depends on Ryan as far as I am concerned.

One thing I forgot to note in my previous email: today - Friday,
November 15th is my last day at Google, so after today I won't have
access to this account. If future replies or patch updates are needed,
they will come from my brendan.higgins@linux.dev account.
