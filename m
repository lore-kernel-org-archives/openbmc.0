Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::233; helo=mail-ot0-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QLTFhnhd"; 
 dkim-atps=neutral
Received: from mail-ot0-x233.google.com (mail-ot0-x233.google.com
 [IPv6:2607:f8b0:4003:c0f::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40b4l22L06zF2Qt
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 01:17:01 +1000 (AEST)
Received: by mail-ot0-x233.google.com with SMTP id 77-v6so13241364otd.4
 for <openbmc@lists.ozlabs.org>; Tue, 01 May 2018 08:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=r7LFsnFntAIAnu+FOzllcsefV1yO4AyZaBrNBaLRS2M=;
 b=QLTFhnhdeGXn7noZDTx0wmUTndsRzghDlB/d9W6agAQoCh8EeRSfIfjIxC3Iapt1SA
 4aCM5N6S+UDCZGdePJSFIguFg2v1/nrreZzuBTHR3TQyEQdGMRoyd3m+LRsVGL8NWJvh
 8kFmlVvG8OA06jLATfQXBvcDGU7NpJovR6NYhCKdIFoorwf+OlWqgeRkzMEfn2KkevFc
 d8wDOtxZ1Zb9LxDvEW3HYb0Pp7S0LMEu5SBeZX0Y+uaLFfkisHGiQVO1Aeb4EQzk1r9h
 TarA+5nxtKs8cLMxL5SZMvDTnOIczi44piQ5xdraRSpGuf+jNTaHHLRyUyRCG+DljCYk
 Eh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r7LFsnFntAIAnu+FOzllcsefV1yO4AyZaBrNBaLRS2M=;
 b=kzGZckQRtB4bPiQ8EkbFXXuDfPeyztfljdWhR/r3/TbnKmuOGKhQdqNAPCkMjx0+lB
 /2/UvFL025gZrpYlphnRGPGn0bLsmOXqSO0LCg1I5iG/VQEvSERlUDLXGrWv4XPUhJBs
 g0P7+1Pu+2FX45UCQJoDJl6z9hq8VjXuOY8/4eHxvANCJoO5On7UJtmFGdVyDCCJlrOv
 NPMMIeld1bGdwKH/O9dPME2/I4QRuuMwQ9ReW5vzg4YGf//Am421oYcqC16RA3znL3Cb
 sLW1PUuiOvaKxmyVZPvGKqH6Sr/loABSuP5DE3BRh0HNkP+xlIyubDvrMbSxt4BK+zL5
 v6RQ==
X-Gm-Message-State: ALQs6tAJKWz7DID5QMlvuiONMupiwox5aE4yYYKoAWHj/zG51sBzJViQ
 jiJdHejcM73swzd/VRQVV0Fycz6B
X-Google-Smtp-Source: AB8JxZoGBiCYKUN8GISpsWVoh+DaFXNnHg9UcjFMPAPlPmQCP5C+ruIlbysqYXnhCYVK+dOqyX9SPg==
X-Received: by 2002:a9d:386d:: with SMTP id
 r42-v6mr11825920otd.186.1525187817316; 
 Tue, 01 May 2018 08:16:57 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-70-114-143-39.austin.res.rr.com. [70.114.143.39])
 by smtp.gmail.com with ESMTPSA id w13-v6sm2980891otj.31.2018.05.01.08.16.56
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 May 2018 08:16:56 -0700 (PDT)
Subject: Re: reference platforms?
To: openbmc@lists.ozlabs.org
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
 <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
 <650906BF-A79F-467F-B9C7-4CD3C9730E19@fuzziesquirrel.com>
 <FA93D326-6F39-4E5F-8A51-1ED819BFF0F1@fb.com>
 <BC2069D9-DAC3-4EEB-9A35-D36F68947E06@fuzziesquirrel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b3f69b65-c977-88b6-39c6-b1bea2ca8eb5@gmail.com>
Date: Tue, 1 May 2018 10:16:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <BC2069D9-DAC3-4EEB-9A35-D36F68947E06@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 01 May 2018 15:17:03 -0000

On 4/30/18 2:34 PM, Brad Bishop wrote:
> Hey Sai
>
> Sorry it has taken me so long to respond.  I hope others will weigh in
> with their ideas on this topic.
>
>> On Apr 13, 2018, at 7:55 PM, Sai Dasari <sdasari@fb.com> wrote:
>>
>> Your proposed changes are good from scaling the development. My original question was from the end-user point of view who acquires bunch of OCP machines and tries to find a way to build OpenBMC for those machines. I was wondering if we can point those end-users to one unified repo @ "github.com/openbmc" and allow them to build OpenBMC binary for that platform. The other option would be for them to let them figure out the repo for that machine e.g. "github.com/<awesome-company>". I think any of these methods will work in practice.
> Yep, I understand the goal.  I don’t have any great ideas off the top
> of my head but I don’t think it should be too hard to come up with a
> solution that meets both needs - a scalable development process _and_
> a one-stop-shop for OCP platform builders (or others).
It has been said before, but I like the layered approach where obmc is 
the base and then the machine specifics layer on top of that. So the 
build process would be clone obmc, then <awesome-company> repo and 
build. This will require good third-party CI by the <awesome-company>, 
as well as clean modular boundaries for machine support.
>
>>> Put another way, we _could_ build the answer to the question into the
>>> core of the project, but why (and at what cost to the project’s ability
>>> to scale)?  Someone could also just host a list somewhere, or maybe a
>>> layer-index like OE has?
>>>
>>>> Does each openbmc adopter encouraged to maintains independent github repo with recipes needed to bring in the openbmc code and build for their supported machines?
>>>     I think so.  The specifics of what the adopter does/maintains are up to
>>>     the adopter.  What are some pros/cons of a model like that?  This is what
>>>     most everyone is doing already.  They fork some part of the project (or
>>>     all of it), build on it (mostly in a machine layer?  hopefully?)  and then
>>>     maybe/maybe not contribute something of what they did back to the upstream
>>>     project.  It is my guess that this is the usual way in which product
>>>     development teams use FLOSS.
>> I am sure FLOSS allows forks, but for the benefit of community, it would be good to encourage contribution to the upstream openbmc repo. While it helps to scale to separate machine layer repo outside of upstream, I have concern that the adopter's focus would shift away from upstream to that external repo.  This might have side-effect of duplicate work in independent repos (might have good intention of upstreaming later), as opposed to ideal work flow (in my mind) of {'upstream-first'-> cherry pick to external repo}.
> I think this valid concern could mostly be mitigated by careful selection of
> maintainers and how we structure content amongst repositories.  I will try
> and elaborate on how I think it could work with some pictures in the near
> future.
>
>>>> One (crazy) idea would be to come up with a minimum acceptance test suite (which can be automated) that validates all the core features and use this for accepting new platforms as reference platforms from community.
>>>     So my clarification is that the acceptance test would not measure how well
>>>     a machine meets end-user requirements, but rather how well a machine makes
>>>     use of the project’s common code.  Maybe a metric measured by the test could
>>>     be something like least number of deviations from the defaults?
Yes, a good test suite for the base, as well as third-party testing for 
company machine support, testing both sides and reporting back. Sounds 
like the basis and requirements for a Test Working Group.
>> Looks good metric to me for various application level service/daemons. Still not sure how the code changes specific to hardware can be regression tested e.g. KCS vs. BT, IPMB, NC-SI etc.
Kurt Taylor (krtaylor)
