Return-Path: <SRS0=1wFR=KQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11905C433B4
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 03:00:35 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8320F61244
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 03:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8320F61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmWZ86cs0z3062
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 13:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ajZiMQH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ajZiMQH1; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmWYS0shyz2yXt;
 Fri, 21 May 2021 12:59:54 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d16so13854807pfn.12;
 Thu, 20 May 2021 19:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bNbYR9JbwfZkXn8zhgxSPHGRk+wq1MKkziL+l6LqDPg=;
 b=ajZiMQH14DX2f8eFpjpv6INp+MxcSxkanvspV5UPP0SUBoWwoOpvmVNZ38RuL5Kl2G
 VhoSyjDBMe/MvRCiPBDiinNmP+860EELmWie4TmnpftFJ//2XdLSMS2hAKEx5GQv9RhP
 xmWjjmNmjP/ZTHBh48k9nXKn88w8OwNV4HpPYisDDfxIgHZuef9gWL8RZx1GRUTTxWXQ
 NBMbcD4Sz8/Wbr5R3EXhmhH9JYn1K7Pj1kPbMiSq+j2ksB6SqZuxVVYD8uVfEaHYSiMF
 RMuSP+AwuRrltoNH7sGgQM22SjI8ay+BWQPyKdJKIdE6k88xOhdHeeCDqcaYI36anZF3
 98wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bNbYR9JbwfZkXn8zhgxSPHGRk+wq1MKkziL+l6LqDPg=;
 b=c4gFYtNFYgyMt5NpcbeXsUq8K1Q9mNqAvaFNur39ng2+IgUfdYzfhVhKINzdb8nmbq
 lt/Tne31eDH6uvU0TFUzSEUw0JM1qPpq+1v/QGDwWtyCtX+3ZiN2TDclVZZ7VFXpKVTe
 W/SHH/b6PUeyl/P1G1yPAh6n0V6/H6oYF4NI4J4dyu9gbHCc0aT+pLIBD4WjiKpi0nNX
 T/kMyqanhY1xa6IWXCyVQVhvY4EQsgqY7Ig2EnpFiCvV0S3LJvyHqeXHAlyG/Yvj6/ko
 FBZfORFjO7X7DbIhURmRJ538VPyUBKDK7SySl9DrtwYsR2woHT76pQvlLH/GIse+M9Jr
 HzgA==
X-Gm-Message-State: AOAM531Dl+/Nk5nKwz2yC5MOsC6vc62+r0E0fFhDhUdrJonb0dp8eHtN
 u77+F3zGYBLISmMZNxylzBw=
X-Google-Smtp-Source: ABdhPJzeRIgNVMmtqCUFR4GUjPqKdMdD2zybgZ3+xdcvECerOxgxbpnDciqXgp3lJheKEpOt3A+U1w==
X-Received: by 2002:a63:cd01:: with SMTP id i1mr4723979pgg.294.1621565993099; 
 Thu, 20 May 2021 19:59:53 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id 128sm3048945pfy.194.2021.05.20.19.59.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 May 2021 19:59:52 -0700 (PDT)
Date: Thu, 20 May 2021 19:59:44 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521025944.GA3450@taoren-ubuntu-R90MNF91>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
 <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
 <20210521024412.GA3004726@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521024412.GA3004726@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Amithash Prasad <amithash@fb.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 20, 2021 at 07:44:12PM -0700, Guenter Roeck wrote:
> On Thu, May 20, 2021 at 06:51:53PM -0700, Tao Ren wrote:
> > Hi Wim,
> > 
> > Not sure if I looked at the wrong repository/branch, and looks like the
> > patch is not included. Do you have any further suggestions? Or should I
> > send out v2 in case it's missed?
> > 
> 
> Wim didn't send a pull request in this release cycle. I have the patch in
> my watchdog-next branch, so he'll hopefully pick it up from there at some
> point.
> 
> Resending the patch would just create noise at this point; please don't
> do that.
> 
> Guenter

Got it. Thanks Guenter.

- Tao
