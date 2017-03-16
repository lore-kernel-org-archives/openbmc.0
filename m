Return-Path: <raltherr@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkYKz4QLmzDq8f
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 03:08:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I9GkZs2t"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id w124so75824110itb.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dZ0EYhf+2AQ3KF7wSiK9m0lFa3fnxfL5h+cyrV9OsFg=;
 b=I9GkZs2tc7W+wu1iIcCZKkgSr9FeV6IHLVCLk3LXQ/V5QIEvnzs3QwyFV8Zc4nKsWq
 hndfZibaCX98eOUjm0aM+8FDnBQEHUUhb+rjjH4RSlQntid5wuKoU4zbgoFW8GoC2bWu
 tDU9CJf8l7MLr7aXhp7aC4HfI8WTdr8NTdrqp+Hhr1b4NBWyxic2JyEI5UOpdOnIlhy7
 hQ7847qho87uweGmVzpO04jX6OLdssvik8FnP2aE6atuEwbBuFPmrOOQd2VfigRSzq4f
 9rDs531n7VaizNKqhjbnlwg3YYmtO79pc037uvgGAx0O6PWuhhmdJO5gUUnHhWWaNyI7
 YhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dZ0EYhf+2AQ3KF7wSiK9m0lFa3fnxfL5h+cyrV9OsFg=;
 b=lp33kUEJTAqM9RGz5iwMwlEmEpbV9o6zZvYT3GXNqISj77+NwTfplkU6JnvfMQphmJ
 bU7EUbrMIXh9MymJIEal/iZRhRsZtxlooFX42w4/E95WYccR4HaG0lOEnyyTffdcDesq
 /Xwjmu4Iqg9f1RDjK7IhZq+uEfB/xn3oR2cXUijUHQXWXCIj98y1jKmh0IlspLtrDdxJ
 W/7+JablZNR26jy0TJ4qktJ3O/Pqq3Pc7TrDVqimpCR8uc2dHNPYg7rFakpuc/8CjiAH
 eVPPcBH8js9oDSAGXXbdsFCCc1XwAdU9dxG4dsEAPZNREfXfXBNCMgmp7bpfq9/FueAf
 X/5A==
X-Gm-Message-State: AFeK/H2s371C2ftrw+8GnPJ+/v/bt/pGZU4HiAvi4vQT3tdUZgEss4+uifV+NDybBhMWkI6y41oPe3LrGjv8WNUV
X-Received: by 10.36.62.132 with SMTP id s126mr27790700its.28.1489680418779;
 Thu, 16 Mar 2017 09:06:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Thu, 16 Mar 2017 09:06:58 -0700 (PDT)
In-Reply-To: <20170316153756.j7zqd7ldhrfwqvii@asimov>
References: <20170316080252.GB24841@in.ibm.com>
 <20170316153756.j7zqd7ldhrfwqvii@asimov>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 16 Mar 2017 09:06:58 -0700
Message-ID: <CAPLgG=mqGZ1ffKEex6o=J71DcZGgiv18xjHr=FaJ1K5EJ-7Ymw@mail.gmail.com>
Subject: Re: Out-of-band SRESET
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
 mahesh@linux.vnet.ibm.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vsainath@linux.vnet.ibm.com
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
X-List-Received-Date: Thu, 16 Mar 2017 16:08:24 -0000

I know x86 has debug modes but I'm unfamiliar with them.  I'll ask my
teammates who know more for some details to see if and how the BMC is
involved.

On Thu, Mar 16, 2017 at 8:37 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Thu, Mar 16, 2017 at 01:32:52PM +0530, Ananth N Mavinakayanahalli wrote:
>> Hi,
>>
>> One requirement from a OpenPOWER service point-of-view is to be able to
>> trigger an out-of-band SRESET on a unresponsive system. We can then have
>> the necessary plumbing in the host Linux kernel to either drop the
>> machine into a debugger or trigger a dump capture, if configured.
>>
>> On P9, this would translate to a series of SCOM operations for the SBE
>> It would be good to have a REST API defined to cater to this specific
>> purpose.
>>
>> The API should cater to:
>> - SRESET a core
>> - SRESET a chip
>> - SRESET all cores
>>
>> Thoughts?
>>
>> Regards,
>> Ananth
>>
>
> Ananth,
>
> I understand the desire from your end with respect to debugging the
> host.  Is there something we can do to model this better from a REST
> perspective to make this less Power-specific?  Do other architectures
> also have a "send debug interrupt"?
>
> Do you need to SRESET targeting an SMT thread?  We will need to come up
> with some kind of identifier for sending the debug interrupts.
>
> --
> Patrick Williams
