Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bX2caC0v"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fjjc05qgzF3FG
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 01:01:06 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 205-v6so1942040pgd.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=db4UaPGVIhH4rx5J4Bdj2PFY4A/otS5rkLlaiDkFd3w=;
 b=bX2caC0vw2IpxqjsY9l7dGHN7quyRZyp0ZhbRMMhRShKTb5Q2IeFTqXhAQ+b0sgY/7
 LXpLCYx3BcPovJrdqwGqfa1mLh5SAYx+vnvU/OV7I88gn3V6JxwXgwOnhal7ERiZk5fb
 Bk9Xbl6cK9lrS4HMGaVj9X9g7cfmrS2q8ewY6SSQJjXLik9yiGsDtmsvLVxVu7+PxhE8
 Lbm8cwt09enu+XZL+T0/DYiYc5C7dNdQmf8WbOxqZ+U1eE5uYvCP3QkDXG2IXUPpIs9f
 /mVNlHd9OG8mP/1n6NNp1lASDCKkAhj95eM96KBiCt8iUcpz09gujC3KC99PF0CYUz3W
 VrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=db4UaPGVIhH4rx5J4Bdj2PFY4A/otS5rkLlaiDkFd3w=;
 b=m6Lr3caWU+fSxF8DVDu3/15H/5Knr4R69GmDKgFFORRvi7aEK4o9hRf+DbH0eIMl4F
 08S6utSXijZF/ETzYtd2vy82LfxysYjDjsexYQCY3DX+ggY/fyAq0Rpl+PJVXiSqWrbO
 G/wQS0sz+3LqSFQAFbqprIilnenxt6ag99ccb2SE3L4jXJyQOz5OX3w88EBQHn6MErDe
 zUJig4NNQxwvwhf/CCfnCe+Yn+HNqERATCUHYt0iWMCS4jRnFEWeRPIgZ/DH05pXut5r
 FCD3c/UDmsuE+9bwVY+FxsRKdnOk6thwD2PyJaGxiXv93nc+AFSgG7fqvtF2b9eobLZ7
 P1kA==
X-Gm-Message-State: APzg51DXwhhDtWHbVgNHPnzeb/hMPwQSBKMGMQx3MMEofa/pQScmQ6ta
 yhd4WDDWYD5GUun7qFbzkdy4zaIQUPOIclbdUCbdig==
X-Google-Smtp-Source: ANB0VdZ1sq0k8WGCC4lF9eK8JIgvBbcUc3WGitJtaNJrmT9GSgI13Ju8Y5/FvIzrcnNpP+Q5ZWHy2b88iVird/afVkY=
X-Received: by 2002:a63:4044:: with SMTP id
 n65-v6mr31914655pga.90.1537369263862; 
 Wed, 19 Sep 2018 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
In-Reply-To: <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 08:00:52 -0700
Message-ID: <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
Subject: Re: Link-up between Gerrit & Github
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
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
X-List-Received-Date: Wed, 19 Sep 2018 15:01:09 -0000

On Mon, Sep 17, 2018 at 12:28 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 17, 2018, at 3:17 PM, Patrick Venture <venture@google.com> wrote:
> >
> > The first meta-google patchset was pushed by Brad into github.
> > Interestingly, the second patchset which was merged into gerrit 3 days
> > ago still hasn't been automatically pushed into github.  It makes me
> > think there's some box we need to check or a setting to push.
> >
> > Brad, can you dig into this please?  I don't have any permissions to
> > poke at it on Gerrit.
>
> Will do.  Agreed there is a problem here - I noticed meta-x86 was out
> of sync too.  In the meantime I've manually fixed these.

I know it hasn't been long, but I was curious if there any thoughts,
since it appears to be all new repositories, and not just the meta
ones.
