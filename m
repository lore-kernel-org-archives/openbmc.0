Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c2LpGaIt"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kFGD5YQSzDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 05:06:26 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id i2so10778706pgj.11
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/RYKU2119n2HNU3rQkCOQwG4vLxXbz5PuZmnqVZapo8=;
 b=c2LpGaItpYwXekgtoF6t++go1v+PJcyyPoWtgGsXcyHViRJ1UdBL+kYiWsglDnn+aQ
 1GlG9GcPQdi4F1lKrRQTB4XS+1yv3pF8/C7/zPe7Q+rJBUt0i6FNGYzOL3hSylDQcFYb
 hbcXpd1rZYnbQ6MtVWXZA323LyoyDcLDAkR+mUuBEMib5WPu6YtI2kDknM+YKlCDSkWt
 Ppdt05eiyCZ7w0dgOgRqEnQeKYHEPDg1StdyqCwlCMDuAEuXxhsOpp4qYIlCrEHhHwlv
 eyZj3M0k2fo9Z3U2yHrpu0G552j7W8/WBLH9LhLyP9i74mzPVFBTLAXlqP3SUEqpe48h
 Uo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/RYKU2119n2HNU3rQkCOQwG4vLxXbz5PuZmnqVZapo8=;
 b=Ph1H8Dd/OfigGEl7Qq7oFg9Kgws/Fkp5Xjv0jSAPJTUHFiQZYcqgP5MtDzfIi1dxKs
 +7fcEmrJY8+wVBrOVAu3t2ahAbaIQKDGjfOhbGngbcC2jegCv6W2qdw3wtDfT9Psf3jh
 OYsoGRETfpC0fAD5oZytnRzmpPk0woPMMcTC/LLfM/J0W1ePTMGdNobiUOOLkd6w9YPy
 pDBKJdkGEL6h6rGsXDZvd5XzpailRRjSYKvS3R93aNHivzqoL/xiIyYHxuvPkLQs/lRU
 PvCuDHymsMagyAc1T4K5Rt9So6RmWwlK7MwyD4yceTAMgeye4KnaW6q6Taw7G8uyUjmr
 /X6A==
X-Gm-Message-State: APjAAAXilKAQ3SrYEL56wk4zGooVbOdkmzUneALR0Q5Knw4/dhkU5Y4X
 wvfZMMeDEJCWycoMnp3FAzMdHSlFwWwRevFgGu+JA/1VOFPrCQ==
X-Google-Smtp-Source: APXvYqwieuim6yEhzvERjn9YcJVuK+7OOaILAHwb7MJzAM13FvHRTcwquboKVbM9naV2RzaWRCZ33nJToJPeqUnRHas=
X-Received: by 2002:a65:5682:: with SMTP id v2mr79395927pgs.100.1555441583260; 
 Tue, 16 Apr 2019 12:06:23 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Apr 2019 12:06:11 -0700
Message-ID: <CAO=notxquVk+kOqYax7RqHrXpr4T0Ws4TZs7L=5kqzzKbGDg1Q@mail.gmail.com>
Subject: tightly coupled fan-presence bump
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 16 Apr 2019 19:06:29 -0000

there's a patchset in meta-ibm that is tightly coupled with one in
meta-phosphor such that neither will pass the CI real hardware test
without the other:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/19882
https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/19933

Is there a special process to get these tested together?

Patrick
