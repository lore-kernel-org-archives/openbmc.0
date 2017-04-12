Return-Path: <maxims@google.com>
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3K0V4TXDzDq7h
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 08:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SJegvXeI"; 
 dkim-atps=neutral
Received: by mail-io0-x22b.google.com with SMTP id l7so59357694ioe.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fEraKvtpoB+UJzqOHtrt+fXE/4bIgwWLQBeTqgTsDbE=;
 b=SJegvXeIRI1qmc8tb3qpmE6kIk7jHeddp7GcckPI/WjHsYQvWKsQEnQMpEb5QJ7ECi
 tBoWaU6CxH/tr2TfnF28TnE2hddCVHxwF0M962jEOAdL3hugAijOQFQxSIVBtdzXT0wq
 9Ev2dQ0PxAxqPY5WHURIFTgFI2VbtlPZDPdnKnPrFBsYiUyxAJKICwyRk8hEPBrHnrLI
 h/izZndCU6tzYB5oXOkkj5sghTBM9+LTxivXF5HpKyq/UqbBTMp+ndkqAuU3GaD38+Fv
 XWEg3W9ogA5HPmYl71JQLqAIbqRiqSGwJQ2U6NRyhIu/mX1eX65YON9VuD5BTJuEx5/H
 waZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fEraKvtpoB+UJzqOHtrt+fXE/4bIgwWLQBeTqgTsDbE=;
 b=e8xn5Kg41ehYerN63j/5fsbWbty1lFp6Fy4HzBixGZ7Ky2Y1RpAasP4Ka+ltayT+UO
 FpJ8Ok36JhPyDiZjzwArKNQ1EaXANjnQpwQNUVMgtHSNoyyA41mUpGlOUoSpphOvkdKb
 IrslgGHA6jwUWW1zpuiSl0Fj2fKSq/AAIs+lQnzLTXYjNT0gHQAOqi8iw1nCAEvecze+
 6WHVB2wimUPXorIQXAa8QwEjYi8pvBWROg/DQIdt1OFI4aNk3XonieU4dnD0LMmeyHfm
 pFCUqlolYNGfgW5AD3p8t8V3QKJxiav7LT67wT1HkZHC21QEKuuMG3dFm4N4kCmY7WV9
 qNIA==
X-Gm-Message-State: AN3rC/64RrgoZX5235UtLDCahoPJskBHs4ZBfgGVdBdVPq63WHtqtuCW
 RttMKh/Xi/DapXwn3b6vjymnZJiGUF7C
X-Received: by 10.107.32.199 with SMTP id g190mr652786iog.117.1492037479266;
 Wed, 12 Apr 2017 15:51:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Wed, 12 Apr 2017 15:51:18 -0700 (PDT)
In-Reply-To: <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 12 Apr 2017 15:51:18 -0700
Message-ID: <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
Subject: Re: Running tests
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 12 Apr 2017 22:51:23 -0000

Hi Matt, thank you for your reply.

So, I've done "Building the OpenBMC SDK" step from the cheatsheet:

$ bitbake -c populate_sdk obmc-phosphor-image
$ ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-toolchain-2.1.sh

Now when I do

./configure --enable-oe-sdk

I get this error:

checking whether we are cross compiling... configure: error: in
`/usr/local/google/home/maxims/nong3-dev/phosphor-event':
configure: error: cannot run C++ compiled programs.

What am I doing wrong?

On Wed, Apr 12, 2017 at 10:59 AM, Matthew Barth
<msbarth@linux.vnet.ibm.com> wrote:
> On 04/12/17 12:22 PM, Maxim Sloyko wrote:
>>
>> Hi all,
>>
>> I'm looking into ways to automate test execution for ... well ... as
>> many things as possible. I see that some repos, like
>> openbmc/phosphor-event for example, have tests in them, but the
>> problem is, I can't build and run that project individually, because
>> of missing dependencies (my libsystemd is too old).
>
> You can use bitbake to populate and install a x86_64 SDK environment that
> you
> would be able to source into allowing you to build the project and run the
> tests.
> There is a configure flag (--enable-oe-sdk) that must be given to the
> configure script
> to setup some additional environment variables within the x86_64 SDK
> environment. Here's a link with info on deploying an SDK:
>
> https://github.com/openbmc/docs/blob/master/cheatsheet.md
>
> Matt
>
>> So, my question is, is there a way to build and run those tests from
>> bitbake, so that they would use the version of systemd from yocto,
>> rather than the one installed on my machine?
>>
>> Hope this question makes some sense.
>>
>> Thank you!
>>
>



-- 
Maxim Sloyko
