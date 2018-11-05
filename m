Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kXq9ijGH"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pmRY2SZwzF2Hd
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 08:44:41 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id o19-v6so5077415pll.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vy9ozksDGLIK5r08hFKgACUYqhumgH2fpJSy+ZY35XM=;
 b=kXq9ijGHqFwKiFUhrhqqP9Bb39ltaimdRhNpaWlSAgFQXPbFAA86/lvHHHZoHDqVdU
 RKmyxgIUO8boaeGyS82CstvKytROe6KLx4Qg8CI0mBX/ircfbP4vZ0xAPBmMdKev7CI2
 IS5jdXNrzBHZVENj79GUZTDoXS7U99IxOZEWQqGpeupkG1nIWikw3yUF8cGMI77aZTYJ
 Jl3zFnoDEggIHDDZwvH+M18PwcZ+YVg7diptXxavmVjPWubOyFxFsoFNKw9i6wkz8inZ
 fgA55vKpN+mpt1sQrh4ylJ9sF0POboon8IxmLve8sWqtSnyTB1DTfpYCAQoleTj0wdHw
 0sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vy9ozksDGLIK5r08hFKgACUYqhumgH2fpJSy+ZY35XM=;
 b=o1iqWJHa8H5tuhGgZa7JLPDfVcjsQK1o5HGVrLFqCp6kJRvN/Tc3/MIBRrL+qifd0f
 cT5HoeNALcpMBmnC22JyFykK0pkZ0R10jNIiXBaxurbSk0ZVTuF0zV8XWgn+eyrUtyiP
 4vuh8xnEjrKhqgoG5BU2dFCbRY8Y3Z4fXoFIKkhMSctiuNchL3dCg0wc5F+X2hghvM+G
 mFNbxceGAqEpTfuGowvwjhGIPo2eTRZCAAtE51dgxNrsVoTVBomafmlkvRkMa2Z69cNc
 iPKUh1KZ34FyqW6q/XF+b50Joztt1FlEY7ADNtJhMbn+UERd0L1sVUNf0HlSBsBvMPLF
 PuXA==
X-Gm-Message-State: AGRZ1gJyiEYj3qE/Zh6qcZLMhL+ERIxIMiEBJgi0D8QCMo+Pu3TRXWBs
 qg/0pWi3XM2NKk39dq0TovexwldvnfKuwTiSKGEopQ==
X-Google-Smtp-Source: AJdET5eO2oRJ18iOO2ZXqaVreyF1+qhJPMAsAAGZLj9RKPm98SoQPcckqfELusJ835b4xK8/DCRJA8bvLjbHtyut1LM=
X-Received: by 2002:a17:902:3381:: with SMTP id
 b1-v6mr23571889plc.323.1541454279016; 
 Mon, 05 Nov 2018 13:44:39 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzskWiKUC149VvN=E6AiALP+G_2mFwRad56jhOykFcLsg@mail.gmail.com>
 <CAARXrtmqHVZspJuOp7cFcyHU+Xnk9Tb0q-KPL5mCEyea48cYKQ@mail.gmail.com>
 <CAO=notw6-JfnR5HK5Uz26HbEJkE+H1LGCqJG+wPQKwtvgCjt8g@mail.gmail.com>
In-Reply-To: <CAO=notw6-JfnR5HK5Uz26HbEJkE+H1LGCqJG+wPQKwtvgCjt8g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Nov 2018 13:44:17 -0800
Message-ID: <CAO=noty_ug4e4gS94OEn6NC1qV8MdrLnV0w5i44fgLGM3mPrzw@mail.gmail.com>
Subject: Re: Copy-by-value in sdbus++ generated objects
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 21:44:42 -0000

On Mon, Nov 5, 2018 at 7:47 AM Patrick Venture <venture@google.com> wrote:
>
> On Sun, Nov 4, 2018 at 6:36 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > On Sat, Nov 3, 2018 at 12:33 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > Most repos inherit from an auto-generated object.  Those objects pass
> > > all parameters by value.  This is fine for many cases where they would
> > > need to create a copy of it, but in the case where:
> > >
> > > for instance:
> > > https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/property.mako.prototype.hpp.in#L69
> > >
> > > The values match it's wasteful to copy.  It's also possible the cpp I
> > > learned way back is different in how this behavior works, but I wanted
> > > to check.  Because of the prevalence of this code, if there are lots
> > > of updates that don't actually change the value, it could optimize
> > > quite a bit at run-time.
> >
> > Agreed, this piece of code does not change the value at all, so it is better
> > to use const reference.
> >
> > >
> > > It would require a lot of simultaneous fixes (or two different objects
> > > generated, and transitioning everything).
> > >
> > > Thoughts?
> >
> > Maybe we could try to change this to const reference, do a build and see if it
> > cause any build error.
> > I guess this is OK.
>
> So, I can guess without building that this change will generate a lot
> of errors as all the overriding objects will be set to "override" but
> not be overriding anything.  So, compilations will fail pretty much
> across the board.  To be fair, it's actually maybe 20 repos that would
> need fixing, so not that big of an order, but yeah, I don't think this
> change can go in without a bunch of other simultaneous changes (unless
> we add something like a suffix, '_next" or "_new_" or "_2" and then
> slowly move things to calling that and then when everything is calling
> that, make the original the same, and then move everyone onto the
> original one.

I was able to make the change and the build revealed the objects (as
you would expect) that need updating and it occurred to me that
although locked srcrev bumps would solve the incompatibility issue, it
would make more sense to do the suffixed version of the method and
then transition all the repos and then transition them again so that
at each point all the CIs would work and all the versions would work.
After fixing up a few repos already, I can tell it's not that much
work and in the equal value case, at least, it'll improve the
performance of code that is pervasive throughout openbmc.

Patrick
