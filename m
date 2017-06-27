Return-Path: <venture@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxxCZ2Sd6zDr3P
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 05:42:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EtH9BxRw"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id q86so21377533pfl.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=FChcjwBKVYuCHX7PTuaqzuWG4bRk9QcrzzHZgoCx97o=;
 b=EtH9BxRw92ixyhoBuEPzvcKBHNXzDnojzpOQ20JtCrsRglJnMUUGT6ssSKwlIdg6wk
 fUgPoHV3m6/ByxY3eUZoh/EQKtjy6+mqu7qo4DTKSsbG4MMPaWKe6tyc+x7HKAs9obS/
 u15L9tCypUvE0XSS+W/SfnNBbO60gS8YUsNvQP/P3oycmuwziAXqtuPnHmsiH8D+pOtW
 R79GVP6RKxMLNE0Nh3EgN5tC1paoxUbWv0x0h7zfZiOj9BZr9boipWvNHvRyQqb3mHQD
 cTgOIpDis52lqnOLR9mcK2MgXclAvQF1J6Q9MEANKmK+QNaZ99u/XyXmZPukY/QkPnZd
 iohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=FChcjwBKVYuCHX7PTuaqzuWG4bRk9QcrzzHZgoCx97o=;
 b=szS+vMnEsyR99alZ2UYbq1do0Q/H9YotozF1PwPQq6fwftWygYhVHQY9710SdN/R7c
 ly+52JoFrXm/2ot18pZHJk1aGflNlfMspghG0qW17c7NEye48l0w4MQ691zHbQV2qh+N
 Ek99m+GfIbhi0rLdJPrSXm6vH3mD/PP8QU0G2vM9SZRsGp5dXTOUGzT7qWVVoSaV/FHp
 tEGjP1sE+jFrb5jVrD6N8V4QUtGUls5TMXw/lOoq6QoSLURb27D33IHdzho/E42CtV9h
 THJ783YrQSAkxBm2HP9R8dFnUBmB6+0X95fj8RYkPFrebZhisYDvxsP3GFW1Cv4927Qu
 bHPA==
X-Gm-Message-State: AKS2vOygKIx6rN0OQtzCw+1ssUvRolAbpQADhSS1rljAECCxRGV3j+J+
 23gIZ4oGdhnSyPYYbHdREkO4BXa16oj4oEOZEg==
X-Received: by 10.84.232.70 with SMTP id f6mr7424118pln.169.1498592551584;
 Tue, 27 Jun 2017 12:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Tue, 27 Jun 2017 12:42:11 -0700 (PDT)
In-Reply-To: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
References: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 27 Jun 2017 12:42:11 -0700
Message-ID: <CAO=notxse66NqGzH7Af_-x0A+2tcqoFfLoWoBVSOPuXcxyqoTA@mail.gmail.com>
Subject: Re: Swampd PID-driven Fan Controller
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
X-List-Received-Date: Tue, 27 Jun 2017 19:42:35 -0000

Patrick brought it to my attention that PID wasn't defined:
https://en.wikipedia.org/wiki/PID_controller

-Patrick

On Tue, Jun 27, 2017 at 9:51 AM, Patrick Venture <venture@google.com> wrote:
> Per the requirements to have a fan controller for the quanta-q71l that
> runs within the OpenBMC framework+, I developed the swampd
> application.  It was designed to leverage sdbusplus and other OpenBMC
> libraries and coding standards.
>
> It supports:
> * build-time yaml descriptions of the sensors and PID loops
> * run-time configuration of the above
> * run-time fan speed set-point control
> * IPMI controlled manual mode
> * passively and actively read sensors
> * sensors that are from the host
> * any variation on sysfs IO that is configured.
>
> The design document is too large to really paste in this email, so
> I'll summarize.
>
> Each sensor is created based on the configuration provided.  Each PID
> loop is created per zone.  Each zone lives on a separate thread (could
> be merged into one thread that iterates through zones).  The zone
> loops every 0.1s to steer the fans closer to their goal while every
> second it adjusts the goal.
>
> Some things I know OpenBMC won't like: it's multi-threaded.  It wasn't
> built into the current fan-presence package.
>
> I'm at a crossroads with this project because I'd like to make it
> generally available.  Should I try to submit it for review on this
> list, if so, how?  Or should I push it to Google's github projects
> first?
>
> +As well as other requirements.
>
> Thanks,
> Patrick
