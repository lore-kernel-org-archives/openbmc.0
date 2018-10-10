Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UNW0McLY"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VDlL6bXQzF33P
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:01:02 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id y81-v6so2691880oia.6
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 17:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dr3MCIZcCjv3CY16P9EiWNozavFHMEL8iQUPcmK8Ygo=;
 b=UNW0McLYKKbf2Z2SlT1QjXSH6hfaCy8CSVad8lO0uV9fJNNZ5mPBjeggwPDEto8DDa
 L0NSI8rZWndQts9IGV0I2EW8bRcDPHV0gf4x+6lDpHVKBO7dSVOSHBZ4B+hsyIXmkmlO
 O7kqS9twCMDFMCHkVwD+z6ZTGloqhfiQJSXXoa+LKg2JQVSAuUcsM0miPk1gyTQSdIwx
 6aLuho8Zz0CAjeKfIvWH8oekzlu7qfHN0HTzoIxAgDwRzE1IlvdnVhb5znmBFcjn7iho
 EIPXOiltBGF/jaLGAf4bRfsf4rNZhUAAIPf6mrhjApgW3Dj8deeakMj6TnxlrVK3eIbi
 kVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dr3MCIZcCjv3CY16P9EiWNozavFHMEL8iQUPcmK8Ygo=;
 b=jIY671apI5fl7ujEslz2b7sqm2P475pOwNhdhyow4RlCLlZDTRrRiHbrwgQYpkIpCl
 j56NhKqsmeQhI/rO2Csk6jsuFdiouG3j7a0Pct76RSjYkO1sqkFXOmeFElF7/ufModas
 Lx43tyOFoh8pyJj/s5Zf2cO0its+M8Qdny2ka5s7OREHKj2wTHNaIzjRUiBOOt28OH56
 DyUTMlMYSyI/qcVH16gUOy+2NS2jocDjxVmMUmoGPe6bv0n99PuWUilCEZ8C6CsCu0UG
 6CCQQCqKMnQ99jTSLyqS6bNoISOYVOPzWXYjLOhI0MlsiOhkeEi/p1/CM+ZvGqltdEtS
 sqsw==
X-Gm-Message-State: ABuFfoj8DmUePS60oEUFHbzNcMjTM7yU41uwUjHyA3L4u+K2PL/Az4vS
 iLslli07bRujlxkKwvvxKA4P6Cz+85vP/GIzUN68Pw==
X-Google-Smtp-Source: ACcGV63RsgmxvySqgp3p8wuDA84Ea0y67W6dIzEQCFN3wqSny5tgfjLo4YtVt/2fKTXaUKh6+sRg1kcBfG/Mj0OKnho=
X-Received: by 2002:aca:a9c2:: with SMTP id
 s185-v6mr339287oie.137.1539129660067; 
 Tue, 09 Oct 2018 17:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181005214507.26315-1-jae.hyun.yoo@linux.intel.com>
 <20181005214507.26315-5-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181005214507.26315-5-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 9 Oct 2018 17:00:48 -0700
Message-ID: <CAFd5g44vi55oMkif1K+hx=O_J0_jqeQunRNiDARF0=qJ=54jiw@mail.gmail.com>
Subject: Re: [PATCH i2c-next v7 4/5] i2c: aspeed: Remove hard-coded bus
 timeout value setting
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
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
X-List-Received-Date: Wed, 10 Oct 2018 00:01:03 -0000

On Fri, Oct 5, 2018 at 2:45 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit removes hard-coded bus timeout value setting so that
> it can be set by i2c-core-base.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
