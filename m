Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::232; helo=mail-ot0-x232.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSmtBJfm"; 
 dkim-atps=neutral
Received: from mail-ot0-x232.google.com (mail-ot0-x232.google.com
 [IPv6:2607:f8b0:4003:c0f::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RjHT4m2qzF1yt
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 01:16:05 +1000 (AEST)
Received: by mail-ot0-x232.google.com with SMTP id w2-v6so6233719otj.0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZgOzZXNfZG5Y8oKaTNvr7a7Ut9VEqP6SbK3WUHd4W14=;
 b=PSmtBJfmZkOgBvhwo29NMcIaG2ZZJV8VB7QtMnjayTBZf0F9DubKdksgJVO1s+MFTZ
 sKZPluF+e9zWaHWC0Bd80E2X6FGKRl7KxoJnaw62ByzgoG0GSGghJSskJKAeIRbIkG+3
 jmQ7fwsFfRcQKQq4M+tVrazoN6e0LEcq1FsrGos2ardKu3qgI6IOEhQn7dO2UWsGAzml
 POi0kXW5jlibxR54LkZ4/l/mJ2Atvkv8sRlgOqYTFED7xQs/ex86cL6fb3c/xE3wG84E
 HTTsRgXvhlDyre9f+6fAbMDVceTaBtd3UAuGsgULy9w9GpgplOYM0v2I0395zAvctqCf
 v/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZgOzZXNfZG5Y8oKaTNvr7a7Ut9VEqP6SbK3WUHd4W14=;
 b=sqZc/ZrA0WpqTEuGIIRNdVxHkDccEnuVhSf0VtHMI2BKNGopJ1qYXmf6pEw0TjLxLy
 46dPp/Xtk0rjs/qjGeZ+7NKRUix1aRMXdq5xVjw8ayS0L9u0hDqMLokI2iQFDQabpKTi
 oMxJPDSqg8Sya5zZDJU1slaGjiQS97ggDZrUI9LNciG6hvuCX/Jj4VYXtLfm+/iNlzO+
 xb6WgRLa3QamV2EbqjcQPmMIsOHYAFdeXqL7ooPJdyMU0G8DpybDL2ygDJRBZ14Qb5P6
 BGBIKF7nLI006tT5kFPpaAIimTqf6edYPP8cQtCLL65VBZTjnExT8vyAJLB4wtGJITFB
 wLjQ==
X-Gm-Message-State: ALQs6tBirCuvkHCef3a/RfjiBwnMsJNEveuMU9lNRiQRSByGpOJdM++N
 TEvOYpxSsGB5vEQHEQt27QpNM6ON/0ulY8XkDiM=
X-Google-Smtp-Source: AIpwx49kuH2I5fSvhRXmdsFL9RiBJmKzbiQn5CJeexkBonby2ejCU/rKroaoXdbn5sJnMM6acjgK+mRzaBm9qBJRM60=
X-Received: by 2002:a9d:3033:: with SMTP id
 d48-v6mr4462316otc.329.1524150962712; 
 Thu, 19 Apr 2018 08:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.50.79 with HTTP; Thu, 19 Apr 2018 08:16:02 -0700 (PDT)
In-Reply-To: <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
 <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
 <49734a94-6e64-5f3f-10cd-546303cc5d08@yadro.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 19 Apr 2018 10:16:02 -0500
Message-ID: <CALLMt=ro3GKkt=1zuddQk2=sHO_mt=SBOK9RqdDjRpRP3dYcpA@mail.gmail.com>
Subject: Re: Domains (was: Migration to new gerrit server is coming)
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 15:16:06 -0000

On Thu, Apr 19, 2018 at 8:43 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
> 03.04.2018 18:30, Andrew Geissler wrote:
>> On Mon, Apr 2, 2018 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> Do we have plans to use the gerrit.openbmc.org domain instead?
>> In order to reduce what's changing with this first migration, I'll
>> keep the old name but yes, Brad got me in touch with someone from the
>> Linux Foundation and long term we'll be moving to something like
>> gerrit.openbmc.org.
> I'm kind of lost with all these domains...
> I remember we have an ongoing effort to move all d-bus stuff from
> org.openbmc to xyz.openbmc-project.
> Now you're saying we'll be moving gerrit to openbmc.org...
> What is the official domain for openbmc now?

For this initial move, I will keep it the same,
gerrit.openbmc-project.xyz.  A little history on this.  Initially when
openbmc was formed, it used the openbmc.org for it's REST api's.
After a while it was discovered openbmc didn't actually own that
domain.  The initial code as mostly proof of concept anyway so the
team decided to get an official domain (openbmc-project.xyz) and use
that to reflect the refactoring work (i.e. you would know if something
was "product" code if it had that new openbmc-project.xyz API).  Fast
forward a year or two and suddenly the openbmc project now owns
openbmc.org (through the LF).  Most people share your thought below
that it would be nice to use that.

> Are we going to move the d-bus stuff back to org.openbmc now?

I don't think anyone is going to have a desire to do this given how
much work it was to do the initial move, and that we would break
countless clients who have coded tools against these (since our DBUS
api's map directly to our REST api's).  Long term the REST api's will
become deprecated and debug only as we move to Redfish, so there's an
opportunity for us as a community to maybe do something there?

> Personally, I would welcome that as I hate the .xyz TLD as it is
> meaningless and beside that has some not very nice connotation for any
> Russian speaker. I also think that short 'openbmc' is way more neat than
> 'openbmc-project'.
> Also, as openbmc-project.xyz is owned by Patrick Williams (as well as
> OpenBMC IANA PEN), and openbmc.org is owned by TLF, I'd say that we must
> go with openbmc.org everywhere.
> However, I'd like to know the official intention.

Patrick will be transferring openbmc-project.xyz to the LF once we
finish this gerrit migration but I think most people do agree that
openbmc.org is better.

>
> Alexander.
>
