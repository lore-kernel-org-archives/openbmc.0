Return-Path: <SRS0=W0y3=EC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72611C4363A
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 20:55:58 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706B421D24
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 20:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hm0Uvuec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706B421D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLPB14bnzzDqNL
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2020 07:55:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Hm0Uvuec; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLP8L2mH0zDqCG
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 07:54:26 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id l20so1889942wme.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 13:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oa11DE3JWVtMM+2Sx1a50tOge7Jv4mhM+l0dqYYmCZ8=;
 b=Hm0Uvuec+tEhcNko1flkujYt/BI250NNzDC4kQGOY/Aa03fFtkqDXgGl1KZMmW/yrf
 6oswvV5xBkQFaRS0fT802PuF9tAx+9BQ2C4pBRhenKzVHdov5G71bMIkXs5iZC1s8gAZ
 K86Z73gIgj+YvVFyVl6n+6hkNFqnmk1OPKZrPrhOfCTj3NpIR0G21alMsNjsPWggSb1e
 4DR2Vu1jIDKuSyJYOesbdXrTAhf7436zO6LCYKdO0EB+t+lMz+A9yPnV4+xwLvAZBO53
 CS9CbR4qv9QDK2QNrpkkoaa4iaYa/wFGMOwakkChBxETwmRoFvSsNCGFVy69p3UNgx1T
 xyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oa11DE3JWVtMM+2Sx1a50tOge7Jv4mhM+l0dqYYmCZ8=;
 b=XJqBMDjHmo9jhv9r8KLN5zdpqL45Apu/ql2Zm9LggYTXDih7QrqkawExaGseu0IQMr
 bBdcKMW6oy8Ur9VPcEXfE5+r0PpR/QVU2ej55+Uyjo9mPhszxGB+tQdQZCv8fxQlxkoX
 WNzbjDpqw1VkODHO5AqHe8X6pek/6UIg1w1KoJXawIkbGidfPqcZKceDwb5NCKJRo1uc
 iD0ZvIApXRTSKm7RbffDk3QcvZlhg+f+bz47jBUJ6EdfiIHIiv27Fg3WHHvyawbMXW98
 6FAtUzuPQzqqnrbKWbcfblY/x1+UsvTpnrNedhMweor2BaVzPKs4Wnhcv0wXBQwE8xPd
 cgTQ==
X-Gm-Message-State: AOAM533QyQPxSAJqZIm5hb6EjcjJoEcOs70KqqtHGK0ti1cSpDJq+sdb
 yUPbYvzdpjoaihz1kf7sm0YQ/b2tQ/rpqCJTRhPmhxDa9g8=
X-Google-Smtp-Source: ABdhPJx4VdEFnAtdDw9ZtPwTQ/vuoV2DvBDJ7H8QReHO+MgE6ReqyQDJl9XKrzCSIWvZ2l/muds6k+Ah7FeuBNM5ZbU=
X-Received: by 2002:a1c:56c1:: with SMTP id k184mr4520748wmb.14.1603832061674; 
 Tue, 27 Oct 2020 13:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
 <20201027202634.GF3614@heinlein>
In-Reply-To: <20201027202634.GF3614@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 27 Oct 2020 13:54:10 -0700
Message-ID: <CAH2-KxAL+iosN+gm5VdDnHvJKqY9m2=hVzj=ks4z3HtGBS60=g@mail.gmail.com>
Subject: Re: VR control from the BMC
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

On Tue, Oct 27, 2020 at 1:26 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Oct 26, 2020 at 04:02:22PM -0700, Ed Tanous wrote:
> > In the near future, I'm going to have some needs for OpenBMC to be
> > able to control VRs.  These VRs might be on the baseboard itself, or
> > on detected PCIe add-in-cards, and controlled over PMBus.
> > Additionally, I will need a "hardware safe" way for the host to be
> > able to modify the behavior of these VRs (usually different voltage
> > settings), and to have that interface be constrained in such a way
> > that the host can never set a value that's outside of a predefined
> > range that's known to be safe for the hardware, which the BMC will own
> > the definition of for security purposes.
> >
> > Does anyone else have similar needs?  I've been pointed to
> > phosphor-regulators which has some similar parallels;  As-is, that
> > solution won't work for me, because it's relying on fixed, platform
> > specific json scripting to accomplish its goals.  My hope would be for
> > a more generalized linux devicetree based solution, as well as a
> > representation on dbus that could be modified at runtime by
> > Redfish/IPMI in band.
> >
> > Is there any other work I should look into that's similar?  Does
> > anyone have any strong opinions on how this should be organized or how
> > it could be built?
> >
> > Thanks,
> >
> > -Ed
>
> Are these PMBus VRs?

Yes.

>  I was able to program limits on a non-BMC project
> I was working on using the PMBus interfaces to the VRs we used on that
> project.
>
> I did need to write this patch which I'm still suppose to clean up with
> some additional clamp_val tweaks to avoid negative numbers.
>
> https://lore.kernel.org/lkml/20191001160407.6265-1-alpawi@amazon.com/

That pointer helps.  Thanks.

>
> --
> Patrick Williams
