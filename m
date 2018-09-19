Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jPFzUdVw"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FlyZ3vCmzDrdd
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:42:29 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id s13-v6so2971395pfi.7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYOk27PWZuTkKe2/xqSNXN17hj+iS7aGYzNnaphlkHM=;
 b=jPFzUdVwG+B1Ye/8KrDUk/nOj0cFVcZWVOJIRac36f43waE88gaLdIeZHsLITOXZGC
 DXY5xi2SDkmI4K537CJiTJpSJkCNEqY88LYy4+7XpAXrb7WYHGU115GwnnEY0JBXqQk7
 bBMoY1dR3mT41HGvvEGegbjxDITqYNYWoLgdXrm0mgMG3gCOvI2Er9cKLEivpwLs8MyY
 rhi4hssX1cJV2BMWEmZxE9+1PV+VtRM5X8ShCEBvuqy3zIK8eXpFRX9nf7kaFzIU8KN6
 vsXcHH+sOv5Y0ccfu9swJp2KlcacFoy/E2omS1CGgPPiqLZ7oiAnDecYY86G9jJGYxxW
 yG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYOk27PWZuTkKe2/xqSNXN17hj+iS7aGYzNnaphlkHM=;
 b=Z4mugheAtEdCZuXv9W1utw0XRSrx1N4Ajib7q2sdeA7oBX8DlgfxofD2KED1voCc/1
 XtAs4pX8i8aaMyGxh+0Vxqde+H0KHdo4Jg76csPhA8FZLw9mT9X2SUzencg+LTXGXZoI
 MY9cqwLaZHeAJST1Al1wIVNQfBMx/nJKusVwvKfUuVN4+iJH6hXNXIQ6LYbN2mucsy43
 6cAiemnWCZb6uglmWl+yDIXWkrEdkYc9xK+2Lf8qcCXrjpZREYfBqHHevCi3wnTctll8
 7ewe7N2NitnnYVkospJkQM/bacWguoqfYdtEpPG8HJN63grNCs91FOGJikiWMejFuBvf
 JpZQ==
X-Gm-Message-State: APzg51C735/nO9EJrcNtcNv/rEOSGTvRKyqobQaC7xO1b7eK1ggdt+b2
 DFGzzVyRhxAjcEjwEhkFWR/gsXJIHbWvztDqQmPU5w==
X-Google-Smtp-Source: ANB0VdbVUkRfL7a5Njlgn16pNuAWmq0UOGtE8jDgLxdAch8b2gdS/NEEksgsUB9STlgkis0Ja7uSoyr54Gdq8FOKPro=
X-Received: by 2002:a62:9101:: with SMTP id
 l1-v6mr36889584pfe.226.1537375347562; 
 Wed, 19 Sep 2018 09:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzdS19X69xpgSUkT5uZhKm0Wv623aThWtsnhRX2NpWJ9A@mail.gmail.com>
 <7a1a72293444f69374e10367aeaa1d74@linux.vnet.ibm.com>
In-Reply-To: <7a1a72293444f69374e10367aeaa1d74@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 09:42:16 -0700
Message-ID: <CAO=notwvBca4ANU6b-kQggP53cM2CdsCVV5QqsBYUCJ_jB+Xkg@mail.gmail.com>
Subject: Re: Repository Growth
To: anoo@linux.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>,
 openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org
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
X-List-Received-Date: Wed, 19 Sep 2018 16:42:31 -0000

On Wed, Sep 19, 2018 at 9:03 AM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2018-09-19 10:47, Patrick Venture wrote:
> > With the growth of number of repositories, it might be overwhelming to
> > someone who wants to set things up.
> >
> > I'd like to write up a directory that groups the repositories by
> > purpose.  I wasn't sure if this made sense, so I wanted early feedback
> > before I started.  The maintenance of it would be horrible for one
> > person, but if someone wants their repository to have details and so
> > on they can add it.
> >
> > I think it's important or useful to know what's out there and how
> > things work together or don't, and what options there are for
> > developers.
> >
>
> +1 . Do you have a template in mind on how this could look like?

I've been toying around with some ideas on how to organize the
information.  Grouping the subtrees together is a no-brainer, but many
daemons don't really fit into a category.  Maybe that's fine, maybe
then it'd be uncategorized.

I was imagining:

{repository name}
{short description}
works with: {list of related pieces}

for instance:
"""
### phosphor-hwmon
phosphor-hwmon periodically reads and reports hwmon sensor values to dbus.
works with: phosphor-host-ipmid
"""

You don't need to run phosphor-host-ipmid to use phosphor-hwmon, and
phosphor-pid-control and other daemons can also listen to sensor
values or read them over dbus, so I don't know how complete such a
list would need to be.  So maybe the list should be less explicit.  I
realize that the recipes themselves reveal the true dependencies,
either virtual or specific and I don't want to repost information.  I
just want to present a better interface to the set of repositories and
how they work together (or don't) than github has.

>
> > Thoughts?
> >
> > Patrick
>
