Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t91Pj69NzzDvRC
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 10:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=m3GOalpz; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id v84so9435832oie.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 16:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tYPebETOVLLnkniMW/YereOqXE58619Ich9hidX9kXQ=;
 b=m3GOalpzadZnKZRMf2Wg5116QpGlAGTKEHFjZnYeJrPlOmL/DvpCYNhNLiT6k7QgUm
 dHjBUqLRYUxpV9oFKrqRkF/S2NWxYVUbK1n/A+0nAw9qipDee7NeBMssv8SfwvKW3Fxa
 ykHGKXdo3Iff1VqomIhKGoGdha4cZYDX5lVvgdWkbesB9WdKK6kgtbQPHxHAPmM47LTm
 qZNenOaBQbOi0BVCcego25NQMJGud0R2XvqYWDDmOJG3AAr/QWWrZSTArJFZ9ATZUm+o
 eiXM0L38/1yHHcc9R2c7MfevybCx/3QjGBUFPEUlbfbDDVbm6NIYoImBxNEwsWFWJ4qI
 fgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tYPebETOVLLnkniMW/YereOqXE58619Ich9hidX9kXQ=;
 b=eQZG/DscxsGglXWmCnWpA9NHhaclxA/3YpnlwscVq3K9n5VUYJAnJCG4dTbo4gFyL5
 Y+RTT4cReVYhMVjv3rI389qTtbWUBXLVqeem7rpRBd3noONaVGpeoygjfKHU7LbAo9l8
 aBqOAY9XRlZOmXdhMrldEnpVVUSynBo4/jq6vwz34VLBXwzWEcQYEOr9smeJC6m1xXmO
 MgDZm/iI3d1u6fVmvUrJs8B86VY7zHuVcjREzD5/MPRRNV+aw3fkTHKPW3ACIImmenC2
 yh7bKgl0lUT2ncncD/SHA2RsyMB88xPqQ8TnHJuT9qQ4zBu3+CIqBpWe4l4gkxEW6Qz/
 Uxag==
X-Gm-Message-State: ABUngvdDFSGftKH8QDkcO0Vn1ygH5df6V/EdkAXL+CX/NNN6j0ULmfuLXf9KcRrKCiE83Y3aydoVYjjNULPRAg==
X-Received: by 10.157.20.142 with SMTP id d14mr8432878ote.74.1478215735056;
 Thu, 03 Nov 2016 16:28:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 16:28:34 -0700 (PDT)
In-Reply-To: <CAPH-5w498pdxsc22+TSMY4u1hEiPmWqrQMa2j6bQzuUsqGkG1A@mail.gmail.com>
References: <20161102055557.24349-1-joel@jms.id.au>
 <20161102055557.24349-2-joel@jms.id.au>
 <1478088662.27396.5.camel@aj.id.au>
 <CAPH-5w498pdxsc22+TSMY4u1hEiPmWqrQMa2j6bQzuUsqGkG1A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 09:58:34 +1030
X-Google-Sender-Auth: 3_s2-iZmPdqoQXrzN28BB0iQk3M
Message-ID: <CACPK8XdWn91bXBgH2CRu=vNKNQWSc6VjhOcJNYcS37F7bC8kgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
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
X-List-Received-Date: Thu, 03 Nov 2016 23:28:58 -0000

On Thu, Nov 3, 2016 at 3:10 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Nov 2, 2016 at 5:11 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
>>> All of the ast2500 systems that we support have incorrect strapping for
>>> SPI. This commit moves the Zaius specific strapping change to the common
>>> ast2500 setup, so that Witherspoon, Romulus and the EVB can benefit.
>>>
>>> This moves the strapping change out from the Zaius board version check.
>>> I don't see an issue there, as the will still be correct for future
>>> boards.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>
>
> Reviewed-by: Xo Wang <xow@google.com>

Thank you both for the prompt review.

Applied to dev-4.7.

Cheers,

Joel
