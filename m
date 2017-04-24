Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBhnJ6gcDzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 09:07:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rUn80EYD"; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id c45so126930009qtb.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 16:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=x70jHHWad9ORTdnCadrmskk63TGewpNwk20yiXIwdMM=;
 b=rUn80EYDGOK+FXBRLfL8MjVOnmHYTLHalF6ep9DoPgpNcvJvYwRfIjauOnqZTTnKUk
 +fWqy6qrhw+QUY3yWWrUHK2EmbDPhjchA51v+kAd+IKpVvZTxIpyV/S9sMqPb9FtznRl
 4YeyhlZeGaj9t1Ot64T8L9UcD7xIAUJ1Svi7P5O1sAzs45p5tZ9Kk4YzA1BV2PHvN6Lf
 XsrLwKQapqWAC44BFK9S9jnMm8B7mQ74mxkUoL3i64+ZHZlJcWzpVlbu3DMzBKHklvwK
 derENcNsHWdI8vpZmk9gHoiTKobSrgPVth+qa9MBmor+L6GJHNP8ujyFaGPu0K2mJB+Q
 U4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=x70jHHWad9ORTdnCadrmskk63TGewpNwk20yiXIwdMM=;
 b=U3eSyEg9kxNXUHJwr8lmnqupRAMXLtia7ErGLjcimYpOFgZFswuMI4flFyNp3b+KAI
 r98Kk9a30KfRcLv0rJ7GqTY2bQ3G9wI2DutSqTc1np3rQBUWDtyH4mcfk8A5aSxrQYLA
 Z786LtKZQBDu6oTVpurGFA4lCVtgCm7miZhvrmP6gYfyApA26VRntFRJVMIqMYWU7Q40
 tLWbx/iWztD18lNQzNSFa+tPadbem4YlC5LGCjj3dva9yr9WuISQvagAG8es6sbsAs+N
 hd8u4ebeuEHKz5qYi8cfNZmFZpZiJDPmkHhJs6gyDwk1lSuzCgaDXA7CFLQegfpuVk4A
 KnyA==
X-Gm-Message-State: AN3rC/7xiQrWsInuY/GrG9kLEaaXo5eJhNLsyG+BiHMAc3nkwSbTYf8p
 vHcvH7LVOSJC9EzHPBYhyjj/SYeYKCIg
X-Received: by 10.200.57.18 with SMTP id s18mr27198324qtb.1.1493075234609;
 Mon, 24 Apr 2017 16:07:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Mon, 24 Apr 2017 16:07:14 -0700 (PDT)
In-Reply-To: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 24 Apr 2017 16:07:14 -0700
Message-ID: <CAFd5g47SMzF=FjYrZkVx6y-L1+D3AGHb7-gQO5W=mzvW+RnTRQ@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Edward James <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 23:07:17 -0000

I just posted the latest version of the I2C driver this morning.

Cheers
