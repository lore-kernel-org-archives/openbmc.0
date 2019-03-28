Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Gi/dyzju"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vgt06MkpzDqPS
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:23:52 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id e80so368021ote.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ounNmDBvL3676Tvkm21rKmCiX7MuQ4zpO5otzkNxiYE=;
 b=Gi/dyzju2O93IeptXKQwTeciJ8QFQUXCaKb6uEOu9+ql0AnmxcaqhuFDHuWShYpmHD
 Bk9uRUSWWFv46VtUmR/7vxovL5BReMYUXS7wN0obZNDdXSAnvJShAti21w4LZ5k4klIZ
 GqmFu+rszsL1PQHg9GkbeUGf3gGrgK/06M5QDxmAIJqCrYX86Gwakno83Ba0id+jkybO
 ao7B8+SORV3INphLIapSgXUJDL3BEs8DdbhG7o5SxxNlDwV0CGp6g9rdn6CBk+G5QcsU
 8wi9TknfZl4iySRhVrtMBpiXe1p06k2w1eNLrs+kAomEcsaGvO6jOw7H/lnN52LaoliX
 Smdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ounNmDBvL3676Tvkm21rKmCiX7MuQ4zpO5otzkNxiYE=;
 b=mzVbUgI1dK8cNdZtN659G0YnMyDmHI23uCLUrzOJFJPe6i++208nu9W5/7aA9/9cTx
 cEiHofVvNc1dIrzBrhH4kJbI8PxHWgnDjp9AfZCfCYoHzvv7pvFvt7qX6/Yceu2CQ8Sz
 elwaWObgIa/D4jdi+DkEHYfHvECWhLGuIB1RWOyyd3kzFJY5NQQlpJryjCq8xmsPSfgw
 8sJiDyj+3vapgVrUP8hMkUFDtuiGNFNmgbSE/aqbv9BNsxhJfu2X98hZbE5qzfbHwaLD
 EHP7oDgGkoEGo2155s3ABzN5swS6hGzpjI2BZbI5PWuE+zQWaZTd/qoGRAN8f4EN39hA
 t6OQ==
X-Gm-Message-State: APjAAAU5fUhOM+UXuQah6Aif0jbpkwBZRkRkXrFeoqmlUrPzhcfGYzWL
 VNONkpOwOJOl/UrhUWP7T9iYvnniyoi3hkBK0kRUgg==
X-Google-Smtp-Source: APXvYqz6w2dCvJ4Nnzk9ChAlzqTWrxrDNq70eUOvOqPH3yshvPy0BDry7fnrWC3H9z/CZpJxNQcjqeGa1EMml7xYOpk=
X-Received: by 2002:a9d:6b97:: with SMTP id b23mr12735088otq.113.1553815429906; 
 Thu, 28 Mar 2019 16:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190328231317.330699-1-tmaimon77@gmail.com>
 <20190328231317.330699-2-tmaimon77@gmail.com>
In-Reply-To: <20190328231317.330699-2-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 28 Mar 2019 16:23:39 -0700
Message-ID: <CAFd5g45V=iKmZoxzCT1i=yP2tizahm=+459wgdFcYv2u6RZFgA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] MAINTAINERS: Add maintainer and replacing reviewer
 ARM/NUVOTON NPCM
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Joe Perches <joe@perches.com>, Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tali Perry <tali.perry1@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Thu, 28 Mar 2019 23:23:53 -0000

On Thu, Mar 28, 2019 at 4:13 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Adding Tali Perry as Nuvoton NPCM maintainer
> Replacing Brendan Higgins Nuvoton NPCM reviewer with
> Benjamin Fair.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
