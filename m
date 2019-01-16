Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::133; helo=mail-it1-x133.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ec7sOwDF"; 
 dkim-atps=neutral
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fVZ66BHNzDqQR
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 12:51:58 +1100 (AEDT)
Received: by mail-it1-x133.google.com with SMTP id h193so631650ita.5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 17:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4rXd6OXt7b6pc71LLJmY1dMV03nktb6gueAyuPjnx8=;
 b=ec7sOwDF2KA4O+FDgFJEmZ8od/auSTs1ZjMiARW443S/W5ybnfgARaAT7hbCz4TANw
 4xs+KzgHvdPx5OPj/X4Lh+ERkFJMHOIWHvsZtY6cgoXjpR65Dv/koSgVlYNR/ZrATav6
 bWnp4lkw6OSg2ypVE9Xyt6o1TbHtluUlSVW5JWZsYy11WAHcwVEH+Ma1cYZhOrbnvqob
 G2AcPL45q6fU0Rv9B93TOwFWhbZgZ6+c+6uSdqA+aytTDRsY7hsmJhawFqwbIRIUgDUm
 AGoZ/Imka0k+tHM5t5mdPQbDolBa1yb4e5XQq+YUQZd2U7fZZjfkcwnWRSwLsBgx1vmw
 pboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4rXd6OXt7b6pc71LLJmY1dMV03nktb6gueAyuPjnx8=;
 b=i6p60JSDxDp0nIYuPGHPouyj/ji3hRYlz9rYWz7BM7M4rqigZh+zk2oEWcCKnMTKCB
 F82tZ1SiooOCqjkNO3CA1JexTGAOGnAZg7fghUFjRMeChG4tQaVM1Wsnrs2QKKpWDgLl
 5eEnnY1fj7IzkziHmIyS2yyrzMthrwqG0vAjb16tgCajH1VDHHwMVRIMQyqR+7ZyUs7L
 MyhVhMQp3jdXEmks580T69A3aC+tGJ8CCY4rJedu87YQxLHTL2xWZ6kvdzan6XhIHsb8
 sPqYwE1T3ktEF2jzbhKErb+IREKLpKeZqcUZDaaNbWUL6O6IrKl/v9YbhPVk7FKtUJ5B
 N+rQ==
X-Gm-Message-State: AJcUukfJ7Q06herBSXZiwzxrQvjr7bw+nblOY2nf1YCBVzMX7ECUD8Iy
 MhLoorXkDp0xXpezW5YrTZf/lMiOBqAqDHxLSj4=
X-Google-Smtp-Source: ALg8bN54yQfKJBOC5Ju7F9M74Eryp3o5pJsO6BgsLkxmt/xoRX7Y5jD2nFiCLyeknCZzKSnO2IYST2DezkN9kTEZcz0=
X-Received: by 2002:a02:a484:: with SMTP id d4mr3814969jam.77.1547603515827;
 Tue, 15 Jan 2019 17:51:55 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
 <CAARXrtkYwRP63pU3o+Bn_r_NZ9K2fAQr3O-3UPZqRY7KYaL6cg@mail.gmail.com>
 <b4672b3d-92a0-b327-7717-76925519d2f0@linux.ibm.com>
In-Reply-To: <b4672b3d-92a0-b327-7717-76925519d2f0@linux.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 16 Jan 2019 09:51:40 +0800
Message-ID: <CAARXrtkdJQsEtZK_cyc2vkR6edoHALdvM2r=Bza8a8+N40=nhw@mail.gmail.com>
Subject: Re: phosphor-hwmon funcitonal interface
To: Matthew Barth <msbarth@linux.ibm.com>
Cc: Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2019 01:52:00 -0000

> Actually, phosphor-fan-presence/control is using the functional property
> that's currently being created where the 'fault' file exists in sysfs
> for the OCCs.

Good to know. Thanks for the info.

> > So we could re-use this property to indicate if a sensor is functional or not,
> > especially useful for fans that will get reading error when it's turned off,
> > e.g. the fans using Aspeed fan/pwm driver.
> >
> This case seems to not follow whether a fan is functional or not when
> its turned off. The fan is still functional, just not powered.

Yeah, but there is no way to tell the difference between power off and
non-functional for Aspeed pwm fans, that the driver gives errors on reading
fan speed.
So the current solution is to use NEGATIVE_ERRNO_ON_FAIL config to tell
phosphor-hwmon to return the -errno instead of throwing.
That way, the reading of the sensor becomes a negative value.

I think a "functional" property is more appropriate for such case than a
negative reading of sensor value.
The code to check this property is free to check the power status as well, so
it knows if a fan is *really* non-functional or not based on the power status.
