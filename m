Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYvrf0t6KzDw2m
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 10:31:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="xdnMRVof"; 
 dkim-atps=neutral
Received: by mail-ua0-x229.google.com with SMTP id 20so431848059uak.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 15:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8/c+2sOo8s4/uopa1SWu2dq5kdLO4rXBf15Sk7a95j4=;
 b=xdnMRVof5ZFsvMoP2DlVJiuyrCqFFLBNzkkUUZFCRu5CzlwyIXKNJ4cGm3xbENMZD5
 s5CF9Inq+KgSIwy1SCeQ8/taIkJYfGS9bR5u5moJV6RRsyrZkl4YnnNuFonh9+nH8oDU
 arWaYiZ+4oQNsxw+YCqNl7iXaeUFGO3E2gLRLrXDs651nXYpV1IVHmyRV175jIzYsUzf
 8O160Ai3o1hoOVt2WAxBMl/YzXVK0rYL6KBYR4XDEUE0RzuGN97ZD7KeJzRKoY+qaoJs
 tEv7mNd/5f2/HjyzYTEC22V1O3WXYHRqnYwQjgXo71ccOdXMPS+V9+jer7IuzD6E1pE5
 UktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8/c+2sOo8s4/uopa1SWu2dq5kdLO4rXBf15Sk7a95j4=;
 b=RESQ9TWkEBL4bvyrpgGHMPj+4ZktzCO1UmIdRqI5aAysusm/v6FWqcleplyFH97iRM
 FZr1IzE5pWYvIQ4IXLWnlgH4RsjC6es8m/+48HCefJCI6sgyuh1OinTKKL/rJksh+JIu
 QYQckEoma6Gd3nMgSW6ckP9H8XDImEGjFxJK5OO6mKS1JPPf0GIWkcqtJU8AAwdmKyHj
 vBi8jI6xWY7Jp5LjOZjQXt5xpZfeAwpzJd1VQ2OdT4sod/D4XnKsceylml0iUtVg9cHG
 FV/Ho3udas3HSqDSUBYV9vRBOfa2punF4exVmR7XCIJPip0kuT4hl2eaMrGrkWLeqnlE
 72pQ==
X-Gm-Message-State: AKaTC02+6+zI+5TzdNklhoDyhntf7bvEZJVGmTs7+scOnuAbKw1Oh39cAWAm0SJBLmc5FKrAjjJrHQZk8HdZmA==
X-Received: by 10.176.82.181 with SMTP id v50mr46223651uav.31.1481153471814;
 Wed, 07 Dec 2016 15:31:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 7 Dec 2016 15:30:51 -0800 (PST)
In-Reply-To: <CAPLgG=mK40uKGdspJnxN8ohZn1XBv41TLknLYsO8JUH94+iZxw@mail.gmail.com>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
 <1481133996-29973-4-git-send-email-raltherr@google.com>
 <5483e4dc-506b-c5b1-8e62-17408a9c1d9c@kaod.org>
 <CACPK8XcpR534r0nr06TQxr9hyM-_CY5SAFLO15-5yqO+zYsu1A@mail.gmail.com>
 <CAPLgG=mK40uKGdspJnxN8ohZn1XBv41TLknLYsO8JUH94+iZxw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Dec 2016 10:00:51 +1030
X-Google-Sender-Auth: diAiwcTEQiJV3lqoUHEglfvm704
Message-ID: <CACPK8XfdtsatERmRN28nwV82w6wwKrETXeX94PvVvFEP6ZDo5A@mail.gmail.com>
Subject: Re: [PATCH u-boot][PATCH v4 3/3] Enable FIT image support and FDT
 loading for AST2400/AST2500
To: Rick Altherr <raltherr@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 07 Dec 2016 23:31:14 -0000

On Thu, Dec 8, 2016 at 9:56 AM, Rick Altherr <raltherr@google.com> wrote:
>> >> +CONFIG_EFI_LOADER=n
>> >> +CONFIG_FIT=y
>> >> +CONFIG_FIT_VERBOSE=y
>>
>> Are we sure we want verbose to be enabled?
>>
> It turns on a few error messages when encountering situations not supported
> with FIT images.  Binary size increase is small and it doesn't generate any
> output during normal use.  I'm OK either way.  What do you recommend?

That's enough justification for me.

We can always revisit later if users are confused by the extra output.
