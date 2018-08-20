Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::235; helo=mail-pl0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="p8wPNCSh"; 
 dkim-atps=neutral
Received: from mail-pl0-x235.google.com (mail-pl0-x235.google.com
 [IPv6:2607:f8b0:400e:c01::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vMR35r5jzF0gv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 04:14:54 +1000 (AEST)
Received: by mail-pl0-x235.google.com with SMTP id e11-v6so7518365plb.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FbzPeZsVWK7ebnw0Zlr75Wy4tAWh8PSsPG1T86cIM4=;
 b=p8wPNCSh5+Oa42Evk7ZItapC91N+k9Qzxufv6mXOHAXPU8Y5Sa4T8UTNxoC2lCi1J+
 ys1PdSWdlmu4WvRa5uUnF5bD4WH1oTou4S0JmCtXeTdRB8qkysS7D9mJlhFUygkdZ6nb
 cds0C3VDhHJC5LCO/GAM4+GJ4CXlnzVFQNd38oaUsKPszIvPatp63Ozy8wWCEMzaEmh7
 SUFCl7WPKr8jRq7w0QPP+CJDbCAn8ZeKC4Zy4CTaLYc89XE4I8qp6c4mkyzPsgnU0NqP
 VdzFD/u1cNIQ9U0H/QJRvJotk7YVe94ix1S6U+4+ijfcZfcj8oPVd/fL6w/AvYk2QBMA
 m2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FbzPeZsVWK7ebnw0Zlr75Wy4tAWh8PSsPG1T86cIM4=;
 b=AHxBWulGl2ovu3AiPhCVOfIMlxcto25yJkFsMbrNw3k7uo0bSrI2qaEDaWdg+7u2Cw
 Wq6xdyflWnie/UjXwEN9tWUqXM2CYfQwkdQIjivd3BH1uqLAlJIVaYb1bKGWSaLpGFWE
 KYiEtEPr1Uw8OiN//liBe9A/lge6J63LICnu9feUvDaboXxrvameySbOn2zuyYRsUF9x
 9gUQsiDEuy4CKR1P4buxA53P2jPc/xKqiyNM/pphkuka/GwoXtbTrokrm6wEEEVJdPmL
 BYqgytR7O3p2cr/A6Fg96ZZtk3spd+rGvBno1+OKUfNc6rqX09ne7q3HnNcesBF3/kb/
 l72g==
X-Gm-Message-State: AOUpUlHjScIbXTskqWfUuKXdHXOBZhbRtVaAL7QS9t9FfZmD9UTrsXiQ
 3sRjgYRnp5Z1JIFy2jVN5lo4UxDIuCXGKTf2/tHm9w==
X-Google-Smtp-Source: AA+uWPykPUvahuyo7P53ZqBLpOETpElINrp908WGWo6TuB+CIsSZ+B8risKkVLLtndHwa7rHnsfNcShk2X4nL8Zwwm8=
X-Received: by 2002:a17:902:46a4:: with SMTP id
 p33-v6mr46742818pld.205.1534788892138; 
 Mon, 20 Aug 2018 11:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pDF+AQWZT1hqe4XEedCkv5ypHd5rLmD5=-+FsBFwZ7xg@mail.gmail.com>
 <OF9ADB4CCA.9B5CDFD9-ON002582E8.0059FA91-002582E8.005B96C8@notes.na.collabserv.com>
In-Reply-To: <OF9ADB4CCA.9B5CDFD9-ON002582E8.0059FA91-002582E8.005B96C8@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 20 Aug 2018 11:14:39 -0700
Message-ID: <CAO=notyRJSzzc8GCXhs35k+mfEQ7kLCXzepwvRb481kevDGOBw@mail.gmail.com>
Subject: Re: openbmc bug management
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: Andrew Geissler <geissonator@gmail.com>, anoo@linux.vnet.ibm.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 18:14:56 -0000

On Mon, Aug 13, 2018 at 9:40 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
>
> Good discussion topic, Andrew.
>
> My thoughts:
> ==========
>
> First of all, bug should be associate with SLA/some kind of metrics on how quickly it gets resolved.
>
> Bug submitter is already started donating/contributing to the community by pointing the issue in the code,
> when bug submitter opens an issue.
>
> It is the maintainer (other assigned person) responsibility to accept (fix the bug) or prove it is not in their
> area and pointed out the issue/bug to the other repository with details.  (From the horse's mouth)
>
> If the ownership of moving/closing bug to the submitter, I feel the point of isolating the bug may not happen accurately.
>
> Second point (back to SLA), If the submitter owns it then SLA/Metrics may not be accurate. This will be totally different than what normally industry follows, I guess.
>
> Real Life Scenario:
> ===============
> For eg. if person A points out issue/bug in person B shirt, Can person A responsible to change person B shirt?
>
>
>
> Sivas R. S
> E-mail: sivas.srr@in.ibm.com
> E2E FSP Test Architecture, OpenBMC Test Lead, Lab Management
> Automation is good, Identifying Defect earlier is better always
> 9902233500
> 08046678273
>
>
>
> ----- Original message -----
> From: Andrew Geissler <geissonator@gmail.com>
> Sent by: "openbmc" <openbmc-bounces+sivas.srr=in.ibm.com@lists.ozlabs.org>
> To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Cc:
> Subject: openbmc bug management
> Date: Mon, Aug 13, 2018 9:34 PM
>
> Currently we mostly open bugs against openbmc/openbmc.  This is nice
> in that it provides a single location to search for all bugs related
> to openbmc, but it doesn't provide any clear ownership for someone to
> drive the bug, and it becomes more and more unmanageable as the
> openbmc project continues to grow.
>
> Per the community call topic today, we'd like to start having bugs
> assigned to the specific repo that will provide the fix to the bug.
> The main concern with this is that if someone is unsure on where the
> bug should go and takes a best guess, if the guess is wrong, how do we
> ensure the bug gets routed correctly?  The idea was that it's the
> responsibility of the creator of the bug, so the repo owner says
> something to the affect of "not my problem" (with some guidance on
> who's it is if they know) and the bug submitter will then use the
> zenhub option "Move Issue" to close it in the current repo and copy it
> over to the new repo.
>
> Thoughts or concerns?

I think it's completely reasonable to expect maintainers to watch
their incoming bugs and redirect as necessary.  Furthermore, I think
it is too much to have all the bugs filed into one project.  I know
that I never check it for new bugs there because of this.

Those are my $0.02.

> Andrew
>
>
>
