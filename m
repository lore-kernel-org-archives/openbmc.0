Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::230; helo=mail-io0-x230.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="q7dz7Oyl"; 
 dkim-atps=neutral
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kpd43NZqzF3HK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 06:08:55 +1000 (AEST)
Received: by mail-io0-x230.google.com with SMTP id z20-v6so12136722iol.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aUQaMBiruYjU+PE+xi5zvsBrdqoTj/PK/a1KX2JDX+0=;
 b=q7dz7OylMq0FLtSVqVmARvgn8aTKrRrQsf1os49mq8KoOWkFhS66Jv04O+x33K1j0X
 jKWD2S3IvhIvr7GC9Olq6vhvWE0Pt+pYDmw7HrPECcrY3v9xOkZzaZ0JMUvh4cSXx0yt
 LlaL0/VxpGhBZWLNVyVVjhM+G0OaT5k5G7GO/ljyimJcm/40bYRHQNKBvEf86fRHbpyo
 AMRdVIkKf2qXyCLz0WEYt8rzHd6KT6Xakm/B+pDFvEwv4NvlL6q2MP75soXvY7Is1PLu
 +hDbT+w713n53JH0rGP3h1JerL0UCwsy9S1VDNF/vBBGS4VhQEzHo6esuVBRLxYLtpcy
 yZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aUQaMBiruYjU+PE+xi5zvsBrdqoTj/PK/a1KX2JDX+0=;
 b=ecy+QMrqmmLmw0oP2q3ZypVq1tNFClwIKFjkDG8nmQiLjTsPkNPf/EStHANUspFCnp
 LcxJhsAk5+y+3drGCOPzXzXxXnowLZXxM6EpGmEGcSica8UsCCZ0qMvso4YN8TyqAaGW
 DiNllNH+icWrZljkAjQaUImjn0VoV8DRakUDYjbFhbeSqD3y4iVdIQdVx5HleNT6oHle
 zDap7keE5UyS3yTb6RrhOSRv5swhr628pJ9GbtnJonLhFvyLCZDRdpB4oQommLsnbcTk
 6UQwvSKh4qX1LmzRGrDdG6ZosZ+2u3U5+Us2cAzq8E7jQ4t9H8fBKLfBm4VAbWUWBPLA
 kjYw==
X-Gm-Message-State: AOUpUlGetmBNcf/zaXz87hMduxNJwfmT6fwA+8fYP+JDqCm/Yt51VNEH
 jQ9C06qP98ON/hINHITC5iBPfmw2His786yD+WTOATR0TOk=
X-Google-Smtp-Source: AA+uWPwuJoTnt75BnVMY4yvfOAJycDU501aNu8j9xmeJqmeQiS70sGu08WrMZUdGJU+HrXw2JfvR7zEfUQ2ruNm7IlE=
X-Received: by 2002:a6b:9415:: with SMTP id
 w21-v6mr3091640iod.290.1533586131793; 
 Mon, 06 Aug 2018 13:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 13:08:31 -0700 (PDT)
In-Reply-To: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
References: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 Aug 2018 13:08:31 -0700
Message-ID: <CAO=notxco-y-56q5kCeqwjeOcjeJ5mpq_LGjY=SsBKfR+q3uUA@mail.gmail.com>
Subject: Re: Proposal to change sensor interface to use double values
To: James Feist <james.feist@linux.intel.com>
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
X-List-Received-Date: Mon, 06 Aug 2018 20:08:57 -0000

On Mon, Aug 6, 2018 at 12:10 PM, James Feist
<james.feist@linux.intel.com> wrote:
> I've submitted a change to modify the sensor interface to remove scale, and
> make the sensor value a double. The main reason for doing this is
> simplification of the interface. In most usages, daemons pull the value, and
> the scale, then immediately translate this value to a double. This could
> easily be done once by the sensor producer instead of all daemons. The
> counter example that was given was phosphor-fan-presence, but doing a quick
> grep I can't find scale being used, so this might mean for a scaled fan you
> have to factor that in to all configuration files, or scaled fans aren't
> supported. The threshold interface is not usable independent from the value
> interface, as the thresholds are affected by the same scale. Using a fixed
> scale also won't work well for a logarithmic sensor, while floating point
> would. Realistic precision should not be affected for any common sensor. We
> also in the future may be interested in a daemon producing a threshold for a
> sensor that another daemon owns. With the scale existing elsewhere, this
> would not be trivial to map.
>
> Review for context: https://gerrit.openbmc-project.xyz/#/c/11739/
>
> This change is not ready to be submitted as is, but we would like to hear if
> there are any major objections. If not, we would like to start an upgrade
> path to support both interfaces until it is possible to make the switch.
> Bmcweb already supports both. In most cases this is just pulling the value
> using a visitor, and setting the scale to 0 if it does not exist. Max and
> Min can also be used for IPMI scaling.

I'm fine with this.  It saves everybody converting it to a double
before using.  Further scaling, which can be necessary can be further
done against the double.  For instance, with ipmi, to fit a value we
sometimes scale again.

>
> Thanks,
>
> - James Feist
>
>
