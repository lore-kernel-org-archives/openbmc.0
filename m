Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::235; helo=mail-oi0-x235.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bg9jCdR4"; 
 dkim-atps=neutral
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VVWk0J4kzF3HZ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 05:21:36 +1000 (AEST)
Received: by mail-oi0-x235.google.com with SMTP id n84-v6so4149881oib.9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 12:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language;
 bh=5+ZhEqQ1kFOM8jeQQmWxU4Xr5fZPdIm3McxfUfv9t7o=;
 b=Bg9jCdR4+f73NDVmGyPJm/JeWJ4iU0w0h+4kR4tcjsPcfXF/agobeGxaSjKCtUvD8W
 fun081tcfx1ukb9VqEXhVd5f4W0fzVYQZHulcICPYTUhYWxxR0D6B9+/WUBWnNJO8OQG
 3biex/gkFcXqbfacMRrfgahiRNba9HzmsdW+KPnraOV+3JnVG4Vm71rHlIJYRkmMFKbQ
 9thwq40Gw3GYf0MlJw1n1ewfcLdPCVSDxYlNT5d75D4nDhsaeQ0tcz3c8ewBQfJwCePp
 dUeKABlrpZ+1i+dWs74kj2fhvflWkv1NUjHaOMvocuEpBm5We3M3mk47LVKAPb3XMRYr
 em7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language;
 bh=5+ZhEqQ1kFOM8jeQQmWxU4Xr5fZPdIm3McxfUfv9t7o=;
 b=Z70vpggYHoJgX0iGLdvN0MGcBDTFjsH4mWp53x66gpvSQeKqh7mvWLNocbDPMFTxg5
 3LG48zaDYclDY8z6d1LqCf0Oyyahm4mt/6H2pP8zsw+51WVxVHEF87cbW2SFNPIL4ngK
 kjITfy4V+XkNW5gu6K/bWso0l0YM136v6+bg27OKFja8e9nlt23sFaMakfqHNzdq9aZe
 hnsDZFCVTrR5V7SbKENULKHkczn7YoixtUvgj6YkKie00YzykFsf8KTwpodsUdjf04x3
 ScMbKOvxdVL8w3givLMMIsFYaywhakgCBkc8P2xoxxl9JBAT4u+76Dnq1romk6m4ZZg+
 PkrA==
X-Gm-Message-State: AOUpUlHoiL9flDFGBTXIQ5FkrYaRK667EC9YK8ygTobrg4Nl4iXsx9qy
 2kDUcybXefhR4MLORsAlD7IjG8IE
X-Google-Smtp-Source: AAOMgpepxoG/AJykUUpKu4vTLcY5gYgPn4vwl8ZNDP3qmKBYO/hi0vQT6lpra1hOYcQEfjvEq9EQsQ==
X-Received: by 2002:aca:ed90:: with SMTP id
 l138-v6mr2946881oih.36.1531855294570; 
 Tue, 17 Jul 2018 12:21:34 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id m62-v6sm3143199oik.30.2018.07.17.12.21.33
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Jul 2018 12:21:34 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: 7/12 OpenBMC Release Planning WG Meeting Minutes
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <781b41ee-9780-a215-c23a-375f9be8883d@gmail.com>
Date: Tue, 17 Jul 2018 14:21:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------746B64F04277D645240031C5"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 19:21:39 -0000

This is a multi-part message in MIME format.
--------------746B64F04277D645240031C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks everyone that attended - hopefully we'll have a quorum next time 
(July 19th). Please urge your company release planning reps to fill out 
the release planning spreadsheet so we can start prioritizing.

Agenda for the 19th will be here:

https://github.com/openbmc/openbmc/wiki/Release-Planning

Meeting minutes live here:

https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing

Kurt Taylor (krtaylor)


