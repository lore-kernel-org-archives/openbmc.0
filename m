Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l8e4Kuwj"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Pqkr4LHSzF37w
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 06:00:19 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id g12-v6so462164pgs.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Oct 2018 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b3f9bW+n2J0WrWMJTgsrEOhsuFUsmEH45SV9PIsAMzA=;
 b=l8e4KuwjJfMJ0QO4nzwG+0LhBY8YYWjSSMLIS/CJZtVHhDhwbE2/oknhiXKlTfIh7R
 7WIwd728cl1bbjgsVq5rYwc34m05ipw0goope6C0KYoxC7nTQ3woELJdjhW9Fx1+FcsY
 DA2OlheMC3ik0l/jk2rcgCnS0hlKBCOCQfUK3nqC3PssSaIz9KJIgKRtHkjVxnkO2jMi
 iwdFsdCz1IMQvvLkzqLF2GSROB3wbq31X5ks7zYGpm/DlT9p4pg+bgNwmcLQvo9OEKxn
 pMcNEfRQyiafdJUHr8NTKKwgHKgRQfZSMfMAK+Lf5+4GBUdjGOpTLRQuwQvVka9X8Q7w
 IZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b3f9bW+n2J0WrWMJTgsrEOhsuFUsmEH45SV9PIsAMzA=;
 b=NpukTmXGkG7G9bnsL8uGhANprjawyKzXtP/ZgRRK4QgUbw5oncdvEYDl8uuZEf5JSX
 pyu6U4eRfbn/eSmXsJ3OV46NK/Fx5J8cRofSp85XBAQAJmodVs9NneUuRbW8ZZE8qCRe
 qAt9yoAXAhrgULQ/U6siz3V6G3tR1eR8fcr6ewavtghJVFln6GCBcacX1SVg//zbhUEN
 0r5ecGmtcZmUaD07rWxqAySIGACRbA93LCTqYpJ9gj8Z0n9NfRJWpzQM3FCzIVGZJQS5
 uV2MbS2CLiNbJ64LIkIbCJcXyqKS6IuGW2HWCQw7vroiY2QytP3iz73rb1MhqXIkBADh
 2rvA==
X-Gm-Message-State: ABuFfohLLLg+OaoSR0Q/Je8eYWFMP6YBSDJHIMGTUZ++cN7aXMGPdY/w
 eUIbGZ/rG/FS060gaS2YaCHu1wMSqy9pB8OOCzLBtoQ8YO0XQg==
X-Google-Smtp-Source: ACcGV634YyNAd9dZBCllWi3Qq79mICCBcVeMteOf0GAjeptidrON46fT9P+xnaulDsH2ad/f94lK4u/V2PjGan63lN4=
X-Received: by 2002:a63:ce14:: with SMTP id
 y20-v6mr16181639pgf.248.1538510416810; 
 Tue, 02 Oct 2018 13:00:16 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 2 Oct 2018 13:00:05 -0700
Message-ID: <CAO=notz0ibE=yZOtg4DE-onDDOWKHvPx_pRTp6OAH7JqRfH3dw@mail.gmail.com>
Subject: OEM i2c over IPMI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 02 Oct 2018 20:00:21 -0000

We have a linux kernel driver for i2c-via-ipmi that ties into
https://gerrit.openbmc-project.xyz/12604 - I'm putting this upstream
but since it's an IPMI OEM handler, it can nicely go into its own
repository - I was curious if there was any OpenBMC interest?  If so,
we can aim for the phosphor namespace, otherwise I'll just ask that it
be pushed into a google repo.

Thoughts?
Patrick
