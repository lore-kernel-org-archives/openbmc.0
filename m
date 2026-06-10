Return-Path: <openbmc+bounces-2080-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01BCCD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 16:10:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb9jB64Fbz3bpm;
	Thu, 11 Jun 2026 02:10:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1129" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781107806;
	cv=pass; b=GUYIu3bynG7rr3Eqjlg4PZy1+XXNb7u2BwYwu/GlPZXzajLFG7Hyog/QcJC5MSdYPbS/Arzqe1/ePkXpzIGIoOODfT86hZpMGDbeFIau/9Zrk57isU3Nq48Q7brXCLBBx0+QDZ7B1YjKkv9OQ1NsQZTIpn7P4AVTI+syw2HxgXc+42eXP9J2zFQCOjVGp3iCUqrd49sD5Bki64c5pP23x0MuxN3o2Hzpc4hYcYyISKTMnYP0WhNGjXjnx0tmVcMPp5sCdlnh0OMKKx8q4VIFDLpyO6CLvQDpAojpiaqrUcE3enXki3tyQ6pAkRGkLOUU6T7NNaHGLFSwlFxgItjQCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781107806; c=relaxed/relaxed;
	bh=lqAyKQN15kHR2LrLCcxh+DJcT+SCWCMBT+tQ8te8Hk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS56R7L9E2tSDBF9Rg7/qX6636jzMiawP7BjRR0UqQSq3She5+wUcz93GA7PPOPCMRpXQJ26TWPLLExUFHf/C40f8Gt646pNNpXxLrCEDRpzk7wGB0ADLb3Ou+8BI/3YmM5lklEHmy4vheL0CZNZIBY0i+WOQwEeN/zlXhnjIMW7dDAjSXMt5AWP8kpEuTU8fxAG1spFoJGgTXn7lhJq5lSdPW1V9jx+nJXSeKqCgpBV70E30cdDBVwrrjqMRoNnxO//KghzbNFNSFfr5CDFcax8kIZG3gzkiElpUYG/FLeIQXbra5So1OmNC4bq1YUihc03VQnZhgvnra4CGdy36g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAgZXe60; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=yash.pateltx@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAgZXe60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=yash.pateltx@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb9j945Wbz2yv2
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 02:10:05 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7e053987001so453507b3.0
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 09:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781107803; cv=none;
        d=google.com; s=arc-20240605;
        b=M8/XiGP1v7WnsfnRv/OmNfjru7mHV9kjX45IPAFqqy5TYxvR+Z8/Dfzjp2KKjoAI7j
         rDOJOh74QUXHFx91rEKIxk8S3bIew/n9yC9xT8c/AdahRu3zGQRBht0o2sjkjnys1D3F
         GXYdomU+fRs454+Nn9d9qIzgYoVN+HV+RLnzWiQtBAdVB24VbBwWUq7CUQ7u9XHarHRg
         7lUDe04IcpJdbqLQdKO3d+ph85WMTFpp+djEfkypT1mXKgH69AVmBCp4HX7G7RGhzfgQ
         uP565VDktGGT0kxCI9yp/jkNnc+E6xnn2PoqRoq0fxkU98VGgE/Yjgkuzr0WCJdNcqyC
         zF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqAyKQN15kHR2LrLCcxh+DJcT+SCWCMBT+tQ8te8Hk8=;
        fh=QU6h4AS9KCZ2jOyE3Nv4R7vs6he1A0mNvfNs8M1gA0I=;
        b=FIwpGlCkoECc9M/8ga6Q+Hy+wz4+1czlpuw1J4mULnv4xfVwqXxGQr9WHDKQjrUU1s
         ygyX/LZpvRHPiqHNufs0i9Zu0yXhwgo5jRdXXrvh20mD1XgsV6gANUDSu7KL6Pahxqoj
         jQVofLqTa1AQe54ORXdW2CWVMon/L02W95CBRSnO1OmIV8BJi3Ms1MtH1ZYzh8de+H6v
         YxpRsLzWXTQb2N5DyuiToVhu87C1bcM2YynXaFHyJb1jjg63DhZRFN5xgnanFFLKbqgG
         MX79Y0zl+ixlhqB0xmNX6lLmPiCNY/eu6ukS+U6ZAAnNXP/s7cZPyuOJzdErF9hMTAaz
         uQ2Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781107803; x=1781712603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqAyKQN15kHR2LrLCcxh+DJcT+SCWCMBT+tQ8te8Hk8=;
        b=IAgZXe60DWF26dIiqKmtbQfuXIl5vKHqaD45tIip6VcbLfX7syCGK4yi6YEfzs5K26
         /JTxLid9SYTnwhb5gMuG7OpXgE8eb989J/u/qcbKGQyTwpIC2wRYdiaArCuk0jQwe5Do
         6Kkwe0sOnjGgSDf6qpU6bQAhW0CO7IdwHmOs7XxRcwomFhwzsNXhgsGz9z+r3Ep6FHqV
         +6IBucWOoAQCA1DKRF+3Dbg1JMBkxo4yrWJ9V2xY/6ueDjHeO4Zs0xEMn+lxWWAbsJ7R
         DpjzmZ2GqX1kjasouBrhX43pczI24kVFNwTo5vA1Fnce2mK4FzzPJIvAAWZ+BTlrCfTI
         zroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107803; x=1781712603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqAyKQN15kHR2LrLCcxh+DJcT+SCWCMBT+tQ8te8Hk8=;
        b=XprEQM2UGn4oSUrBc0y1cJkG8YeyTYh+bVt8hVjSs5Yx7IcranoUBWZfefYnWLIMhR
         XN9h9JChvU1yb5FlPjfxEOrlnfMB5jo7MGITQwdCAMXDAm1gZF3sq1RBBQfLsaG78ncP
         umugArX/7kZZIBEUe/yRDsroIEnXv/n9zOdBK21Q3Qp7X1bisaHGvjNGFExNwQcvzrj6
         bx6wEuOrMwRhK9aRoRPXK0sAfive6T+bLA0eR/pKotgApzctcJyt4+9Y/2mx4E9ZSzYh
         bNQHbcpvNkPZZMK06AjXRip/MhbSsnlCkp6+spil90Ja4h5z7o/0UtctGmjrs5yC3u+Q
         Acfg==
