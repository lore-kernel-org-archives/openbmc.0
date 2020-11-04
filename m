Return-Path: <SRS0=lSEV=EK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3802AC55179
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 00:44:07 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5C8223C7
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 00:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLXmUJ64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5C8223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQnw428hmzDqd9
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2020 11:44:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mLXmUJ64; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQntg19wJzDqY2
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 11:42:48 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id r7so17344284qkf.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 16:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOUMZlfy1XTyF2tvyjARqdV7viDcNZyQn6hPv9OYozU=;
 b=mLXmUJ64sLni9qtGlQsXc+ywoUhDoTFzZKIjk+Etf75kwrlAvr1JFgXeKDghLy6iXK
 zY2DPXP1Z/vr0c+LEuxsXxfkRu2KPQ1I3QUMZSFV6yETuVxpWIbOGwg0VR9ZTEXBjXL7
 AKCzl3aY3oOOQZzq/g2dO+0KkdCaEntsDloOAWfLGAjzVu8dt8TuojG2rz+cm4BHcvql
 jtkWQW/PRJyT0MrVQI8uHYJrVk0AQB3zfHott8pVckDAEv+JKrC2LP4rE+zUfL0306bJ
 23bXtOkNX9i+2tE/Rj5LnbYh/7Et3gCJybCLenKc0RZAKF8CIuUeHsZkuFWoIuhX6gCk
 Bslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOUMZlfy1XTyF2tvyjARqdV7viDcNZyQn6hPv9OYozU=;
 b=q7DOhC0Yw7jdVwRZS0xRguo7ClttirOtwFV4BdbdISiF6C/64qpnWRhM+5o9+DOmMj
 yoo3utFbs1nGOvvYMquJmsxsoGML0DSwh+ckr8DMnN7PwvvmjK6hsUMwzjo3zXsNvfH6
 pwYXMDPYICImiUkpESmGCSwVqwW0OmbQ88OLWOjHL/KnqLo+dnZXRUK1Lpej8TLHWryT
 l0ZYfGIBdA96/a2p360THIjpUjwJND+5ArIh3KTBS6zaTjborURcKZVmzxyyKhgK7eP1
 Gp9SgLWBX86DBBrJm/OhgjPoJ4RxutKDDo7NCtYrw0w7+Z2Hvjq0Iw7XsrsdaBXASJd7
 eWLg==
X-Gm-Message-State: AOAM531sKWWrI5cqsZjNzhQgV4Asuh69xXBckhNHYBBCFhQXGLYJXGXY
 kvsFWw49+PiNL7xwxdNKSOOt5TYQha0Rf0IIN4ZqLQ==
X-Google-Smtp-Source: ABdhPJzx18c0VL6i5za6c1eG+rbGlzxnd1JmquhRqGys0v9cs50C/fvkloqgKzH+deYM/g3XTWret4zRJR9Cy9VsWHI=
X-Received: by 2002:a37:7685:: with SMTP id
 r127mr22146524qkc.261.1604450563847; 
 Tue, 03 Nov 2020 16:42:43 -0800 (PST)
MIME-Version: 1.0
References: <CAD_3qNncYz=iWjZ_3xxPuzeW_1vXCjTENAyC77A2KWa29B6KDw@mail.gmail.com>
In-Reply-To: <CAD_3qNncYz=iWjZ_3xxPuzeW_1vXCjTENAyC77A2KWa29B6KDw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 3 Nov 2020 16:42:32 -0800
Message-ID: <CAO=notx5cwo6Y9x_gvg0=cHBv7cnaPqowrOBRA-_ahfRAfy5hw@mail.gmail.com>
Subject: Re: BMC Mock Sensors
To: Junho Park <pjunho@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Nov 3, 2020 at 11:27 AM Junho Park <pjunho@google.com> wrote:
>
> Hi all,
>
> We're currently working on a project to mock out sensor values and error cases at the kernel level - we would appreciate if you could take a quick look through the proposal and let us know your thoughts on the project.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37870/1
>
> Any feedback and input would be appreciated - thank you!

It's true that using Qemu then only works on BMCs with Qemu support,
but there is already some Aspeed Qemu support and Nuvoton Qemu support
has already started to land --

Patrick
