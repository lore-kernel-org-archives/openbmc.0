Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sFVHh02rRzDr5T
 for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2016 01:24:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jfpLO2o2; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id x131so930820ite.0
 for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2016 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=66PjPfRbx9dYVJrwkybMqKUoEqHH9tHUdWM3nUO62uc=;
 b=jfpLO2o2JgXv8jusRBRhycC1XxmFU36wJ5wE8hVLqbyahAHSxRC2h2AIwSL+X9ogE4
 KgrWGHk04JZskfQZju/5xB8LcvBHN1n+bH6uAVa6MvW1W+CiId3NHUeSUQyvTlpszUFA
 Uhwd+YsTqhxBJpB03YiUYjvlD7TVp0IwFwHjGaGMOkMNJ8NrCfamlFz7/nEqG6iMED9Y
 hSgfE44JTTAwYAD9NcOH+a0aH9nPN4U65WjHgVGxKcTV+A467INOE3a+0S7tjY8jM0Jq
 I8czPfnZ76tItUeVxmJWK2n1Pbljcx/5xozhex8MnBhhyhWhlfz6WuNyEf2LBCnVMPPX
 BdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=66PjPfRbx9dYVJrwkybMqKUoEqHH9tHUdWM3nUO62uc=;
 b=U3RvJgJdQJqN8+0HFlCLRKjHHXciORdzlbpjAXIrObz6G3PqiWC0yhxZbGalBrVuLx
 LErcniFltGGXrk/tUfI6xdyOrL2/aG5U8z4b3b059MVfn+z1nsElkd0ST+zWxoH6mIGE
 oSRGE5TPamqXOP1lr8n544OqaM/dZK4pGEhI3aZKTP6IID+f7NDcde5wxDzEzRRx0Obl
 z5CtzOJOckHtV3PrjgLxf4QDBgqKwJ5wsCOfaONhmsZT1saOSKtcrzpl7+LqR+hRHrqh
 KYanWxTJi3wxphdXvlzDDWDx3egM5zx5YJ9szdgrrqqXDBX0uKTd5ZU4YCJnqPoqUMdD
 yhow==
X-Gm-Message-State: AEkoousbVFesnv58+saQDaQKeaIKk/YIfmCmuNVefF785+fT5Ah23cJwzW+kJoXN5mnSh4GGD6TcbREs6HtEmw==
X-Received: by 10.36.104.73 with SMTP id v70mr211120itb.12.1471533837283; Thu,
 18 Aug 2016 08:23:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.140 with HTTP; Thu, 18 Aug 2016 08:23:56 -0700 (PDT)
In-Reply-To: <CALLMt=ryfJyMtWstCGyZgPM=8VZMw8kDiS__L0GoTRaY2ZADng@mail.gmail.com>
References: <CALLMt=qweXqtGwNAA33EEzNVj=117wbuF_CDcr8JBeORFusU0Q@mail.gmail.com>
 <CACPK8XfY=nOr3-TAZP2U3vQrrVA2bh8vcSeuj2oMcnunZdE+iw@mail.gmail.com>
 <CALLMt=ryfJyMtWstCGyZgPM=8VZMw8kDiS__L0GoTRaY2ZADng@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 18 Aug 2016 10:23:56 -0500
Message-ID: <CALLMt=pBiT60w-tvo+A20JZ_KHyC0WO_yne=sJ-wogWAmjL8Nw@mail.gmail.com>
Subject: Re: Robot Tests in CI
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 18 Aug 2016 15:24:00 -0000

ok, all code review comments addressed and code is getting cherry
picked into our CI runs without issue.

Final +1's and merge appreciated from the team.

# New scripts to launch qemu and run robot tests
https://gerrit.openbmc-project.xyz/#/c/166/

# Disable uninative feature
https://gerrit.openbmc-project.xyz/#/c/176/

# Update build script to support ppc64le
https://gerrit.openbmc-project.xyz/#/c/196/

# Update build script to auto extract master if no code given
https://gerrit.openbmc-project.xyz/#/c/211/

Thanks,
Andrew

On Tue, Aug 16, 2016 at 3:34 PM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Mon, Aug 15, 2016 at 9:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hey Andrew,
>
> Hey Joel!
>
>>
>> On Tue, Aug 16, 2016 at 1:00 AM, Andrew Geissler <geissonator@gmail.com> wrote:
>>> I've enabled running our robot CI tests against all of the
>>> openbmc/openbmc gerrit commits.  This is against the basic ARM based
>>> QEMU model.
>>
>> Thanks.
>>
>> Do you intend to run it against the palmetto qemu? This would be
>> useful to ensure our kernel and userspace interactions are not
>> regressing.
>
> Definitely!  Just not in this commit :)  We wanted to start with the basics.
> Running against Palmetto QEMU and running an enhanced CI bucket
> against it are on the list.
>
>>
>>>
>>> Reviews/Comments (or +1's) appreciated on the scripts to do this:
>>>
>>> https://gerrit.openbmc-project.xyz/#/c/166/  (main script)
>>> https://gerrit.openbmc-project.xyz/#/c/176/  (minor change to support
>>> QEMU in docker)
>>
>> Andrew J has beat me to it. Look good in general.
>>
>>>
>>> The jenkins job can be found here:
>>> https://openpower.xyz/job/openbmc-test-qemu-ci/
>>>
>>> The test team is working on optimizing the test suite to ensure as
>>> much coverage in as minimum amount of time.
>>>
>>> Also, I've tweaked the build-setup.sh script to support ppc64le,
>>> comments (or +1's) appreciated here as well:
>>> https://gerrit.openbmc-project.xyz/#/c/196/
>>
>> Looks good, pending addressing Andrew J's feedback.
>>
>>>
>>> Next on the list is a real-hardware based CI job.
>>
>> Great!
>>
>> Cheers,
>>
>> Joel
>
> Unfortunately we've got a bit of a blocker with
> https://github.com/openbmc/openbmc-test-automation/issues/78
> We're still running the CI tests but we wont fail the job if the CI
> test fails until we get this resolved.
>
> Andrew
