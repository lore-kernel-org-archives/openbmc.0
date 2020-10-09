Return-Path: <SRS0=hdvT=DQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1A3C433E7
	for <openbmc@archiver.kernel.org>; Fri,  9 Oct 2020 17:56:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EA02076E
	for <openbmc@archiver.kernel.org>; Fri,  9 Oct 2020 17:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snZdQPHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EA02076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7G2v0brYzDqXW
	for <openbmc@archiver.kernel.org>; Sat, 10 Oct 2020 04:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e;
 helo=mail-il1-x12e.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=snZdQPHK; dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7G1R0gRLzDqQ9
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 04:54:49 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id t18so9892298ilo.12
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gUVyT34h0r2QNRDDr/bROc8/fAXehJjR1qD5PS2JbHY=;
 b=snZdQPHKmcqqwJNCCVRKLDg2sG4MHcp/kgOVOa3dkoqDBpNpJFWqUAaVArsSOYafKd
 1Y9CfCK+aVDsj2Znk15sBkMwz/87xz5/8bEIuEcfsbLAeFMrKyry1QJqdaE15AghwUmI
 OR5zR+8P361pUK4Muv/qZax3fonz7zNbEQuj0LO1SgKNfMoPF9v2mzEo8uvNugovjCuK
 egqeFhtHaRyfViA/0JaO8hbiJBGyo8fBjrM57efR8DOSCugN6RL7xrSWX4gkMrQyatwJ
 8zy3qHDElRc/XDlrEt2Qda9McY7we0Tdq9UCMQWr97d8zjQvcH01dNNoTP3bCduZuKMG
 yWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gUVyT34h0r2QNRDDr/bROc8/fAXehJjR1qD5PS2JbHY=;
 b=B8FzB7DEakLl63v9MTsj89ETAAGuE7NhFlSjuetf1lc44lEcKUai/U2X7R658dBg29
 WyojmwW7XZlzcpz69QoFeAtS23cnG1A5XF6QdmkngmUkQcVru6jtGHhGrJCPkfz97Slc
 njf3bmy4OSYBxZWsRz8WF9OaBsDAt1wfMO26c8RZQ17uN40j5TpIfj047NyaeGwSNdfi
 ldpMPpE/RNjcwlNdYm0xTlIMpZ2vqtq+bKtMdbqr1YAJShlurqyIfeNxKGFJ49nE9hB6
 cvABIOJsxc4qnU4S0H0vhppkvaQiYRjX5PlnkJxsqTuCmxsiwQu2unvztF8uL6a22DWI
 3Spg==
X-Gm-Message-State: AOAM533CJeWEBOsfnJUUnFRE+wCOBr8BooKMYnNiTXGrNct4cfOmIisX
 yFmbYlsiwtc1s55HpuoTSprowbGohCgWT6H5hXRLlPVJeuN7kQ==
X-Google-Smtp-Source: ABdhPJymKfeNj/f95Iha9RDEZUuQmhNbENe+2/F5tx0kGRqhPH1Kb8HsWrdIT/Qakh4Fq0cpRUbX8pFQ+PXoqHMuKhc=
X-Received: by 2002:a92:91db:: with SMTP id e88mr10631933ill.126.1602266084542; 
 Fri, 09 Oct 2020 10:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqc+eJk4P1HKZvx5JhNAcnRjnnHY2ZsquRXyrP74kVogtrkcQ@mail.gmail.com>
In-Reply-To: <CAMqc+eJk4P1HKZvx5JhNAcnRjnnHY2ZsquRXyrP74kVogtrkcQ@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 9 Oct 2020 10:54:08 -0700
Message-ID: <CADKL2t5R5yOfcMHsXHce4_0zMcBg7KY23ZVNwF=YXfSc96oQSQ@mail.gmail.com>
Subject: Re: Nuvoton WPCM450 Support
To: Mac Wynkoop <mwynkoop@netdepot.com>
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

On Fri, 9 Oct 2020 at 09:59, Mac Wynkoop <mwynkoop@netdepot.com> wrote:
>
> Hi Everyone,
>
> Does anyone know if the Nuvoton WPCM450 BMC would support being flashed to OpenBMC?
>
> Thanks,
> Mac Wynkoop, Senior Datacenter Engineer
> NetDepot.com: Cloud Servers; Delivered
> Houston | Atlanta | NYC | Colorado Springs
>
> 1-844-25-CLOUD Ext 806
>
>

Hi Mac,

There's currently no support for that BMC in the kernel used by
OpenBMC. It would likely be possible to port OpenBMC to this chip, but
no one in the upstream community has attempted it as far as I'm aware.

Benjamin
