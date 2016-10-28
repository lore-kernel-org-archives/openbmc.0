Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4kZS1nW6zDvQC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 11:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=h91jifGt; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id p136so32228986oic.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 17:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5witML8CpWqK9xrrmpnDFHNGOz9UojmLN6cRoA9ryTY=;
 b=h91jifGtnHKHepMH4+S1rPFBmcmC79V6R4OlpYcRme+VzsiXZsClsWu1wO7mId19zy
 E2NzSca2XJDqoA4AOiZqUUyZJISGc3zE4WFPeExUgOn2NIARu+Zk13h9CFdmyprNEgNB
 ivoMkHdjQZYdl/Cz/tDKIBVJ1ANDVUK2oyXPsAc5rjf/jn7ysPRyQUp9MA6jxRmg3Xo/
 EXqnoZhkMso+jlokU41KLk8LQwF+t1eQ1eIesyO4xMsNSrjWM6GnLaruT/Nle3YvKCIw
 FYGopzSaXMx2H8kRxhAolES6705Ir6puLM6B331V4lTm763hyZNH0gcxfURbOs9Hjeb6
 N6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5witML8CpWqK9xrrmpnDFHNGOz9UojmLN6cRoA9ryTY=;
 b=MYCuU9TWt528ADLSlESWNoXbXck3dwqJmMkBtefUyblKwGW0IPAGPppCjXpiRO2XAn
 vEGXzOFfwU+bFey1QYV9V2x05X3SzW63DUYKx02dcU7H1qOPs/QifWErzdv63CU/0Zp5
 CPJ6qvj3Sp3b8hQASF2lWISUjMrbmt9hX1OoCgPcEdkGYJWag+k5iX8HLcSaynd7Oka4
 1plrIHnZLACCuOrGy/uoG4vq6uo/gGVlwEXLir3aKkM753dMFGbtNpmMYlXpMD7B8UOo
 adN3OD7eT/DtHPovOUZA61WLU2AmOV68twstBvbSVF6nygABq0gyd0bK6Zx5pue06JTg
 mmtg==
X-Gm-Message-State: ABUngvd9xq3SKwEXfZu6P6XorL3AAnCYAzJEP7NILqZvSUZgqhEd+sqYvsga8VN7FhuSVPz5FkkvFObL22XLzg==
X-Received: by 10.202.90.3 with SMTP id o3mr10466220oib.46.1477613198027; Thu,
 27 Oct 2016 17:06:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 27 Oct 2016 17:06:17 -0700 (PDT)
In-Reply-To: <CAFR_W8pqYspY7kFmm_Re-3Rr5ZuFhkjCu0QRFGM-+rDh0HCxQA@mail.gmail.com>
References: <CAFR_W8pqYspY7kFmm_Re-3Rr5ZuFhkjCu0QRFGM-+rDh0HCxQA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Oct 2016 10:36:17 +1030
X-Google-Sender-Auth: Ms7yBUF3RcAEi9RaFrCvmRhi0ko
Message-ID: <CACPK8XcNAcQ+JEagO8ThwhBC60HNCm_FbfAPTVvrJ8baqGu46A@mail.gmail.com>
Subject: Re: U-Boot network driver
To: Maxim Sloyko <maxims@google.com>
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
X-List-Received-Date: Fri, 28 Oct 2016 00:06:40 -0000

On Fri, Oct 28, 2016 at 5:02 AM, Maxim Sloyko <maxims@google.com> wrote:
>
> Which networking driver are we committed to for U-Boot, is it aspeednic or
> ftgmac100?

Currently we use aspeednic on nsci systems, and ftgmac100 on systems
with their own phy.

ftgmac100 is upstream, but does not have ncsi support.

The plan is outlined on the u-boot wiki:

  https://github.com/openbmc/u-boot/wiki

Which is to write a nsci library for u-boot, in the same fashion as
the one Gavin wrote for the kernel.

When we have this we will integrate ncsi support into the ftgmac100
driver and delete the aspeednic.

Cheers,

Joel
