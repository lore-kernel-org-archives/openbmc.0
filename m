Return-Path: <openbmc+bounces-1637-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC608108E1D6
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 10:22:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fc1vw2SMjz2yng;
	Thu, 19 Mar 2026 21:22:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773915724;
	cv=none; b=G85YpofACc1TtVtKDRVbKFY+K9Irlvm29Y0DWsltd8CWy2yRzoOLLM44+jKdtD43gXh0tnpo7x/leUPu3MPqtEaJqrNWAm3I0OeoDYR5lQ2/W66msF54rSwiKJBHdNigGUCl/CbrtfqIYGuxtH8JJCXC0xetm8X2OtMdzk3bpLnHE/A+3LpBu+LU2TmT+EXKZFofbXQuCvzUYPb20NJuISOqzq4VFZCeYs9CcSwVD11/mz5wB+qOMnIDS1sddSrRRLlwllbctr49LC55gdiQfGZKlPIGlZGMIUCKODPtnza3CX/mcSgFmt6g5CAoR/Z7jy3/CpQkpkIyW6XcD3BzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773915724; c=relaxed/relaxed;
	bh=reMCKHg8kxF9F8ZmfJgQlcki40Rd1O841/bLIxQYjhI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=gzZSnf4+nxCf3PU2tXjygEuZF0MCSzYAAMHx7BCkIIvDFcQYLFR5HQhpDDBW6ystNm3yXtkU9XS5p16+WE/ZsA8KQXBH+SN9bqxQ2tMxtMhl0FYkeRHHNs7ywpEf/vQ4tqVkKumtm6L/XahQhVfXI/Dk+2raFigPNYjBYOdsI2rk5udauEWEN8OICCC+qJJKhA37W96jsB7xnPzQgIYSL/OmpbSAapRPj0ui98C2uN7IYYQthUp30KHPj7A1iUuVEjcYy94bEja9kd0dmfNtCHpBCxC1k8QdWtyf0T7OGbPjBvB92m2YUH4laeB6yvMatRkalv3HL9NMXo2Bt6yT7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FzSqZlzs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FzSqZlzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fc1vt5kQ0z2ygT
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 21:22:02 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-486b96760easo8612165e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1773915718; x=1774520518; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reMCKHg8kxF9F8ZmfJgQlcki40Rd1O841/bLIxQYjhI=;
        b=FzSqZlzsxEnCIeacwdPDFSYiwRTbGNQNVX2GFjSB7IEmkJXFEhU38mmjDMDHoZE9Ab
         DH/usWwmpD+Hn1zkFEvZzJS7FO/pq5eZMGiVSMrfVO10wdJ4N5AHWeQ1RRGTzEHoYrdk
         WcfpkMBdWuorziWMTkORRgIQVfDocZOveQT2yFGGaz/Zaa1fzj6wXQ1EDv5FtySJuKvd
         fATCV0ezv06F//TvaeUZMboBWv7KN4C9LNErb0OW3T9GWMjV7FOtOQ4tjV1Czq0hmPNU
         YNq9cTZjFj0PTFAKmQC5q5EotQPnrdY70u2QamKKtYwiUoPg+/4exgaU2nZvZ4WZfmOP
         pAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915718; x=1774520518;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reMCKHg8kxF9F8ZmfJgQlcki40Rd1O841/bLIxQYjhI=;
        b=r9eNj6qsDoyTRbC54NJ8a8Q0J15mAyn/eH1csuhccknNdgbcAh6dROGmUxHLjk6Ych
         PGadKwdpsNGkL6ktAPFJ8HQcJuPBbOtUV4Jp9qMxGpAkSHARgRT2nE6evTUZb99fr9vu
         bJ9Z4HW+uBjOL8DEzRF91KbrbBiWvtpK1Ql+1aciDAE/8s9dI4ujpnKrZcY8bVQ5NU6B
         i9S/cIMZP82xqOsIv9wmPWGVX8sMr9tXLPcVKJI92spZl4IqSaajDTvTKjHt20BBL+Cg
         Az9/5QT97b7QMyj5i2hQNZ7XuxavxYeb2Fs92z8tVVGw2notkZbXNjl8OdiqN9hSzPuS
         yrfg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ014mLBdZHkxEY73HH3oLbXLIJ6VbnSVnhlfpesyUUf3mHY1FdnKrqxfb4Xc4/lysmNH4Xno8@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3V40thz3B4+0jf+ztcSmnstVDBSlqrjmzRteORcyk5QUMgiQT
	MHK2szkD5HGg35giwvY6pwmt/+GXG7WDb+NqE1xPG/bs/uesFLBJgi3HE8PU98O5v6I=
