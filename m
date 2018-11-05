Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12a; helo=mail-it1-x12a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJazNumv"; 
 dkim-atps=neutral
Received: from mail-it1-x12a.google.com (mail-it1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pGyx2b76zDrPq
 for <openbmc@lists.ozlabs.org>; Mon,  5 Nov 2018 13:36:41 +1100 (AEDT)
Received: by mail-it1-x12a.google.com with SMTP id d6so10676415itl.4
 for <openbmc@lists.ozlabs.org>; Sun, 04 Nov 2018 18:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2N6qQI5Pj81HGGtXOqit4/KmlwXMjiAx7UvXTBpOBI=;
 b=cJazNumvW6OV1PGuFcDx+Ik8A7lSsIGwHP7dI0xowmYzB2GylaJwWkCjlGpJWluvX2
 CKcz/B8sbHQMCzArLnPWmO6wLJ8/h9gIZADaIUL/z4Yy1v2WGyhxfZGjHovTRX0fBZJ5
 +VBe9+f3unZbNcb2w76Q9I4RAQx0W2QiCx0hzi4SMP31CNtKiKkNlOR18LhIqLVA/df8
 DsMtVbETHz4vfZQf9ZEA9df5HVTyA/uTZagL7S5I/Y2DpO+SZeMQXwxMgSWEW+nZSHR0
 rU6jtG5g2Lv7X+LPLl4tl8alkmGhT85ZgTxoHMCW45IUouWzWZjyp1YTrP2BrjgMUVMo
 kugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2N6qQI5Pj81HGGtXOqit4/KmlwXMjiAx7UvXTBpOBI=;
 b=ek7qK6TVIZhRsLa5KxNLF9rXh2VItXHTxzO5hRwjMFY5rZB7g8Uf1sO5wWzPaCrNUZ
 w1dvbRqECyeGUgC2bRxjSFynXaDHNU2p6M55jZx5acwZBhHVzfZF/fUDU8qH1Cnowyyz
 3qWDOZDmfdq+ND+SbNvdgE6HiY95WDjr55LZpx7XtK6YACIojfLkIQUyBvm5h4HnJL5j
 rkA18GQOk2CdHsOvnkAeQ/nBLc9DKwSfD/BNp9PsTmiRVjAFVAVG3SfGyr3J6Pj3Qkvi
 8B78q8A0aIkv49UMvHA9nHoi9Y7+WvnO9u7i+20ouD5y+QXJpoJvJA8ThC2BSdDfzIgs
 HfrA==
X-Gm-Message-State: AGRZ1gK8K+BHsI826kB4I+QnmgrVGysVBUGhcyMmxYFJp2LrXSXJUf8r
 Wg/1OpdEAYjS/mAYDXBkw5lIqB/W5AeZWJiGwcc=
X-Google-Smtp-Source: AJdET5c0HFBd7YAiWk2Zo5NFXRmujQmaa+IEyPXPmDeaYV5FJVY/Vy5Y/qZCh2sAegHGsMD6l11i7N9VQo42WAKWtsE=
X-Received: by 2002:a24:3a15:: with SMTP id
 m21-v6mr2849244itm.178.1541385399142; 
 Sun, 04 Nov 2018 18:36:39 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzskWiKUC149VvN=E6AiALP+G_2mFwRad56jhOykFcLsg@mail.gmail.com>
In-Reply-To: <CAO=notzskWiKUC149VvN=E6AiALP+G_2mFwRad56jhOykFcLsg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 5 Nov 2018 10:36:27 +0800
Message-ID: <CAARXrtmqHVZspJuOp7cFcyHU+Xnk9Tb0q-KPL5mCEyea48cYKQ@mail.gmail.com>
Subject: Re: Copy-by-value in sdbus++ generated objects
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 02:36:42 -0000

On Sat, Nov 3, 2018 at 12:33 AM Patrick Venture <venture@google.com> wrote:
>
> Most repos inherit from an auto-generated object.  Those objects pass
> all parameters by value.  This is fine for many cases where they would
> need to create a copy of it, but in the case where:
>
> for instance:
> https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/property.mako.prototype.hpp.in#L69
>
> The values match it's wasteful to copy.  It's also possible the cpp I
> learned way back is different in how this behavior works, but I wanted
> to check.  Because of the prevalence of this code, if there are lots
> of updates that don't actually change the value, it could optimize
> quite a bit at run-time.

Agreed, this piece of code does not change the value at all, so it is better
to use const reference.

>
> It would require a lot of simultaneous fixes (or two different objects
> generated, and transitioning everything).
>
> Thoughts?

Maybe we could try to change this to const reference, do a build and see if it
cause any build error.
I guess this is OK.
