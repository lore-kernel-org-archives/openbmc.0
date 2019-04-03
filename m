Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XQhQisBU"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YxBc6YWYzDqJl
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 17:34:32 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id x12so18235943qts.7
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXEKU93/+XsjBfsmJAL4MqKOWiuBauRQ5/Pcl1zNgQ0=;
 b=XQhQisBU9mOf/4SF4CEJx6tKE/HpleXIDJLFh0llBHUG+8PjolbbnCyYCYmJjB0Y0e
 aa31i56gfXKdXgshMQvUBQ3U7hlUENBvpu9+KyvpzjI1BvNtpjiPKuIPLNShtHYDHC9m
 XWvGLgody1I77PvcFtgc5dFEMmVTqaWMxFqGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXEKU93/+XsjBfsmJAL4MqKOWiuBauRQ5/Pcl1zNgQ0=;
 b=GJWj0xDDJVHxMt0TBKZYPT4w28EYTey+/Y+m3A4YedsTzFUZuAsmdMKJmzyvf6S9pN
 GXz0tY0FSKDCbtUhjG3s6VB6OWdFL28TpCjUeibQOrVawBzUg9fBymM4ufERM7K6W3P/
 UCr3m8Fy2LWN21+XJfVlOQhOCqqmW3MWYJNzPpkal5BVhzv/Kz9i1M76RA4j6eqLpcfP
 wyW86JMSs0RRB6+oE1QdgpV57NRY1+9HlVYo2RdQI9lbbSkZoYFgcaK6ElK3ZHBqa/lz
 BoF2+K3+e93uktEncwXXimAa/Gy3gvKeCUscjzTDYM6GtUlbrFCEXESBo8OSQysV+PrJ
 jPDQ==
X-Gm-Message-State: APjAAAUBUfb9m2LVin71D3KrJ3XSOaEWN/gjP2POnlFh7LGAZmtioadA
 NoD+OhdiaHRscgEZqFRyyuayuh4KAuOvjP5M5XZRRgV8UxBrAA==
X-Google-Smtp-Source: APXvYqyqb2HCQu0A1k4P8T8QNEdgn8kVKqsQi9B5FT+VEEvDtTPlTXzJEWk0OqMmMn7q1p4OfEwx5aNzaCziOSkHgng=
X-Received: by 2002:ac8:54a:: with SMTP id c10mr62373839qth.43.1554273266776; 
 Tue, 02 Apr 2019 23:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Apr 2019 06:34:15 +0000
Message-ID: <CACPK8Xfn6-_zKpY9ga38Pwv74kKQ-Wi7FkXs03nUV4m=0p9r7g@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v4 0/7] Enable video engine
To: Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 06:34:34 -0000

On Tue, 2 Apr 2019 at 02:42, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series adds the necessary clocks for the video engine to the Aspeed clock
> driver. It also adds the video engine node to the AST2500 dts and enables that
> node in the witherspoon and romulus dts. It also removes the use of the reset
> line in the video engine driver.

I've booted your patches on my system. How do you test this feature?

Cheers,

Joel
