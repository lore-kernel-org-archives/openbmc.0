Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DaQJS1qj"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WtgD6MYzzDqCF
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 11:32:55 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id s11-v6so9723520wra.13
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 18:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RSuM0rZ98HKTD9vYjFqOIZO7aGEIq0LBcYS6anh6l4=;
 b=DaQJS1qj98RqfnM9XTh8vDpV3MQQSEBoCWhF0EnnBP9PMZ0yiHpqNImER49PmkJ48d
 CFYVLzmlWsefEtLCqDxdvL2ndX7Lnzu7ddHOU9FsD2DQK5+9aSWgybINvKbcdKYhz6ir
 8zRRtxeCYhwXT8385q1r6WCAwd6/d9kf3br9hQSsMXVramm7C8ygNaGjqWYCpd+r6a7h
 nF84lOU6oHHVbX56Kad6l1cmwhZRTQNdB/zxVhLwKJsg+VWBlBNl3y9mW+ctu41Uixb2
 XmQ3slexBHCfprj7Co9qc/HICBz6xMmyEv9Vn7+N3Wbpj9u8csI9d/vSCsBvYWg0O6w1
 4E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RSuM0rZ98HKTD9vYjFqOIZO7aGEIq0LBcYS6anh6l4=;
 b=O7HmVKsCGjFG3WVIm1o0KO35wpdSko4qpE5R27vjbUSnLc4TPftVnmXz8R5BDEPIg2
 DIA/Iq7W+wsgLLn2yp+xvHaNflJeEA9tQxc6Q4p4+iM7EcUHUWtHtoXOmjcX4vxsGbOc
 vNbn4JBr6VxVkyNd0uh4szG0iJIkT0puaOlhZXjyAgHZrxJ86x/DcDLzPfZO157YqVIg
 ckW0GxD3slBaWQeboPuddAXnhwzn8H7UIIDkhnWUQnz2wnXiCGwa5xbZsXSBcnybuC9d
 svChlK9U0DxAWyj1lLyZMuD1L+9yRgDYfYh6mb3UBegYP3KInNY3u5IKSTkzqHW0jLRQ
 24CQ==
X-Gm-Message-State: AOUpUlFkdIlEk9XYMwHFJxSDFlcSfZXRCJLaMQJFSFXO8VHed9eU9fYV
 +wynXrkofSNBJBzryQfb7yZv8Lps64KFT0egTaepqw==
X-Google-Smtp-Source: AAOMgpfLEoSetKNbGXlLmbr8T52oMCFwAEBinct654IpKZwBRiMFXsAsK+T5pbt7PenO5spV55Y3QG0n3ijcQv6aNmA=
X-Received: by 2002:adf:9183:: with SMTP id 3-v6mr24935wri.122.1532050371460; 
 Thu, 19 Jul 2018 18:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180706181601.134913-1-benjaminfair@google.com>
 <caadb9ae-68ca-3086-26fc-e03cb7ce1d59@acm.org>
In-Reply-To: <caadb9ae-68ca-3086-26fc-e03cb7ce1d59@acm.org>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 19 Jul 2018 18:32:15 -0700
Message-ID: <CADKL2t6CUs95zJ6989LqSkq_GCor-duqYAn78XDRxpWOk2EA5w@mail.gmail.com>
Subject: Re: [PATCH] ipmi: kcs_bmc: don't change device name
To: minyard@acm.org
Cc: Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, 
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 openbmc@lists.ozlabs.org, AviFishman70@gmail.com, tmaimon77@gmail.com, 
 haiyue.wang@linux.intel.com, tali.perry1@gmail.com
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
X-List-Received-Date: Fri, 20 Jul 2018 01:32:58 -0000

On Thu, Jul 19, 2018 at 5:52 PM Corey Minyard <minyard@acm.org> wrote:
>
> On 07/06/2018 01:16 PM, Benjamin Fair wrote:
> > kcs_bmc_alloc(...) calls dev_set_name(...) which is incorrect as most
> > bus driver frameworks, platform_driver in particular, assume that they
> > are able to set the device name themselves.
>
> Sorry for the delay, I've been busy and on vacation.
>
> This is queued for the next release.
>
> -corey

Great! Thanks, Corey.
