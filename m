Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYkjp48H2zDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 20:39:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=c4n6k7f8; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id t127so14443891qkf.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=J74QhWVx73o54teOAG8cD/Ur79tQgzMMMbLhoJFqqO4=;
 b=c4n6k7f8l01W29fNOMSMC/AhB4lPSi1/jOtCmj8q4wsCGIZa1rh8CuIo58l39suG+t
 KWYch5N/LF3TEJBb2txFGIMyDK+TZxtSxkTZF6GPrKKUQXo2jf0ZHHHNA1bsj1vo1WDZ
 LBepsX4SpMPmkuIKOM9HZYblfTj+D1uHVgPqc+mnQjxFTnCWZQk1ykBl5woSksHcwCrd
 lqp+jVRNf2AF2nMLG7NEDcVaIGp1zgtJp6tbZDBYVA/CBPKOg7MVNAWmZB/B350wFYS5
 k2gDDAT6Fu1LseVG8/BpZz/gCcteVKdNoehBWNBH6AlxpyxBDu97wpkwIBHsggcIwg0g
 iR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=J74QhWVx73o54teOAG8cD/Ur79tQgzMMMbLhoJFqqO4=;
 b=O+oc6D25YdF/9oeJdyLFAeDfDFVB6PScIsiB2DoZ6Eb88xiYqygpPsfBR7NycBKv0m
 B+6kIlbnWhtV8WIvXDZAskUmmdi4YKRw+S+5wY4ikMxl1E0z6rDoAQqJTxUjE6JCL0XZ
 Z6Kuwo4IrPG3vCF6HCfdVNCehP/G0zXK6Z8E3A0ySH7fbXM/0EtDUoTADIFSqroGI1h3
 VzXmnZXrDP7VvOqx1Yg9405mQAk+kQplcyMfmttx/QAece9W/9L0B4lYRCQPSkOJFU3c
 2k2byzAhha6aBJFZnPfsWpsPp3/lZ7F6Gu0cLtDJ/SD5MYDBVGPYWIr29AK/YJFJvxGK
 6U3w==
X-Gm-Message-State: ALyK8tK+4Cnqekdn0Fd0HjdgrhB+2X+7lx0ODcwP9ardOWQtmCLjZFCwqCaBxiQbTPAfF2nHmLNf2MV5NQRzMQ==
X-Received: by 10.200.40.88 with SMTP id 24mr15463222qtr.73.1466505548342;
 Tue, 21 Jun 2016 03:39:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Tue, 21 Jun 2016 03:38:48 -0700 (PDT)
In-Reply-To: <20160621103121.GL19968@asimov.austin.ibm.com>
References: <CACPK8Xezv9egJUBxBdQm4woL9B7FrusQLajhOPuYru+tbCJaDQ@mail.gmail.com>
 <20160621103121.GL19968@asimov.austin.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jun 2016 20:08:48 +0930
X-Google-Sender-Auth: EZFRjSxje4vMu4766ayal27HVCk
Message-ID: <CACPK8XfBuC77BGrXkSCcsBVygDUOCxH7ONy3SvgBY8jDoE3bLg@mail.gmail.com>
Subject: Re: Adding meta-raspberrypi as a platform
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 21 Jun 2016 10:39:11 -0000

On Tue, Jun 21, 2016 at 8:01 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Joel,
>
> Can you go ahead and open an issue for that?  I have a few layers that
> Brad wants me to add as well.

Sure, I've created https://github.com/openbmc/openbmc/issues/399

Cheers,

Joel
