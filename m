Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vde09wDR"; 
 dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WDnQ1tnmzDqX9
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 08:06:49 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id a6so2379582lfl.5
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhtfQhdfe/HampkDZN4MqGy/dvY848EADTQASjGpxkg=;
 b=Vde09wDRx4TXUSXjqr7GD1hiRlIWTGR3etuaUr2uWoEnBK/YC+iKgvE5StMYnf2SXG
 X43v6GPjZvtXB4DamhmOYN4noG3sYUwcTct3rJmsFPlTWzhoOZeVu71Qo68nzUxDjyf2
 H8yqPRUwqt4PARxs73xDmPjNReciESmdZChCI8ONahFPTjrcCyAuuaiGEqv3UXNqBAaR
 b4ZzCB0Rc3VBOTXoBmn3Y6eRsQDenNet4N63iU2PaAudzJXdMop42oq5oPRy1e3Z/7zn
 crzfKpo+imlSCfqSkVlVUUrjRyceieaxrmImoWMiISkH8K6Bvo1IKgcxrJ9klT9xJD6i
 ZlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhtfQhdfe/HampkDZN4MqGy/dvY848EADTQASjGpxkg=;
 b=ojj9p+MfWrKECo1iZN/Tj6ZYMvPNx+KO2PDkncVuJurMXHtpnhIHCyV2vA1tj1HG+g
 FegVJGVXzDqX7lzxHw07ZgzGgp2WU16jlwdfFf1DSUxYRQt/8WK0dUYwoJJVdzcann6F
 OTLbYpKKDpJRbFFARvze2m/l7GPCI8iWBZHo4zht9/UhVT4RlR632LbPKnRdZaVFLH4d
 62f8gvJv2Pfvmsf1OMe8wmdnIO5NrpJOg6AtVAJ1jkcaew4JwL10XAf1TNNmbkeeR+r1
 m+enbBrk73gV/zFUxjDmNlFKyWmqnfH8RV1J5jH4sVwUdDKUe0goRTMsjcSc70HYf12m
 7Vog==
X-Gm-Message-State: APjAAAWbAeyNU+1IEjY6qHkuivZBP4VqXGuKPDupfNO0FSxVHQscn2oJ
 cbwgCq4uL97mb5ddeHj3lsvE4lSCitGbNdcr9HY04w==
X-Google-Smtp-Source: APXvYqwDO2OxbtYFXmbQaLtCBaF/QNJnqwognnmZ6ky8I3soQZoBbuUPWC/i0gTrsigBHoSJK8yMEbC2/vbbpjERTZs=
X-Received: by 2002:ac2:530a:: with SMTP id c10mr23125166lfh.45.1553893605186; 
 Fri, 29 Mar 2019 14:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6W4jqEfuQTMe4jEMYmJpys1JFj_JxV1BL7NWp_UJ1=Qpw@mail.gmail.com>
In-Reply-To: <CAGMNF6W4jqEfuQTMe4jEMYmJpys1JFj_JxV1BL7NWp_UJ1=Qpw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Fri, 29 Mar 2019 14:06:33 -0700
Message-ID: <CAPnigKnu5_UmavFkK+NsjMXdKF4Y3YK+89y0F-rayewMJvZe3w@mail.gmail.com>
Subject: Re: Include BMC watchdog in sensor SDR?
To: Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Fri, 29 Mar 2019 21:06:51 -0000

I went down this road last july, but wasn't able to get associations
to map the way I wanted. I think at the time it wasn't possible to set
the second parameter (which is the watchdog type) in the SEL via the
phosphor-logging mechanism of generating SELs. Anyway I never got any
of this working but it is something that would be nice to have.

On Fri, Mar 29, 2019 at 1:06 PM Kun Yi <kunyi@google.com> wrote:
>
> In the interest of recording IPMI SELs for watchdog expiration events, I'm looking into how to include watchdog in the sensor SDR, so that the sensor path entry in the event logging can map to the watchdog specifically.
>
> Looks like "watchdog 2" is specified in the IPMI spec as:
> sensor type: 23h
> reading type: 6fh (sensor specific)
>
> then it goes on to specify more information at various offsets.
>
> Before I dive deeper into this, has anyone tried and encountered successes/difficulties?
>
> --
> Regards,
> Kun
