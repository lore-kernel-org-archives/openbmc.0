Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7H9b2fHTzDvNV
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 14:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GDy8kbfh; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so15078945oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 20:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UWFaAGGO7Bju+hZyTTMnY8rHurjA67Rxk6lGwXY/hwk=;
 b=GDy8kbfhLk3yKns31b6AkqUr3UUpNd0fhPDVc4Et8LTU6B3IQ/ykAgYBQyQtXfkzGd
 pCLtEDIm3YAzYzGBl+AsQxDsbVIwSSp4VD6CiLreCGceqBIN2gJQ0zWlxWaitmfzl7/d
 GejP+IiTrW+q2V61XlLHiP2OH9UQLyLfbmTdsaC/P3P9TPz5P4eVuzRsXqDtSE697VNG
 hu3LAJN+LazjSx3MEs9jX7+GfA1Od1b1dLlUkE24oA8tRHJRrQs06qDDAGtqQPJGI7MK
 c3gUz8y69FmMxePl6idSjoLPZfA50y6PvdQer3eU/4N6/rvLlgRguWbpDOAYkeVcyTUg
 9DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UWFaAGGO7Bju+hZyTTMnY8rHurjA67Rxk6lGwXY/hwk=;
 b=Z3kpyX02FzxrpWxnReMS7YXXmB1atgM9UAVFJEuksevs3rWhs0Hv4IhadfhghZ/hOX
 EAqC1Ef7Dzq47KWwPJmFHsPB6oeASVyDgjxDAloAqKG8yWlKf65CEnRj4NbI9eiQCOrS
 FhPaPM4odWcmLr6mvfcqsNAG7kdL7UHs8fv5bVPK+oo2fM3prpXQTHWBCFrrfJLO5Rml
 e7wKmhBYyj/8kKtLtvnN8RwgyhVFSKr5yuOMy2qZ4of+Thl62fh95anvxsfXmH/Emkbe
 Yra2sm40imOzjSLNNn6pLMufmu5UDZmf8yGbMQnghZRgKvu3KtDT82dlgUUl4ci19cwi
 7shw==
X-Gm-Message-State: ABUngvfVwtF3PXVFFO9fLRGba8grZGinTanjxSTkm6hg+iYpabjAE8dB90CJ/bN2GvJ7McjhWYnxEksRtB2nWg==
X-Received: by 10.157.60.206 with SMTP id t14mr5197884otf.37.1477971745419;
 Mon, 31 Oct 2016 20:42:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Mon, 31 Oct 2016 20:42:05 -0700 (PDT)
In-Reply-To: <1477957752-4831-1-git-send-email-jaghu@google.com>
References: <1477957752-4831-1-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Nov 2016 14:12:05 +1030
X-Google-Sender-Auth: 8JOv6IZfSVNBtpJm1mcY48xjGyk
Message-ID: <CACPK8XcVN=q_gF=oPHo4nH4wmoUCnJrGh9NQSsfwHtFZWfU1dg@mail.gmail.com>
Subject: Re: Support for seven segment display
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Tue, 01 Nov 2016 03:42:28 -0000

Hey Jagha,

On Tue, Nov 1, 2016 at 10:19 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> The are 3 patches included:


Git provides some nice features when you generate your patches to
send. One of them is --cover-letter, which generates a template for
this first email you're sending.

git format-patch --to=joel@jms.id.au --to=openbmc@lists.ozlabs.org -v
3 --cover-letter -o mypatch-v3 origin/master

This will create patches for all the commits between HEAD and
origin/master, with a cover letter, and place them in a directory
called mypatch-v3. The cover letter is just a template; you can fill
out the subject line and the contents.

You can then use git send-email to send them:

git send-email mypatch-v3/*.patch

> The first patch is a character device driver which implements the user-space
> API for letting a user write to the display including any conversion methods
> necessary to map the user input to a 7-segment display.

I haven't had a chance to take a close look at your patches. Are you
sure you've addressed all of the review from Rick? I can spot a few
things that have not changed that he pointed out.

When reviewing via email, you can chose to reply to all of the points
that your reivewier has made. This is a great idea when starting a new
project as it forces you to think about each comment.

You should certainly include a changelog between versions. In
individual patches you can place some text below the cut line (the --
marker), like this:

v1:
  - Fixed checkpatch errors
  - Reworked init fuction as suggested by Larry

v2:
  - Changed camel case to kernel style

You can use a similar format in the cover letter to describe changes
that affect the entire series, or higher level things.

I suggest having a read of this:

 https://www.kernel.org/doc/Documentation/SubmittingPatches

I also suggest finding other people in your office who have worked on
the upstream kernel for advice.

Cheers,

Joel

>
> The second patch is a platform device driver which provides an API for
> displaying on a 7-segment display, and implements the required bit-banging.
> The hardware assumed is 74HC164 wired to two 7-segment displays.
>
> The third patch adds clock, data and clear signal lines to control
> seven segment display on zaius platform
>
> Please provide feedback.
>
> Thanks,
> Jagha
