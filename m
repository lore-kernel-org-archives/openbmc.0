Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::231; helo=mail-ot0-x231.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqruDzEr"; 
 dkim-atps=neutral
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hZbS6sdJzF2C9
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 23:59:32 +1000 (AEST)
Received: by mail-ot0-x231.google.com with SMTP id 15-v6so2382838otn.12
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=cJ3XYKGrr2C3aoMqsLz3JWsiqGAznsuMAtQBbGkj+I8=;
 b=nqruDzErit9Evpacea6T5j63GGqUkLn5uKZjAwD4j7H0HnRm8HAkhKfaac+lthCatW
 /bL5+kB5WU20Y/bcqXTBkcD3fHpBfEl6/HC7MnaMcXL1qOqe4RjPxb4rw8okSXcDsOa2
 PkxGeEkgNmDIFN77Nx99PHyV6L2QH2WCn6mQIfnuFeSMH4FQ7rJs8qI49cTYoraFOVbA
 30jA3bZ2s13gNY8tPGtR9v8lk2eBbS/nE4BU+LmpzJg5eAuwOmfzeA3+55QH1ag3ROVY
 d54vGGTFMpX+p8lbkPQfBFYI81AQHFuHkmABwM6zeOLMrRTlukGROfYoNN7GfmCrrZ7Q
 Xo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=cJ3XYKGrr2C3aoMqsLz3JWsiqGAznsuMAtQBbGkj+I8=;
 b=gFPcrBe1nvKVFrTDadJvoqQWZNsutPe4Fs8deIu0BVvqWwUkgdpFJHKG/gUCZFYor/
 S2Xl2tAr7Rg42+1D5jm4aGMbsO//UXI5OSK0mi2GxM4pL8ILnzVnVzqmGDLUZ5gLUZnJ
 YftuQ/RziMPBKW72ResiUcjXkOgT8od14D9pW9nHAm3avZmTw1JKgWinJmGVsh9xXcYw
 z7J268aSNqLaGOOzMOXpMmZALx33SRvO85wCEtM4Kh93XyDUjKzOClU4lRBXypbxtox/
 MAt3VxA41P9AX5d9eXSaTO76QvA1R0pTW2bdC2Xuga9VRsNkzkIbxhfob++GLEtmI3+f
 WfMg==
X-Gm-Message-State: ALKqPwe24lORxPV+f4Bj3JhdNoxGc4ceDHcOJXcDB8fgxRq5t6wutaWb
 RAVtADHOZ9nDcTfd7VOLlvqMThXk
X-Google-Smtp-Source: AB8JxZrS/1TSeMyfcmtpoKSyOPjZG3Z5kZKBYIX5k6HA3fhOyJccCXpyK6Uy6dbqn8E4f8LQ4kRkmA==
X-Received: by 2002:a9d:33a0:: with SMTP id
 u32-v6mr1051507otc.232.1525960767892; 
 Thu, 10 May 2018 06:59:27 -0700 (PDT)
Received: from krtaylors-mbp.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id p3-v6sm438154otp.2.2018.05.10.06.59.27
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 May 2018 06:59:27 -0700 (PDT)
Subject: Re: OpenBMC Fix-It
To: openbmc@lists.ozlabs.org
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <78bfadf4-1493-d9e9-58c0-9d1163f99f76@gmail.com>
Date: Thu, 10 May 2018 08:59:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------516EB1D4130EE64CC8186840"
Content-Language: en-US
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
X-List-Received-Date: Thu, 10 May 2018 13:59:33 -0000

This is a multi-part message in MIME format.
--------------516EB1D4130EE64CC8186840
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/18 2:28 PM, Nancy Yuen wrote:
> Please join my team for an OpenBMC community "fix-it" event in June!
>
> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" 
> as part of a larger fix-it initiative. OpenBMC is a large part of our 
> project so I'd like to spend part of the week on a fix-it on OpenBMC.
>
> I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could 
> set up an IRC channel for the fix it where everyone participating 
> would hang out for the day. We could pick one or two areas to
I'd say let's just use the #openbmc channel, it may pull in others as 
you move along.
> focus on for those days, put together a list of things to "fix" in 
> those areas ahead of time.  On the day, we all tackle things on the 
> list (or something not on the list), discuss over IRC and do code 
> reviews. Inevitably, people have meetings or things they can't get out 
> of, but if you can be available for most of the day, that would be enough!
>
> Anyone interested in participating?

I'm in.

Thanks for organizing this Nancy!

Kurt Taylor (krtaylor)


--------------516EB1D4130EE64CC8186840
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 5/8/18 2:28 PM, Nancy Yuen wrote:<br>
    <blockquote type="cite"
cite="mid:CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com">
      <div dir="ltr">
        <div><font size="4">Please join my team for an OpenBMC 
            community "fix-it" event in June!</font></div>
        <div><font size="4"><br>
          </font></div>
        <font size="4">My team is devoting the week of 6/11/-15 to a
          Google OpenBMC "fix it" as part of a larger fix-it initiative.
          OpenBMC is a large part of our project so I'd like to spend
          part of the week on a fix-it on OpenBMC.</font>
        <div><font size="4"><br>
          </font></div>
        <div><font size="4">I propose to have the fix it on Tues and Wed
            6/12 &amp; 6/13.  We could set up an IRC channel for the fix
            it where everyone participating would hang out for the day. 
            We could pick one or two areas to </font></div>
      </div>
    </blockquote>
    I'd say let's just use the #openbmc channel, it may pull in others
    as you move along.
    <blockquote type="cite"
cite="mid:CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com">
      <div dir="ltr">
        <div><font size="4">focus on for those days, put together a list
            of things to "fix" in those areas ahead of time.  On the
            day, we all tackle things on the list (or something not on
            the list), discuss over IRC and do code reviews. 
            Inevitably, people have meetings or things they can't get
            out of, but if you can be available for most of the day,
            that would be enough!</font></div>
        <div><font size="4"><br>
          </font></div>
        <div><font size="4">Anyone interested in participating?</font></div>
      </div>
    </blockquote>
    <p>I'm in.<br>
    </p>
    <p>Thanks for organizing this Nancy! </p>
    <p>Kurt Taylor (krtaylor)<br>
    </p>
  </body>
</html>

--------------516EB1D4130EE64CC8186840--
