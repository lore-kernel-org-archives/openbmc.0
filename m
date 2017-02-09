Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJnGp45przDqGn
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 16:50:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oAxIV7Ab"; 
 dkim-atps=neutral
Received: by mail-ua0-x232.google.com with SMTP id y9so127250286uae.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 21:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ec4M17lTgv6jOQwgIdk5tu74NkLAQbmJAQJViGSL7Fs=;
 b=oAxIV7AbPGXuj19azDNmXM50muBXQ8ydO7AgJc8fcCfdLdIMQtlSbFZklSoSTk6Qzu
 q/YORqpF+de7/fL2UiaDzUfL9GaJUcL+jEPmC+W4NUJ+27PKWym7GApGMppWRmbX4/mg
 vadSHOTPt1vTwaXusjmz60xPMdhLYePns5g6rGfbKj5G1XOAqYCQxqnDLL9m/FD7qgZV
 zF8GkKxhBVFBldksQmQ9OrAO/63LnDVAeM+lQmNFZH4eeob5bouyfJdTcYp+qm7216ru
 BGy8nS6Vx6Yj4eOsnFInN3W3IiULtglDdSU+9m4TuFKa3ZMRkFL3JmpT7x4YZG+VwhP9
 ynrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ec4M17lTgv6jOQwgIdk5tu74NkLAQbmJAQJViGSL7Fs=;
 b=hFdZy+TwCz308sqCmg8g5kGzKt0UUa/HDdCq7d+i2IvlOqBpeae8l+Ywhba80F3kff
 0G5UQUOk3WxyA56SvJGJNsSzhUuD5AjU2swAm79W27xJn+2AwR1z2hiEZlzYeHVZGqaD
 CLnrBqIwxMzxY8882l3UfOCpzkjCVXdlUzoFElHeiD3b884ctBRjSKl8IyYdo4UcRf2g
 UaCzHtYeq4UB4xyeCIVElSI5x1OATn7Yg+JVl9LOl6ywBvDZeoGO41O7Bgx1WNlZFZCI
 dit2PQh+tR9SkS2JHSz2ZqQSbCtRnndNTsOfU5Y7X1zAqZdXyjmORTJM8QXAHD2fVVMy
 Vo4w==
X-Gm-Message-State: AMke39l8JhU7ywQrLLUfrdLS7MxpLydQ1tFSXTy2b/LgopYOL0dX+VdEiMg/DNfb3torNLOfHCdFdbJaZQoQOw==
X-Received: by 10.159.32.38 with SMTP id 35mr789518uam.12.1486619407243; Wed,
 08 Feb 2017 21:50:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 21:49:46 -0800 (PST)
In-Reply-To: <CAPLgG==GnEFG23QYWy81TexkKwcUaERd2gPqRBPnSY82h0fmmQ@mail.gmail.com>
References: <CAPH-5w7reqNuPcbf48F+beqFyK=Te5c9rd+0hwvqt4nD0MQXqA@mail.gmail.com>
 <CACPK8XfmY3sGcvqQnjmdOOL59RNxQ_M0YGPAROdW5GMujA+BVw@mail.gmail.com>
 <CAPLgG==GnEFG23QYWy81TexkKwcUaERd2gPqRBPnSY82h0fmmQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 16:19:46 +1030
X-Google-Sender-Auth: m01972FhjXo5-e877ZaUWRtNrkk
Message-ID: <CACPK8XeSijSkjAY9F7oUUfFXGYX8zVSfS0KRGO_BEywqScdh0g@mail.gmail.com>
Subject: Re: Patchwork lists submitters @google.com as "Rick Altherr via
 openbmc"
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 05:50:11 -0000

On Thu, Feb 9, 2017 at 2:43 PM, Rick Altherr <raltherr@google.com> wrote:
> Testing... Testing... Is this thing on?

Woot! It works.

I'll leave DMARC rewriting off. Keep an eye out for regressions - if
you think I've started ignoring your emails please ping me on IRC.

Cheers,

Joel
