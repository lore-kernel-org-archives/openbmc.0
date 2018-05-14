Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hv8/hNUl"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40l2Vw28mQzF2TW
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 00:04:07 +1000 (AEST)
Received: by mail-it0-x233.google.com with SMTP id p3-v6so10464452itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=286pd8M1pYu+5/qLbsul57AXkj4wGRSwL7CQYwmtvdE=;
 b=Hv8/hNUlJomaHpZeoviSQBj6AsPtSQpsVDNuEnu/YONgs1CojRMG8AO72X9gHf0rQl
 riSUsvsvBy+mVV22Y3atCQDIksyhyqGhevO92oyDXhjgnPfTbIjDaaB14gDft3CpZhU0
 OYSdOQWOYDO/TlJX0A7HpBDNGpZ2M468NU+afcWF5+SqmSPxDNQuC0skGx8Y3pTQ6yZk
 nO3Ac5dyJIOPgx4k5DlXmfWzxAPWjQaExMZ146TFNOtXP3MNHEUSONIzQjeHkQOb3+XB
 9hpbOiznKq7zAJsMQLlNJEXTfK7KgpZ5ld6k6LtVmsuC8ionQk0qfLFBGucRo0vlcmPd
 e9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=286pd8M1pYu+5/qLbsul57AXkj4wGRSwL7CQYwmtvdE=;
 b=AZ9vCLwQ4qu8UFaLoEtqDwjJk0OXOqHVOFaSxzwHLdOzdPv/KyBl4DoJ6RW0lDLqfh
 3cfCai+aZTJKRfUgx4aiypknq7sac4pPrAReiZushglV3oAi+gxsWUfeqgygJz04kFqE
 CNijoP6+j5Dt1OhEGBz8oAxMpb9jemnWoqn971rWYujjkCVcZ6eupZgSLrqwZ3ld+ZnX
 KJmIowqj8fDDzVvp99iK7MVqsQBxZEg+PzgtweqM6doFT7BpruzOVxYd12CDXVuoNmoO
 DO6yo4unvmhkGfR6E5WE2+WPvrwlaPgJga7qkqdEXtrqRLbmzBnMHfmmcpuLEXcyh6bJ
 +a8w==
X-Gm-Message-State: ALKqPwcy3uQcZQPVnTEmDpsh9jn2UIzRV7MBWFZ06UNDU7nViKfIUZUm
 VU8qIxFKr5JDZpZzeBr8wo6Mtf7lbVdrVUw40Bc=
X-Google-Smtp-Source: AB8JxZpml5QQOXNmkGadKEv52KnnuPAXNf+HHOLq2dINcmaBLSSR6YUwTs5U7AiD1CuRcLeKd+uPXX3V6jRDjAEkl/I=
X-Received: by 2002:a6b:109:: with SMTP id 9-v6mr10022068iob.138.1526306645615; 
 Mon, 14 May 2018 07:04:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Mon, 14 May 2018 07:04:05
 -0700 (PDT)
In-Reply-To: <495148e9d2b74b00b2fc6e5eedf13cc3@ausx13mpc109.AMER.DELL.COM>
References: <495148e9d2b74b00b2fc6e5eedf13cc3@ausx13mpc109.AMER.DELL.COM>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 14 May 2018 22:04:05 +0800
Message-ID: <CAARXrt=ee74cA2rx=KeBDCS_dENdDpEm7onPs+mzQwgv7N01Tw@mail.gmail.com>
Subject: Re: Aspeed AST2520 support in openbmc
To: Lakesh.Sharma@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 14:04:09 -0000

On Thu, May 10, 2018 at 5:54 AM,  <Lakesh.Sharma@dell.com> wrote:
>
> Hello
>
> I Aspeed AST2520 supported by openbmc ?

Yes, it's pretty much the same as AST2500 except that it has no VGA.
So it's supported.

> I don't see it in  folder meta-openbmc-machines/meta-arm
>
> regards
> lakesh
