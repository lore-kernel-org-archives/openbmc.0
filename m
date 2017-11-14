Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::233; helo=mail-lf0-x233.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="acTs1PxJ"; 
 dkim-atps=neutral
Received: from mail-lf0-x233.google.com (mail-lf0-x233.google.com
 [IPv6:2a00:1450:4010:c07::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybYHs2wFnzDqkx
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 14:43:04 +1100 (AEDT)
Received: by mail-lf0-x233.google.com with SMTP id s16so20453454lfs.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 19:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4pniy500NLMOdDTENkJCMJKQcAgR4nfzk7E1J+2buIY=;
 b=acTs1PxJZHpa5PwFx/gIUotOKPcLw/Wf+EwlnyYFHYbhKdNyYhZBq1qW2xn6IIJG47
 kc0jTY4wa5SU/glpSlVhzOGjryvHpygCYH9r9nRmpsazIYycfSGHmTpC0t13HX9JrlaW
 KBGCW/Rl3LDMQkl/hken+h62PnG1Gpt+e5cRQWGnqPuzsobwgyuXE5Al/MkAGkTnBl1Y
 pGrWSJYwN+YWm8iO/XmDhcFY4MQ/KvFMoKj/eMq46AZKFNLLqXvn5WPMRmbc9FaOe95y
 ZToi+eS4DNzpmO3PbxnOJlsdRzbYl1aF76zDV8YQQOjK6V0sT+tpcwirSioD/T7aDWRO
 +3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4pniy500NLMOdDTENkJCMJKQcAgR4nfzk7E1J+2buIY=;
 b=Q6TYyMQkoLfQPTR+sC08f/hzVlQ7hqZ7W9nCwgwv2nWsLgOsU4XK9P5pEtQHvAOOQA
 krAa7/Fnq5BsYVGD8SBuScOSSGSqp+gTKSdAo//8i04Tqe2ZdylY8V/xjRVNj4c4n003
 Nca0TI3wE4do7hSWnuanFgWsOPja8+B/FcWW2MSpmjZsRCKYeZjbvDuGoO6BEwRFcuy1
 bI0j1vgM5y3ecTFZLvGjbq7cIgWfJQO+FLU0tLaYeZBR+jJfpYfS+E4pxs6k0Rq5Q8cI
 9vof4y+VaHvkXz1Z5NAcg1X25i2nwD+ZOIQjU/wehTedCLnyjccIORaqHHijHYXHjAOz
 hdng==
X-Gm-Message-State: AJaThX4esW0BcloDzKonm/JjRlc2S3d3VPSo5I0nWwc0Sv2m9hCpR6pY
 75OALkqjRh8EvB24Fj+bE6SJUFgcrGZt/KGMutI=
X-Google-Smtp-Source: AGs4zMakE+VE8vIMcgQPOvqYShH3HHHGqRGlih0a2CDrDtueY6o7sD0YAc28Opmg0dIciq2JTSdVzgvkTX26qfl8COk=
X-Received: by 10.46.64.82 with SMTP id n79mr4486522lja.129.1510630980915;
 Mon, 13 Nov 2017 19:43:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Mon, 13 Nov 2017 19:42:40 -0800 (PST)
In-Reply-To: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
References: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Nov 2017 14:12:40 +1030
X-Google-Sender-Auth: 9ISWkWsAfa-H8LfT7NviR021mPg
Message-ID: <CACPK8Xd=EKts=4+8mH8khqzBqJRmBjC6sB6RqpEk2SVzc2cOHQ@mail.gmail.com>
Subject: Re: checkstop processing
To: Sergey Kachkin <s.kachkin@gmail.com>,
 Alistair Popple <alistair@popple.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Oliver O'Halloran" <oohall@gmail.com>, bsingharora@gmail.com, 
 Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 03:43:06 -0000

On Tue, Nov 14, 2017 at 8:04 AM, Sergey Kachkin <s.kachkin@gmail.com> wrote:
> Hi all,
>
> i'm investigating the checkstop processing and looking for a way to isolate
> a faulty component with OpenBmc.
> So far SEL logs available via REST are not really helpful.
>
> Is there any data source in the openbmc to troubleshoot checkstops?
>
> I guess eSEL binary data parsed with eSEL.pl can be more informative but do
> we have any procedure to grab the binary sel data and parse it with the
> latest obmc?
>
> Currently it seems that IPL checkstop analysis is not really working. i mean
> that faulty component is not deconfigured on the next boot and gard list is
> empty.
> It can be easily duplicated by injecting an error manually via putscom.

I think you've identified an area that would be great for improvement.

I'd like to expand the scope beyond just checkstop to other boot
failures: I've tried to boot machines recently that have failed to
even start hostboot, and I haven't known what has failed.

A tool that inspects recent error logs, and the state of the SBE would
be useful. We can leverage libpdbg to talk to the host.

Cheers,

Joel
