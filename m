Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQRqj5NNNzDrns
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 15:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=F8YEUioy; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id x187so538436vkx.1
 for <openbmc@lists.ozlabs.org>; Thu, 01 Sep 2016 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jVjjWmHa4cVtwrWmblkSNsjrrHkri8Ctp8plHPpi29c=;
 b=F8YEUioyYhLoWFJ2KaE9PDlaLc7/nZCIaQqHejNbebGX2+WOj2mYXAzPfMDxJzfdXA
 TCz1f05OVVeiwIyDd1X03dPXPLBfKqzuccdVe7PGaW1n6nWg9P3Qmeo0GXSXr8zfNSfi
 D7yaibmtBmjTJwdJONuQrMpo0PQj/HZTy7qAz+7DurHEqNkyOHTRSs2MrlLd4n/t224e
 n6HoRKRfg6ABdYnivGCKyUOAP6TO8t4WzHTu2UoJL6biXAEgrSctdE7hahq8zXBg8N+j
 zXSNteT8sLgA4MPN+usIoWrYC8N3BmF79gYprxS8dbb3G83u6L9DMkCC7FLDLIP1ksZu
 NXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jVjjWmHa4cVtwrWmblkSNsjrrHkri8Ctp8plHPpi29c=;
 b=CQiQ4/mqOuOOyDgBoSUmR3xKl0WfZtCMbe0H3qdYFju8YjFuFZx0kG1btMMidiAml1
 yEAUIN+OH+As+TfoLfQnGbDjyQJwClyBYGwW9k1Kr9jhIEKfJGtZrAonMRNGJUJjd24e
 c5zyKM93RttuTy2hhdwOoZv5akNnfTDKZ5pbXnTk7swDCKUX+Rbv6mRxqiD6HdbMmAwv
 TL7MHFv1PiqoLZ8fB8/ebPd163pMCOBl7jUZSuZvSxdiONuZylOEoM8jhafwMP1H0PL7
 wxjVQIDBE8t+wNL9IyZWOERtECD50/0gzx9eJuas1bZvWt+TkOSnRWbSSJYk8b6zE8w8
 MLbw==
X-Gm-Message-State: AE9vXwOef/HzIIm7D8x77c3A31zka5s/0fLqZzpqXgz9LVgJi/spWymtJU7aF/IwLjuwXWaBBESBG1Gdi1VKRg==
X-Received: by 10.31.141.21 with SMTP id p21mr12221658vkd.152.1472792655187;
 Thu, 01 Sep 2016 22:04:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Thu, 1 Sep 2016 22:03:54 -0700 (PDT)
In-Reply-To: <1472670147-8888-1-git-send-email-brendanhiggins@google.com>
References: <1472670147-8888-1-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Sep 2016 14:33:54 +0930
X-Google-Sender-Auth: DDgG0D5s5hT5fxPmNtAC9Ev0AOA
Message-ID: <CACPK8XfF0Gxof6jUS60iiro7EbrxN1Hr0L_TUo7rJdF26G4hQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: aspeed: added driver for Aspeed I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 02 Sep 2016 05:04:18 -0000

On Thu, Sep 1, 2016 at 4:32 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> Added Aspeed I2C driver and device tree bindings documentation. This is patch
> set is based on upstream and SHOULD NOT be applied against the OpenBMC repo.
>
> Joel, you mentioned in the previous thread
>
>> Add the binding in a separate commit, coming before the addition of the
>> driver.
>
> I am not sure what you mean by this as the binding is part of the driver, are
> you referring to the documentation?

I was referring to the documentation.

Thanks for sending these out. I haven't had a change to take a close
look yet, but will do so at the first opportunity.

Cheers,

Joel

>
> Other than that, I think everything is good to go.
>
> Cheers,
> Brendan
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
