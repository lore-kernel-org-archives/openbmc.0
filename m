Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Yp2rrc6O"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409b040jKvzF2Dt
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 02:43:47 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id l123so13462528vke.8
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8rIRF8EMoft1toVftiuEXvug9r4R/M7NPKN8v5KQxD0=;
 b=Yp2rrc6O2cXIbwMFyH8fMqr4HVYAawulgZbcDF7PqVKZNDJCQTxx5LNoxkt5eQfj74
 ICrE/xuCfM4KCQkVjlnzpePG2q0bmgB2CMJBUXDKbUibfyoTnvAQLtPZizOPxdjlbOcW
 0OsCeI4Jc9ye9ncGVkA/6akHGQIBxeyx0UU/VcGG5RZFw+c+Al5cpc5omQfCJtgjopb3
 sqMwukirLztrN0vVdMpOXUaNlKW2RwwjmENbwI1FydKTISXc2lkEZQlXhDMvbz+nFFJM
 iSHuBz9okdo/K/eDNAeLBvQLypiImdKupoWjYMYv1uB3rY2/tG+gR2OXlaT85OBA3cFw
 8o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8rIRF8EMoft1toVftiuEXvug9r4R/M7NPKN8v5KQxD0=;
 b=SEEGxBHzRtslW/qMEGUqoMKOaAaZ8EavcbUCkcFWjIhbKGDwA3mmNGntQuA1kNf2pH
 OHG8KSORZatk/oLg2zfMP3zUVjgVF+M6CPb4yDGb0VMdvMRZRnBAPOth22GmplrDd/aO
 Nj9Pc282LyZ+KpMOJ1jCSM9qw0Nc+cuYd1UqxEEzHDxMLBAAxlVW9ljS1I6mzBpbOjnu
 rCnQO5Ppl/qIqvDRAswRc5Pgh/1LtZmasQwuTyX2fcsow4K/CECOMUMQQ9GgyPHJlnJA
 uak+uWgY1UrxLT3YrcG2C1Xul/Tksxu1q++SvGn/ZytuvO903/AzzJz+O/onWuI8O/vk
 FaDw==
X-Gm-Message-State: AElRT7Fa3D88fUez0D1Y89e6UZUPIVch34R7hybpDOZUuGtC2D/cMLyW
 mQUDYAKJcNAbTPDAB6Hza/zE9NTX4Wpv+nmxLPSqlg==
X-Google-Smtp-Source: AG47ELtF5FfMzVGPv8XDDJ1+AoL4DT6/Eu34+FQfl1KTMtUZwlGbK4jYGoUfVLN5d9RlzFrCLOdcR5n2F7IPdGgt458=
X-Received: by 10.31.229.196 with SMTP id c187mr27581605vkh.1.1522165425384;
 Tue, 27 Mar 2018 08:43:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Tue, 27 Mar 2018 08:43:24 -0700 (PDT)
In-Reply-To: <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
 <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 27 Mar 2018 08:43:24 -0700
Message-ID: <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
Subject: Re: Sdbusplus-based Shared Library
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, "Tanous, Ed" <ed.tanous@intel.com>, 
 Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 15:43:48 -0000

Brad,

If you create a repository - phosphor-sdbus-utils or
phosphor-sdbusplus-utils or something like that, I'll put together a
starter pack on this and submit for review.

Patrick

On Mon, Mar 26, 2018 at 11:04 PM, Ratan Gupta
<ratagupt@linux.vnet.ibm.com> wrote:
> Hi Andrew,
>
> We raised this concern around an year back with patrick but that time it was
> told we have limited set of users for such classes,
>
> Let it be replicate but now as the code size is getting increased we should
> look for some common library for such classes.
>
> Regards
>
> Ratan Gupta
>
>
>
> On Tuesday 27 March 2018 11:17 AM, Andrew Jeffery wrote:
>>
>> On Tue, 20 Mar 2018, at 06:03, Patrick Venture wrote:
>>>
>>> On Mon, Mar 19, 2018 at 11:24 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
>>>>
>>>> Have you tried prototyping to see how much space you'll save?  I suspect
>>>> it won't be a lot for a few reasons.
>>>>
>>>> 1. A lot of sdbusplus is template instantiations, and unless we forward
>>>> declare a number of base template instantiations for use in the shared
>>>> library, most of the application code will end up in the binary anyway.
>>>> 2. Sdbus calls into libsystemd, which is already a shared library.
>>>> 3. The filesystem is already compressed, so I suspect that any
>>>> duplicated methods that aren't inlined will have the same binary code
>>>> pattern and get duplicated by the squashfs filesystem.
>>>>
>>>> Those are all the reasons why I haven't really looked into it for the
>>>> dbus stuff;  I can't speak to the timer stuff, but I suspect the wins in
>>>> size there are going to be small.
>>>>
>>>> Normal disclaimer, on this specific library, I haven't prototyped
>>>> anything, just done back of the napkin guesses, so I could very easily be
>>>> missing something here.
>>>>
>>> So my thinking wasn't about reducing size of the binary but rather
>>> reducing the toil of maintaining multiple implementations of the same
>>> code.
>>>
>> I'm on board with this idea. There are a bunch of utility classes defined
>> for RAII that are (were) used in phosphor-mboxd that would be much better
>> off defined in some library where they can be reused.
>>
>> Has anyone looked at this beyond what's in the thread?
>>
>> Cheers,
>>
>> Andrew
>>
>
