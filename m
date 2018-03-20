Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::235; helo=mail-io0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qLV3mXc4"; 
 dkim-atps=neutral
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404xlp28NDzF1XR
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 13:32:05 +1100 (AEDT)
Received: by mail-io0-x235.google.com with SMTP id v13so443576iob.6
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 19:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JUHEqNS3MYTuS4N7CHgF2RyZPRuMzRsdWlvg/8pmag8=;
 b=qLV3mXc4nMHSipmE+vN9isTgqSuYZRTAEZ8xRo+pfNOHAeCtGYXmRM6CMJP7whemp6
 BTy9toch3dozPuz874Y5FV8L28TedPioz5Hm66qC3xP069vDtn+l7H172I5fmDU+EuPw
 hvVQBRhgF50vUTMRJhwcFYRxgTCzfFzIbFhi4ExY6lWgcx4rYlAD+AlVxPvLYdnOMvww
 aMnnSNw1NzKIE/aHCbBkR6NTu87sO+L/8JRzwg44pEvf5sovRUC9slfkuv+qXGALxHzD
 dza/ZLFLYtgGO9vz36KhQ4BAnsTad5A71G4Q4O7vQ6cKY21cEogPcZxRcZIRcF7vDoxP
 kZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JUHEqNS3MYTuS4N7CHgF2RyZPRuMzRsdWlvg/8pmag8=;
 b=GEcjnfCTw0QuVOoSpbTDH5TKiO6K+smCRcIqMfjkLEvftsI0HXc8YsYkSGV50LDr7r
 KN2V6amP+uB296VcGDyO3/HehjBdxPGXSy4H8zzN5eLsWuRwelIk5buGAwVhYQ6SDOkl
 RqpqADGK1NwkaIUz85AtCvHgT8YPHWqQOryY3lhiQyM3/nA9u5c3Pk18s1qJfVn1OKMr
 fIvfEGofYkZpXiFl+Y4bCTmzCTFcaIRgL6n7IAz4iGIus+Z4MdStaYjgth/kqab8MoDM
 DLIN0kU03G1VF2zGpFlfA4SrCUSjApZSQkuVIkdQdAYIXKz+aQW23z5rYWMLgLjikhCl
 UdOw==
X-Gm-Message-State: AElRT7E0N4/Q43TsA7zcFx+nImTgi45qX/SafVR2DTlNfCoJa/Ai2cpN
 XNFfMmrYiCoAVIuStrCwqS0uflHOor66BKg9d4U=
X-Google-Smtp-Source: AG47ELs1vt+7MiEl3zjsKLTHYESTApmmmm/hPBzr/jVst67edQrXjoh3Nrh4VEChEFSwchgmwn/obcijsn7j82UuUZs=
X-Received: by 10.107.149.70 with SMTP id x67mr14210647iod.156.1521513123541; 
 Mon, 19 Mar 2018 19:32:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.146.18 with HTTP; Mon, 19 Mar 2018 19:32:02 -0700 (PDT)
In-Reply-To: <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 20 Mar 2018 10:32:02 +0800
Message-ID: <CAARXrtkWU-aPFKmD+CU29Sxn0CwsjKv4BcFEn6=T9u8DcMYgOA@mail.gmail.com>
Subject: Re: Sdbusplus-based Shared Library
To: Patrick Venture <venture@google.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>, Ratan K Gupta <ratagupt@in.ibm.com>, 
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
X-List-Received-Date: Tue, 20 Mar 2018 02:32:07 -0000

On Tue, Mar 20, 2018 at 3:33 AM, Patrick Venture <venture@google.com> wrote:
> On Mon, Mar 19, 2018 at 11:24 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
>> Have you tried prototyping to see how much space you'll save?  I suspect it won't be a lot for a few reasons.
>>
>> 1. A lot of sdbusplus is template instantiations, and unless we forward declare a number of base template instantiations for use in the shared library, most of the application code will end up in the binary anyway.
>> 2. Sdbus calls into libsystemd, which is already a shared library.
>> 3. The filesystem is already compressed, so I suspect that any duplicated methods that aren't inlined will have the same binary code pattern and get duplicated by the squashfs filesystem.
>>
>> Those are all the reasons why I haven't really looked into it for the dbus stuff;  I can't speak to the timer stuff, but I suspect the wins in size there are going to be small.
>>
>> Normal disclaimer, on this specific library, I haven't prototyped anything, just done back of the napkin guesses, so I could very easily be missing something here.
>>
>
> So my thinking wasn't about reducing size of the binary but rather
> reducing the toil of maintaining multiple implementations of the same
> code.
>

I am glad this is proposed again :)
I definitely support a shared library for common sdbusplus code.
I know there are comments that phosphos-xxx repos are expected to be
independent (and thus only links to sdbusplus and phosphor-dbus-interfaces)
But it does make each repo to have its own utils with common code like
"getService()", "getProperty()", and timers as well if it uses timers.

>> -Ed
>>
>>> -----Original Message-----
>>> From: openbmc [mailto:openbmc-
>>> bounces+ed.tanous=intel.com@lists.ozlabs.org] On Behalf Of Patrick
>>> Venture
>>> Sent: Monday, March 19, 2018 10:12 AM
>>> To: Ratan K Gupta <ratagupt@in.ibm.com>; Brad Bishop
>>> <bradleyb@fuzziesquirrel.com>; OpenBMC Maillist
>>> <openbmc@lists.ozlabs.org>
>>> Subject: Sdbusplus-based Shared Library
>>>
>>> We have a lot of duplication across daemons using sdbusplus, and no new
>>> utility library.  To avoid every daemon having their own timer object, and
>>> their own this or that, I suggest we create this shared library.
>>>
>>> Thoughts?  We can start simple, just have a timer object in there, and then
>>> the new timers being introduced to phosphor-hwmon and phosphor-host-
>>> ipmid can be the first customers.
>>>
>>> Patrick
