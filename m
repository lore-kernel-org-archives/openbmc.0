Return-Path: <bsingharora@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::230; helo=mail-ua0-x230.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uubHzMRz"; 
 dkim-atps=neutral
Received: from mail-ua0-x230.google.com (mail-ua0-x230.google.com
 [IPv6:2607:f8b0:400c:c08::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybp370vY4zDqF4
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 00:17:54 +1100 (AEDT)
Received: by mail-ua0-x230.google.com with SMTP id u18so3665318uau.1
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tYjnOUa9INICIGuerJrc2x7EIVKF8sXqLA3jLXi2GHQ=;
 b=uubHzMRzXj+wjHkVx3DHhEai7SE54ESB5GzDr6t2UUelReE7dCgfy43qjxwpezJJXZ
 pRwlRngmocP+ibcDw0RszPNRPJ8GhbDZ5cumu8Av9jMS3pJIBY0J1LUvH7TDaqm1Ba6K
 WKI++O5HMzbdlflzTiDPOTvIJ3+xvCXoEuiLp1S5R8LXD97s6ifu7yll9sZA6LdW1y2s
 gYRoEdFQ8EQjTGqyBJ2Ryf7EURv7LOHA72YDqLTFm/swIzs/SLJUoP+afNZIdWPzTxZ9
 gij5wN6FHzikZ+edd37lUZvg1wQvY2ix3ZeuGrchAgcW8iFifWitjfL1DctzSBEJ8ALr
 Kj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tYjnOUa9INICIGuerJrc2x7EIVKF8sXqLA3jLXi2GHQ=;
 b=nAWVwiv2HJo1YmDvoL92qep++w/sfduIhdHSeCJy3SShQVh7rj9tlPmqc6T86Nfov/
 tfQ2OfASvVD2T5BYFVbUJvZKiPhLTpWwaZgyseGumpTJIONNPCX4am/grtAZYq02Dehh
 ais4f2mvDyd7MGplARUwt0FgMtrTGHbGetWnldpp6gG+8jFDTx1LECN3h53jZPjpaG6p
 b8d9Qwi84BYO/vqqkFXxlxy0PGg9KWS9XcXnywLLPQdJ/Ei2xjwB3PqbV/FTLwtDxFjl
 QkQjf3ioMHroJLF8WiDxiCUxeAHlX1jKNl/BB2ss8br8kjCPHs3GIlTTGso8N22rzQ9N
 6txA==
X-Gm-Message-State: AJaThX6VhzU29mE7UfsF752O2HU1cP5wYvLLQ6QbaPG/+xCnA/1a1KHk
 fzNsYpyHVKzWLK8QytYtSRc/pYr5e5CqD7YWgwg=
X-Google-Smtp-Source: AGs4zMYyq7ttTkL56yIdZxzEoHshsbo3EPJe4dpwqOYBQSMz0+VOEvRKsKVkw7uQyCIMYehQ8vPgL/TwrSmEKuuvOpw=
X-Received: by 10.159.51.85 with SMTP id a21mr10173597uac.11.1510665471688;
 Tue, 14 Nov 2017 05:17:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.139 with HTTP; Tue, 14 Nov 2017 05:17:51 -0800 (PST)
In-Reply-To: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
References: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
From: Balbir Singh <bsingharora@gmail.com>
Date: Wed, 15 Nov 2017 00:17:51 +1100
Message-ID: <CAKTCnzkPYHxVrMu_O+j9uky=fwVEmLqSkmytUsAieLnAJk0xNw@mail.gmail.com>
Subject: Re: checkstop processing
To: Sergey Kachkin <s.kachkin@gmail.com>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 14 Nov 2017 13:17:55 -0000

On Tue, Nov 14, 2017 at 8:34 AM, Sergey Kachkin <s.kachkin@gmail.com> wrote:
> Hi all,
>
> i'm investigating the checkstop processing and looking for a way to isolate
> a faulty component with OpenBmc.
> So far SEL logs available via REST are not really helpful.
>
> Is there any data source in the openbmc to troubleshoot checkstops?
>

Not yet! I guess you'd want to use some of the built-in pdbg infrastructure
to look at the checkstop issues.



> I guess eSEL binary data parsed with eSEL.pl can be more informative but do
> we have any procedure to grab the binary sel data and parse it with the
> latest obmc?
>

The workflow as I understand is

1. run IPMI commands from another host, extract eSEL logs
2. Decode those logs with eSEL.pl

Hostboot has gotten better at decoding checkstops at boot, so thats a
good first step



> Currently it seems that IPL checkstop analysis is not really working. i mean
> that faulty component is not deconfigured on the next boot and gard list is
> empty.
> It can be easily duplicated by injecting an error manually via putscom.

I've seen the opposite to be honest. What error are you injecting?

Balbir Singh.
