Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22f; helo=mail-qk0-x22f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WBzt21H3"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hf7/UIEh"; 
 dkim-atps=neutral
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40FS5y15b4zF25Y
 for <openbmc@lists.ozlabs.org>; Tue,  3 Apr 2018 08:47:17 +1000 (AEST)
Received: by mail-qk0-x22f.google.com with SMTP id o64so16708594qkl.7
 for <openbmc@lists.ozlabs.org>; Mon, 02 Apr 2018 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yDZt+GnPydtnQmdSUWW8Q/syxOuXwXIziXoScDK0Fwo=;
 b=WBzt21H3uLc2uDHECV47NcQaB4uJyDyU3eQi/Odny5bZv/SYlnb0M2J4thSCxLQIZF
 3YYDcibzfT4dutw3jPVAv+Nzh1NA0IxLf+9EG11UNJ4fbY+dUYT9Xq5u5P68NxQC+mUA
 8+fMcWdbVMWOuHgWYOhnhbRF5Z706mIiZMQdwmsnF9whqY5zp38/8dfwKum7OSkNqbbM
 KTgUP8CyGpVzxfBORcK6796g16A8/mprbwvnfBcYic9HfnTxUB8rBjNQ1aF+8ZbL9Kge
 uUCg3SBFD6SeiWej9U3Vo1qd4ieSjP14G3fgnNXfWF8ZskdeL/+QIUqnEwBzHdkmCTGk
 mdpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yDZt+GnPydtnQmdSUWW8Q/syxOuXwXIziXoScDK0Fwo=;
 b=hf7/UIEhe0cg9c53V5WrL9haw0byCYOWY7DqAYp4HYRvCrPmpe5ysoNPPyF6e8B/kH
 kAgO2sso9BwVRjtDkMRvFiI0bnc7fF0ou+71TutA3oWxDTzACq4xvgs5R6KYaKpBclA6
 igl5RMxvj4E0R60nGccyKgFH5iFSVwcgd9xWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yDZt+GnPydtnQmdSUWW8Q/syxOuXwXIziXoScDK0Fwo=;
 b=LtLsdurT5XUpYJqjnZ/YbDaKDgcpEfQx6bjNINwdtKT4tDSDeDXFPpBYvn7vPbXL3v
 6gN/Qh7e1qGle4iUkU+w4gYsFrLdmeavyvJ9wIjBNYuIno1SzHNwNSOZEv3t3HhtQ0Hw
 GvlYmfeCX1NGxMkfAtHcDN+89lRSfPX2p1TjTqABD/PsCzn1cIKJeLXVJOc7vR6G6AV8
 v9NfxpP12cQyLaT1hmWcZjVfgZ/6Cpaqb7xhh8j6HEHTnrji7E+mLTRr9o2LjBPX1xrP
 dqMB3ORul5kWqn8YtXBFcMf3VN+c+A8VR2GFSaLrNJi6/5pDwSSAUrA5iq8gAFVv82uK
 nLCg==
X-Gm-Message-State: ALQs6tCED2jYP367kUoNCUPKyxh82L5n9VW+rqJzaYUUIsD89VYgTmsm
 CRPUNJVdfoYk/H+XtvnZNyh6CpZJAz7XO0X6q0g=
X-Google-Smtp-Source: AIpwx49dHgBAmRe33zmaEX4lk0BoPpeuBI+2VURFUuhDTulK634UB0ZoFTqIQYOyXkoQb+RTvpZoqR7vqRhxtx+2mn8=
X-Received: by 10.55.246.26 with SMTP id y26mr15456599qkj.127.1522709234695;
 Mon, 02 Apr 2018 15:47:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Mon, 2 Apr 2018 15:46:54 -0700 (PDT)
In-Reply-To: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 Apr 2018 08:16:54 +0930
X-Google-Sender-Auth: nz9h43KAtRz1miZ7Q7Fk5P5uYlQ
Message-ID: <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
Subject: Re: Migration to new gerrit server is coming
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 02 Apr 2018 22:47:19 -0000

On 29 March 2018 at 06:25, Andrew Geissler <geissonator@gmail.com> wrote:
> Greetings,
>
> We've gotten ourselves a nice big server to run our gerrit instance
> on.  The virtual machine we're currently running in is going EOL
> within the next few months so I've been slowly working on a
> transition.  The migration should be pretty painless.  At some point
> I'll take down the existing gerrit, migrate the data from it to our
> new instance, and move the domain name over to the new server.
>
> I've got a test instance going now and would appreciate some poking
> around for anything obviously wrong.  It's running the latest stable
> gerrit, so we'll be getting an upgrade in this process. I synch'd over
> the data from the production gerrit this morning.
>
> https://test-gerrit.openbmc-project.xyz

Thanks Andrew!

I had a poke around and it looks good. Much snappier than the old instance.

Do we have plans to use the gerrit.openbmc.org domain instead?

Cheers,

Joel
