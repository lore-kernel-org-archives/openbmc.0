Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJ4Zy0sjMzDvhL
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 22:16:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I+06Tdm0"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id s68so10813363ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RTy5Vd/Ph/RmDX7zoksjtAVeWOZ5xrFEEcLdUT97fbo=;
 b=I+06Tdm0t4gdeNKhp3GVCjBG7r4MIPIYtt/sRhY/wuvSJoFJCLgo+UVv7wQHJ+88A3
 4TUXjdmdDG7TiFG+xUn45ILgozd8FLBuPOy6qeAEWmriI3LRr8VshewxQOdUpAA0l5Qs
 P9dRsZIwRaQDwuVtbBXvpad4cm+KRr1j3UIuB4vbPQlL9km8fuCSydOcWHUsWKFVKEb0
 ix72U8HdaMuRoSvdQenVMoAHd1jGmVjomvHv73P6jmBYyyr08Y4TcxEp8egPn90rZEYJ
 +h4qDPSscVYT7khwTwECpg7ScQw2UOP/v/qG6u4imWbGMcytFfwwb5E4tL2HMgquWgUv
 oayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RTy5Vd/Ph/RmDX7zoksjtAVeWOZ5xrFEEcLdUT97fbo=;
 b=P4Ho1bISPOmiflFoQ7/IYawk900RlRQTRj7x7oawS/5TpHftYvzG7EGgPENT0XkfH8
 63cUeQsd6V0nsZ50jbaZdmpDOKXj6dAMgUoxjcbKyezorjaMoExgnKOoHHWiHfVtu1P3
 LwEDVH0VbzNokZpGhLSB6iz13hLoKVKaHbT7sfwRmCxzA6JfCOgv3soxDqNHZDiI0YOC
 ZtkMXCooDzKea0o3VfVDnfl6gB5cTy3NuwThgg1s/YcIjmqNcdIlebnyzGvjhqar9M6A
 ttFuTP8EdJozWvPJ8g2xp5Vvko4c1WPE7hexw/RbX0fCBQSpwlSorQPnchDzwBHw7N7R
 8QQg==
X-Gm-Message-State: ABUngvexGKJt0IF8HI2LLHjpzUgi6bhdoWBBpSnLwQUjXEYJjmBjlHSmZxZIfTrlc2qvmVlEHuDpun0TrId2ow==
X-Received: by 10.157.63.199 with SMTP id i7mr8389214ote.63.1479208583155;
 Tue, 15 Nov 2016 03:16:23 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Tue, 15 Nov 2016 03:16:02 -0800 (PST)
In-Reply-To: <20161114155731.p4kxmefqevplphtd@rob-hp-laptop>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
 <1478311099-6771-3-git-send-email-brendanhiggins@google.com>
 <20161114155731.p4kxmefqevplphtd@rob-hp-laptop>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Nov 2016 21:46:02 +1030
X-Google-Sender-Auth: UqopaQCDBR9NK9Tmz0OKvQG0ffo
Message-ID: <CACPK8XeaqwKJZHX9BC65wedQY__JKDZAy6RPiwzCB41TMKF=jg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Rob Herring <robh@kernel.org>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 15 Nov 2016 11:16:26 -0000

On Tue, Nov 15, 2016 at 2:27 AM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Nov 04, 2016 at 06:58:19PM -0700, Brendan Higgins wrote:
>> Added device tree binding documentation for Aspeed I2C controller and
>> busses.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>> Changes for v2:
>>   - None
>> Changes for v3:
>>   - Removed reference to "bus" device tree param
>> Changes for v4:
>>   - None
>> ---
>>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 61 ++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks Rob.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
