Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::236; helo=mail-it0-x236.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jNI2wuuV"; 
 dkim-atps=neutral
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mXzq6rTzzDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 02:01:11 +1000 (AEST)
Received: by mail-it0-x236.google.com with SMTP id 139-v6so1098674itf.0
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zwEXzzakEBJ2qC13sGieC42vLfN9E9HcTDWb+BHCr64=;
 b=jNI2wuuVN88uf66b6Gu0Z9mziyfP0ldBZLPn9hatJWxIk1xyq/DdDOmG/IIqv/9779
 /7Buat/Ytf1xv2WkPFpzd+JdCsBbhozGiKyWPkB/Zm3LLusCm3e9RS+7dNAfj6d043WI
 TOyvkMyrifmx0729tSHgFtRatNY+kIKkgCSbJEZAGP2/t0sov8rrjdLfNLvqucsVPyXh
 kgxltvMu75oxTHJzkpb0DT8JlucFmhNHc5DURsPDJgxmh2mS5pyIklvBESfc8e3tGuwa
 9jL+zr2aKQO7CPlgi1nPLvogfCghXKGmlqok8xwBr6xWQkUiarD9QAolKQX/aFGCg0uR
 uU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zwEXzzakEBJ2qC13sGieC42vLfN9E9HcTDWb+BHCr64=;
 b=VfEt1Bc2cuIxwQ6yEI63q338r2QGscJrVeJ+Hf89o1/DbtUcoQlzRG9jqEDUaL9L99
 CGIvN2PvmqrjrkuMk5pjYQLOy0bS6bMafu6UQHCifcl8282mP1emq1qPP8ABLv0P9KIC
 wAAVOMt8ZBpGpO4FUXZJ9gu5B32jQ4bzNefivgjlv37ZgNSQmNZttf4Ns+gB6js/67QK
 ueFp43vYaC5i5tXCveWuEYIMY1mEluGcLr+FM8x6J692vmc/cCctprGdltcaSpE/CiGU
 oj/8U8m4OJU/GGjorwUT0lvWKpUZMXavCyfi/VB02cvw8IdGeTUtZS0o0bny7UlGbajL
 FZDA==
X-Gm-Message-State: AOUpUlFHG5w6E119PNHLJ3NLa5mv5qD9viDcFKbZ4MnFAPtFCXAPoHov
 BY85yEfKvtxXNAmy/pKLyfkh+eed/2EtTmwsgSwjbA==
X-Google-Smtp-Source: AA+uWPw82rXMp4DS3U6FJzOedVdoO461YzLdk3jSL3mfjyk3HocyqPr8iPx5YUNRqkcHTJ5Ttb8Ulx5gqIoFmS2s9BY=
X-Received: by 2002:a24:83c3:: with SMTP id
 d186-v6mr2357164ite.88.1533830469062; 
 Thu, 09 Aug 2018 09:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Thu, 9 Aug 2018 09:00:48 -0700 (PDT)
In-Reply-To: <4cda5582-7307-2418-e5f2-679cc051e66a@gmail.com>
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
 <4cda5582-7307-2418-e5f2-679cc051e66a@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 9 Aug 2018 09:00:48 -0700
Message-ID: <CAO=notx-uK_8hPiPpTxq8FQe64UcAb4G00Du2CgyrqjYrWnRLg@mail.gmail.com>
Subject: Re: Licensing Question
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 16:01:13 -0000

On Thu, Aug 9, 2018 at 8:47 AM, krtaylor <kurt.r.taylor@gmail.com> wrote:
> On 8/8/18 5:45 PM, Patrick Venture wrote:
>>
>> So, I've spent the last hour trying to submodule my way to using
>> ipmitool.  I've managed to get it compiling for just the one file I
>> need (or want).  However, then I try to link it and then more failures
>> for things that are missing, such as helper methods.  So, then I add
>> the file that has those, and then it doesn't compile because that file
>> doesn't compile.  This is of course, not compiling with the -Werror
>> flag among other things with gcc.
>>
>> So, I can keep battling this, or I can ask -- the license for the
>> ipmitool just says I need to keep a copy of the license with the
>> source if I reuse it.  So, I can do that, and I can hack it up to work
>> -- but where I'm curious is -- how does that impact the license of
>> phosphor-ipmi-flash?
>
>
> Not a legal professional. That said, it depends on the license and linking,
> packaging, etc.
>
> I am assuming phosphor-ipmi-flash is Apachev2, so linking to any GPL may
> have viral effects. ipmitool looks to be bsd so it *should* be ok.

Yeah, phosphor-ipmi-flash is apache v2 and the ipmitool source has a
license file to a company that says I just need to include that
license file in anything that uses that code.  So, I'm going to drop
their license file into a folder with any code from them...

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/11858

This patchset is where it'll show up as actual code manipulation
versus just adding a gitsubmodule, if anyone is curious.

>
> Kurt Taylor (krtaylor)
