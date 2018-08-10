Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22f; helo=mail-oi0-x22f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8Kdf808"; 
 dkim-atps=neutral
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41n6wY5p7LzDqrN
 for <openbmc@lists.ozlabs.org>; Sat, 11 Aug 2018 00:30:21 +1000 (AEST)
Received: by mail-oi0-x22f.google.com with SMTP id 8-v6so16177688oip.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=3rKW0OYEwLMHlbvyn1wf3Gd+zAKbj47hnDRo7ptbfKg=;
 b=Q8Kdf808ZDDaeoWtocW86uDII0fe5DZpEgXVFWfOD9ZndBXT9kcwvAvxxd3Qnd40ce
 9OTuCPIx0K+7lsCLY3+r9hv+8OdyYY/URJGopgy/7Ra5ma0KQY97Uz9/Np0oFIJqN3Pw
 qBZO18JtYlyDIC3sWRecWOsWTVQNl3tTP24iR1375vktB+YCsBuMz3NGqmsKK3w4yAoY
 k7H5CCfJ/cxVE7y//pJbP4oVXWxUo3vGnJVJtw+IOB4I72IINjltkT68b1QkdzuwzhqC
 wdx+Chp7CsqeFM94LA/uBXrBc/HwDVNyXsi2lbet3Iu35qSA/jDmxLs5fRJcQiKH74WF
 7Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=3rKW0OYEwLMHlbvyn1wf3Gd+zAKbj47hnDRo7ptbfKg=;
 b=KvjDZfoSPIdDwsQ4N+UvJTw8iZuHXTkp3IUrxl0H82Ou/ftSvdtTObWSNnzw7tH8UY
 jAX39RgMZMXvFkm33IhCtocwA57xaviaAaOL+QBVn0TAB4fFmJ5wpQzgPInnJrFmv+z0
 yZ7gHcEvS14/RcKj2cCregqohhAdgkfzfSOKK9pbqNraVDY1HUpBFGjCnNINjdTwLEvN
 MxkfCbO4ZMco1gfhxViUGqPzFBCQm0jVccEINyVOmuCsmoolOz1h+iRjV8fU8BKEGweB
 6LFYzxMGTrgVeSR8sPPl8hL9rFnufs7Tck2OTx04GR9rZZ0P1dHTfnGrXuqO5FgFVR7F
 PS+A==
X-Gm-Message-State: AOUpUlGNuL1t11/1xTxDxZUn0wmBhrxuENkFqYcun6YmySEe87TQtxib
 gWhiCgzC4p2C77ra7rPU1J3ocM1Dgts=
X-Google-Smtp-Source: AA+uWPwLPiURMvS76+A4ltteUoiBpaEqCtdAx0j39yxj0dLprITbH/VnUPxokie9vF35vaC9jgsUPg==
X-Received: by 2002:aca:6206:: with SMTP id
 w6-v6mr6503178oib.201.1533911419054; 
 Fri, 10 Aug 2018 07:30:19 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f144-v6sm14544836oib.39.2018.08.10.07.30.17
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Aug 2018 07:30:18 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: 8/9 OpenBMC Release Planning WG Meeting Minutes
Message-ID: <2bc4b415-1a44-8b8e-84be-e0fc7539e6ab@gmail.com>
Date: Fri, 10 Aug 2018 09:30:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 10 Aug 2018 14:30:23 -0000

Good meeting - getting formed around release delivery features and 
producing high-level designs. Thanks all!

Meeting Minutes:
https://docs.google.com/document/d/1yo9lZp56jkwDM1eXJRE8p__FqlAjq7qcdIi1W7hAD5Y/edit?usp=sharing

Agenda backlog for next week:
https://github.com/openbmc/openbmc/wiki/Release-Planning

Regards,
Kurt Taylor (krtaylor)


8/9/18
======
Attended (*) Primary company contact
------------------------------------
    Kurt Taylor, IBM (WG lead)
    Brad Bishop, IBM
    *Sai Dasari, Facebook
    *James Mihm, Intel
    Kun Yi, Google
    Maury Zipse, IBM
    *Nancy Yuen, Google
    *Andrew Geissler, IBM

Not Attending
-------------
    Tao Ren, Facebook
    *Dick Wilkins, Phoenix
    *Ali Larijani, Microsoft
    Yugi Mani, Microsoft

Review of Agreements from previous meeting
------------------------------------------
    None, brief recap of progress made

Release Content (Design Milestone - Aug 31)
-------------------------------------------
    Items we are completing (by company)
    Company reps scrubbed the features, noting items they were working 
on with “*”
    Some discussion on items that multiple parties were working on, need 
for community communication - WG, IRC, maillist
    If WG needs to form around a feature it needs to happen VERY quickly
    Features “Inband Firmware Update” and “Secure Boot” possible WG or 
at least need for more collaboration
     Some discussion on design process, agreed to look at the feature 
“SSL Certificate Upload” as a good example of getting the design done in 
the open
    Goal is to have a better defined policy on having the design 
complete before code drops (Design Milestone) and enforcing this

Requirements for these items (design template)
----------------------------------------------
    Discussion on PEP vs OpenStack
    Nancy to contribute Google’s design template
    Kurt will push a design template proposal before the end of the week

Designs
-------
    Workgroups needed for design, work spanning multiple companies
    Existing designs that can be shared are ok, final format not 
critical at this point, new designs should follow design template
    Agreement: Once WG or interested parties collaborate on a design, 
the design should be pushed to gerrit - openbmc/docs/designs (will be 
created as a part of the template merge)

Need to move the meeting time
-----------------------------
    Agreement: Majority of participants agreed on Monday at 3:00PM 
Central (2000 UTC) - this will start the week of the 27th of August - 
refer to the agenda on the wiki
