Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ETpnbQ6F"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zKcjm2nNdzF0Z6
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 13:28:59 +1100 (AEDT)
Received: by mail-it0-x233.google.com with SMTP id b77so15088386itd.0
 for <openbmc@lists.ozlabs.org>; Sun, 14 Jan 2018 18:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jO5drA+CQTIn8vf9k64urMGYWgVhKPZLI+munWeDfiQ=;
 b=ETpnbQ6FJg/pEYtsOOcXaF3BSAzDdvwRQkp0bwc1E5LO8ycM39rBDgxBn4M7TTvsOq
 5Ho9MPZ7hJVls3bnnhtOtDv7t0TgdNyRPf1pE0ptQ79HS8feO6xxlwPY9IKLJ0uUGDvZ
 xIpHyLssYyGvX7jEXGcxsXlmGD5u+7iPmY0ya5CKfC+ImAgQhp+MW+R6biaL1uwbv2Ty
 abL17zkclnDY7VXau5NwaFqgJ7pYuh1yQ0uEbjYEi2MUxwdETSWbGFalzwQw1NDWeqYw
 nj0YzJAq2fB//+hfy7iB+1qiQg/3jeg/4lB3xKRW5Nk7jhu0vzbN5ZF8JGp1VCARISaF
 ECsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jO5drA+CQTIn8vf9k64urMGYWgVhKPZLI+munWeDfiQ=;
 b=Pd8dkOAvyeF7OdWoD4OLtPn86yeQPnB37N0gpfEKrcBW8tyoNCITB9fuoC6i178bLE
 dh6sucshb7r9cEgw3h/bCSC1KTNExH+2uzAdlayLhBoCwXbo9exE59pgzqG5Tyqiuguk
 kVYWE88AnfOLXNXMFvkx5TBSiezZfSEK627D0GzWUJRnl+KVCnlSx7+JWykVBROD5LKd
 dxQqoiVq1aN+kfexBa1yEbX0SYTEEUrVxuxZ7nrxPC4lTjpEDW9AziXEVn//Qtpvcjuy
 vb0ek46vEKDJsa+Y+PW99HGOH4jxQ6w9FRzTjuZfYUDsLrAaQvVJXaYKJ3kzjLCK0ZJ6
 vKCA==
X-Gm-Message-State: AKwxytefSN4281bXfZ7y6nGO2wKCfHmz8rxCV11xWZzqvubLURaV4mqS
 zNXEbPBmleypj9rKo2AFDHTKIMVx2nqHqwcTH0c=
X-Google-Smtp-Source: ACJfBosG2BpKrjQJHvlEkZM1NSFYhUsbRCfh4lhww4YuNxlMlr1Ek2vuQX+Ki1/pB4B0j4aQK/PxZ+8gxarUpJ8K43M=
X-Received: by 10.36.69.219 with SMTP id c88mr13444909itd.68.1515983335863;
 Sun, 14 Jan 2018 18:28:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.175.7 with HTTP; Sun, 14 Jan 2018 18:28:55 -0800 (PST)
In-Reply-To: <87r2qs3p7u.fsf@linux.vnet.ibm.com>
References: <CALLMt=oxScYiG4J-Ms367nqtv_cdZURoiCsa2jz9LH6=n2fRVA@mail.gmail.com>
 <87r2qs3p7u.fsf@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 14 Jan 2018 18:28:55 -0800
Message-ID: <CALLMt=rPacHObpRfFq08+SkJaKjnoo+Msz9jTqwayiourLUV6g@mail.gmail.com>
Subject: Re: openbmc coding standards validation in CI
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: ed.tanous@intel.com, Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 02:29:01 -0000

On Sun, Jan 14, 2018 at 5:06 PM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> Andrew Geissler <geissonator@gmail.com> writes:
>> During the hackathon meetup, we decided to try and get something in
>> our CI jobs that would validate the code formatting and automatically
>> -1 the gerrit commit if it's not up to par.  The reasoning behind this
>> is we still have a lot of code review comments coming in this area,
>> which is wasteful for the reviewers.
>>
>> Ed, Adriana, and I all worked different pieces of it.  We're using the
>> clang-format tool to format (and then validate the format).  The idea
>> is you do the initial run of the tool against your repo and check the
>> .clang-format file in with your changes.  The presence of the file
>> will cause the CI job to validate the code formatting.  After the
>> .clang-format is merged, CI jobs will fail if the new code doesn't
>> follow the standard.  The CI jenkins job will output the diff of the
>> code that is not conforming to the console.
>>
>> We've tried our best to get the .clang-format file to match up with
>> our requirements in
>> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md.
>>
>> The .clang-format file and the changes it did to the sdbusplus repo
>> can be found in https://gerrit.openbmc-project.xyz/#/c/8461/.  Review
>> comments appreciated.
>
> Oh neat!
>
> I gather the CI job is something like "parallel clang-format -i {} :::
> `find . -name '*.c' -name '*.cpp' -name '*.h'`" and then check for any
> changes?

Yep. you got it.
https://gerrit.openbmc-project.xyz/#/c/8455/4/scripts/format-code.sh
if interested in reviewing :)
The CI job will just call this script if it sees the .clang-format
file present in the repo.

>
> --
> Stewart Smith
> OPAL Architect, IBM.
>

Got some good comments on the format review, keep them coming!
(https://gerrit.openbmc-project.xyz/#/c/8461/)
This will most likely what forms a base in all our other repos so lets
get it right from the beginning.

Andrew
