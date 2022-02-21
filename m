Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4079DC433EF
	for <openbmc@archiver.kernel.org>; Mon, 21 Feb 2022 19:49:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Xv15s6pz3bcy
	for <openbmc@archiver.kernel.org>; Tue, 22 Feb 2022 06:49:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XhIvDFN3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XhIvDFN3; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2XtG2Zrtz30gg
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 06:48:52 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id j7so20558077lfu.6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BudZ8j4URaolnotMr3tBwzc4i/zo363P32YAL+UbJbQ=;
 b=XhIvDFN3HbL8RHDsuCzOx/EU9gYKn4eZfmbUoSwuBRN/L6K+Sy3+Xj+ZW8/H3+iKq7
 qP/eO/J+p5lIboGpElo6R5dt04kbDHtHjLj4ZzImqksm9O+o59PwVgEhXs/XjcHnidSL
 nnXQwc9fijnVrz7mMt+QsMV4eArI8SQ/eDx9obrsc5pq73wxtK4zyT7WSvvrU/2LQgH7
 G+GLhfRw1C9jbLiT7L7zeNJVUwKsnafwTmvdNOmIY1Ar9wLe6g5mD/6dlT0881NMU6+r
 ebT3NqZr5oKXzOc9drcHy2IgWD+cC6KxExkoQDvYrhEBRYRjM/G1HmEDxQDTpcDLj62G
 2wMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BudZ8j4URaolnotMr3tBwzc4i/zo363P32YAL+UbJbQ=;
 b=kTvGNrvPrKCJW7uWdTyR84GE0dR6i8MdlfEhaVSsYCJ9CsBf4gjcuCu2Uf8nRxtgRr
 0AYlfJqQa/kjwqX3PYMMUKBkFYxVVuWdfnhSi1JVSbBtTHtScYXAbSA2qh0C3r+qN5rv
 EP5EnLotgSREs8Zea7u+RLl5NrX9qyGPbUKXJR1lhRK8GGiq81BE0USTy0eUuFOHoqFw
 B9eaE7F+nNyYU3jZ8Q2slHaheTooZ7aOZ2XnTBRADQ4zYz+mmbp60UC/pjUw2C8ABLDb
 LmeDATsNrtO70eKcQgWrVWwQwrM9z/iJbza8a+O3N/sppKjyp0LWixwlzhD2aQ+JFCS1
 2MmA==
X-Gm-Message-State: AOAM531U3wrk+32E5NA8k+FqttVvyohECk1533XGccFiH7uCHD0o2hjA
 Glmg1DQvMkFKNBFuBoCChwB+/vtTUWMINuLwIz0=
X-Google-Smtp-Source: ABdhPJx+JIpI+rMBPXf53dLqeg4QZ2RN+1nQLUlKh8342vjN4CxL6BiDlt4ATVlUR9DX91IQ9hjOV+IdJUVQYpnbOFg=
X-Received: by 2002:a19:4f02:0:b0:441:39df:161c with SMTP id
 d2-20020a194f02000000b0044139df161cmr14833048lfb.504.1645472924220; Mon, 21
 Feb 2022 11:48:44 -0800 (PST)
MIME-Version: 1.0
References: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
In-Reply-To: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Mon, 21 Feb 2022 19:48:33 +0000
Message-ID: <CAD2FfiHBHrc2WSSgsQUWqobYwTv+8wrEaQ39Nyr0F6Ed59TiMg@mail.gmail.com>
Subject: Re: validating secure boot settings
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 21 Feb 2022 at 18:23, Andrew Geissler <geissonator@gmail.com> wrote:
> So, anyone else interested in something like this? If so, any votes on where
> a good place for this logic to reside would be?

This seems like the kind of thing that we'd be interested in for the
HSI specification[1], although I appreciate that's only tangentially
OpenBMC related.

Richard

[1] https://fwupd.github.io/libfwupdplugin/hsi.html
