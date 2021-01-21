Return-Path: <SRS0=9oG3=GY=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2A0C433DB
	for <openbmc@archiver.kernel.org>; Thu, 21 Jan 2021 16:09:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7CF823A1E
	for <openbmc@archiver.kernel.org>; Thu, 21 Jan 2021 16:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7CF823A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM6lQ1z7CzDrBB
	for <openbmc@archiver.kernel.org>; Fri, 22 Jan 2021 03:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eTl/2mSt; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM6jX5F9JzDr83
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 03:07:26 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id q205so2595017oig.13
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 08:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MN8B4AhL17FCSPVj56RRy3v3COLVWl6DlH3q8xUXEbo=;
 b=eTl/2mSt9nWTZAbCkZFQBc1F1X5E2+XizMy48j9xWyoXWHbVMmmjFttQjxg7sx3kqH
 v5eHrihJc9lT8q0OmliBwgINKDa8HQ4ld90ACPevV6dnrU3hlcF1FlwZxa+R/hFb3qQ1
 9bsM1bDAp2A1jvO75GMf9vM6B3XOKQjKF/sCO33a+l9JQdhnqnTIhVbBrNudCy8cmGFo
 Pb9JFYVzbKJlFCTqun9MhrIFRv1t7BIy6oAEplI4tjewspNlU45KKOQkW+Ua88JSqCjT
 haoujNeWaAk7LMR/sAveo+sbIOFt062vKHsHODgfF2+AFaIEGyG2o1QD3LQbNALMtnUi
 XjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MN8B4AhL17FCSPVj56RRy3v3COLVWl6DlH3q8xUXEbo=;
 b=rw8+lCFcdJUvkYKiftGjzONw13SQWbWF7EkTKnaz0GfI6eyvZiu5GsgOy/Hbj1SJEb
 Th/HaF1u2HfQxLCEmAYvpQDgD/rq3OHyWZtiPBPfPwR8menCeLFlHcZlvxikP0RVzPJK
 RcMuaopsdYg3K6GayTvcWa7lAo5Q266MzoYBeyDKgSt9mbWncVoASS7QPPtR+kRIaT+d
 PQ9fHcwdC3JZbbq5Ipg2y3coM9SmuAC7KwXhKXdhuY+2uPyAZpRX7GV/MiYW7wCkmJ5F
 dpVofJXlVha7lwaHwY5m3dyMzlGed5iMqMOqZi6QKrqB5TQ3Ao8BwI9b79S3D1Ag4jFS
 fZkg==
X-Gm-Message-State: AOAM532EvappmhzDNGlxjYJpgHOsqIJLRjuNvAQpP7os8OJ9HIcQ7hsW
 hvqUxtR0mfNd9e3QGXFI6KVxl6Ae3z3zXg==
X-Google-Smtp-Source: ABdhPJx3rmudTxQhyCcVdL3Yeis727yFcAmExMnxA3YgDF5QCVyojZDwI3do8fWmebFAGd702m26MQ==
X-Received: by 2002:aca:3404:: with SMTP id b4mr168320oia.77.1611245242588;
 Thu, 21 Jan 2021 08:07:22 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:e93d:30e5:84f3:36c3])
 by smtp.gmail.com with ESMTPSA id i24sm1040177oot.42.2021.01.21.08.07.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 08:07:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Gerrit owners plugin coming
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
Date: Thu, 21 Jan 2021 10:07:21 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <F55AAE75-B6DB-4185-95AB-4318E725B0C1@gmail.com>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



> On Jan 20, 2021, at 1:23 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
>=20
> Overall, I hope that this will be a great improvement in the overall
> structure and usability of openbmc, and remove at least one stumbling
> block people new to the project tend to hit.

Thanks Ed, this is going to be great!

Brad, we run this autobump[1] script in a cron job right now. It scans =
the meta-* layer
recipes and creates bumps into the meta-* layers as needed. I assume all =
we
need to do is tweak this to just look at openbmc/openbmc meta-* layers =
now and
do the same bumps against openbmc/openbmc?

I=E2=80=99ll continue to utilize openbmc-config[2] for non-openbmc meta =
layers=20
(i.e. meta-openembedded,=E2=80=A6) but no need to run against our =
openbmc
meta-* layers after this change.

Once we change over, I=E2=80=99ll also be disabling the meta-* layers CI =
job
(https://jenkins.openbmc.org/job/ci-meta/)

Andrew

[1]: =
https://github.com/openbmc/openbmc-tools/blob/master/openbmc-autobump/open=
bmc-autobump.py
[2]: https://github.com/bradbishop/openbmc-config

>=20
> -Ed

