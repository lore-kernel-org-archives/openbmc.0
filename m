Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCTgz0lgszDq9P
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 01:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ROCWw2/V"; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id d9so28864977itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TfdPyyiW0oiClP8bmukyvksW4PiKILVfzdKDbo8W+Qc=;
 b=ROCWw2/Vy6/bn6CyZpMsqYD6YLmiAVq/rbG2BSsIbXfQK7j+81oLjuChTFiGwciZn4
 3gDO/7Fsy8pCzQMkbtQG8vvDC0aD8L1bbyjTd+tM7FYTOsY/BP80ufFw44SfVbKQCQKc
 jtUBn2g/wsLR1+fMtsQYIgFbUdaI9x9VwXPW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TfdPyyiW0oiClP8bmukyvksW4PiKILVfzdKDbo8W+Qc=;
 b=OhqQ9wzvaxoKpJmj+agiSvO/uYP6IcS8zygyWh6sKuhmgHQqx0hxKooX4Q29q8QWoN
 i+qtjIRmMhmDB6V8lAxvJ6n1Z0Up/Ns5hXPkgPUOKZHYg8Be3S5KIwV47CcFn7xOVLhV
 mbBfSIoZ4fO6WEjXuZirCi8jO1E5J0v6ET13YE7GHF68R7oyh7yKbRt8O1f0UbBXoIQX
 R2xPq0V7wkSSvhBDq69oJg+uvIWc6qHEpzp1psYtkWkBUx+kkdYxoGXA8eygGvis1Xbn
 ZluInHSUFXn3+ZtWs4fEycqx4L5d3HnlQRNNJYisoJOfWbiQO6lY4t9dceP38wszklvi
 sCUg==
X-Gm-Message-State: AIkVDXKaauq/kTnoR0doawQXfX0dl0IFuVOJNzfLaabaePx8Z6jqFd6ccBkgFAmJeffOXwtnT5XOoZ4Ny0+59OfF
X-Received: by 10.36.123.136 with SMTP id q130mr20190227itc.25.1485874204256; 
 Tue, 31 Jan 2017 06:50:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Tue, 31 Jan 2017 06:50:03 -0800 (PST)
In-Reply-To: <20170127042442.28994-1-andrew@aj.id.au>
References: <20170127042442.28994-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 15:50:03 +0100
Message-ID: <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Tue, 31 Jan 2017 14:50:08 -0000

On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> Since v2:

Patch applied with some patch -p1 < fuzz
please check the result.

Yours,
Linus Walleij
