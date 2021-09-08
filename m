Return-Path: <SRS0=GQ2/=N6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370A9C433F5
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:03 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D74660EE6
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D74660EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4Kcx0K1Kz2yMs
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 21:28:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UMfQnx4b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UMfQnx4b; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4Kc50Xlbz2xsN;
 Wed,  8 Sep 2021 21:27:14 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id g14so2898639ljk.5;
 Wed, 08 Sep 2021 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zArPnbgBGxH5qbqpeK2J30GwRdILfZEvn45KQmNxalo=;
 b=UMfQnx4bcQZd5SvTOkMpm6L/1WKlh7Eork9Id05e5fk/8402XhpLqn/zQMTVXqAB6I
 HkFbGZwgYdA6BQ/mbAhqEe/4NOEe7e++lsWUE2NQpo3+zwvSSHmXvScg865STNrCrp+G
 zvpXoSMGxXiB9sjQXVL//9Xvunon1w700gEDOaO9YUOsYeP2t7+simHTn2emLSnfDlJu
 W8yPjGOIVO4hAIUbTfaDgjPgzJaVIlPVGp94GGVLeMoxPL+JgcpZwL52x8r9lBfixozQ
 FiZVcPHKK2D9tynhO3/izirk4gJ+wOQXeKSkw9KD2kRE5asdq4VFLI4eETuAAGxEzmFU
 cwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zArPnbgBGxH5qbqpeK2J30GwRdILfZEvn45KQmNxalo=;
 b=hS6KbrBbLKHvFoZIHMEYwPsvWfDPbCR/kiEw5jm1T8Xs+QJLeUYgLFmcex8IZqkDwI
 e+kMaQMPvLcVuWvCSAO7NJ5j3A6k4/qgGY3m//J1fC8lEE+GzJMU4FEhiStKUrUYdBaV
 ByPbMbu36fNFQNNUOFxpKD0rRD+s2k+mKivc4yrX1BruvTUnlOXhwr5giN7hTtksfqyD
 PMOBJQ4CY7hf0op4XD96nCZs+n/ayETu6w/dLRCRLF2xiUOsIxRez28KhcdOLqgmiTJv
 mgieZgrTnrmCXY8Nk9bujcWGjYKviVCGbcBrAVPkuHsPY7/gMENt/L7JDgbI7Sm1DB31
 aOLw==
X-Gm-Message-State: AOAM533gc9bqDSUCQ39Xj+Wwmhk9gK1PO6LJYGBJCHiNZ/dhH9P9DYab
 oQt1PxyeTeN9soL4ZeJQGfk=
X-Google-Smtp-Source: ABdhPJy8Hv43+g0NY1Pmxc4LeynlznWNToK9X9xFqmpQtYjskjVO7X1CS7pVbBBfoRlxdo+/v3iHfA==
X-Received: by 2002:a05:651c:154b:: with SMTP id
 y11mr2243226ljp.480.1631100430110; 
 Wed, 08 Sep 2021 04:27:10 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id a23sm204070ljb.95.2021.09.08.04.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 04:27:09 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 188BR67i015807; Wed, 8 Sep 2021 14:27:07 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 188BR4Rh015806;
 Wed, 8 Sep 2021 14:27:04 +0300
Date: Wed, 8 Sep 2021 14:27:04 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: VUART compatibility (was: Re: [PATCH v2 0/3] arm: aspeed: Add
 UART routing support)
Message-ID: <20210908112703.GC23326@home.paul.comp>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210908094248.GZ23326@home.paul.comp>
 <HK0PR06MB3779180F75DB8BD872F8A78391D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <20210908105245.GB23326@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908105245.GB23326@home.paul.comp>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 01:52:45PM +0300, Paul Fertser wrote:
> In this case do we have some way to make it an obvious error to enable
> both SUART1 and VUART in DTS? If they're conflicting surely there
> should be a way to express that?

I have to add this idea is obviously silly as we have sysfs nodes to
specify both LPC I/O address and interrupt number for VUART and
arbitrary numbers are allowed (so it can conflict with any of the
SUART port) so there should be probably some runtime checking in VUART
driver to prevent that?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
