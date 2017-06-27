Return-Path: <venture@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxsQf62DrzDr2Z
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 02:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GSDPLBY+"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id f127so18431310pgc.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cDhETVJ9Aez6q9sYOIzRRI0796NRpC4Evp1nd+H8+AM=;
 b=GSDPLBY+09/Z7BJyTogsVZ+Uk5bS8dsEcEY0xuONhP4D4yLBZdu3gQu9nou8HBRWrV
 L08uMxjMD70okw2KtRXYSoDowW4lQvxGF+ZsrSg3YcObRO/1pPucgXhJQZ8jFZqbl4Hi
 S25868GJY+0GvoN6I5qbNvcnllTSoTo8yIrb14E52xcPi3hs3IYIlAFa+akxwcFycjyT
 WkVyJSmJ9lzWOfgEtOIFVhJkTvs1pPCYeO1wrm5HLhh8Ol2yf3ZH0yHKXj0DDopkyxsY
 r2JZQERWMx0XutdLabG6P47m60Iz7lMzP3j5v72mDpdQyrjO/ciVaHTF9Sz7xtYlZJL1
 gsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cDhETVJ9Aez6q9sYOIzRRI0796NRpC4Evp1nd+H8+AM=;
 b=n+dkfTaNS6rMcxj6tJmCEEUX0TTAezNPrl2wTlEq05JbGckPZz2PvSP+s97skDP7fx
 o+yNcdIhQhzrQbreQQxHiMLNXv9sfYw+f+yw887o3sFttyYiz7dgX1WuDDq0W5XCuQGL
 a9RKA3PsbxXzcOjqjTBHN2rPNShSQqlN238ew2zet+j8wHqUWAkAL8tPYsB1CqDybtf2
 JkcNM17g+3V3/PToBhfafcjPmFmDB9P15s2TNdYm2yI9Er2/gYtdhT9OnHjuSWyAw/Ub
 bh3Y3CYMLB4MIE8Hz55icwlIMb1r6yKzxw6iLQSpXO1SuD54kZ6ijzQIQuedHz8+WNd1
 tf4Q==
X-Gm-Message-State: AKS2vOxGjEoTo5mELS1qNyj+gGLI/uBkcY1sw189kqOZBad7KnSHfWm7
 YP1kT6YHRbP5cMLNIX1MvZ3NpfHXHqXF94k=
X-Received: by 10.84.232.70 with SMTP id f6mr6710018pln.169.1498582311586;
 Tue, 27 Jun 2017 09:51:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Tue, 27 Jun 2017 09:51:31 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 27 Jun 2017 09:51:31 -0700
Message-ID: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
Subject: Swampd PID-driven Fan Controller
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 27 Jun 2017 16:51:55 -0000

Per the requirements to have a fan controller for the quanta-q71l that
runs within the OpenBMC framework+, I developed the swampd
application.  It was designed to leverage sdbusplus and other OpenBMC
libraries and coding standards.

It supports:
* build-time yaml descriptions of the sensors and PID loops
* run-time configuration of the above
* run-time fan speed set-point control
* IPMI controlled manual mode
* passively and actively read sensors
* sensors that are from the host
* any variation on sysfs IO that is configured.

The design document is too large to really paste in this email, so
I'll summarize.

Each sensor is created based on the configuration provided.  Each PID
loop is created per zone.  Each zone lives on a separate thread (could
be merged into one thread that iterates through zones).  The zone
loops every 0.1s to steer the fans closer to their goal while every
second it adjusts the goal.

Some things I know OpenBMC won't like: it's multi-threaded.  It wasn't
built into the current fan-presence package.

I'm at a crossroads with this project because I'd like to make it
generally available.  Should I try to submit it for review on this
list, if so, how?  Or should I push it to Google's github projects
first?

+As well as other requirements.

Thanks,
Patrick
