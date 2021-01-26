Return-Path: <SRS0=A2IC=G5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36531C433E0
	for <openbmc@archiver.kernel.org>; Tue, 26 Jan 2021 23:59:00 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 828E12065C
	for <openbmc@archiver.kernel.org>; Tue, 26 Jan 2021 23:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828E12065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQNxF1YyhzDqnw
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 10:58:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oJrZnkbL; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQNvQ2vJbzDqm6
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 10:57:21 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id h11so33595ioh.11
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 15:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Kg7FOEfSrIukbgvVGG6NDglDGKBp4k4RvacfFWoRf8=;
 b=oJrZnkbL00JaCGOJCGH+ASawjr/TIE8Bsw22sv//UwBZReovKBDSoTfHgeme2BwFDL
 OmXoTg+ZGut/oy8UgTK1K00CDHWuWWPp/fTVRCSQs5MxT8Oa2ADb/6AZo5YPgr18K6Sr
 qkaQcEuZbqLTD41juofWEPOcyHFWKVrWBBYJNiJl4R0oFk2aTochajQgXV+zmpvjwNIM
 2pdl17IDmUXK5b465VdU7WS0l3lC7ZEX8BsOGcoGb72xwLIkhcKT42iWaDmLNuQq/1uc
 GPoVS+AyZZ6EsMpZtqPYjFjAvzWPRr6pgaNwELCrWT4zy+DUjMK++3k9kbWKNZTyKWTM
 Ib8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Kg7FOEfSrIukbgvVGG6NDglDGKBp4k4RvacfFWoRf8=;
 b=R+ZotEKzbduMIXXScWDstUGFnbVqMUHIcyd62Nim8C835X6BcFVqGwDGM3keHA6+kB
 YO1ThwgGyPV50J/kht3CTKTrkzQU31GVVX3Ri6xRGJqhNHpu3GpO4NTzWlDx0KeOPIUY
 PTGddNnmAGoeSOlDzizE4ZCZKUx0Las1Qj+x+Y4kuEYL9VuS4d/JEFhyGme9MimtbJE3
 g0p2LdWb3Yg1jiGQLKhbeptONKGznNNrLB4nXq93SfJ1ocDzgUtirXwX1oe1kSEc5J3A
 TpOGWMtPmjOcay/v10hQydkNZS1UxYKRHA/zaV5tHhlp1qrk5kPJW7soQ31PMYde6+Gq
 HFIw==
X-Gm-Message-State: AOAM531XYs/TftFaR7vQ/MIAbSgP97/b4R0/6FBcozTfbbn3vHD1pICK
 VckBOQLrNzMkjCM5TlMuc+0xyAcvQqm6Oc2x5Ct6lg==
X-Google-Smtp-Source: ABdhPJxJdEZvnieLO0nIR82CawRBkDC8FE2yIJYJMRiORbJM94tb+Frx/mcPs6YY1+eCAo6avDDE88DSn2RDfm+fBtY=
X-Received: by 2002:a6b:cc07:: with SMTP id c7mr5907939iog.122.1611705437571; 
 Tue, 26 Jan 2021 15:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 26 Jan 2021 15:56:40 -0800
Message-ID: <CADKL2t5ibO+khACv+w5xmpdWe8o48KAAGpaUUZMZBr9rVCL-qw@mail.gmail.com>
Subject: Re: Call for volunteers
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

On Mon, 11 Jan 2021 at 14:09, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hello OpenBMC-ers!
>
> Your TSC has been aware of the problem of fragmentation in our project for some
> time.  Fragmentation is a loose term - for the purposes of this note consider
> it to be any time contributor efforts in the community are duplicated without
> thought given to maintenance and/or compatibility.
>
> To begin to address this issue the TSC is looking for volunteers to serve on a
> "repository review forum" to which the TSC will initially delegate its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
>
> The TSC fully expects the scope of this forum to quickly grow into the role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in terms of
> governance, advocacy and industry exposure - and likely get a rename (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.
>
> The new forum would meet periodically or at the demand of other forum members
> to:
> - raise the forums combined awareness of new function under development
>    (information exchange)
> - build a consensus within the forum on where the function should exist
> - inform the function contributor and the rest of the community of the decision
>
> A successful forum would be a forum that can simultaneously encourage the
> contribution of new and innovative solutions to existing problems without
> introducing complexity to the project as a whole.
>
> A successful forum member will have previously demonstrated a breadth of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and Discord.
> - submission of high quality designs and code to upstream OpenBMC
>    (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC developers
>    in a timely manner, enabling them to come up to speed quickly.
>
> If you are interested in serving the project in this manner, please reply to
> submit yourself as a candidate.
>
> -brad, on the behalf of the OpenBMC TSC

I'd also like to volunteer
