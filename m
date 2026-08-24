Return-Path: <openbmc+bounces-2495-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B7CC5DF9C
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 23:52:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTSNt3FhZz2yr1;
	Tue, 25 Aug 2026 09:51:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787585018;
	cv=none; b=CB1tU5qmwFkYtp3+14g8gthM739il5oAfd0XjO9Qzc89Qauw03I3yKP/z9YraqIHMEr8Iv7db4VjxynzIQvf7sBRdC5TpdrP+EvRp+xeIUwjViUlQz70HA+9srJgcCsmJDz0waaGXMfio7FKIZ6sXrhvDdeYsH4DQRMFMC1QCuhZDsZWMIq7YXh2SYc0y0DCV8ISZprsV/SWQf/ph751f2TT4qbdjaUmqm72zpKHAqdi2u4vjsrobmzrQLfSwr/qQxSK214/ZSUD0gcZRH5lIBE6Abz35I2ddmRM2iAtxTWUBhvUXs0Vt8nSNg2MlaxyvuwfN2jaK+1oUQf6sz8ViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787585018; c=relaxed/relaxed;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UGgz4WGLuJE8ybxjmUgtrnD1ML7SaIkHLF315tAcnAtEYp6BCRhvIkrrbEKMGmY665Zs7+H/1x0oo+3uaVVMPcjAutdrQisI783CTFxsz+ZzjUEfcL3wqw1Y5odwpxiiPSklehpgfNEGwnx1XIjkWG5wVEWQRKyXUtUlTj7cQ/pmezaoW5x7gUdYxApbVvZF5HYa8820JXcI22e2mURnqoFIJNpe/usFZM7J5d62PcO+hUWC+WBsuHksBv6Q33kugtyRnTpVXIIqqpJBq57ieRyUzNhm0ypiPRbfAy/eQwFcWN92lclZeveYBkVCLlop23kOY85ij+KQXp9Efz8JVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjdIR1wr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APoGnSDM; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjdIR1wr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APoGnSDM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTF6x4Kbyz2xpv
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 01:23:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
	b=GjdIR1wrlljmRwfJk3l5VXV7fTfNcfmGg7Z4+RC0+1CRg7e0YTSfJSE7hYaNG6Jc9aSkwi
	YQjfAEIBGXO/WfvWRMO+fo6ujiLiO6m6/sjfTgby207P3xXL0ajMotF0yxuq7SEWrXxkLw
	TcdPGYwcCfowog/++IRfoMqawln7fV0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
	b=APoGnSDMNWT8igCrQaUfj3EJkeUZJ6iLaWo4v0Sb3PQ1wD37bvR56ZA2iLUDZEgF+rr0ud
	LpsBFZ720Tz2il7v5FolGI4Gg+GycJc/kmGEFRN8TPUJOKQ+1GzlECFiCNfAj60JXyEzuC
	zSqZCorrn7j48N0f77bBVpw83tm0CEo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-ojVt8v8GNt-C4pkodz_7XA-1; Mon, 24 Aug 2026 11:23:30 -0400
X-MC-Unique: ojVt8v8GNt-C4pkodz_7XA-1
X-Mimecast-MFC-AGG-ID: ojVt8v8GNt-C4pkodz_7XA_1787585010
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so28743181cf.3
        for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 08:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585010; x=1788189810;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
        b=ixrlk+LKKlSCyfToVXpLLWtyAsE6wiw/Di+RuqQaGSUTLqHElV1SbitwnmE84nIK6F
         Uw9zBa0CvbIcCS3iZC510cAUAsxcOa1VIeWXyXMF8shSJMsmK86yGxEliD+09gWqMw96
         eu/B2VkRJpwRILOKLiHlucVyRvnBBVVJf//Lx8/snrn0jV4n8g9n5AqY+5KlyXFXWP76
         COAefXxD1BByGPIYEo67nIsMgFmOdw1Q3TQrPobk9IkBXhVhEmlsZ4y6awoENj9J5LVc
         GT+lg1er1hiu/ZS0YiBE1XEOHBKIYaArcszKRnSdebEPVwDWpfZ2x5M/2Dpr80gw/yN0
         xaBA==
X-Forwarded-Encrypted: i=1; AHgh+RpKzf4e2c0uj9Y3OwIeQNAnj+oaS9M6dMojcipf1fCSTS+CDpXThrak6ePNrRt52YqQwl4yHM0+@lists.ozlabs.org
X-Gm-Message-State: AFuF++kqY4Dz67O/WH4dq2X39pmxE3yxcKKsIZf03dqsDQeMye1Opqad
	H2FJL7L8rWVsuumR8Tt6J8rL6I4vfOd+Q1L9P4oheCjbp78GEP7KhD8hfT5LeMJ79doA4c/ELXk
	tExtpuWRiRM1Nb1jMakAttc42Hs7k+EAzOa1qK3XIwYiliDtT3j2dofmm/tOO
X-Gm-Gg: AR+sD134WsA45CD9mKKifkArl2Nvh112SxLJGaJEK/ySNgeBJX9eNbVubavlMl/kfpR
	OahaQ877YIJAByfdf+O2leNnmB8MFG5kip5uvEUFLcj9EyPP5EvfCJmY1awnmQyhEv0N7xxmZZr
	JpKoSDNJPA44HuhBYJc+A0tkeCNJSN1L1tIqJdZ6pW0m99opgubxF2vDBX/fEp0R+eZGv+T+kpF
	91akW/lCGNGcIftMLAQFI/dyMLOrZAkOXqoQX85BOUnV+ifo4AFeFJdlt8OyiDEJt/Mc5jdyH8p
	EJPiGqii8STh38CnNqBY3uH1bL5Vo/OgdQdWcguWtrVVCJGHdhmARBsNkrcEgMU5UBEP3zE0FcC
	kwj4jY0lf+KFwex5iOAN8mgYUMhsvF37a3X0=
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291839271cf.30.1787585009886;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291838151cf.30.1787585009336;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65764626d6.27.2026.08.24.08.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:28 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] peci: controller: aspeed: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxh76RQucnlttcA@redhat.com>
References: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
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
In-Reply-To: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UOSNjN4jaQUshlVa6ul0nPa2xHcrd1KAWPpqis8v6N0_1787585010
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 12:08:05PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


