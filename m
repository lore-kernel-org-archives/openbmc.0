Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com
 [IPv6:2607:f8b0:400e:c03::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVfd231lZzDrp7
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 11:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=oDo8aSMj; 
 dkim-atps=neutral
Received: by mail-pa0-x235.google.com with SMTP id id6so22654018pad.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 18:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=6/M5lH9bLYBo3fSYW2p6F1xAxS0YpX//aY+JhM8L0xw=;
 b=oDo8aSMjkIFF7HSPKqekl+gQRuQWMAIk/bXuifsgaObhGezRaM2MiafzzXbwr1ggtU
 ZQPXYm3D7fLCWiix2aFZed2WK4eL8QnR2URBT1tZuG3Hfwd6oLPw/XPpmJa8IHqc/9bE
 U+K9RiUTGW2qfeOo4Jh6MPxFl8Kr3eEHWfL6LaInucNiOaH3lRf/X/NmpQRNw065AcN6
 LuUJRYVaiaX1skTO6Hrd6/VnwoW1tcp4smQP3y83MWbrr702oblte3bQOnEPa6idPVHw
 fI0+R3HuSk3KqKRs9OM0i0n+1ctyGr7/MbGnWjAfKJ1Zzoy76BBThMGxyLhLrayXHOjb
 hG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=6/M5lH9bLYBo3fSYW2p6F1xAxS0YpX//aY+JhM8L0xw=;
 b=QW0OnZxtLyPsHZw5FPmrdY6VlHSKnNIM69be42DbqyQholRhEXAbclOqdzHtfSWZGq
 sQ0cB2GsaT3DblSENx8iGCXz0Kj8HUI/HDF6tY7h5e6c72QkTlPYTOAAbynhQqvdlpDD
 pT16XkkkLUYeVUjQoLFS/k5oZtNP+WjjBF0qJrqUHI+DiLBp7+aG/y3LnFL1NvqBPCPS
 xe3b4eGFZ+V1W9UZ1+sLRUkDQYI97IMN7GmgA+mZh+JdqM/zjFuXh19HFkAuHczQOGm8
 etSUsJZRDBXqBwYp0lLxPl3m3DNb9cETs0d1sgbYdJZa0F6oPttG7Rw86TC0DSpSY6nH
 cm2Q==
X-Gm-Message-State: AE9vXwOKbDSsMS5qaalzOWQsSBX1eW6oxQmFRhJRS2mo7Fl1DZx/n7j4i2lBtN0IUEl1SS6/
X-Received: by 10.66.120.143 with SMTP id lc15mr1660689pab.139.1473384275885; 
 Thu, 08 Sep 2016 18:24:35 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g200sm557163pfb.77.2016.09.08.18.24.34
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 08 Sep 2016 18:24:35 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] i2c: aspeed: added driver for Aspeed I2C
Date: Thu,  8 Sep 2016 18:24:30 -0700
Message-Id: <1473384271-7185-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <CACPK8XdutpE97bUr2goj3Vqw9R0_HOtZ0rLWLnT-FcmYnLQHZg@mail.gmail.com>
References: <CACPK8XdutpE97bUr2goj3Vqw9R0_HOtZ0rLWLnT-FcmYnLQHZg@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 01:24:39 -0000

> Can you update this to 2016? And add your own?

Done.

> I would prefer using the ASPEED_ prefix for all #defines and functions
> for consistency with other kernel code.

Done.

> Typo: Global

Done.

> If you want to convert these to use the BIT(1), etc notation.

Done.

> Can we get away without the guard here?

Done.

> s/sts/status/

Actually this is the command register, but I fixed it.

> Would goto out, with out being just above the _ireqrestore at the
> bottom of this function, make it clearer that we are doing the correct
> lock/unlocking?

I was on the fence about this, so your comment gave me reason enough to fix it.

> I assume we are releasing the lock to wait for the completion?

Yep, I do not think a comment is appropriate here: it is pretty clear that the
lock is will be held by the IRQ handler.

> Above we call it "sts", down here we call it "irq_status". I suggest a
> consistent name.

I renamed the above to "command", so this is fixed.

> What is "value"? Perhaps "request"?

So this is actually the value that gets passed in/out of the slave callback; it
is just an arbitrary byte. I agree that the name is not *great*, but I could not
think of a better one (could be an in or out). This does follow the convention
set by Wolfram in his i2c-slave-eeprom driver which is the example driver for
the slave calback framework (although he used val, I like value better than
val).

> You're testing for the same thing in both if loops. Could you
> rearrange the logic?

Done.

> As above.

Done.

> Not sure about this. Are we able to leave them as null?

Nope. I tried it.

> Could we just create the buses that are defined as enabled in the device tree?

Done.

> Drop this. We've rewritten it since we took Ryan's code from the BSP.

Done.

> Not sure about this? Keep it if you feel comfortable answering
> questions about the design of the entire driver.

I don't mind. I expect to clean up after my own mistakes.

> Aspeed I2C Bus driver?

Done.

> Not sure that we need this.

Done.

--------------------------------------------------------------------------------

Changes:
  - Addressed comments above.
  - Found and fixed bug in error reporting (did not clear .cmd_err).
  - Found and fixed bug in unreg_slave (did not clean up after self properly).

Cheers
