Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x233.google.com (mail-ob0-x233.google.com
 [IPv6:2607:f8b0:4003:c01::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DFF281A044F
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 15:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vzb4ml/2; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fefMLCng; 
 dkim-atps=neutral
Received: by obbbj7 with SMTP id bj7so51051652obb.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 20:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TbQZpWS4+lK2hQGpVT/VcDwXy9PqokmKcZh7ekL0mDc=;
 b=vzb4ml/2Px5lwGtORvG1g7+x+IcTvY5zqfRQi/v0nzqHWqfDefdS7T3ZDbNmXysI24
 76jJa0a37bDLs7pUKGcO+4mNGZOTbByY5zkZ2MayppsTJqzTdE2VmIqMLR9g/J9DfY0L
 Jt9IsI0yStC7qyney4746jATScLKEn1pnio2QR93hhIR68uWJzYg9mlyb6gu1H/3vecK
 oWXWLm85Zq/zuYDYeiLWergGS39sVv/DZcfdmmD8weQ4oe38ZeKMZi+EAc8Rb07ANIvw
 1m3eFv/qKsYsapHkGnR2aY7C2i9dRNQJoJG1AQukMe22TgUj7ApQiF1cGzkgY3s+LpZA
 O7Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TbQZpWS4+lK2hQGpVT/VcDwXy9PqokmKcZh7ekL0mDc=;
 b=fefMLCng5Yr2k2G+hLDfmMOXrfFvYpxQi3s8b6K/fSue1GvFefO8qnlXnMHw+SrOtm
 iyIgKWsHjt34V+egdO3d5yYtmI/yILFJ1IyzNsHvm8ED5F+8v9ztZBN9LTqNWfOO/Yb8
 OmJFzUz+70Mu5r1dnkWIPtiVDPwMlFE7laUK8=
X-Received: by 10.60.97.233 with SMTP id ed9mr3685434oeb.32.1447906724656;
 Wed, 18 Nov 2015 20:18:44 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.226.10 with HTTP; Wed, 18 Nov 2015 20:18:25 -0800 (PST)
In-Reply-To: <m3vb8yslyo.fsf@oc8180480414.ibm.com>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2015 14:48:25 +1030
X-Google-Sender-Auth: wu8p7Q80Qpor91PoDswsNo28rMQ
Message-ID: <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 04:18:47 -0000

On Thu, Nov 19, 2015 at 2:02 PM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>> This switches us over to use autotools rather than custom makefiles.
>> This brings us into line with the defacto standard for building
>> userspace.
>
> I haven't converted everything yet, and I've really only started to poke
> at what makes sense for the current structure of everything.
>
> There's a magic thing we could use for plugins too, which allows in tree
> and out of tree, and I haven't started using it.
> See https://autotools.io/libtool/plugins.html
>
> But first I wanted to raise the possibility of autotools and what it
> kind of looks like.
>
> We should also move to explicit exposure of symbols rather than
> exporting everything.
>
> thoughts?

Looks like a good start. Thanks!

There are two things I think we want to look at. You mentioned the
first; making sure the structure makes sense. This means double
checking our reasons for the separate git repositories, as well as the
directory structure within repositories. We want a sensible strucutre
so the code is easy to understand, to release, maintain as well as
test and hack on.

The second is to see what changes we can make to reduce the footprint
of the distribution. It looks like we're moving to 32MB flash for the
systems we are using, so that alleviates the problem somewhat, but it
would be good to make sure we're not bloated for bloat sake.

Cheers,

Joel
