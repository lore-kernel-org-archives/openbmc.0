Return-Path: <peterh@google.com>
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3MkX146zzDq88
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 10:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ATn+SRdj"; 
 dkim-atps=neutral
Received: by mail-io0-x231.google.com with SMTP id l7so61712641ioe.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 17:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WVcEl2qKVamh0F1C4Dnkj9C//zB/1FvzwAP231AaOaY=;
 b=ATn+SRdjIuS8aNsUNEMIcnP8liTjFqsRHd72k2OI71Mtq3IFNUTY+kVkr9hEL2oIO8
 etsnyhD3QUcolImnhwuCKVd7tFg9sgwcdsE2JsFCSnC+r73cOfoFbVNNaPfQmX7teMFL
 hM3k79+tA2bhMUdSzpXurFF1QVNlXxPtigF0vbCzgLbsaDDeseBdOZmJfpPk/lLFVCO9
 HkqC7wCXNXe0dvE/krSzwwonn+GnDMTOX5lwP6sqSRvdCTZhP9J7jc21GfnrfOHfqNuD
 I8EKxgc6fzZaNJ/lcAiZxZcYLGHa+sjsuX9Akbi8yHDmzSG0eGkToSYt45KtFNrr2VTQ
 IvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WVcEl2qKVamh0F1C4Dnkj9C//zB/1FvzwAP231AaOaY=;
 b=fdNl+fN9fe52EtRBPBeQk53qksp/5sswVFyA1D7tCupjnAKpcoMr64w6LsRN2jrPDx
 Ytc9V+vjJBUBjgrDeaeALV37vBQNYTiRtVgmMVzuGYZG74ZmPbb9yDoklS5w8ezBkdOy
 M77HDjc3Qvmz+NE2RYtsDl3bVXhWxumdZmzplLMV03cGuTkru0ol+9UpOGpCaBfUKs+K
 Et6aZBQ75cZox1APuqpTiJ606ipDkfiO+uyQXXHR+D9R3NeM3Wh9hIG8ifJppNg6h6oD
 m7NkpOKynwU/o98+GBCEg89W9sjtSiWAd/f1Xj2HpfrbciI+G6MSy9xTKm1dF1PI23Qs
 k2wA==
X-Gm-Message-State: AN3rC/6Vc5ba2BmmnGupgofE1A/h92uq0d/gYcxyDdJIaAcozW2fqH9/
 S61mHd26Nyf/NLoCgwq/W3qV0JZn4JkP
X-Received: by 10.107.26.17 with SMTP id a17mr1058603ioa.72.1492044864498;
 Wed, 12 Apr 2017 17:54:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.84.202 with HTTP; Wed, 12 Apr 2017 17:54:23 -0700 (PDT)
In-Reply-To: <58EE852E.8010005@linux.vnet.ibm.com>
References: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
 <58EE852E.8010005@linux.vnet.ibm.com>
From: Peter Hanson <peterh@google.com>
Date: Wed, 12 Apr 2017 17:54:23 -0700
Message-ID: <CAPozSNrrtUcmsw=wbhwY3dttzbKLJUraS1LPyDnPU4mgzjEs5Q@mail.gmail.com>
Subject: Re: Plans for BMC i2c to host bridge via IPMI
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Apr 2017 00:54:28 -0000

On Wed, Apr 12, 2017 at 12:51 PM, tomjose <tomjose@linux.vnet.ibm.com> wrote:
> Hello Peter,
>
> As i understand you would be leveraging the BT(Block Transfer) interface to
> route commands from host to BMC.
>
> From the IPMI specification it looks like this can be a generic one
> implementation instead of implementing
> OEM commands.
>
> Implementing the IPMB interface (Section 7) in the IPMI specification would
> probably suit your requirement.
> The following commands should help us achieve the goal: Master Write-Read
> command, Get Message command
> and Send message command.
>
> I am thinking that IPMB interface could be a dbus service which parses host
> IPMI commands and maps to an I2C read/write.

Choosing the best interface is a very important early step, so I very
much appreciate specific suggestions in that area - like this - and
will be as specific as possible in my response, so that I can promptly
correct holes in my thinking.

So here goes:

1. IPMB plumbing alone is significantly heavier than this feature. The
resulting Send Message and Get Message API seems awkward for our
simple case. Someone with actual IPMB use cases should drive that
work.

2. The key message the host would want to send - Master Write-Read
Command - does not address the full problem at a modern BMC. My
reading of Table 22- in section 22.11 puts the maximum number of
private SMBuses at 8. We have 9 i2c _controllers_ on a typical system;
some are further connected to multiplexers, further multiplying the
number of logical buses.

Our proposed OEM master write-read feature addresses both concerns.

> Let me know your thoughts.
>
> Regards,
> Tom
