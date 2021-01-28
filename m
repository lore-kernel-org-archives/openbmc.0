Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E913DC433DB
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 05:42:15 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1BF64DD6
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 05:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1BF64DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR8Vq20KDzDqC8
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 16:42:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AOOs+8oX; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR8Rt3YrrzDrgn
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 16:39:37 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id a7so4241118qkb.13
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 21:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=y4E/Yqc95WZr9BopGgmVE0ApJqsRoVhjMJME0nU+fW0=;
 b=AOOs+8oXWJuBF2kLoRLPo3GzvL5/FCqB1q2gZmhpqJWVaqtDoF65kSyoF+0DZ3YtH5
 e8aJ7QMgAz2qhEipa2H4s1ieOo88bQ1T8WszCRY4d961DhWBewvwCZIlJgeI/un12dkI
 f2+bcKFEZ9nv/NPeLDo9UZ+VIFN6tsvBEpjJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=y4E/Yqc95WZr9BopGgmVE0ApJqsRoVhjMJME0nU+fW0=;
 b=CqjDxOoJBwB6loCJ5iL3An6FofJ9wI3FGnK+ZDIpsKJEG3kOGOLiBcwBF0iyCGAuy5
 9YvCvrKXvdRJSn1GKil6uZzR2uK5/BPSdRscl+Gp1n4biG01UHAeN2xx28rGIQVoiSiS
 SvUZz6ck8axW++DTtBReavG2Jr82M7diSZ9RfpGAb7Zli/3KnS0e6F6GjexkCrtFu6lC
 eATKeytoV5Riu0U2jqX9d2k6sq0LN9GXzPueJbBzeSFfpnA0YXBFS2YP3wjlOkraqALI
 f6yqkrJ3ixBp2joBdfHxZbtaeVSwCXgeC3S5WPd2QJ3xZHTQFFqzE14nzqlKI6UnezwK
 O25g==
X-Gm-Message-State: AOAM532xSD/rCwrBi/encOwRHxeNmzWNeFF199pi1dDq/OU2Z3Epq4G+
 46EOfd//JX9fPmBpGWR+Y1fyOWQgZG+3XBkBmpZnEBhs5sU=
X-Google-Smtp-Source: ABdhPJzWxM4CO2JogrZ2PGsJU/5UNvYMoaVQ3ofFht2g7sMKoi06UUVdbyPOctmBI6VwUwKbR/CQuDuaUthb/44/sns=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr13845564qkn.273.1611812373814; 
 Wed, 27 Jan 2021 21:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20210128001521.266883-1-joel@jms.id.au>
In-Reply-To: <20210128001521.266883-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 05:39:21 +0000
Message-ID: <CACPK8Xc1kyWoGOJqyW9Y-YJJUXEdtt_PBw9-FAuQsQaPHnf8iA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/4] FIT verification
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 28 Jan 2021 at 00:15, Joel Stanley <joel@jms.id.au> wrote:
>
> As part of our effort to enable secure boot in openbmc, this turns on
> FIT verification in the SPL and u-boot.
>
> It adjusts the SRAM layout to accommodate the extra code size, moving
> the heap to the non-parity checked 24KB of SRAM.
>
> It also modifies the way the SPL is built, including disabling features.
>
> v3 Reorders the patches to put the size reduction changes first, and
> then enables signature verification to ensure the build can be bisected.
>
> The ymodem disable patch is dropped, as we fit cleanly under the 64KB
> boundary with the feature enabled.
>
> The general cleanup patch is dropped, except for the DOS_PARTITION
> change which was added to the SPL cleanup patch. These cleanups will be
> posted separately at a later date.
>
>            Size   Delta
>  HEAD     44054
>  patch 1  43442    -612
>  patch 2  42337   -1105
>  patch 3  42337       0
>  patch 4  63378  +21041

I've merged this series into the v2019.04-aspeed-openbmc branch and
submitted a bump to gerrit:

 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40076

Cheers,

Joel
