Return-Path: <brendanhiggins@google.com>
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svPrY0Y9bzDsxJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 07:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=LyLVURlc; 
 dkim-atps=neutral
Received: by mail-yb0-x236.google.com with SMTP id 191so23349804ybv.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 13:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Jmo+UNUiRUYKfPVutcezSPymWR7ntsaaoIF/pPN71sA=;
 b=LyLVURlcZiThZzOF5Y7oDTG+R7rZuMkEgFR5/K88mpxsnYBwGuvWWodsi55wnRHIM0
 tYaQs3V50OsoFXCQ9Hdfho4MyCaBC3JESEHk4eP9JICurtHYDrbwa2ybJt+4rQSUS49A
 ff2rMk9/TfBRhvvlEa9jWcZ1qmdZfa4a/MVOxMY6kdDCxKeI1D79p5XcAQ4jWihlohju
 nZK0AuCRSbLz5VSKbSw3oEq1eviMXqFLzRbJz65T7TT3FKRfXPBLosVdS180PazaU2p+
 m3IpCWPAbNbudysTewmMCglmBZKA9RKSTAyc1wELi5lFmtCKlRrrlmaPl5bS6YMjjiIG
 +qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Jmo+UNUiRUYKfPVutcezSPymWR7ntsaaoIF/pPN71sA=;
 b=d90DgZNviOg4B4bx0dHrQuhvG3lVZyK7DQEYLP+qJXIurKYupP2L7nC0QIBXXg18jh
 zWxN/NzKhlKNCEcYypOSpPJ3R/hzx/nttbHYEVwAkF9xcDOVqyDbGMFfKGuJuOGVopuk
 MhE3KE8aKHlM6d2w0+E0N6JDafX/nmEFbGfA+p5bjV4h4luNJ/E3JunahG202b17L8On
 CSquGc2x3HKyiWED1lbWwF79kgl4VVRqGxkUTq5jS0rh3TA0sQ0i5Mfd+M/x7z7L8lbw
 6b4L/hZFBQSYOhc/VO6G+xZ70M9nQhlCvHknW7JTqgFsUl02Q9qmpUS5UW9smRg4Zb83
 EcXQ==
X-Gm-Message-State: AA6/9RmPIe6fjFO+V0MVCWh3/ZxQTvPC0AeUZtq9GV+nxg2Kvo1cD/nDD2T3dils4/peQIXJxMM6c8Bay787RPTe
X-Received: by 10.37.217.204 with SMTP id q195mr2537547ybg.97.1476302490079;
 Wed, 12 Oct 2016 13:01:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.169.71 with HTTP; Wed, 12 Oct 2016 13:01:29 -0700 (PDT)
In-Reply-To: <20160923180219.GA9401@rob-hp-laptop>
References: <CAFd5g47W-dGVt6hA+FSpqxCqvd5ZpQP=FCCpYGErahF0iKqTEQ@mail.gmail.com>
 <1474327414-651-1-git-send-email-brendanhiggins@google.com>
 <1474327414-651-2-git-send-email-brendanhiggins@google.com>
 <20160923180219.GA9401@rob-hp-laptop>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 12 Oct 2016 13:01:29 -0700
Message-ID: <CAFd5g47UYhgNO8SE8jcVGcV7Ti1xnwgQWMzKF17i3e1WFC9e9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, mark.rutland@arm.com,
 linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Wed, 12 Oct 2016 20:01:33 -0000

I never got an acknowledgement to this email:
http://www.spinics.net/lists/devicetree/msg143944.html
The "bus" number is something that is defined as part of the hardware
specification for this device.

It seems we will not be able to do away with the "bus" number parameter.

Joel suggested going back to the way I was originally doing it:
http://www.spinics.net/lists/devicetree/msg144134.html

Cheers