X-Gm-Gg: ATEYQzxuNQt2/k7WBaxhJ62vybHKsWD918SoXOxUyXvWKNmLV9MkhFHv3w/fUXkvXzE
	fU/dClC7KWEOzAEz18eRGfXef+T88ff5GLO8gVroOyBXcRjRqO+DWgv9uBjtD1E0k4lY/bRB6PP
	Q2b/GefVoytGmjnQyj1CVYMLzNo26EA9iUo4yoDOrca2wAg99HazYBV2UjHw7r5e8d/DSkLKYwd
	V7J1j3GQSublATlVetcuukiBJ0b7JYExZcUimtNiN4sygBpFPaWuHjhJyKmkRjLK9uKZxjnbJg5
	56lsAKJuH9A67AW9HGBaxJ3dC9/GUjLYcz+0nhKf2XP1cLF6I8sVwr1harILRKBs0YIBRqN+jDH
	k0RFNmg1MBHKXynmXiPpvVwqaUoP93v2QYJ8s/hPo1VlMoxRoU3qveZGjQlH+jQRIdAc1t/vC+I
	W9hS9owgbOSzOqT5xFizj+b30P4VBCG3v0o3m/W5WUOnY5u1Wn4eE=
X-Received: by 2002:a05:600c:3e0e:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486f4475054mr102774125e9.21.1773915717671;
        Thu, 19 Mar 2026 03:21:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5c81:9f00::698e? ([2a02:8071:5c81:9f00::698e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm40937825e9.0.2026.03.19.03.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:21:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jtwHr7fE5wrb5xqdTxIHQUGE"
Message-ID: <325cc62f-2c65-4ce6-aa22-79d5f23f4672@9elements.com>
Date: Thu, 19 Mar 2026 11:21:56 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TOF elections for 2026H1
To: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
Content-Language: en-US
From: Alexander Hansen <alexander.hansen@9elements.com>
In-Reply-To: <absG_8pQilMHGMnO@heinlein>

This is a multi-part message in MIME format.
--------------jtwHr7fE5wrb5xqdTxIHQUGE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> I would strongly encourage candidates to reply to this email with a 
[brief] > campaign: who are you, what work have you done for the 
community, why do > you want to be on the TOF, etc.

Hi,

my name is Alexander Hansen (GitHub: pointbazaar), firmware engineer at 
9elements working on OpenBMC.

I have contributed to sdbusplus, bmcweb, entity-manager, dbus-sensors, 
and libpldm, working on D-Bus modeling,
Redfish multi-host support, and platform support (e.g. Tyan s5549/s8030 
platforms).

Some concrete examples of my work:

- bmcweb: binary size optimization with busybox approach (one binary for 
both the daemon and cli utilitiy)
- dbus-sensors: modernize debug logging with lg2
- phosphor-bmc-code-mgmt: parts of the common code implementation 
underpinning many device specific code updaters
- entity-manager: design and implementation for reworked physical 
topology  (Type: "Port" configuration records)
- sdbusplus: discussions and patches around |object_path| behavior and 
API design (default values, usability, and correctness)
- libpldm:  libpldm++ library implementation
- phosphor-led-manager:  removal of the yaml config mechanism in favor 
of json based configuration ('one way' to do things)
- removal of preprocessor based conditional compilation in favor of `if 
constexpr` in various repos

 > why doyou want to be on the TOF I believe OpenBMC could benefit from 
some controversial ideas like - deletion of unused features. (unused 
code should not block upstream development, i do not count private 
downstream forks) - consistency of implementation across repositories 
(contributors should not have to adopt an entirely new style for every 
repo) - reducing the amount of code duplication
- 'one way' to do things instead of various (possibly incompatible) 
alternatives - progress on the upstream community code over stability 
for downstream forks If you like these ideas then i can represent them 
for you as part of ToF :)

On 3/18/26 21:11, Patrick Williams wrote:
> Greetings,
>
> For the TOF elections for this half, we had 7 qualified individuals
> nominated and there are 4 seats expiring.  Therefore, we are going to
> have to hold an election for the half.
>
> The 7 nominated developers[1] are (alphabetical by Github IDs):
>      * Andrew Jeffery
>      * Brad Bishop
>      * Deepak Kodihalli
>      * Jagpal Gill
>      * Jayanth Othayoth
>      * Alexander Hansen
>      * Patrick Williams
>
> A few key points about the election:
>      - Voting is by Ranked Choice Voting.  The order you give as your
>        preference matters [2,3].
>
>      - TOF members represent the development community and not their
>        companies.
>
>      - Since there are 4 seats up for election, you may submit a vote
>        with up to 4 candidates.
>
> With this being the most nominated-for election in TOF history, I would
> strongly encourage candidates to reply to this email with a [brief]
> campaign: who are you, what work have you done for the community, why do
> you want to be on the TOF, etc.
>
> Votes will be accepted until April 1st, 2026 at 12:00 GMT from qualified
> votes[4].
>
> As with the last election, we have a tool to facilitate voting[5].  You are
> expected to fork the Github repository, run the tool, commit the
> resulting JSON file, and create a Pull-Request to submit your vote.
>
> If you have the `gh` tool this would be as follows:
> ```
> gh repo fork --clone openbmc/tof-election
> cd tof-election
> ./vote --user <github-id>
> # make your selections with 'vote N', 'save', 'quit'
> git add 2026H1/votes/<github-id>.json
> git commit -s -m "2026H1: <github-id>: add vote"
> git push origin
> gh pr create
> ```
>
> [1]:https://github.com/openbmc/tof-election/blob/main/2026H1/candidates.json
> [2]:https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md#terms-and-elections
> [3]:https://en.wikipedia.org/wiki/Instant-runoff_voting
> [4]:https://github.com/openbmc/tof-election/blob/main/2026H1/rollcall.json
> [5]:https://github.com/openbmc/tof-election
>
--------------jtwHr7fE5wrb5xqdTxIHQUGE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="white-space: pre-wrap">&gt; </span><span
      style="white-space: pre-wrap">I would </span><span
      style="white-space: pre-wrap">strongly encourage candidates to reply to this email with a [brief]
</span><span style="white-space: pre-wrap">&gt; campaign: who are you, what work have you done for the community, why do
</span><span style="white-space: pre-wrap">&gt; you want to be on the TOF, etc.
</span></p>
    <p data-start="74" data-end="77">Hi,</p>
    <p data-start="79" data-end="180">my name is Alexander Hansen
      (GitHub: pointbazaar), firmware engineer at 9elements working on
      OpenBMC.</p>
    <p data-start="182" data-end="365">I have contributed to sdbusplus,
      bmcweb, entity-manager, dbus-sensors, and libpldm, working on
      D-Bus modeling, <br>
      Redfish multi-host support, and platform support (e.g. Tyan
      s5549/s8030 platforms).</p>
    <p>Some concrete examples of my work:<br>
      <br>
      - bmcweb: binary size optimization with busybox approach (one
      binary for both the daemon and cli utilitiy)<br>
      - dbus-sensors: modernize debug logging with lg2<br>
      - phosphor-bmc-code-mgmt: parts of the common code implementation
      underpinning many device specific code updaters<br>
      - entity-manager: design and implementation for reworked physical
      topology  (Type: "Port" configuration records)<br>
      - sdbusplus: discussions and patches around <code
        data-start="446" data-end="459">object_path</code> behavior and
      API design (default values, usability, and correctness)<br>
      - libpldm:  libpldm++ library implementation<br>
      - phosphor-led-manager:  removal of the yaml config mechanism in
      favor of json based configuration ('one way' to do things)<br>
      - removal of preprocessor based conditional compilation in favor
      of `if constexpr` in various repos<br>
      <br>
      &gt; <span style="white-space: pre-wrap">why do</span><span
      style="white-space: pre-wrap"> you want to be on the TOF

I believe OpenBMC could benefit from some controversial ideas like

- deletion of unused features. (unused code should not block upstream development, i do not count private downstream forks)
- consistency of implementation across repositories (contributors should not have to adopt an entirely new style for every repo)
</span><span style="white-space: pre-wrap">- reducing the amount of code duplication</span><br>
      <span style="white-space: pre-wrap">- 'one way' to do things instead of various (possibly incompatible) alternatives
- progress on the upstream community code over stability for downstream forks

If you like these ideas then i can represent them for you as part of ToF :)</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <div class="moz-cite-prefix">On 3/18/26 21:11, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:absG_8pQilMHGMnO@heinlein">
      <pre wrap="" class="moz-quote-pre">Greetings,

