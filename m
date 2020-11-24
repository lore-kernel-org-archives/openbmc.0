Return-Path: <SRS0=E9Gk=E6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB469C2D0E4
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2020 15:58:39 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF0D5206FB
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2020 15:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2vzGbDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF0D5206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgTG430NGzDqTs
	for <openbmc@archiver.kernel.org>; Wed, 25 Nov 2020 02:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=k2vzGbDC; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgTDF1pD5zDqZ2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 02:56:57 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id h20so2210671qkk.4
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHOsDbZN+JYNR6XTrKMbQ1wHnCEWircVPxxVoubx5ZE=;
 b=k2vzGbDCmXwQCANX06cyd4fVEIPk2JBxcqvn4BZf5cyIG1GJ8B09J0jI18zyiJYoC5
 JaujFpx8ghQk7lwQ4zO3xEGcpAE/8IqcvnNrpVU4ulgZ6s+G4MedOuiABAGwkVoJxIR9
 LjZ/QNb3RIR4ShgpXUazf82IOrf0NI35WpgADxLA4BPApu13vbLReZQb1XTQzdc5IAtM
 1i6+PN49jJkugRXs1MIern52tYmEG6WBte4iRRhwUfgd02rp0J8HUUmVUr1c2EgttNW9
 elfjHBmLTd2FG+RBnwhSjC1i7VuM+wjDiVBvfii200ybnd9O3X0zBnfKwdSbpFnnMi/5
 66LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHOsDbZN+JYNR6XTrKMbQ1wHnCEWircVPxxVoubx5ZE=;
 b=W+PBoMhTBwGj3yQIurQJtg8hc4/49F6p8ox9aa047nUyP5+HGrp2sG8yDKO4hBFvfl
 KL86R3cdUhpUGIWpxG/jUZg2eF3K8mp/NWKKbc/Ka55tHl2HVVDPK9By99jvdAm8uhSw
 METyXRP/uHr5K8tAgTSA4XtPkiPPrrcd9WU/ZzF0cNsgtAskDGQxhkl7JEFmV6jutmvV
 PqUgYHPhoqMHA303NUwcba9bASaiBYGNzd10oFHflJbVZkYLX4kQSJdjKAjyEgL058Fk
 leUwum7OCeqeXzNROYSaMEh/laz9oiB3nFeQ22Bo/0cPlzUuT/5QdgUXxZacNF+zQIhF
 ey1g==
X-Gm-Message-State: AOAM531dRmA+1RW5p4lnwZbTxuNudLCfTpmoIRPJ/h5+mAH5XMvFCR08
 7uywYq/uo8qlWZyJc6sIZgY0j1P0eQIIe0djz/0ga1tKRAKurQ==
X-Google-Smtp-Source: ABdhPJyQVWZe4Jc9FvSuTuj88T1n6QSKY7CVvlpDcUPM/9731utm++wgdydnz7hrb0fsn9bgR9w34tydxNqoMATCY8Y=
X-Received: by 2002:a37:a249:: with SMTP id l70mr4993329qke.79.1606233411216; 
 Tue, 24 Nov 2020 07:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <20201118230938.GA1261035@heinlein>
 <CAO=notwTKgDD20KKXE=5gF4QOeT3SEpuEwrzRRgEkxPYGzFFqw@mail.gmail.com>
 <20201124140701.GD1261035@heinlein>
In-Reply-To: <20201124140701.GD1261035@heinlein>
From: Patrick Venture <venture@google.com>
Date: Tue, 24 Nov 2020 07:56:40 -0800
Message-ID: <CAO=notw3CXVZTG6yAVv9-kVtXLqZM2NXZFbjYLtbiFK2S35qtw@mail.gmail.com>
Subject: Re: qemu for bmc
To: Patrick Williams <patrick@stwcx.xyz>
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

On Tue, Nov 24, 2020 at 6:07 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Nov 18, 2020 at 04:29:28PM -0800, Patrick Venture wrote:
> > On Wed, Nov 18, 2020 at 3:09 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Wed, Nov 18, 2020 at 01:11:42PM -0800, Patrick Venture wrote:
> > >
> > > Hi Patrick.
> > >
> > > > Patrick;
> > > >
> > > > I was looking at a patch series of yours that landed,
> > > > https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> > > > this line you're referencing a device that appears to be missing from
> > > > qemu - namely, the pca i2c mux.
> > > >
> > > > My question is to the community at large, and you also, is anyone
> > > > currently implementing this i2c-mux or a similar one?
> > >
> > > Timely question.
> > >
> > > I don't know of any current work going on in that space.
> > >
> > > Facebook has a hack-a-thon kind of event we are sponsoring at a local
> > > university this weekend and that was one of the projects I gave as a
> > > potential item.  So, maybe, if we're lucky, it'll be done by Monday.
> > >
> > > I'll keep you posted.
> >
> > Hahaha, thanks!  I'll keep an eye out for your update!  Seems like an
> > excellent hack-a-thon project!
> >
> > Patrick
> >
> > >
> > > --
> > > Patrick Williams
>
> Unfortunately, this was not one of the chosen projects.  Maybe next
> time.

No worries, we'll have to do it, as we definitely need it in the near
term getting out Nuvoton efforts to materialize with real boards.

>
> --
> Patrick Williams
