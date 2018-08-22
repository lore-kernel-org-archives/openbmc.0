Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VqS9nO+y"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wTj36Nn4zF2QJ
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:00:55 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id k19-v6so1035501pfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YPWWre/ebm3xtHIcWb8IyVlIIjNI0BRXeqduXDiUhUo=;
 b=VqS9nO+yZ5IpGtLichxvnpYFjCoiQHqmSh4YRwfUPjbsiYUPb7gFVpyP1/bHSwVSLO
 Ix2LiVGViyA7EqEKe3oW0fa+yZrRwTfGF5LXWJJF+b2fNiRzHzpQzYKOnJRg8nPhQDAj
 qE0ORjXEa6txK7EZ0vsyADTFoATw/LwUpouLGS7UJTHlLHU1sTwlwk7wDlRy3fZtTQHH
 xA0QWsliSoEHm+Z+vdtRP0T39zADMxzbF3rtlOdHwHOe7sGgzc6PDzBCl1QM9y0eZ6HM
 ueGKEjnFemTEf1KW5tmxveFeE/KE8CYTqX+NnieTsyNEEgN0ZTnyByD9FAZ7reMukyEO
 xtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPWWre/ebm3xtHIcWb8IyVlIIjNI0BRXeqduXDiUhUo=;
 b=JN1VUBiIvM7vPaaXoXUJxdJ0VMJQetvYKrpIv3BnHNeQ9WlGmc4Ui7JmsweuA4RylH
 TYQ/ndktbl9lqzG2QDv16Ge6Dhd6v7aEoq4q2SYIUdrGTFWfRhwuMtwtOuUma6ixHr7+
 +15PYA1fOKlJyrYdQgSyErhLKs37MptQ14U/F1ufXp7vamcxACEIPKwvSolVh1asfNxU
 vnh25xFu43VbyZ4LoDqqhI3UZGBV4AeB88Scfl80HtptZBiz/ODvml5+eZPXS/vxmBii
 F/fGwo1laXm2VQhpIgq46vOopEEdHMIRVq2qrr2b5GE2Upbcxvl8EzIkN3M5omDc/VvP
 vHPw==
X-Gm-Message-State: AOUpUlF703s/liv6wvu8Idctpv7xIOMJX9OSFBdI6wlBx8DUpD3a8qvf
 a+IalHtvYduJnqrv4I8Zpva+Xpz3vsx4rJgw3VWOmw==
X-Google-Smtp-Source: AA+uWPziPj5teYfbZ4IKlfKX9GXSXx3pSAxzOm/Ks8MO/1N4qbD+ngikCyDH/u5qqSaynKzGnz/gnpoev2DfG1OnvlU=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr50850554pgk.209.1534946453511; 
 Wed, 22 Aug 2018 07:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnigKkG1C-80T-7c18oSAC_s5CpEN2XbaCOY2u9g1jqVv_fmg@mail.gmail.com>
In-Reply-To: <CAPnigKkG1C-80T-7c18oSAC_s5CpEN2XbaCOY2u9g1jqVv_fmg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 22 Aug 2018 07:00:42 -0700
Message-ID: <CAO=notwK9fhqSTjHpMZYMmUrJZFKfNKW9m83KiT9Vun-rY3R3g@mail.gmail.com>
Subject: Re: Announcing gpioplus
To: William Kennington <wak@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 14:00:56 -0000

On Tue, Aug 21, 2018 at 8:21 PM William Kennington <wak@google.com> wrote:
>
> Yet another c++ wrapper in a series of changes I've been working on to
> make ergonomic c++ abstractions for commonly used library functions.
> This project intends to provide a simple c++ interface around the
> existing linux userspace gpiolib syscalls. The functionality is
> complete and the tests cover the entire interface.
>
> As usual, please let me know what you think of the project. It currently
> resides at https://github.com/wak-google/gpioplus. This should find
> a new home at https://github.com/openbmc/gpioplus if it receives
> good feedback.

+1 to this.

>
> Thanks,
> William
