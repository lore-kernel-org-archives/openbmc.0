Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stt6F0ppBzDsrM
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 10:11:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QdWMHQez; 
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id 83so12215950vkd.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 16:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ru0lxg8eMWKwS1CMKTOQsKNjJapoR9o6OkCOsfCPN84=;
 b=QdWMHQez9pmClnvXaQILDmLvZ9lKPE7tTVsHDb29BZBkqwnc8MkGoxEOvVQTYVRNwm
 WVSbDWZfamDoe53AbfZw3TVUVMmHJ62zpK+H82wu+FOUipQzODEyrPoroiMA4oeEtBzW
 D6fi1uwsqZ5DEMdBq7njCOxRkPJlzmKMNoNHewxbKpwg90PeLP5HWaI1WefztNW5UHOd
 EJvAucDYN6EMMt+n+WkwR43PN6/meIj8Jjam4glZAWEPzWLxkIc6zTKsHIQ8EEnzCyMz
 /+dchPVev63DFSGsiMBU5jbAnwNI5ynG1wI5h5/FMJV/ig0f5gErB2cBhUQJ7Pn5Egbd
 nhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ru0lxg8eMWKwS1CMKTOQsKNjJapoR9o6OkCOsfCPN84=;
 b=m/3VzJeOy6V5CKZr7KmHJDJBAZDmASkjFpi0IHH0xY7wt0XE+x/UyqHRfmr73bMvPi
 bQNC8uYU51qF0f6s8EbzsVrjIQTNzv/7Ba6xiwaOQcgb7gPdVbWg3W/WeV3Wsy8As+eN
 3gyHNFlt7kXpVY9LT3Sm0FyNntgWI752Xwl97MD3W9BT7dzFUWrylblSIKPsbViskh2M
 HlnVUts1rQp7WBbZlMF9WGzF4wD/D2pv48+67BYrEp8Wm1QQX3xZMbe7YE4smPYNEdaS
 Jez1O+6Rl5Rlq1ti0pU8h3KlOOPdZKdsiexmKGIpPiZnAZrnn2gGPPicwmheuh/rc2G9
 sJbQ==
X-Gm-Message-State: AA6/9RmwvQwev8yW9HSIqPCmB3UUwJ4quFvnAxcvxg9z71MztHV9qZokmQflwZ0g2H6J06+FC5BZrJ5ZluyRRA==
X-Received: by 10.31.102.6 with SMTP id a6mr4429010vkc.151.1476227490869; Tue,
 11 Oct 2016 16:11:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 11 Oct 2016 16:11:10 -0700 (PDT)
In-Reply-To: <57FCFA02.8060001@raptorengineeringinc.com>
References: <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
 <20161007015152.GA17914@heinlein.lan>
 <CACPK8Xfwj82abqJS_j20WZFzwwPZke2y1FCHk3eoMTwJopxDpw@mail.gmail.com>
 <57FCFA02.8060001@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Oct 2016 10:11:10 +1100
X-Google-Sender-Auth: 8DoD2ApuTeMwuJCTnHA841UQ3iQ
Message-ID: <CACPK8XfcwECCYPgPYG5a5QqxGgtjH_ZQJyTfPuz=+HgGBWyevw@mail.gmail.com>
Subject: Re: I2C device driver names
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 11 Oct 2016 23:11:33 -0000

On Wed, Oct 12, 2016 at 1:41 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>> Yeah. I did ask that he spit out the maintainers part of that patch
>> before we applied it.
>>
>> Timothy, are you able to make that change?
>
> No problem.  Updated version sent to the OpenBMC mailing list.

Thanks. I'll take a close look and add it to our tree today.


>> Timothy, do you have any update on the rewrite?
>
> Not at this time.  I've requested a status update from the hwmon
> maintainer that was working on it.

Cool. If you could, please me on future correspondence. I'd like to
keep a track of how it goes, and we might be able to offer some help
if the hwmon guys don't have time.

Cheers,

Joel
