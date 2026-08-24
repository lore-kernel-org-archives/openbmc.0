Return-Path: <openbmc+bounces-2491-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A8FC5DF9C
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 23:43:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTSD14Z6Qz2y2g;
	Tue, 25 Aug 2026 09:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787585085;
	cv=none; b=QWSSDSQFit59WWWipIf21sxjKLteN4HGhNP28O8Ga9o//KA4XZn/9lTlAYUW4gUKZSvHUFL+TGurSplISzET41wga+6NhtGdHanYzPcMt4GClBjG905GUb2Ym5WjvZpbQQmhtVH23VJwLm6gdFZUwqMVwRC3jtYxku/D+9UpUCQY0e9yqQAcUFGIPOrR6VgYCvysXHoSNcltHx/7B6fJlPPLS5x7yTjSqXEVyKSXc074iwCwuVuAMmxY9w6HYcTnuU4zvGYClCsUfqrZfli03gZczwR6iwWCtqmQKHBTcFEckbHe6ejyZfrLRHYesmWEbLs2jN988fkl8MnEydoDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787585085; c=relaxed/relaxed;
	bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h4qS4ZwrOleC8hX6ZxfpRyqs8oKYEVtCtfpicHj8nhXrnlbA2FkNVZ7PLOKdl2S5TigI19asVJyj4qNJFd5U2TA6Y+960XK9m+hKnHyhJLqM1zE8IaUbxCEgN/IWmK4EJnf0H6QPs5hd4IzcslvQNDBXfVI2egbyJF0f/ZNdU7rGUthoZtLz+1ypaaAzbhhklJgMUW97C8h0aXEN4v5W9W2iJ37XxuOSzv26mLJuQyUvXLjzbjSOJbULI2ZVpmbmVgdPUtoceAXWx8sI3vXmaLXRy9Jv3a393KkWgXKc7ANmcBmoNQXSj/F00kgw1zh+3/3kw3pMF/b9hwe+o7yd8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VsyRkK+U; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UTXcPm6+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VsyRkK+U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UTXcPm6+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTF8D5jsyz2xGt
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 01:24:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
	b=VsyRkK+U9tmWDmjL19H9v8WSHQSJTRoJgNWwFtFs8l9NBsBZCUHqfnqhtXv7FI32fU86RM
	B+JTe1GsZeJUjHZj16Sl9yIVN98kKUzavQ2LJLBP7H25WQ0m58j6AyqJQq8XuCHr/fFwyY
	AsoO4k9E6HO3MXvoq/6cJoJyJo94xNk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
	b=UTXcPm6+VXpe/TpmCLNe02a7z32Vm1GuMVJEq6aTvCQbE7g5ymRCtKkeJ/DJe0NPgpDwbn
	33c5qnZraJaoZUEiSfpkp/G8ruDInRv7wdhO6YYntxdlBDX51/UGdDbcz2ZEntg4X27Z3A
	N7iolvpZtll4bEymKo11sBd5KviB0s4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-1MMrtgvOOzi9pI2WmStOpg-1; Mon, 24 Aug 2026 11:24:38 -0400
X-MC-Unique: 1MMrtgvOOzi9pI2WmStOpg-1
X-Mimecast-MFC-AGG-ID: 1MMrtgvOOzi9pI2WmStOpg_1787585078
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936cadb0e8bso228454485a.0
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 08:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585078; x=1788189878;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
        b=ME76ZTzhpzxU6v64qBjbDYHbA7MQsHqX7Lqonqr+tOe0XAZguVg2k7hCi+4qe/NpzK
         u+9Vs6lDNX+7LJxh8ZRygAo+5mNX5Jvm4OSqCBcrczD4asdyLIW6V6gBUWqgWLWn6qVA
         WaHlptETEzY7jQOQwVoqS+WNMHzJlIwtWgDBLP/3m/EaK/zEgEvHqf44wlYqLZW924QI
         4DqZfTb8zlDBTr7ENQe+3rJ+A9l9/Oy7JdBDXqsxlr/iroT23MFJFoLRAxR6P63I5qIy
         ygOipgzgBCuVzvX1d7bCZslCn8Wj3MUQ3HqomvT45eh4orhZjAUQqYB0gnE964VrqXWS
         58CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrx59h068N6czUBJO1mDPrmjNvi5T7q+NdEViiAgMqDQlVHW91upnjgvVpkFXtArvIpMwnviOce@lists.ozlabs.org
X-Gm-Message-State: AFuF++lYI8hTM6TQ98fTHrUqbtRbNPtsjzAg9qEfIbvjCwsCprom4vcD
	SfPUxnN17OspNdIOpm7niTJv+ZqxmHN8TX+fMwO6oe4Cgiwcr9ugnw45cJI1Sy1Us5Ha/OQfQ5n
	wZ/2sQ6qw1tsZ989S7bI0ijG0USRlnhMOO9xuFMH3x7hz4cmYqn5s/XJfdfwB
X-Gm-Gg: AR+sD10aMn20QG7SGZWKK6Fvbo6zLxkrYTShGTlXoVMkV/5aTSUBTRxg7v5i7zFYw79
	5pFdNx3XNGnAt5eDTNxAjOzDWX+/J6dElHWk/dSlgz9JPfF6FXNNSteGWwuPulN+WT4ccItYo4Y
	m0RLEgtQbeanm1/E7LsEq9ISOVtC5X9RFRj6XyBTjocDcUimCtYaYzVOzuXnMxO+jVvUPxCeYbu
	Uf1C+ZAfnczrgkKkvoA1cckCvyTHeq+8x5MOcaRw7PkTRpqOU0VPesU9/3WrudHYdKcmsbVDL6u
	pezNQ3m+alOD3lNWdWQo2lEaAyXQwDMdeAQ4wqeO/8anr8seTX7cZjHufYxFs+9FJBacD0qig/9
	3Lkl10sMlJaZ1p/cf8ksn8krNq2mLux2a+w0=
X-Received: by 2002:a05:620a:4148:b0:92e:7cc9:a888 with SMTP id af79cd13be357-9373942e4b0mr2548675085a.2.1787585077811;
        Mon, 24 Aug 2026 08:24:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:92e:7cc9:a888 with SMTP id af79cd13be357-9373942e4b0mr2548668185a.2.1787585077349;
        Mon, 24 Aug 2026 08:24:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749eb15f4sm522227985a.42.2026.08.24.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:24:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:24:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, linux-rtc@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] rtc: Make sure clk_init_data is fully initialized
Message-ID: <aoxiM3te751QfPJn@redhat.com>
References: <cover.1787241693.git.geert+renesas@glider.be>
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
In-Reply-To: <cover.1787241693.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FsagmbuIrjqyPppJw3_F44YSVJhL5C8eQSFgpY9hPJU_1787585078
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 12:09:01PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the RTC subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


