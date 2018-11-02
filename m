Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QqP+m+4x"; 
 dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mQnz06qXzF32n
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 13:22:30 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id v68-v6so877866qka.2
 for <openbmc@lists.ozlabs.org>; Thu, 01 Nov 2018 19:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQ7VofKdzvVkh+Xv3Iv59iSQyY6GEDu4uHKAq8xzblg=;
 b=QqP+m+4xJd9Zbc4HRnPDjXBWyeAevmKSWZl5Cg6WzwPw8SUgQV+ixBGRy9fBmEhCV8
 uJlJtYT+i9JzS68FL5YfHFp5aLCt0XGAERxamsCNHB32w+FhYp3E7SosbXDChRzQpqe8
 KVRc3v0LePUK/bNK68ejuvv7wOcmZ1+lNgYzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQ7VofKdzvVkh+Xv3Iv59iSQyY6GEDu4uHKAq8xzblg=;
 b=g195MyN7af/8alN9UI6tlPxonMs2G7MpcwrVPYphd583W+tkrL2HADvaSCDu0YWzzl
 clvKZ0pLkNXbZr6DUPz8T39HHyh9L3XuvpXscYP4fwv6tVK5D9pNI447setssKsgorqk
 I2PERbdCBjlQ8KbUsA4CtgI3svMo2eRo8z9PsYcfPyG0uC3sxCeiRgcHYWROpkcKtrrs
 94wzOeoDQTrMI+5yf1ziovbR0Cds0ds30OaG6puXhf2Pg9FaTSHA4De/Lp/dQ4Odcfti
 LBDIYn5KJT7bM/8HOhvjn2OK56IrUSq5LaNEgvikoJOUv1htHja7JLVAutYBrqCgxQQ+
 eY3Q==
X-Gm-Message-State: AGRZ1gL6y4TN71zvcwdT6KZh7ElVBJz/H8a3cm0RHD2wMkBJ0eRM3rbX
 8lYDvUIs99qc0Umvmc/Y1OQixb0xUka11Lfk6es=
X-Google-Smtp-Source: AJdET5ewOWRAbsPDT9Ztnlc7WbeudSyVHt8gtKS1inCqzN0lnmSNaKRzoP+37fLejsH+RjJ85yVBjzKksijdKpxzRyw=
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr8843607qkg.127.1541125348496; 
 Thu, 01 Nov 2018 19:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
In-Reply-To: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Nov 2018 12:52:16 +1030
Message-ID: <CACPK8XeQQgWVjACHhhKJmP9j06WQ98jsuP99qVHM934Dt8PmnQ@mail.gmail.com>
Subject: Re: Infrastructure Workgroup?
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 02:22:32 -0000

On Wed, 31 Oct 2018 at 02:24, Andrew Geissler <geissonator@gmail.com> wrote:
>
> Based on some recent discussion in this area, I'm contemplating
> forming an Infrastructure workgroup. The focus would be on improving
> our CI infrastructure and the scripts and tools around it.
>
> There's been a lot of great community effort already around our CI
> build scripts.
>
> Some thoughts on goals:
> - Documenting the existing flow
> - Alternatives to existing flow (ability to use freely provides clouds
> for open source projects, ...)
> - Managing the Jenkins nodes - Bringing new nodes online quickly
> (chef, puppet, ansible?)
> - Managing and optimizing the CI flow (repository CI, meta CI, openbmc CI)
> -- Which systems do we build?
> - Process for adding hardware CI (mechanism for individuals to add HW
> CI to gerrit commits)
> - Optimizations to existing scripts (docker building, CI, QEMU)
> - Gerrit, Jenkins, and build node periodic update process
> - Overall maintenance and responsibilities for infrastructure
>
> Thoughts or interest?

I'm interested.

I wrote the scripts that were used as the basis for our CI. I recently
revisited them to fix an issue, and there is a lot of bitrot there. I
would be interested in seeing that resolved.

I would also like to help enable the compute power we do have to be
used effectively. Currently we have a lot of CPU cores sitting idle
while there are jobs in the queue.

Cheers,

Joel
