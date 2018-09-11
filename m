Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q1vG/XZI"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428xVY4TBMzF38B
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 06:35:01 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id p12-v6so12804788pfh.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBxVS47crPB5gAcPXnCwy5jpPcTUtcMXapxNCtRAfU8=;
 b=Q1vG/XZIdGy0uoksOGUN8IadNal+l8YbtgDX3U8IHXRMFoXxDPFJES7xFQ5KTk1GMx
 iyAg1R3mayYqcS5LPg4jjE9qPysaIj8Qa7Omnw2J1Vj8TzSpg0FUPNXAxQqMHBtGP58P
 l/baokuoqEMYL9dYI8qDxBEHhVXuk2OLPvdLpH0RxLwZKfxGccCeV8IRtkutLFn6vruj
 aw3ThGQD5LUM+obq6tMD1od+Yan+aWxjQSVEcSRUpHfRZJNqf8Nv0KBi7SGmjoyYlOCR
 awKNWD8MtWu0xIN3s9mAPRI/VjG8TVGtBiCcJYcU7kf+MqTtZfOGEdxZhWsnqlpGiNaj
 kQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBxVS47crPB5gAcPXnCwy5jpPcTUtcMXapxNCtRAfU8=;
 b=Yu6ktoZmvrmNTJbRk4oDPB+sSv/Nw28Sf+opbEzOPfhIAcgq7K5JQzuCuvH/GkHFmw
 I85ngBWFLe6Smv5mmU1NgJWOXFLkmbjwvzJTgGUF39/qM687+9++qKnbeTl+PjpwRWPk
 uFK7OKP/bLTZpWbDIJ2FCKPS2rkiyI85W+u+pXIfgIx1SSrj/Yr0vUb7nTQoRvUz6g7G
 JjeruWY9dZHP9LgY4MhKt+2becO7scq7PYXQLRKg1RNla/Mci1ShtmspJAFTqKa95EQt
 NMXH8uZOwHHhek9C15a8tvubreMroPg/SKA24XZSPoQyVc4p71hWQI/kdypDy1JhQxTP
 c4fA==
X-Gm-Message-State: APzg51AgrDjLS1o8LVP/kV7CaEqCRHrJ5SlBuvoUj7K1zBNv1jVr/ZuR
 8Ipzn2KsEAavI9ICoWptiDAd/6tYy+V2oA+RJOfKL122
X-Google-Smtp-Source: ANB0VdaAK98+gNSuwSoIJsDr2dX0A5OopgyieYvic00l3Z0tZBOEExF5Eg95o0XIz0jFQS41tmgOEDMqR4q4REqtbgg=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr30120715pga.449.1536698098727; 
 Tue, 11 Sep 2018 13:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx6QwNkQJ8HgDFJWqDChVw9j4ye=1qSWz3yaFBFYAOEMg@mail.gmail.com>
 <CALLMt=qCkxga7=8ttD9xC4jtSaE8M9piJPB8UuHnHTSNV0rLLA@mail.gmail.com>
In-Reply-To: <CALLMt=qCkxga7=8ttD9xC4jtSaE8M9piJPB8UuHnHTSNV0rLLA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Sep 2018 13:34:47 -0700
Message-ID: <CAO=notxK4stv=rpXkykWTM9Zcn_U5ukNsMs1Rp5O2V9QOz6NOA@mail.gmail.com>
Subject: Re: meta-google
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 20:35:02 -0000

On Tue, Sep 11, 2018 at 11:05 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Tue, Sep 11, 2018 at 10:24 AM Patrick Venture <venture@google.com> wrote:
> >
> > First commit.
> >
> > I am a bit new to subtrees, so I was following the steps to get a
> > configuration into meta-google, and following the steps didn't work
> > because there wasn't a master branch yet in meta-google.  I submitted
> > a "first patch" to meta-google/master via gerrit, but it appears that
> > gerrit isn't sending that patch (yet)?
> >
> > I'm just looking for a quick -- why did gerrit not push the commit?
> > Perhaps a configuration change required?
>
> I didn't see any errors in the gerrit logs but the synch didn't happen
> for some reason.  I did a manual push and it worked fine.  Not sure if
> that first gerrit synch needs a manual push to get the master branch
> setup Brad?  Let me know if your next one doesn't synch to github.

Thanks! - I have a hunch it's because there wasn't a master branch yet.

>
> Andrew
>
> >
> > Patrick
