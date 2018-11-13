Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FC9tUTY/"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vff11kBhzF3Kp
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 07:40:40 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id a11so8998036otr.10
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 12:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xm3+hNp7JsIVtk01eNI9GeXaGk/rLwy99hIfpwHuT4A=;
 b=FC9tUTY/jGga+QmeyBGigCSx4Dae1f6KAGSZYHeta5hftkIjoV4F3lSMxddZ+LTH1q
 /Ik7749f+2NZlRC/LdbodGzQ+2njpHvN4ZGSvavgMpYpMa4N80d1V7BlnH8W9FjIK2Wl
 3/qPEvDGQKBpyNbIpafYk8BHIoMVOHUYM9Qk3s69lXkzJx2wlvZbZY1dKdmGH5+x4eJQ
 A9zu5EKAgKSFROali/98zZ0knyFIKtZRDD0JADJBYeQZEU/u7MM5oFHbuKSpFmUlSiS9
 ccM7emEJtt3RYwv2OwUwGdHy+MNVGO8mUMvxlSHid8nKT2/LhQt10PN7wgaP/LrmmMUr
 dIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xm3+hNp7JsIVtk01eNI9GeXaGk/rLwy99hIfpwHuT4A=;
 b=ksti92qAzHyT5YnHowqR6P6iREsm0O7hmf4kf1eW7gOjvuEomJc4EaOiNYllEiZlvp
 rUigWhhm/8rViPmYr2sEpwkeINIrhcrl/dxQFESPqwlXv4tWeXuV9oLm/S2LH9CQcO2H
 qBsjaqAVh+lY/TpFCBFRxkr4uvJc1ylAIKDHvifAns6Gnms4CMriQ6A8mtlCE58hrvux
 kRDvsVgINf8cBujGFJ6fd4U3NsP2D5bwPXZEU2I/X0Yw/iMP2o2WxeZ99s9mU1lvMc88
 mCDmApQN3ol5Y+j4bad+m8r4L/YqduktPhna5sxwov9UdAZfVf42vm2FxHC5+uFqQU0D
 EvqA==
X-Gm-Message-State: AGRZ1gKmpCztcNojfsx2POe/mE+S8C+lzZQjTkXHkk5tzS6uqEhFGWbQ
 wpIvpfs5GlmL1TiO46QIhSiAewlm/QqdBgELolM=
X-Google-Smtp-Source: AJdET5exN9bNXc5vKRv4OaDJWstkUuNNwIyVsfroKBNYEW9+uEN71FnW8A0wRPeGkySek1dpwsWvrwRT5gOMLnvyW2A=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr4308993otl.107.1542141638465; 
 Tue, 13 Nov 2018 12:40:38 -0800 (PST)
MIME-Version: 1.0
References: <0000000000002cf60d057a7c257b@google.com>
 <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
In-Reply-To: <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 13 Nov 2018 14:40:22 -0600
Message-ID: <CALLMt=r8i-bugAiHYwdbB+MadLV01FKnr8o3N4g75Y66LMhoLA@mail.gmail.com>
Subject: Re: OpenBMC Infrastructure Workgroup Meeting Time
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Nov 2018 20:40:42 -0000

On Mon, Nov 12, 2018 at 10:41 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 13 Nov 2018 at 05:18, <geissonator@gmail.com> wrote:
> >
> > Having trouble viewing or submitting this form?
> > Fill out in Google Forms
> > I've invited you to fill out a form:
> > OpenBMC Infrastructure Workgroup Meeting Time
> > Per mailing list email https://lists.ozlabs.org/pipermail/openbmc/2018-October/013867.html, I'd like to find an optimal time for people to attend the new OpenBMC Infrastructure workgroup.
> >
> > My thinking is it'll be every other week for 60 minutes.
> >
> > When would you like to meet for this meeting?
> >
> > The opposite week of the test workgroup, Thursday, 10-11am Central
> > The opposite week of the release workgroup, Monday, 3-4pm Central
>
> Do you mean Australian Central Standard Time?

Hah, it's like you're on the other side of the world or something :)

I was wondering if maybe the afternoon slot would be ok for a
few of you guys based on location? Either way, the responses
were about 50% either, 30% afternoon, and a few misc, one noting
that the release workgroup may want to go back to every week
at some point. There was also a request for a "Europe Friendly"
time, but that may be tough.

I think based on the feedback, I'm going to try for a every other week
on Wednesday, 3-4pm Central. Unless someone responds saying that's
just not going to work for them. The goal is to have as many companies
represented as possible so if you're the only one from your company
planning to attend and this new time doesn't work, please let me know.

Thanks for all the quick responses!

>
> Cheers,
>
> Joel
