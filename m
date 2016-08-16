Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDPH52p29zDr4d
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 06:34:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ztrkqMAD; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id x131so25890611ite.0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UyJyfELotI9G7B/zqoUJ+RTEs5TR20qV1ree4ke6Qv8=;
 b=ztrkqMADcbPbjh8i36fh0KBieMJFNp4th/Rw2l/UY0kveOQ1pCAK+W1P5dp4SxHgoi
 UYlJVCZh+Zm3g2DZRPh4dlbIR3su20eKHkvF+1vdOljIo1W1fVC9DPE5YmbTEXvWQKhs
 1sQtjZLBNk+6qFiMU5z0DoLKcuI5luqYxJXiqX+F9d6qXE7eSXFVnfH4Cv1J8CBgWQjr
 SmwsZn3LpNSTYzNmgTa4V9hFdSnHmjJVPuOTcc1Ui3S1O6bS6DDChCzl86Kwi2PdHbLn
 D8SQRH4L2ZY687esPOuI8C+lQevR0GpPvK/ddKJq8XGROqy1wW5fIUtnfklClQnWUp3F
 5iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UyJyfELotI9G7B/zqoUJ+RTEs5TR20qV1ree4ke6Qv8=;
 b=M6w3Y6/D9Gv4EyKfJQZQwSREvYvXcHEJX1VBhQItC2TarRsylGrTZUjwUhVv/4GKcf
 pxtIWAd0zs/CqnkTjt4/WqimtEU0EU9gStH+SC3ViwJlmiUN2gG8Rmm6yiTgf70YYjLp
 7XFcGST5nnkbI/bjwF5TeXatbuieLLKzauojzXLx63Wd0MaCe3cmThbL4Yl8V8wYWp08
 Dtm97jsYmtJWEbk0QVZ3aVrodLkgo/yLyJaM0lI66eRVVtzHrpfz62/rRlL2W9K7LakI
 lhWroVh8ODbRpjobFURebYw5PcfhRxDzZZN3nL8nd6Lh9RpEKoSoljn3oS4PkgoRM2h/
 6QpA==
X-Gm-Message-State: AEkooutUnQyyEMBhy77ltzMz8e++KW/BbeXV3re1ugUG38BOJgLjgpnsKc97pQPWdeP/yNbpQFBXbvK3BWAHkg==
X-Received: by 10.36.104.73 with SMTP id v70mr24405722itb.12.1471379678120;
 Tue, 16 Aug 2016 13:34:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.140 with HTTP; Tue, 16 Aug 2016 13:34:37 -0700 (PDT)
In-Reply-To: <CACPK8XfY=nOr3-TAZP2U3vQrrVA2bh8vcSeuj2oMcnunZdE+iw@mail.gmail.com>
References: <CALLMt=qweXqtGwNAA33EEzNVj=117wbuF_CDcr8JBeORFusU0Q@mail.gmail.com>
 <CACPK8XfY=nOr3-TAZP2U3vQrrVA2bh8vcSeuj2oMcnunZdE+iw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 16 Aug 2016 15:34:37 -0500
Message-ID: <CALLMt=ryfJyMtWstCGyZgPM=8VZMw8kDiS__L0GoTRaY2ZADng@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Aug 2016 20:34:42 -0000

On Mon, Aug 15, 2016 at 9:14 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Andrew,

Hey Joel!

>
> On Tue, Aug 16, 2016 at 1:00 AM, Andrew Geissler <geissonator@gmail.com> wrote:
>> I've enabled running our robot CI tests against all of the
>> openbmc/openbmc gerrit commits.  This is against the basic ARM based
>> QEMU model.
>
> Thanks.
>
> Do you intend to run it against the palmetto qemu? This would be
> useful to ensure our kernel and userspace interactions are not
> regressing.

Definitely!  Just not in this commit :)  We wanted to start with the basics.
Running against Palmetto QEMU and running an enhanced CI bucket
against it are on the list.

>
>>
>> Reviews/Comments (or +1's) appreciated on the scripts to do this:
>>
>> https://gerrit.openbmc-project.xyz/#/c/166/  (main script)
>> https://gerrit.openbmc-project.xyz/#/c/176/  (minor change to support
>> QEMU in docker)
>
> Andrew J has beat me to it. Look good in general.
>
>>
>> The jenkins job can be found here:
>> https://openpower.xyz/job/openbmc-test-qemu-ci/
>>
>> The test team is working on optimizing the test suite to ensure as
>> much coverage in as minimum amount of time.
>>
>> Also, I've tweaked the build-setup.sh script to support ppc64le,
>> comments (or +1's) appreciated here as well:
>> https://gerrit.openbmc-project.xyz/#/c/196/
>
> Looks good, pending addressing Andrew J's feedback.
>
>>
>> Next on the list is a real-hardware based CI job.
>
> Great!
>
> Cheers,
>
> Joel

Unfortunately we've got a bit of a blocker with
https://github.com/openbmc/openbmc-test-automation/issues/78
We're still running the CI tests but we wont fail the job if the CI
test fails until we get this resolved.

Andrew
