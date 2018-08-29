Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dAKQ0/Dk"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420s8Q0dk1zF0gL
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 02:51:17 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id z25-v6so2578614pgu.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtifxR2rsS0v0BwQVjNZatOgczPxq0fPNdpLiJ6f0gc=;
 b=dAKQ0/DkxTWgy4Cd3xRV53WRVMkrlp2fENja1ZqAJzHufSICFJvMZwizxdyh2NUWwI
 syo2oYqjPMVTRJN1EGDd7hd41O9Z6xOjdG8dIuU+wzs/Js0lnYCAQyJ0y2J/pltdCDVC
 lmsUsqCs5aRJvG3F+tufwC3vWj0L7rxbdbL+Cf58bnn2sivEvyhCt2fp0kvvOLEdiIU7
 t4WCzVf9nsqjxNqhLECeQQIG+05A2BN94U5RPkcj0i4gxVcZeZhUkHiFrWumNMbhd7v0
 7+g9yvakkWBv95SIYQVzIb/2jPLU4Pk/lAAYpf9SPQZ6MXGLYrs4eSaIsGkSmkUFfeRj
 kX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtifxR2rsS0v0BwQVjNZatOgczPxq0fPNdpLiJ6f0gc=;
 b=fKiGMeAJ4gewAUJkUQ2AoDpLPd/Knh8sX5Tq6AMHHAGIWK//csSW/KsD9GMYwaRCIa
 FcUAGDeWFR0OIBU6diiYWNK5tUWqIhVqfxJKT1HzPYtYXHdRRIVVXVVGq5rzTI+wBHXS
 4jT30Eett218ZW/u0nCT8xQRT3frLwMoWPEolF9U4q1VXDUVh/ul7UwlKVVlP27zKDx1
 mTFetEBOOj4+eH7RjN5konnrfIDUpv6pUQq8A2XpHpvwhWJ69bJV+fWTfHk2UrhCvQPj
 vx3t8drwD5ZwNxcXYjOaBl/KvvMHOm/6sR0ThlLkw+N98ZTHS6nMtJWHJ86VZpRafCYS
 TWDw==
X-Gm-Message-State: APzg51Aqe184qZXkbM7xirl5wboygkT4J0hfb6z5QavO3glGLJYZJ2g6
 d0CCB3ZEu1e/oNIO1S3XL2JFlbU7zFOvJvJf37IehA==
X-Google-Smtp-Source: ANB0VdbT92h5uDur63VxdNtgL9U1H6Rdxhssujhbn70V1XBa4c22ZqxOssrxpUdv3YrwS7muhirSrl7Xw6txiqnLQXg=
X-Received: by 2002:a63:6745:: with SMTP id
 b66-v6mr6652600pgc.248.1535561475054; 
 Wed, 29 Aug 2018 09:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836DDE@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345836DDE@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 09:51:03 -0700
Message-ID: <CAO=notyTKi2WBYn626Jtax2tuya_1GVZhxJw8j0iYdPSyznpdA@mail.gmail.com>
Subject: Re: Two Google-Origin Daemons
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 29 Aug 2018 16:51:19 -0000

On Tue, Aug 28, 2018 at 3:47 PM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> > We have two daemons (to start with) that we'd like to send up.
>
> What daemons are they?  Are they generic daemons that others might be interested in, or google specific things?

They both, in this case, do Google specific things (so not the best
example).  One we're aiming to open source for a vendor to then
incorporate, but they both rely heavily on phosphor design (such as
dbus objects, phosphor-networkd, etc)
