Return-Path: <xow@google.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCgky2MJMzDqBh
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 09:23:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ihAciaKD"; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id u25so180065636qki.2
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 14:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=j+AATLdAd+10i89doBsYt5wvj/lnAUNNQRIor3zk3j8=;
 b=ihAciaKDyQmfy7V+PSQtkKBmFSS0tKfVVYGPYOytEpse4iR+QaoeJ8FmdgI7/qgiiL
 XzGrQcLUEslHnLAlt2/QdegvE9lABMB2EnRoG1ugWhoPCno102K+amEEk/vuTf3K6OBY
 Kg4Umumm5r0+Ya5ml+GH5Ah98J+y/DIMmsbuVp8rV3PJCpjtIvvAuw0qAScf5EUi9yUB
 gzqLvl3b5LEvz69i//ZIo/m+DK70M/kh6Z3rC9mOfGjrR+x/kKGNPky4XfZGKgFpj1oE
 xxupW2SnGdaRm/EloW3iHd1rfVVFSg3u8xautu+KIUSQ/Bi7HXuagoHE9mo5eBoAntWi
 Utjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=j+AATLdAd+10i89doBsYt5wvj/lnAUNNQRIor3zk3j8=;
 b=rlYY/7oacyEj4+q0h90hUjfappSJe3xWYEAoUf6rL7/6sOZC5wrkeacO9XiqUCYZ10
 5ZOGw+8nAr3iLZz6uFeevAeikjej3S6xmCakm0b9ZkwP9ENPqttN5xxg7nPqEK7k+vuS
 xGRw1VywKv/n5ZwzIYJ/dDK5O7CcEPBpPXAF4S8OJTKlMc9qHp0VL1ZXIKmRLRFwrTx4
 jTUtplP7iS0P6PIDhY/Kwxh2OzbiKSDEyHKUZHFoAVqMee9ylI0SsCiLWGzNjDGImwH9
 fPRgCd+msWKoi1YaatLhCNdyOZ9uEZxmBLHcwlkpaNy86/bkATG6iMC8JqMANousoL+Y
 HVdQ==
X-Gm-Message-State: AIkVDXK88ilXODlA7OpWY4E0dooXqpLYzw6r2jsLhT5cONmNsOkwBjlQGK6iP4ZDuKZvePtMLHlgl+4GvjFiV3rZ
X-Received: by 10.55.18.165 with SMTP id 37mr29578034qks.22.1485901399245;
 Tue, 31 Jan 2017 14:23:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Tue, 31 Jan 2017 14:23:18 -0800 (PST)
In-Reply-To: <1485590413.2450.7.camel@aj.id.au>
References: <20170127232307.110483-1-xow@google.com>
 <CAPLgG==oWWy8pTpLszLOECXK7pQMXW8uE_NgpFz7Awx51q5ohA@mail.gmail.com>
 <1485590413.2450.7.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Tue, 31 Jan 2017 14:23:18 -0800
Message-ID: <CAPH-5w4VX6HhGVGPXZp-xM17SWniKRUwvD_Wu0Vqf_KyHQnjLA@mail.gmail.com>
Subject: Re: [PATCH linux v2] arm: aspeed: zaius: Disable LPC reset for UART1
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2017 22:23:23 -0000

On Sat, Jan 28, 2017 at 12:00 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-01-27 at 15:32 -0800, Rick Altherr wrote:
>> I still don't follow.  Is this changing it to drop bytes until the
>> host powers on?  Is this change making it so the device won't open?
>
> I understand it to be the other way around:
>
> In the existing configuration UART1 will drop bytes by being held in
> reset until the host initialises the LPC bus (i.e. releases LPCRST#)
> during boot.
>
> Xo's change reconfigures the SoC so that UART1 reset state doesn't
> depend on LPCRST# (i.e. the host initialising the LPC bus), so it is
> immediately useful in that it won't discard bytes.
>
> Xo?

Yes, what Andrew said. It releases UART1 from being controlled by LPC
reset, so that it's available regardless of the host being up.

cheers
xo
