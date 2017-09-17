Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwNct6fX6zDqq1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 08:10:54 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1505686248.29751.8.camel@fuzziesquirrel.com>
Subject: Re: GPIO Centralized Control Daemon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Sun, 17 Sep 2017 18:10:48 -0400
In-Reply-To: <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
 <1505599960.32310.1.camel@fuzziesquirrel.com>
 <CAO=notykPK7VkRgynx-Tsyu0fuR25O4wZ-0voX4GiVhbmXfyaA@mail.gmail.com>
 <1505665582.29751.1.camel@fuzziesquirrel.com>
 <CAO=notzg_QhapqfOx2w75A9Z7K4S3etp7i4a1LSS-qkWb5BMHw@mail.gmail.com>
 <1505669634.29751.4.camel@fuzziesquirrel.com>
 <CAO=notzxdXfK9_x-LwbOkwawcLLqUTuLZ8kbHGnMUxN6rCQ6WA@mail.gmail.com>
 <1505684302.29751.6.camel@fuzziesquirrel.com>
 <CAO=notwfcPJiEjtQ_n1jxFQpwtPwtvPisOZpiV64DbVHrk0qfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sun, 17 Sep 2017 22:10:55 -0000

On Sun, 2017-09-17 at 14:49 -0700, Patrick Venture wrote:
>=20
> Ahh - yeah, sorry, I didn't explain the entire use-case path
> initially.=C2=A0 I assumed gpio-gated sensors were just a normal thing.=
=C2=A0

No problemo!

> I'll reach out and see if this should go into the adc driver or the
> iio-hwmon.=C2=A0 Since those are the paths that are involved.=C2=A0 The=
 sensor
> itself it plugged into the aspeed adc, and then controlled by a
> gpio.=C2=A0 My initial thought is the adc should be configured to know =
if
> such things are required for its sensors, so that iio-hwmon wouldn't
> need to know.

Excellent.  Thx Patrick.

> That's what I'm thinking, if I can put it in the driver as something
> that can be configured - then perhaps that'll be a neater solution.=C2=A0
> Although, depending on how it gets added, it might be too platform
> specific.=C2=A0 I'm using an Aspeed part, but I know there are other
> manufacturers, and if this type of arrangement exists elsewhere, more
> drivers will need modification in-lieu of a solution at the highest
> level.=C2=A0 I see the value in both approaches.

I can too.  Adding to that I'd like for our standard operating
procedure in general to be that we work with upstream Linux to set the
kernel direction and then we react to that to meet OpenBMCs needs.

-brad