For the TOF elections for this half, we had 7 qualified individuals
nominated and there are 4 seats expiring.  Therefore, we are going to
have to hold an election for the half. 

The 7 nominated developers[1] are (alphabetical by Github IDs):
    * Andrew Jeffery
    * Brad Bishop
    * Deepak Kodihalli
    * Jagpal Gill
    * Jayanth Othayoth
    * Alexander Hansen
    * Patrick Williams

A few key points about the election:
    - Voting is by Ranked Choice Voting.  The order you give as your
      preference matters [2,3].

    - TOF members represent the development community and not their
      companies.

    - Since there are 4 seats up for election, you may submit a vote
      with up to 4 candidates.

With this being the most nominated-for election in TOF history, I would
strongly encourage candidates to reply to this email with a [brief]
campaign: who are you, what work have you done for the community, why do
you want to be on the TOF, etc.

Votes will be accepted until April 1st, 2026 at 12:00 GMT from qualified
votes[4].

As with the last election, we have a tool to facilitate voting[5].  You are
expected to fork the Github repository, run the tool, commit the
resulting JSON file, and create a Pull-Request to submit your vote.

If you have the `gh` tool this would be as follows:
```
gh repo fork --clone openbmc/tof-election
cd tof-election
./vote --user &lt;github-id&gt;
# make your selections with 'vote N', 'save', 'quit'
git add 2026H1/votes/&lt;github-id&gt;.json
git commit -s -m "2026H1: &lt;github-id&gt;: add vote"
git push origin
gh pr create
```

[1]: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/tof-election/blob/main/2026H1/candidates.json">https://github.com/openbmc/tof-election/blob/main/2026H1/candidates.json</a>
[2]: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md#terms-and-elections">https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md#terms-and-elections</a>
[3]: <a class="moz-txt-link-freetext" href="https://en.wikipedia.org/wiki/Instant-runoff_voting">https://en.wikipedia.org/wiki/Instant-runoff_voting</a>
[4]: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/tof-election/blob/main/2026H1/rollcall.json">https://github.com/openbmc/tof-election/blob/main/2026H1/rollcall.json</a>
[5]: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/tof-election">https://github.com/openbmc/tof-election</a>

</pre>
    </blockquote>
  </body>
</html>

--------------jtwHr7fE5wrb5xqdTxIHQUGE--

