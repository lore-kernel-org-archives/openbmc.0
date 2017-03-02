Return-Path: <xow@google.com>
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ0RV50k0zDqWK
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 04:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="d3DQDUjq"; 
 dkim-atps=neutral
Received: by mail-qk0-x22a.google.com with SMTP id s186so135911152qkb.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dxLHfRPEySpz7T95nQX2LCeFtg1Sbp71C8XM7Jwz/SA=;
 b=d3DQDUjq928xTCBIQkdszLPwkAp5ptb0/baovE6sgkZ/TvCZMYg7fyPdE8u8e4x5ms
 GNaqDk41p6KIgf+tLS2w1SgAXS8QeqCJkyw2RlX4+bPjN/KWLjnVHL+2f0RcFLpzpHsy
 NB+jG+ImOIXhhmZABUX5IzPNLad6una/HsOphKk7H3XB/N3i5I24XemTop0xbtFTpzaf
 0sdyipKqZEilLTVjuYCw1n/wVDkiU00hsESUXyj0JrPialhKLTkBmaJjwXUyu+CQAkBv
 5agEGW2gZ9rMpEc6McBVaJPAGxOya2VWhxGXTrx1CKQcVKEKdKRg3GD96Xpmg9bEn5sr
 mTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dxLHfRPEySpz7T95nQX2LCeFtg1Sbp71C8XM7Jwz/SA=;
 b=sNUf9QE+C/nWfBof6lXJxThM9dOhmny2Uf+FdBmxaGkBA18QENXupIIzlGuETE2RrA
 0tD73l81ruWUfm+deLjilcFX0KuDJxOmJ7npC4iCCDuCzPBaZXOk8OqV+8HmfOmKl5J+
 +2RvgrfCOrLxYPqNcwop5KkCZ+rypkaeKqknnERyHydbzOsKVEqJPprPqGzoZESiAXxs
 0l7vxqIgEHlPVH5RRXq7BryXC696GR2Zaf53fe4asQpWpgb5o5jUV6PIGon35g1MjvDD
 MKwM0cIXUUm2PTCpRnqRyHbHo2w590Sou54cD1QkGnBwBemXxGRQaF4umbHvdeWgGcWf
 WqDQ==
X-Gm-Message-State: AMke39kgcoC/a8f0Vm/B1zPe6np7nWWxy4f13o8Wp2cEWeRjum43Z+ajM3hG/MDf+YsqlpADR+Je7cBjxBZlEP62
X-Received: by 10.200.56.248 with SMTP id g53mr18455836qtc.172.1488477506143; 
 Thu, 02 Mar 2017 09:58:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Thu, 2 Mar 2017 09:58:25 -0800 (PST)
In-Reply-To: <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
 <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
 <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 2 Mar 2017 09:58:25 -0800
Message-ID: <CAPH-5w7qxK6J6KsQQk6CVQt0eg6X2zfWDTPsTD09vFrpdh6UxQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Joel Stanley <joel@jms.id.au>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Patrick Williams <patrick@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Mar 2017 17:58:31 -0000

It looks like this issue is fixed in v4.9: https://lkml.org/lkml/2016/8/15/569

The cover letter to that patchset also mentions adding an unused "reg"
property as a workaround. I had probably copied and pasted the pca9541
bindings without "reg" to the Zaius dts without reading the rest of
the notes. Oops.

Should we backport that patchset and/or wait for the next OpenBMC kernel rebase?

Emily: can you test whether the "reg" property is still necessary if
you backport those patches?

cheers
xo
