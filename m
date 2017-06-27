Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wy2fY6ntmzDr3b
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 09:47:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I4NAjlT3"; 
 dkim-atps=neutral
Received: by mail-qk0-x22a.google.com with SMTP id 16so38677244qkg.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 16:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3pv+vLste5M0H+/hHeF73GV2SHdRd35PDn2mCo82a6s=;
 b=I4NAjlT3OUho5JUstc0tJyA3NLnOjNPdyhlYgpLI3BwQFm6+jZN3EvGncXOWcF/ker
 zqW+95o5Dmyklj99Vu/2lGJhDvELeHrDsNhwYCYA4hquoS+ZJWXc4n6RFLuQGZkA/fgj
 Y9GZLvWivOdvKa7SlO9BSmcq9Q06zebI1c8xy5hwrMTdtVzdns6CDj7gT/DVz27pgmB7
 jr2cBAG238RbdaCFKGZp0N4WdKxa8E3jn7hnvdcFidebrYtpGGCZtrx9NwbLPZoA8+hN
 OSqrNRwqbvDLHrw11naS3Dvko/ddve2GmkDX0DhdnIr+P1112NFPo7NHQCkDi2tpkseG
 xwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3pv+vLste5M0H+/hHeF73GV2SHdRd35PDn2mCo82a6s=;
 b=BVW+QPsejP2oNOeeV76BdOzwyhm3UK7rInkf0VB4z6LJEKLBwc3L89yKAN7YIrcOMM
 9RL9QiMe1h8aU863wCnM2IpBhgE3BkzQd9C45pIMjVW1kLL1degEGBy5DIjX9VU4hlrN
 RQEENv/g+BXJRzZ2+fgQrgVwYP/qdKxXpo6LQcjJqOfGxZK97WGxk+Kx/zh2cMCDhlfP
 Xhc5ucyvjhKt/l+myvJ1Py7Ui3SNrghrcd4YEiYQK/jhnRtP7T3wZToAdgRLW6cJYA2a
 ++261NVstr7EBWwuCAF7HmoetX0PtvKSZFSC+XOtI+2jReEs4sr8XD0Q9ZQ74ZlscFXP
 C0Og==
X-Gm-Message-State: AKS2vOxZnbP5JmclO0uiSeEKlxgp/t4xf6GUWvpgyoR5oVXHqDxJpZAp
 R+OmVfDcZ80qr441NwV1+3dB2UV1voQA
X-Received: by 10.55.74.13 with SMTP id x13mr9086658qka.254.1498607266456;
 Tue, 27 Jun 2017 16:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.67 with HTTP; Tue, 27 Jun 2017 16:47:45 -0700 (PDT)
In-Reply-To: <20170627090042.GA2408@katana>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
 <CAFd5g45=O2_MgfZEkmbY-=ZZY+izxeWSuhZT+B2e08P=O+WEog@mail.gmail.com>
 <20170627090042.GA2408@katana>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 27 Jun 2017 16:47:45 -0700
Message-ID: <CAFd5g449iu6DGvMuP8-n8C6GBbr62G6_ZYS6Lh9038EB0XO9YA@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, 
 Joel Stanley <joel@jms.id.au>, martin.petersen@oracle.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-i2c@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 27 Jun 2017 23:47:50 -0000

On Tue, Jun 27, 2017 at 2:00 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> > If SCL is stuck low, how do you want to send a STOP?
>> >
>>
>> Fair point. I should probably drop that in the future and just do a
>> reset, and even then, doing a
>> reset is probably just wishful thinking. If a slave is holding down
>> SCL, we are pretty screwed.
>
> Yes, you'd need to reset the client device. And that has to be done in
> the client driver. I wonder if i2c_transfer and friends should return a
> specific error value in that case... need to think about it.
>

Well, a good first step would be to make my recovery code conform to
the struct i2c_bus_recovery_info. Is i2c_generic_scl_recovery supposed
to be part of the user interface, or is it just intended to help put the
main recovery function together?