7/12/18

  *

    Note: call in numbers and info may change frequently for the next
    few weeks, please check your email before assuming the number is the
    same as last week

  *

    9 Attended

      o

        Kurt Taylor, IBM (WG lead)

      o

        Brad Bishop, IBM

      o

        *Andrew Geissler, IBM

      o

        Kun Yi, Google

      o

        Tao Ren, Facebook

      o

        Maury Zipse, IBM

      o

        Yugi Mani, Microsoft

  *

    Not attending

      o

        *Nancy Yuen, Google (on vacation)

      o

        *Sai Dasari, Facebook (on vacation)

      o

        *James Mihm, Intel (on vacation)

      o

        *Ali Larijani, Microsoft (no response)

      o

        *Dick Wilkins, Phoenix (no response)

      o

        (*) Primary company contact

  *

    Review of Agreements from previous meeting (see previous meeting
    minutes)

  *

    Work item prioritization spreadsheet

      o

        Company representatives need to complete their column

      o

        Process review - prioritization, public design and potential
        workgroup formation

      o

        Backlog: Spreadsheet needs to be completed asap

      o

        Share/Edit permissions - still problems?

  *

    Milestones, how many and when

      o

        Discussion on what milestones and why they were useful, tracking
        progress

      o

        Release week, code freeze

      o

        Proposed: WG formation, design, code 1, code2,...codeX, code
        freeze, release

      o

        Long discussion on release process/test/merge/freeze (see below)

      o

        Discussion around what was needed in each milestone

      o

        Backlog: Topic tabled for next meeting

  *

    Release process

      o

        Branching - release: branch and freeze(stop merge) and test, or
        branch and continue merging, but then who is testing/documenting
        the release?

      o

        Freeze and branch immediately so that development can continue
        vs. freeze/test and then branch at release date to allow for all
        developers to test and document

      o

        Backports to stable branches

      o

        Backlog: Supported releases, long-term support duration n-1,
        n-2, ...

      o

        Backlog: “Support”, what does this mean to the community?

  *

    Codenames

      o

        Brad proposed to follow Yocto, branch name would equal code name



--------------746B64F04277D645240031C5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Thanks everyone that attended - hopefully we'll have a quorum
      next time (July 19th). Please urge your company release planning
      reps to fill out the release planning spreadsheet so we can start
      prioritizing.</p>
    <p>Agenda for the 19th will be here:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/wiki/Release-Planning">https://github.com/openbmc/openbmc/wiki/Release-Planning</a><br>
    </p>
    <p>Meeting minutes live here:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing">https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing</a></p>
    <p>Kurt Taylor (krtaylor)</p>
    <p><br>
    </p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-cfd6ad5a-a9ae-b560-71f6-f45c7801fc54"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">7/12/18</span></p>
    <ul style="margin-top:0pt;margin-bottom:0pt;">
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Note: call in numbers and info may change frequently for the next few weeks, please check your email before assuming the number is the same as last week</span></p></li>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">9 Attended</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Kurt Taylor, IBM (WG lead)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Brad Bishop, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Andrew Geissler, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Kun Yi, Google</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Tao Ren, Facebook</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Maury Zipse, IBM</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Yugi Mani, Microsoft</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Not attending</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Nancy Yuen, Google (on vacation)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Sai Dasari, Facebook (on vacation)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*James Mihm, Intel (on vacation)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Ali Larijani, Microsoft (no response)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">*Dick Wilkins, Phoenix (no response)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">(*) Primary company contact </span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Review of Agreements from previous meeting (see previous meeting minutes)</span></p></li>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Work item prioritization spreadsheet</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Company representatives need to complete their column</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Process review - prioritization, public design and potential workgroup formation</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Spreadsheet needs to be completed asap</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Share/Edit permissions - still problems?</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Milestones, how many and when</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Discussion on what milestones and why they were useful, tracking progress</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Release week, code freeze</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Proposed: WG formation, design, code 1, code2,...codeX, code freeze, release</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Long discussion on release process/test/merge/freeze (see below)</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Discussion around what was needed in each milestone</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Topic tabled for next meeting</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Release process</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Branching - release: branch and freeze(stop merge) and test, or branch and continue merging, but then who is testing/documenting the release?</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Freeze and branch immediately so that development can continue vs. freeze/test and then branch at release date to allow for all developers to test and document</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backports to stable branches</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: Supported releases, long-term support duration n-1, n-2, ...</span></p></li>
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Backlog</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">: “Support”, what does this mean to the community?</span></p></li>
      </ul>
      <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Codenames</span></p></li>
      <ul style="margin-top:0pt;margin-bottom:0pt;">
        <li dir="ltr" style="list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Brad proposed to follow Yocto, branch name would equal code name</span></p></li>
      </ul>
    </ul>
    <p><br>
    </p>
  </body>
</html>

--------------746B64F04277D645240031C5--
