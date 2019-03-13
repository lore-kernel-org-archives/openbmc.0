Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gIZ+mTqz"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KCjk1YVFzDqKy
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 00:43:51 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id x4so1710021ion.2
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YXiD35JTFMx245XADwmonB0GeC3IjVExuEdnO7Wg2CE=;
 b=gIZ+mTqz4ikGkZQX5kkKn/nITBX8je+JCgyhZtKcTaWS5STOyI28Gq2FGjP/VaMPvl
 Cf92znBc613R7WPU7bJvt0CpnmOjLNrEzXho67a8xj6e8e/kRdr19002VZMzNzrV2UYl
 SQD1Q59z2iODLL/SZI6CtqRQ18kbbvMTQQP954QoRoCgvfSnKMZh0fyCNIka7BkUh93k
 0nTOHitOjYgXOvGzKiG8WznzXcO9vGR8EJDmPXQtXpbj2xq0VFTwnUa8Zh1uF1pQH7k9
 rOyT77iI6fkue6J/eJIxTSKdjtsWeory+XSvxZZsRLoN84ocZRbd3ypVnztJV4LFZ/Ka
 xnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXiD35JTFMx245XADwmonB0GeC3IjVExuEdnO7Wg2CE=;
 b=t2MeQYTdQms0XxT/rDmITv6Pfy22buU2wIZsbItemE9hQ7zFLc9ZKJwzLoedoPUmS6
 nPz/Ec9rFgJHRqvV4ZFjMGkD9kAIlcqKA+7zxjVwEr4sfL36+4xR2EbrhGe9i4ub6fxR
 2z6w6yObsBelkyuf+slEJDCQeMQ7bqWTcqm0SEcKC0Y26DJqkFaD8ftm8uu1y+CQZcmm
 3/Ep0yw6f0PaaEm9LZFFVRfpuwuPJOQqDouwDbyo2BW1JhVwiXNm+w2eToTpbgtekdlz
 qynqt9XC7JvSfml/0n9vzJ/uE96dqrx7HxNSRXXX1n3T127H55XSyDiNuhBP5NTLJnpi
 zlWA==
X-Gm-Message-State: APjAAAXrGCMYd9f47fVHMimigO705Vg4wiBl1XsdCEba78Z4EGwlriSq
 1VQpZmmC10u4w2/mbprQ+XR8xunSfzoPBu7NFfA=
X-Google-Smtp-Source: APXvYqxUCcsiSytFAaNbKZuuNwe+qFVRcuSyJFgzyirvRqqtBGRANwdm9p1+LdSU0XfkLu1fdRquDShLDRDdRacvzLI=
X-Received: by 2002:a6b:f81a:: with SMTP id o26mr876889ioh.156.1552484628462; 
 Wed, 13 Mar 2019 06:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <de550e08-2338-9438-6021-b2b6ef130bdd@linux.vnet.ibm.com>
In-Reply-To: <de550e08-2338-9438-6021-b2b6ef130bdd@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 13 Mar 2019 21:43:33 +0800
Message-ID: <CAARXrt=knVzKw8HeiRi=XzZy322Sw12sevrWdgnuK82YHm1kiQ@mail.gmail.com>
Subject: Re: Static code analysis tool for openbmc
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 13 Mar 2019 13:43:55 -0000

On Wed, Mar 13, 2019 at 6:15 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
> Is there any plan to use any static code analysis tool in openbmc? I

In Jenkins job, we have cppcheck to do checks on the code.

> find one of the tool which is good and used in multiple opensource
> projects is "coverity".

I would prefer clang static analyzer, but other tools like coverity is also
welcome.
And if possible, there is much stronger analyzer PVS-Studio Analyzer (need
license though). I read [PVS-Studio's blog][1] and that tool is really really
good.

But I think the main question is, what to do with issues found by the static
analyzer? We need to define some rule to fix or ignore the issues.

[1]: https://www.viva64.com/en/b/
