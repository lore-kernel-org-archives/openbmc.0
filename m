Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTcVd73n4zDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 01:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="PLtENBGG"; 
 dkim-atps=neutral
Received: by mail-it0-x229.google.com with SMTP id 203so1651449ith.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 06:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=85IkaoUMGDd6HN4RRIp8wwMWXU5wXPTYzw0B3Y0O42A=;
 b=PLtENBGGgtrLuSgHde5F2gM+GNg+aIr47lkDwANew8ewnCJ6usGXVh/fKKXwKgFpYa
 PEfcCo1/+MaxDTE0QkosNG/bm+VHEtdjzTswNQLm8dOc+xv8satBD7VDjttrd129xkaW
 l/fXvbARBvUIcpa+UPJGmCmhonW4CVxOTib6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=85IkaoUMGDd6HN4RRIp8wwMWXU5wXPTYzw0B3Y0O42A=;
 b=la25fO0Z59UCOJibr5+6alaByL7kLFeWPwCT2M+H8aUVxI04k4fhtLtSSN84NLfIqf
 VE92a/CrdcDT/vyAscRSMWMfSTikfXA1Ztk/A+9sjsz784ny1HcINOl4KeqrbSPai85G
 WjGq888Q/Af7HrEWQO6vukkQrdMFflZf6clCTbEPt3/+ycIb6CSJkorzf+GJVLENEEwd
 0bVXxmOl7WwbB+nm+mVJ2/GdzMHlDd9zzg3Wi/tQsh3r72Zsl3RBzfrp5eKY2HLpmDkT
 xmbONXmCJNGYsoixYMDlqdU11G2X7WhavZxweIjwSiNoQoyvYSQ1yTn8XSvUek70DQk/
 /vJw==
X-Gm-Message-State: AMke39k1V0qKgzGp3fL3AtLB851bo3ryLeS4dupt35MZE5Me6pVAFmP0qLrHs1c3ch2bSAjPti6HaQcYke+3lgKO
X-Received: by 10.36.83.209 with SMTP id n200mr4210415itb.9.1487861156741;
 Thu, 23 Feb 2017 06:45:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Thu, 23 Feb 2017 06:45:55 -0800 (PST)
In-Reply-To: <20170215060914.5952-1-raltherr@google.com>
References: <20170215060914.5952-1-raltherr@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Feb 2017 15:45:55 +0100
Message-ID: <CACRpkdZRnANEETxRijAiGYdsoEAv0uk3h1+LOPPH6qjwdStJfg@mail.gmail.com>
Subject: Re: [PATCH linux] aspeed: pinctrl: Allow disabling Port D and Port E
 loopback mode
To: Rick Altherr <raltherr@google.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 23 Feb 2017 14:46:03 -0000

On Wed, Feb 15, 2017 at 7:09 AM, Rick Altherr <raltherr@google.com> wrote:

> Port D and port E GPIO loopback modes are commonly enabled via hardware
> straps for use with front-panel buttons.  When the BMC is powered
> off or fails to boot, the front-panel buttons are directly connected to
> the host chipset via the loopback to allow direct power-on and reset
> control. Once the BMC has booted, the loopback mode must be disabled for
> the BMC to take over control of host power-on and reset.
>
> Disabling these loopback modes requires writing to the hardware strap
> register which violates the current design of assuming the system
> designer chose the strap settings for a specific reason and they should
> be treated as read-only. Only the two bits of the strap register related
> to these loopback modes are allowed to be written and comments have been
> added to explain why.
>
> Signed-off-by: Rick Altherr <raltherr@google.com>

Patch applied with the ACKs for v4.12.

Yours,
Linus Walleij
