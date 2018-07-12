Return-Path: <peter.maydell@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=peter.maydell@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="KtG9dxPY"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RLjK6pBTzDr0X
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 02:18:59 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so56845571oie.13
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4xpRK9vUfvVfinjgiqVxJ9D7PGneHr4aCDPSSoLVXZs=;
 b=KtG9dxPY2JwZNj93VGIb+ZiXv/HcxwEEj1sz1059/j2ZtgXwnGj7tKtrzi7BdK9y61
 Wvit8OxQNANMD+YCULPcM0wPRqx+20opX6zlKN6QyEkvYMITD7Dr5elrv3p2vVXuqX4Y
 nId3ds6bT6I9a/jAhMeCSluH7L88CY5oZ22LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4xpRK9vUfvVfinjgiqVxJ9D7PGneHr4aCDPSSoLVXZs=;
 b=qOiHMZA3GfHIewI8FBbFVOSuXXxeyM+2pCgyPAWI6ON75dOKU04l13qXWYFtQxi2l/
 gbang28zjo9FuH1P9BWormC3LFDJknHh8/LHel5dxn5bwhQYSTVHNZ/YcoPEtH8P9Eyr
 aPAz8dIZT0FEdSnllALRSemnNxfUuh5yJoD4kOVtvt4iIdX/pol5W/e0TwCTLUWQaKKs
 X/qiRXgdX44HeiH7sg0lajcYRTAt0i2pF5yuq+LtVnKhWKctWcoNY8K0gdanB4gnoyv6
 DJjmSDxMsabS3kCUxAClH5ydb0TYVQNAH1qePbnkJ1EJxHgyfT5grAoIAaxH01vZcmf7
 BufA==
X-Gm-Message-State: AOUpUlGA6LXrn27qiwA5rD8WB7dm8fGvGB1oDIP7REckD44aGf6gBqqz
 hRxhBLxh5IcbOrCdM4llQXSeDpMctLh4w2HVbidzGA==
X-Google-Smtp-Source: AAOMgpdb4hIBQ7zWcXfkVvGHxe3w1x3foY3+se6MXinaV7THxJByWJwN6nb2X1aR834h7iThEfhDSsaOxDM4pV34ZwI=
X-Received: by 2002:aca:a982:: with SMTP id
 s124-v6mr3200300oie.80.1531412337871; 
 Thu, 12 Jul 2018 09:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:18:37
 -0700 (PDT)
In-Reply-To: <1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
References: <20180709143524.17480-1-andrew@aj.id.au>
 <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
 <1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 17:18:37 +0100
Message-ID: <CAFEAcA9Ri8DANtFHtC=H83Vr2zotGRSWOY=QK37MN-TParmETQ@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-arm <qemu-arm@nongnu.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 16:19:03 -0000

On 12 July 2018 at 17:10, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 13 Jul 2018, at 01:28, Peter Maydell wrote:
>> On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > The AST2500 SoC family changes the runtime behaviour of the hardware
>> > strapping register (SCU70) to write-1-set/write-1-clear, with
>> > write-1-clear implemented on the "read-only" SoC revision register
>> > (SCU7C). For the the AST2400, the hardware strapping is
>> > runtime-configured with read-modify-write semantics.
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>>
>> Hi -- is this a bugfix suitable for 3.0, or something you'd
>> like to wait until 3.1 ? The commit message sounds like a bugfix...
>
> If we could get it into 3.0 that would be great. I ran into a case where the distinction was important so it would be good to have it resolved sooner rather than later.

No problem -- applied to target-arm.next for 3.0 (should go
in before rc1).

thanks
-- PMM