X-Gm-Message-State: AOJu0YzTag5bt4lgILOFSjz6+Mn8G+Kym/Aun8ZuVUzW9EvCbjIy9ZaS
	D4mi20RB79JBt89Jc5pbBniuANMk2a4sHt9+PihkP1PIfLJkE1QwjHmP8HEcZPpDMuGHDYMn6sm
	+uQmggMqNxV4n56CiiRHY9HWiJF9x8Mo=
X-Gm-Gg: Acq92OG+fLKbroSOVh4t11NMyKnUiKbvrU7Wghy4pcDN//Qv1kGjMxNce6XmDWMc4Wz
	KKdVnMz5c/uaD7gGUom0OVVF0zOtdIVf1/2UO8qFTbPlhWSn02hAjajtT8pUKJYXtG5gWOUzcbQ
	se8j2OJ4ZXitB78lMHx2sFAUtaZqRi5NJqgchwgD9XNDOs0vP80B03+dG/j+l8Kpl0XTJCvokVx
	vAv+9rfuMJ0Ej9yUyWCQYlmvD1P9Ui4INKUuApPOKYCZhtKxCjvN2LNpj3zCb0JclklgVQMiu5l
	x5TL5oS2hyjKsM4=
X-Received: by 2002:a05:690c:4a08:b0:7e1:e496:ad86 with SMTP id
 00721157ae682-7ed50d65af7mr198797477b3.12.1781107803233; Wed, 10 Jun 2026
 09:10:03 -0700 (PDT)
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
References: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>
 <aibpanHZagb39G4t@heinlein>
In-Reply-To: <aibpanHZagb39G4t@heinlein>
From: Yash Patel <yash.pateltx@gmail.com>
Date: Wed, 10 Jun 2026 11:09:52 -0500
X-Gm-Features: AVVi8CdhaXBfwc-Aus6SO6jAygHVvVd8OGJdApZTNwlxSplcG6MHgi5EIj1Vf8Q
Message-ID: <CAGwee59_qUrYYhY7jBCqcZraks7vw8n7xza4DWawabD_QUUjng@mail.gmail.com>
Subject: Re: Proposal: Utilizing Container Registry for Shared BitBake Sstate-Cache
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:10=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz=
> wrote:
> Welcome Yash.

Thanks for the feedback and the welcome!

> One of the issues we have right now is that we do not have a good way to
> clean up the sstate/downloads directories out of each Jenkins node.
> Eventually they run out of space.  Managing it through containers will
> hopefully make it easier to prune old state and keep the nodes from
> running out of space.

I agree and managing the cache entirely within disposable container
layers should help address this.

> In addition to per-platform containers, you'll also need the branch
> included there.  We should make sure to build this for Wrynose since
> that is the Yocto LTS branch and we've committed to supporting that for
> a few years.

We will add the branch name to the image tagging convention.

> I would suggest a separate job for two reasons:
>     - Ideally we need to trigger this more often than once per day if
>       you want other Jenkins nodes to use that for a starting point of
>       their sstate / downloads cache.
>
>     - You are going to want to create sub-jobs per machine / branch (and
>       like I mentioned, we should do this at least for the Wrynose
>       branch in addition to master).

Agreed. Our current plan is to create a dedicated Jenkins job with
sub-jobs per platform and branch.

> Make sure when you do this that you don't use 'FROM: <old container>'
> because that will just create a chain of container subsets that will
> grow monsterrously large over time.  You have to create a build
> container and a final container.  The build container uses the 'FROM' to
> pull the previous container, but then the final container just takes the
> resulting final sstate/downloads as a directory.

The current implementation avoids this by copying the resulting
sstate/downloads into a fresh final image rather than building a chain
of container layers.

> Have you done any experimentation on if the GHCR will rate limit us in a
> way to make this non-useful?  Do we have enough space on the Jenkins
> server to run a container repository there?  There are a few smaller
> ones that are self-contained in containers like how we run
> Jenkins/Gerrit.

We have not done any extensive testing around GHCR rate limits yet.
Our initial focus has been validating the container workflow itself.
Evaluating GHCR limits and alternative hosting options is something we
plan to investigate once we have the Jenkins generation and
build-setup.sh integration in place.

We have a generic container available for testing. To try it:

git reset --hard 71085e902b0d22bcd854ae0db4c46c6fc666d17a

docker run -it --rm --network=3Dhost --pids-limit=3D-1 \
  -e LOCAL_UID=3D$(id -u) \
  -e LOCAL_GID=3D$(id -g) \
  -e LOCAL_USER=3D$(id -un) \
  -v $PWD:$PWD \
  -w $PWD \
  ghcr.io/pebbleeee/sstate:p10bmc-x86-generic \
  bash

. setup p10bmc

echo 'SSTATE_MIRRORS =3D "file://.*
file:///var/lib/openbmc/sstate-cache/PATH"' >> conf/local.conf
echo 'BB_SIGNATURE_HANDLER =3D "OEBasicHash"' >> conf/local.conf

MACHINE=3Dp10bmc bitbake obmc-phosphor-image

Our immediate next steps are to generate the containers through a
Jenkins job and update build-setup.sh to automatically detect and
utilize them.

Thanks for the feedback.

