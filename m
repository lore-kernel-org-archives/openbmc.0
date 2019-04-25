Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Pf9wU8HM"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qlSX2BbGzDqdD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 04:04:27 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id e24so278999pfi.12
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nsOqLp+Owi3851IilBJIA/UxmncsqRJvv61ck3rT8LQ=;
 b=Pf9wU8HMMalAvemvT88UDWB9ltUoaUPbH0x3j8Q6YLDRWIiz7GGPzRNkVFgpZQVWro
 Jtlck0QkzRlLlBPCnOKGbToHUeg8oFHXSO3tfw01hZEzQ0biPPcmBeS8Tc95BXopbBNx
 sX7CP7L75hTFs0nx56u1LAWI/+cc5f09QC2DBJDkErWpzpkjQeCjWR5R5Ss2s8XpwFAv
 +AvD+Kq8BcQCJqGyzy2HTGCTgt/Uv4CQh/IFsbO7Vvj9mMgXBZGY/j66aJxKWJho5b/a
 vL5tMFtqrvogVvWl76jkAbiYSBXFiqRS1sUS6wYVkSKdfd5dsA+TjffLk6BjJivuBgBf
 tEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nsOqLp+Owi3851IilBJIA/UxmncsqRJvv61ck3rT8LQ=;
 b=f9UcbnxIlCDfN+Pv0DwreID1lDAUmLfY8JA1YBEwEXrJvrMdJOm1Kh/IUXvQLR7xvs
 oiNOUiEWHO2DsAOwj9A4wNRkTYFOZzS2z+my1CU5/SKpvHzTCKIbIcytqwCnBAOMx7zS
 9e2aMo67e7mr7XmxlSqj7MMmUbWvqbW0vRYYHnZux7rkotLSRrMX5HH9DWlLit3c0pX8
 8/pQmWxhvf+r3R+SpfQVQUreFvVpo6RWrmqm/vzFXC31KUH2/3BmPdCTw8Gi7a/ocgpw
 IAkaiPmXLH1u0a4mGiUIFy6VSLy/Senvt8mf2yBUgwZoOvqb+YrPMbHJnVrFC92d6Bbd
 +i3A==
X-Gm-Message-State: APjAAAVFpw8hmV+wCSD50g1WmHPFiw8+51rz5a3gMJ/fyNgbmSY5ZQFI
 cGD3nb7W43hmEuosByBVdCeP7NbEBU0mFe0uWSH8UtyjGTULfg==
X-Google-Smtp-Source: APXvYqztoVd5qsraGMfDMju3IL0XtQJhbyGohp9EMjX7dHNA1UNksWsvq7NPwhsHamjza4KIdJwGd8lZWfyzNu1dxfY=
X-Received: by 2002:a62:b602:: with SMTP id j2mr41771008pff.68.1556215464091; 
 Thu, 25 Apr 2019 11:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxWQFgmgJUUVXDZun1FR9jZ1+hhD-5mdWjNttcxKiwwcg@mail.gmail.com>
 <c5373614-4965-4cba-b68c-c114389a315e@www.fastmail.com>
In-Reply-To: <c5373614-4965-4cba-b68c-c114389a315e@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 11:04:12 -0700
Message-ID: <CAO=notyVNDMvNDzVDz-nELDRuThWQ3CEWs4qecy6YPT5iF4Zmg@mail.gmail.com>
Subject: Re: Requesting Patchset to linux
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 25 Apr 2019 18:04:29 -0000

On Thu, Apr 25, 2019 at 10:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Thu, 25 Apr 2019, at 10:54, Patrick Venture wrote:
> > Hi,
> >
> > I was curious, when sending a patchset to openbmc/linux that is
> > already staged elsewhere in a maintainer's repo -- should we just send
> > an email with a link to the patchset or the full patch email?
> >
> > I've done the patch email for this in the past, but wanted to ask.
>
> It's easiest if you send us the backported patches based on top of whatever
> the latest OpenBMC dev branch is (dev-5.0 right now), that way if there are
> any conflicts it's the subject matter expert dealing with cleaning them up.
>
> When you backport your patches, please use `git cherry-pick -x $SHA`, as
> this will embed the commit ID of the upstream change in the footer of
> the commit message of the cherry-picked change. This allows us to easily
> track the origin of your patch back upstream if necessary (handy for
> Fixes: lines).

Thanks.  And I just saw the --suppress-cc option so I won't spam
others as I have in the past.

>
> Cheers,
>
> Andrew
