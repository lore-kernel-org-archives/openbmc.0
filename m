Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::229; helo=mail-vk0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uEIsUk79"; 
 dkim-atps=neutral
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BVWb0cbBzDqh0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 14:25:45 +1100 (AEDT)
Received: by mail-vk0-x229.google.com with SMTP id v134so2614195vkd.10
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 20:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VlC/XW1W0EissZ+P2xNXYHlYerJBeds3V4zndtyxEVU=;
 b=uEIsUk79Q0FrwMtqh09Msex2wVbrc7vao8MeJ1VEEL57hY3WZ/UxRNx2AgtesFW2pl
 EfDC4I50c1X+fkMZlWzzTB+dm48FsU0Gmrt+6GAvqzduKIrYbpcXkSqDpYXKYBjcphoz
 Ykea7b1SXUkmJWIoyTtD4g1cDoUYzb4r1RTNztFAWhuGvwaRs9vVeXlvZe2Gp61tluM8
 LVcqGOxTXbkM66AS+fkJfeoBizKPxkqAWh1Jrw4OXYDhTg9xGKmvintqFtTgZCOYJPbI
 5Z3AKfRDLJb1N1h9kZJ8R1DoM5sfySdxFHb27GY7VSYs/ScmbD8jglNbvDW2ClaUqYPY
 BZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VlC/XW1W0EissZ+P2xNXYHlYerJBeds3V4zndtyxEVU=;
 b=JswK+JztC4+j/98Fhip98L3grQG57Z5Rz9qxqrqj/a6JaGYqWrH8bV7duW9Ewgks1S
 G7UROc5pC0sdzmjuakYHhCWMFSAxry+7hL85+UdcrgxXQ6EPko9KikIZTZIrwro8e3la
 BsIbOVFtepf4agCbSm4Wnk5+x1JHEX5BbzmgP9dXwn1sKZbfYEkwkyJgpzQejYaCRh/Z
 Sd+Z/Ax2zbzs1Kaik4NjCbqobjFXHNNQgfLk/FARS25oKOOojfCE0/hKH8ntYCbpkSOV
 NK9AqAkpnGuUFD+6GLFLTwJad2LWfxV9MVq1rbcM8ZRzecGLW9IguRbp5zwVol3cKquJ
 xqxw==
X-Gm-Message-State: AElRT7GlWIlzZtd63hVZnX45zF76e2rMEtX7C1p/W/7F4bz7kvm8K0mM
 +D1V3Eh7sIlUbuDlv0VzznqX9rNy8tvblrB1Oa3BWg==
X-Google-Smtp-Source: AIpwx4//aH0Z3LR3Aqtqs9qwmB+RB1rtlUskrJMA2uVzxVag1QJx+V2Adjoz6Fl/TTPjdnOJ34Ut5x8w7aobdVtPPDA=
X-Received: by 10.31.206.198 with SMTP id e189mr4010345vkg.164.1522293942558; 
 Wed, 28 Mar 2018 20:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Wed, 28 Mar 2018 20:25:22 -0700 (PDT)
In-Reply-To: <ED94F738-2C50-416D-826B-82BE0D1B0E94@fuzziesquirrel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
 <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
 <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
 <ED94F738-2C50-416D-826B-82BE0D1B0E94@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Mar 2018 20:25:22 -0700
Message-ID: <CAO=notz7gk5oF9BSpviz+1VrDRCeBCU7t8+zQxTGZOCDYy=VmQ@mail.gmail.com>
Subject: Re: Sdbusplus-based Shared Library
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Tanous, Ed" <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 29 Mar 2018 03:25:48 -0000

On Wed, Mar 28, 2018 at 6:39 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Mar 27, 2018, at 11:43 AM, Patrick Venture <venture@google.com> wrote=
:
>>
>> Brad,
>>
>> If you create a repository - phosphor-sdbus-utils or
>> phosphor-sdbusplus-utils or something like that, I'll put together a
>> starter pack on this and submit for review.
>
> May I suggest
>
> https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/sdevent
>
> as a possibility for drawing ideas?  :-)
>
>>
>> Patrick
>
> Thanks Patrick! will do but I=E2=80=99d like to get a bit more clarity/di=
scussion
> on what the content of this new repo will be.
>
> So today we have sdbusplus built around the sd-bus folder in libsystemd.
>
> Do we envision something like separate repos for:
>
> sdeventplus - wrappers for the sd-event folder in libsystemd
> sddeviceplus - wrappers for the sd-device folder in libsystemd
> =E2=80=A6etc
>
> Or should we just try and have a single c++ wrapper repository for all of
> libsystemd?  In that case should we simply rename sdbusplus to libsystemd=
pp
> and start putting more code in it?

I had envisioned all the sd-bus wrappers in one library, however, I'm
quite flexible about any of that.  My primary goal with pushing this
line of thought it to reduce code duplication in openbmc.  So many
daemons have the same methods that just talk to sdbusplus, etc.  So it
makes sense to me to have a utility library for interfacing with
sdbusplus for common tasks.  phosphor::util::getService(),
phosphor::util::get... etc, so they can be maintained in one place.
Even phosphor::util::network::... because those are becoming
duplicated.  It might make sense to have multiple libraries for the
utilities, which is also fine.

>
> -brad
