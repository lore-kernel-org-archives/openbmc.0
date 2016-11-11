Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFQ8r6HMCzDvnN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 14:18:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IeJxEApA"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id e187so7763291itc.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 19:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8ceD6drl933vjh5kN5EtX6cDWDThpsgRIw+sKdp0Dh8=;
 b=IeJxEApAV0YsbP/Y/S04eeX6ZyrRxuutS09OQ1cQvJ6gtGgaETGrQlyAaCItEkqwZy
 4GA0bcNaor0lc0WfvLk4Kr0+76Tt4EWlm4sz/M2E5XJMCthrW0IE1ERi26dbZgRRn3b/
 ikrgcBNA4iXETOoIdWqWTJcPqYvCB8PzD+I12bweC1QtK0lpWMveGNbeL1cHbIqIb8/p
 gWdFnvV7QFaPORkgnRaicPQHtHr0NoCoDj3YSYmXzGUSycLTHgfuCT5jBZiyY4ZYjt3f
 Tc4v5XpS1k87n1fcJaTsLlapzisJIFnjOQFBSOGf5/6tYeIFiuqYdZDuE1Mhv5Rf/U9A
 Ixaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8ceD6drl933vjh5kN5EtX6cDWDThpsgRIw+sKdp0Dh8=;
 b=XGuFFYCfxt7aMjI2vMTjRaKGqNO8j2/OCEylHA3xcDvJtWgPPwX4Y+QCOBpa7qlveS
 Z43I6QBYYADPwjHzNzm5lz/i5FGoVccy2WPM2cwpTfSs025sWVyBL6oECpkT9UI9iai6
 J1r6WPGLEtQbpOISOmq8ZyRP7aUgvuELidOs/e2aoIPtkQ8QHlQv37lvuOlq69ZQXCNk
 whhC2WoxuU27YoZ8L/B/m8fA7FHuzX18kUHwDX+cealpKT3RMmEnvlwrriNd5VwWlFAy
 p3HIYA10dVNs4/9sujqb3LoGlGX3bVlKLj2vZbFGlNqc6bmG/0QZ8Jz44UndxUKJfuNN
 PtDw==
X-Gm-Message-State: ABUngveQPCwrxbsr61IxxbQAZjRLE3a6zTNn6ueiiCEtqTOFYI8zoptex4RwJnduDu9M+PGRkmTIKdt8ogW05A==
X-Received: by 10.202.92.198 with SMTP id q189mr449567oib.6.1478834282566;
 Thu, 10 Nov 2016 19:18:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Thu, 10 Nov 2016 19:17:42 -0800 (PST)
In-Reply-To: <CADfYTpHjti40QXSwPHGvgBUTZO9mK8t5h2dvTCnE+1BUAUi1xA@mail.gmail.com>
References: <CADfYTpHjti40QXSwPHGvgBUTZO9mK8t5h2dvTCnE+1BUAUi1xA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Nov 2016 13:47:42 +1030
X-Google-Sender-Auth: g6FbIcURJeMICroH6jHEnYd4VjE
Message-ID: <CACPK8XdN2kSmo5dQmZTxioB2-CGLjt953X0Um+iA3QXvOQTJZw@mail.gmail.com>
Subject: Re: AUTHORS files
To: Nancy Yuen <yuenn@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 11 Nov 2016 03:18:05 -0000

Hello Nancy,

On Fri, Nov 11, 2016 at 9:06 AM, Nancy Yuen <yuenn@google.com> wrote:
> The open source policy at Google requires that any repo on GitHub we
> contribute to contain an AUTHORS file listing all contributing
> companies/people including Google.
>
> Any objection if I send out patches for AUTHORS files for each of the
> openbmc repos, listing Google in the ones where we've contributed?

I can understand if you have a requirement to do this in projects
started and owned by Googlers.

As is an existing project I would do the open source thing: follow the
existing conventions of the project.

OpenBMC maintain authorship information through git history, and
whenever a contributor sends a patch they are agreeing to the
developers certificate of origin by providing a Signed-off-by line.
This is enforced through our code review process on Gerrit.

Cheers,

Joel
