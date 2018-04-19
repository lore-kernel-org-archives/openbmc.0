Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::231; helo=mail-oi0-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tBq1wr4q"; 
 dkim-atps=neutral
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RdmW5HYwzF20x
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 22:37:30 +1000 (AEST)
Received: by mail-oi0-x231.google.com with SMTP id c15-v6so4675266oic.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=khvYOCXnV/QCisQJI8exVe/PG4mWX0sBORSoRll/F7A=;
 b=tBq1wr4qJppY3wKj3yeLMlzV8IwNoxg+TFFoxIDLSvSeRAbsHQ93Ulzs2KA6VwZm0H
 ePOMg8znMNO6PQYcmHggOKEv5YISC6erRGcClIatfk5t8RIfR9G2tY+Sum59gQyZqco5
 n4mteUpSZqZQPNwmDazIeqIEJBsbYb7VmIPn0dVYvfEZ8xMlVnJx34pnKofG4uEmi4ST
 dKFZwmEEyx7fGrUiXO+CEJmAULnhSBONbaEHYrxpUszilZnrjR0UZW5dCK/SScHaY5xe
 OMUT0jWao9gYayptUgUmrvvH8KAFQycbmWmaLFDUIN5fXIpVi3CgXDKfwsG5whBJ3Zj8
 m+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=khvYOCXnV/QCisQJI8exVe/PG4mWX0sBORSoRll/F7A=;
 b=gbhgS/k3Wlz1L4elKUnR2C2jvddpuaOZ6WYTUZh9oHE7/nMpSUd4HfKyTtFZH1RpO3
 IToLnRywR8jCxw5OH+yiYhNvi6JE5sjW889Gjmt2cX35+nrkqLaKjj77UYiz0LrxaGKT
 Qkwl8vZCUvDdsSLCbdQG1jr25lMXLFhIytNjV8Y2i6N9cwzgBz07FEXfkfn6prvSmfD9
 r5g86wIYTy9RGLfAVuPk59niMiN76cvuPzKcUXhEPz3fWC1DMQFB82N+TQGLA9TkDkHW
 bBrsedJo+etvjhUiNsrlZT5r0rensz6hfoTCEA/n7NR2n8MfUd8USiQjzQoOCUzIATC+
 RokA==
X-Gm-Message-State: ALQs6tD6qvOsg0MyOi82gxR5fcGAtTHDyA9WFtUZPPt4NZ5yBFpo4d/n
 uVabED4iLcBzwg+HxU0QJ1XSlhASc6T4Ji5VzCaSvw==
X-Google-Smtp-Source: AIpwx48MRthv+nGVC2Xtg90lA7ilC5Kkh8siS9+xJtRTADMPY6yti2RHIihdFCD7ZpxRL5TYN7TTYQYeG4awGimry50=
X-Received: by 2002:aca:5d46:: with SMTP id
 r67-v6mr3381438oib.257.1524141446014; 
 Thu, 19 Apr 2018 05:37:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.50.79 with HTTP; Thu, 19 Apr 2018 05:37:25 -0700 (PDT)
In-Reply-To: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 19 Apr 2018 07:37:25 -0500
Message-ID: <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
Subject: Fwd: Migration to new gerrit server is coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 12:37:33 -0000

Hello everyone,

I got agreement from the current VM and openbmc-project.xyz domain
owner to work with me today on this transition.  The bad news is that
it's going to have to happen today at around 4:30pm Central time.

A good excuse for the west coast crew to start an early Thursday happy hour.

My estimate on the outage is around 2 hours. There will be no impact
or domain changes. We'll just move the DNS for
gerrit.openbmc-project.xyz over to the new server.

Andrew

---------- Forwarded message ----------
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, Mar 28, 2018 at 2:55 PM
Subject: Migration to new gerrit server is coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>


Greetings,

We've gotten ourselves a nice big server to run our gerrit instance
on.  The virtual machine we're currently running in is going EOL
within the next few months so I've been slowly working on a
transition.  The migration should be pretty painless.  At some point
I'll take down the existing gerrit, migrate the data from it to our
new instance, and move the domain name over to the new server.

I've got a test instance going now and would appreciate some poking
around for anything obviously wrong.  It's running the latest stable
gerrit, so we'll be getting an upgrade in this process. I synch'd over
the data from the production gerrit this morning.

https://test-gerrit.openbmc-project.xyz

PLEASE NOTE: No review comments or merges or ... anything will be
saved or executed on this test-gerrit so don't get the two mixed up :)
 https://gerrit.openbmc-project.xyz is where all real work should
continue.

Andrew
